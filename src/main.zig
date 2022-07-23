const std = @import("std");

pub fn main() anyerror!void {
    const match = [6]bool{ false, false, true, false, true, false };
    var count: u8 = 0;
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.os.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    const rand = prng.random();

    outer: while (true) {
        std.debug.print("ジ〜グ ", .{});
        for (match) |item,i| {
            var b = rand.boolean();
            _ = item;

            if (b) {
                std.debug.print("ジグ ", .{});
                if (b == match[i]) {
                    count += 1;
                }
            } else {
                std.debug.print("ザグ ", .{});
                if (b == match[i]) {
                    count += 1;
                }
            }
        }

        if (count == 6) {
            std.debug.print("ひとりきり〜\n", .{});
            break :outer;
        } else {
            count = 0;
            continue;
        }
    }
    std.debug.print("match で〜す！（鶴太郎）\n", .{});
}
