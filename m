From: Markus Mayer <code@mmayer.net>
Date: Fri, 12 May 2017 16:49:55 -0700
Subject: [Buildroot] Buildroot w. custom tool chain looks for
 ld-linux-aarch64.so.1 in the wrong place
Message-ID: <CANEuBv4wMzQ9MS3XEJR+vURfmyOiKJBw4f79CNbWxdm1ZLhLwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am very new to buildroot and have just started playing around and
experimenting with it. Specifically, I was looking at building ARM and
ARM64 root file systems. MIPS will follow later.

Using a Linaro toolchain, I am able to successfully build a basic root
file system using our kernel [1].

However, the ultimate goal is to use our own toolchain [2]. This is
built with crosstools-ng, so it should meet the requirements of
buildroot.

With our toolchain, I am running into an issue when it comes to
linking busybox. I believe that the error only shows up with busybox,
because it is simply the first time it tries to link a binary, not
because it has anything to do with busybox.

The error is "/opt/toolchain/stbgcc-6.3-0.1/bin/../lib/gcc/aarch64-unknown-linux-gnueabi/6.3.0/../../../../aarch64-unknown-linux-gnueabi/bin/ld:
cannot find /lib/ld-linux-aarch64.so.1".

Here's the full output:
----------------------------------------
>>> busybox 1.26.2 Building
PATH="/home/mmayer/Development/buildroot/output/host/bin:/home/mmayer/Development/buildroot/output/host/sbin:/home/mmayer/Development/buildroot/output/host/usr/bin:/home/mmayer/Development/buildroot/output/host/usr/sbin:/home/mmayer/bin:/home/mmayer/bin:/opt/toolchain/stbgcc-6.3-0.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os " CFLAGS_busybox="" /usr/bin/make -j8
CC="/home/mmayer/Development/buildroot/output/host/usr/bin/aarch64-linux-gnu-gcc"
ARCH=arm64 PREFIX="/home/mmayer/Development/buildroot/output/target"
EXTRA_LDFLAGS=""
CROSS_COMPILE="/home/mmayer/Development/buildroot/output/host/usr/bin/aarch64-linux-gnu-"
CONFIG_PREFIX="/home/mmayer/Development/buildroot/output/target"
SKIP_STRIP=y -C
/home/mmayer/Development/buildroot/output/build/busybox-1.26.2
  LINK    busybox_unstripped
Your linker does not support --sort-section,alignment
Your linker does not support --sort-common
Your linker does not support -Wl,--gc-sections
Trying libraries: m
Failed: -Wl,--start-group  -lm  -Wl,--end-group
Output of:
/home/mmayer/Development/buildroot/output/host/usr/bin/aarch64-linux-gnu-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused
-Wunused-parameter -Wunused-function -Wunused-value
-Wmissing-prototypes -Wmissing-declarations -Wno-format-security
-Wdeclaration-after-statement -Wold-style-definition
-fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer
-ffunction-sections -fdata-sections -fno-guess-branch-probability
-funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1
-falign-labels=1 -falign-loops=1 -fno-unwind-tables
-fno-asynchronous-unwind-tables -fno-builtin-printf -Os -o
busybox_unstripped -Wl,--start-group applets/built-in.o archival/lib.a
archival/libarchive/lib.a console-tools/lib.a coreutils/lib.a
coreutils/libcoreutils/lib.a debianutils/lib.a e2fsprogs/lib.a
editors/lib.a findutils/lib.a init/lib.a libbb/lib.a libpwdgrp/lib.a
loginutils/lib.a mailutils/lib.a miscutils/lib.a modutils/lib.a
networking/lib.a networking/libiproute/lib.a networking/udhcp/lib.a
printutils/lib.a procps/lib.a runit/lib.a selinux/lib.a shell/lib.a
sysklogd/lib.a util-linux/lib.a util-linux/volume_id/lib.a
archival/built-in.o archival/libarchive/built-in.o
console-tools/built-in.o coreutils/built-in.o
coreutils/libcoreutils/built-in.o debianutils/built-in.o
e2fsprogs/built-in.o editors/built-in.o findutils/built-in.o
init/built-in.o libbb/built-in.o libpwdgrp/built-in.o
loginutils/built-in.o mailutils/built-in.o miscutils/built-in.o
modutils/built-in.o networking/built-in.o
networking/libiproute/built-in.o networking/udhcp/built-in.o
printutils/built-in.o procps/built-in.o runit/built-in.o
selinux/built-in.o shell/built-in.o sysklogd/built-in.o
util-linux/built-in.o util-linux/volume_id/built-in.o -Wl,--end-group
-Wl,--start-group -lm -Wl,--end-group
==========
debianutils/lib.a(mktemp.o): In function `mktemp_main':
mktemp.c:(.text.mktemp_main+0xa0): warning: the use of `mktemp' is
dangerous, better use `mkstemp' or `mkdtemp'
/opt/toolchain/stbgcc-6.3-0.1/bin/../lib/gcc/aarch64-unknown-linux-gnueabi/6.3.0/../../../../aarch64-unknown-linux-gnueabi/bin/ld:
cannot find /lib/ld-linux-aarch64.so.1
collect2: error: ld returned 1 exit status
Note: if build needs additional libraries, put them in CONFIG_EXTRA_LDLIBS.
Example: CONFIG_EXTRA_LDLIBS="pthread dl tirpc audit pam"
Makefile:717: recipe for target 'busybox_unstripped' failed
make[2]: *** [busybox_unstripped] Error 1
package/pkg-generic.mk:227: recipe for target
'/home/mmayer/Development/buildroot/output/build/busybox-1.26.2/.stamp_built'
failed
make[1]: *** [/home/mmayer/Development/buildroot/output/build/busybox-1.26.2/.stamp_built]
Error 2
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2
----------------------------------------

Now, it is not a surprise that it can't find
/lib/ld-linux-aarch64.so.1. What is a surprise is why it is trying to
look there in the first place. It should be looking under the
toolchain directory, specifically, here:

$ ls -l /opt/toolchain/stbgcc-6.3-0.1/aarch64-unknown-linux-gnueabi/sys-root/lib/ld-linux-aarch64.so.1
lrwxrwxrwx 1 mmayer mmayer 19 Mar 31 20:00
/opt/toolchain/stbgcc-6.3-0.1/aarch64-unknown-linux-gnueabi/sys-root/lib/ld-linux-aarch64.so.1
-> ../lib64/ld-2.24.so
$ ls -l /opt/toolchain/stbgcc-6.3-0.1/aarch64-unknown-linux-gnueabi/sys-root/lib64/ld-2.24.so
-rwxr-xr-x 1 mmayer mmayer 1195200 Mar 31 20:00
/opt/toolchain/stbgcc-6.3-0.1/aarch64-unknown-linux-gnueabi/sys-root/lib64/ld-2.24.so

The loader is there, it just needs to look in the proper place.

Do you have pointers how to debug why it is not looking for the shared
library loader in the toolchain sys-root? Or maybe somebody already
knows what needs to be tweaked based on the above description?

Thanks,
-Markus

[1] https://github.com/Broadcom/stblinux
[2] https://github.com/Broadcom/stbgcc-6.3
