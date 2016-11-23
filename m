From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 23 Nov 2016 13:16:24 +0100
Subject: [Buildroot] Bare metal toolchain support?
In-Reply-To: <20161123130636.5b362a27@free-electrons.com>
References: <CAM+bi4v0iJKAbKV8FvqwJqEw=L+DqTLZhcHWGboYBbPv1oTM0A@mail.gmail.com>
 <20161123113517.04f6ec47@free-electrons.com>
 <CAM+bi4vNKMBr0Dv9_-rsQzU_kPNrze7o9_EcSEA--g2UCVCfzg@mail.gmail.com>
 <20161123130636.5b362a27@free-electrons.com>
Message-ID: <CAM+bi4ujUpa+BEtU8XAC1sCW2AoM8gUhT-Rtg8xWs-_O8KTF6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-11-23 13:06 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Perhaps it is not really used? I guess, you'll have to hack things
> a bit to get them to build.
>

Just to see how far the compilation would go, I removed errno.c from the
codebase
(a little drastic solution, but as you say, no one will use errno on this
thingy) and I got the
full BSP to compile. Hooray!


Now, I'm trying to compile the bootloader itself. It has complained about
function putnum()
(which prints a number through a serial port), that also seems to live only
on Xilinx' toolchain.
Maybe it's also a newlib thing.

I've also removed calls to that function and the final error is this one:


/home/agamez/mb-bootloader/scripts/..//test/output/host/usr/bin/microblazeel-linux-gcc
-Wl,-T -Wl,../src/lscript.ld -L../../bootloader_bsp/microblaze_0/lib
-mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div
-mcpu=v9.6 -mno-xl-soft-mul -mxl-multiply-high -Wl,--no-relax -o
"bootloader.elf"  ./src/bootloader.o ./src/platform.o ./src/srec.o
-Wl,--start-group,-lxil,-lgcc,-lc,--end-group -Wl,--start-group,-lxilisf,-
lxil,-lgcc,-lc,--end-group
/home/agamez/mb-bootloader/test/output/host/usr/
microblazeel-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: In function
`_start':
(.text+0x30): undefined reference to `__libc_csu_init'
/home/agamez/mb-bootloader/test/output/host/usr/
microblazeel-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: In function
`_start':
(.text+0x38): undefined reference to `__libc_csu_fini'
/home/agamez/mb-bootloader/test/output/host/usr/
microblazeel-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: In function
`_start':
(.text+0x40): undefined reference to `__libc_start_main'
/home/agamez/mb-bootloader/test/output/host/usr/lib/gcc/
microblazeel-buildroot-linux-gnu/4.9.3/../../../../
microblazeel-buildroot-linux-gnu/bin/ld: xilisf_read.o: unknown relocation
type 30
/home/agamez/mb-bootloader/test/output/host/usr/lib/gcc/
microblazeel-buildroot-linux-gnu/4.9.3/../../../../
microblazeel-buildroot-linux-gnu/bin/ld: xilisf_read.o: unknown relocation
type 30
/home/agamez/mb-bootloader/test/output/host/usr/lib/gcc/
microblazeel-buildroot-linux-gnu/4.9.3/../../../../
microblazeel-buildroot-linux-gnu/bin/ld: xilisf_read.o: unknown relocation
type 30
/home/agamez/mb-bootloader/test/output/host/usr/lib/gcc/
microblazeel-buildroot-linux-gnu/4.9.3/../../../../
microblazeel-buildroot-linux-gnu/bin/ld: xilisf_read.o: unknown relocation
type 30
/home/agamez/mb-bootloader/test/output/host/usr/lib/gcc/
microblazeel-buildroot-linux-gnu/4.9.3/../../../../
microblazeel-buildroot-linux-gnu/bin/ld: xilisf_read.o: unknown relocation
type 30
/home/agamez/mb-bootloader/test/output/host/usr/lib/gcc/
microblazeel-buildroot-linux-gnu/4.9.3/../../../../
microblazeel-buildroot-linux-gnu/bin/ld: final link failed: Bad value
collect2: error: ld returned 1 exit status
makefile:36: recipe for target 'bootloader.elf' failed
make: *** [bootloader.elf] Error 1


xilisf_read.c file is part of the BSP, it is a library to read data from an
SPI flash,
from which I want to load the OS, so this time I can't hack around it
anymore,
as I need this to work.

Also, the bootloader trying to compile against crt1.o (and not finding
entries)
shouldn't be worrying too?

I can provide lscript.ld if it's helpful, but I don't think so. This is
above my knowledge, though.

Thanks, best regards!




-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161123/bf2d6977/attachment.html>
