From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 22:28:02 +0200
Subject: [Buildroot] [PATCH v1] qt5base: fix double conversion for
 microblazeel/microblazebe
In-Reply-To: <20180821201617.20231-1-ps.report@gmx.net>
References: <20180821201617.20231-1-ps.report@gmx.net>
Message-ID: <20180821222802.012ef423@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Aug 2018 22:16:17 +0200, Peter Seiderer wrote:
> Fixes [1]:
> 
>   ../3rdparty/double-conversion/include/double-conversion/utils.h:81:2: error: #error Target architecture was not detected as supported by Double-Conversion.
>   #error Target architecture was not detected as supported by Double-Conversion.
> 
> [1] http://autobuild.buildroot.net/results/489/4891d96f45c64c2e66fe819bd4175cc1d6243a93
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Thanks for working on this again. Can you submit your or1k and
microblaze changes back to the upstream double-conversion project (and
perhaps also Qt5) ?

> For microblazeel (using qemu_microblazeel_mmu_defconfig changed to musl
> because the original uclibc resulted in 'mmap of a spare page failed!'
> error message):

This uClibc issue is something for Waldemar. I'm personally still a bit
impressed by the magic of qemu user mode emulation.

> 	$ ./build_qemu_microblazeel_001/host/bin/microblazeel-buildroot-linux-musl-gcc -c main.c
> 	$ ./build_qemu_microblazeel_001/host/bin/microblazeel-buildroot-linux-musl-gcc -c div.c
> 	$ ./build_qemu_microblazeel_001/host/bin/microblazeel-buildroot-linux-musl-gcc -o main main.o div.o
> 
> Fix wrong staging absolute soft link to relative:
> 	$ ls -l build_qemu_microblazeel_001/staging/lib/ld-musl-microblazeel.so.1
> ../staging/lib/ld-musl-microblazeel.so.1 -> /lib/libc.so
> 	$ rm build_qemu_microblazeel_001/staging/lib/ld-musl-microblazeel.so.1
> 	$ ln -s libc.so build_qemu_microblazeel_001/staging/lib/ld-musl-microblazeel.so.1

That's weird, I have a musl toolchain here (installed from an external
toolchain), and its symlink is relative:

$ ls -l output/staging/lib/{ld-musl*,libc.so}
lrwxrwxrwx 1 thomas thomas     14 Aug 21 22:14 output/staging/lib/ld-musl-armhf.so.1 -> ../lib/libc.so
-rwxr-xr-x 1 thomas thomas 740772 Jun 26 00:08 output/staging/lib/libc.so

Applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
