From: Zac Wheeler <zac.wheeler@gmail.com>
Date: Fri, 20 Jun 2008 15:33:39 -0700
Subject: [Buildroot] u-boot failure and compiler versions
Message-ID: <206b9e70806201533p76ee5aftd61a76b22008ee5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm compiling u-boot-1.3.3 for AT91 within buildroot and getting some
subtle problems at runtime. A lot of things work (serial, parallel
flash). The usb_ohci doesn't. It does with other compilers. It works
fine when compiled within scratchbox using toolchains
arm-gcc4.1-uclibc20061004 or arm-linux-2006q3-27 (a glibc codesourcery
toolchain). So it doesn't appear to be all that fragile. The code has
a lot of hard-coded delays.

The compilation options are the same, the code is the same (I added
some line breaks for easier comparison):

gcc -g  -Os   -fno-strict-aliasing  -fno-common -ffixed-r8
-msoft-float  -D__KERNEL__ -DTEXT_BASE=0x23f00000
-I/home/zac/buildroot/project_build_arm/board/u-boot-1.3.3/include2
-I/home/zac/buildroot/project_build_arm/board/u-boot-1.3.3/include
-Ibuild_arm/u-boot-1.3.3/include
-fno-builtin -ffreestanding -nostdinc -isystem
build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.3/include
-pipe  -DCONFIG_ARM -D__ARM__ -march=armv4 -mabi=apcs-gnu
-march=armv5te  -Wall -Wstrict-prototypes -c -o
/home/zac/buildroot/project_build_arm/board/u-boot-1.3.3/common/usb_storage.o
usb_storage.c

gcc -g  -Os   -fno-strict-aliasing  -fno-common -ffixed-r8
-msoft-float  -D__KERNEL__ -DTEXT_BASE=0x23f00000
-I/home/zac/u-boot-1.3.3/include
-fno-builtin -ffreestanding -nostdinc -isystem
/scratchbox/compilers/arm-gcc4.1-uclibc20061004/lib/gcc/arm-linux-uclibc/4.1.1/include
-pipe  -DCONFIG_ARM -D__ARM__ -march=armv4 -mabi=apcs-gnu
-march=armv5te  -Wall -Wstrict-prototypes -c -o usb_storage.o
usb_storage.c

The executables are quite different, and the usb_ohci controller times
out when trying to get in touch with the USB key. I've tried numerous
USB keys, all work with the scratchbox compilers, and none work with
any of the buildroot builds. That is 4.1.2, 4.2.1, or 4.2.4. This is
working from the 20080620 snapshot, but is the same back to at least
06-10.

Looking at the executable with insight, the only thing that looks
unusual is that insight shows some <internal disassembler error>
notices for jmp instructions (specifically within hc_interrupt in
usb_ohci). Not sure if this is an insight issue or executable issue.
They are only present in the non-working executable.

Since the code functions fine when built by several other compilers
I'm hoping that this is something specific to a buildroot patch so
someone here might recognize the issue.

Any ideas or hints would be appreciated.

Thanks,
Zac
