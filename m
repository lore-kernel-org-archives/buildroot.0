From: Michel Benoit <michel.benoit@sepab.se>
Date: Thu, 23 Oct 2008 11:39:22 +0200
Subject: [Buildroot] Busybox build fails with external toolchain
Message-ID: <c88e466f0810230239m298d6b09v92a11fdb4ce5f077@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to use buildroot to build a rootfs with an external
toolchain based on uclibc.
I'm using buildroot svn revision 23768
The toolchain is based on gcc 4.1.2.

> arm-linux-gcc -v
Using built-in specs.
Target: arm-linux-uclibc
Configured with:
/home/danov/ronetix/buildroot/toolchain_build_arm/gcc-4.1.2/configure
--prefix=/home/danov/ronetix/buildroot/build_arm/staging_dir
--build=i386-pc-linux-gnu --host=i386-pc-linux-gnu
--target=arm-linux-uclibc --enable-languages=c,c++
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld
--with-gmp=/home/danov/ronetix/buildroot/toolchain_build_arm/gmp
--with-mpfr=/home/danov/ronetix/buildroot/toolchain_build_arm/mpfr
--enable-shared --enable-threads --disable-multilib
Thread model: posix
gcc version 4.1.2


With "make menuconfig" I configure an external toolchain and set the
toolchain path to "~/Projects/eaclock/sw/tools/arm-linux-uclibc".

When I run "make" busybox compiles ok but then it appears to choke
when linking against the libraries.

  CC      util-linux/switch_root.o
  CC      util-linux/umount.o
  AR      util-linux/lib.a
  LD      util-linux/volume_id/built-in.o
  AR      util-linux/volume_id/lib.a
  LINK    busybox_unstripped
Trying libraries: crypt m
Failed: -Wl,--start-group -lcrypt -lm -Wl,--end-group
Output of:
~/Projects/eaclock/sw/tools/arm-linux-uclibc/bin/arm-linux-gcc -Wall
-Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused
-Wunused-parameter -Wmissing-prototypes -Wmissing-declarations
-Wdeclaration-after-statement -Wold-style-definition
-fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer
-ffunction-sections -fdata-sections -fno-guess-branch-probability
-funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1
-falign-labels=1 -falign-loops=1 -Os -o busybox_unstripped
-Wl,--sort-common -Wl,--gc-sections -Wl,--start-group
applets/built-in.o archival/lib.a archival/libunarchive/lib.a
console-tools/lib.a coreutils/lib.a coreutils/libcoreutils/lib.a
debianutils/lib.a e2fsprogs/lib.a editors/lib.a findutils/lib.a
init/lib.a libbb/lib.a libpwdgrp/lib.a loginutils/lib.a
miscutils/lib.a modutils/lib.a networking/lib.a
networking/libiproute/lib.a networking/udhcp/lib.a printutils/lib.a
procps/lib.a runit/lib.a selinux/lib.a shell/lib.a sysklogd/lib.a
util-linux/lib.a util-linux/volume_id/lib.a archival/built-in.o
archival/libunarchive/built-in.o console-tools/built-in.o
coreutils/built-in.o coreutils/libcoreutils/built-in.o
debianutils/built-in.o e2fsprogs/built-in.o editors/built-in.o
findutils/built-in.o init/built-in.o libbb/built-in.o
libpwdgrp/built-in.o loginutils/built-in.o miscutils/built-in.o
modutils/built-in.o networking/built-in.o
networking/libiproute/built-in.o networking/udhcp/built-in.o
printutils/built-in.o procps/built-in.o runit/built-in.o
selinux/built-in.o shell/built-in.o sysklogd/built-in.o
util-linux/built-in.o util-linux/volume_id/built-in.o -Wl,--end-group
-Wl,--start-group -lcrypt -lm -Wl,--end-group
==========
/home/michel/Projects/eaclock/sw/firm/buildroot/project_build_arm/eaclock/busybox-1.12.1/scripts/trylink:
line 44: ~/Projects/eaclock/sw/tools/arm-linux-uclibc/bin/arm-linux-gcc:
No such file or directory
make[1]: *** [busybox_unstripped] Error 1
make[1]: Leaving directory
`/home/michel/Projects/eaclock/sw/firm/buildroot/project_build_arm/eaclock/busybox-1.12.1'
make: *** [/home/michel/Projects/eaclock/sw/firm/buildroot/project_build_arm/eaclock/busybox-1.12.1/busybox]
Error 2



Could there be a problem with the path to the libraries?
The -L option seems to be correct in EXTRA_CFLAGS.
The busybox build starts with the output:

/usr/bin/make -j1
CC=~/Projects/eaclock/sw/tools/arm-linux-uclibc/bin/arm-linux-gcc
CROSS_COMPILE="~/Projects/eaclock/sw/tools/arm-linux-uclibc/bin/arm-linux-"
\
        CROSS="~/Projects/eaclock/sw/tools/arm-linux-uclibc/bin/arm-linux-"
PREFIX="/home/michel/Projects/eaclock/sw/firm/buildroot/project_build_arm/eaclock/root"
\
        ARCH=arm \
        EXTRA_CFLAGS="-Os
-I/home/michel/Projects/eaclock/sw/firm/buildroot/build_arm/staging_dir/include
-I/home/michel/Projects/eaclock/sw/firm/buildroot/build_arm/staging_dir/usr/include
-I~/Projects/eaclock/sw/tools/arm-linux-uclibc/arm-linux/include
-L~/Projects/eaclock/tools/arm-linux-uclibc/lib" -C
/home/michel/Projects/eaclock/sw/firm/buildroot/project_build_arm/eaclock/busybox-1.12.1
make[1]: Entering directory
`/home/michel/Projects/eaclock/sw/firm/buildroot/project_build_arm/eaclock/busybox-1.12.1'
  CC      applets/applets.o
  LD      applets/built-in.o
  CC      archival/ar.o
  CC      archival/bbunzip.o
  CC      archival/cpio.o


Any ideas with the busybox build fails?

Thanks,

Michel
