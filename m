From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 9 Oct 2019 14:55:35 -0700
Subject: [Buildroot] Build failure on upgrade to 2019.08.1
Message-ID: <CAJJ6jxvGsZ0SYgivex5jGCHg21_acu=kp5CdRO2FF2K_xhUZwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I built the buildroot toolchain in one BR tree, to use as an external
toolchain in another.

Versions:
calfee at dock-container:~/edi-workspace/buildroot$
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld
--version
GNU ld (GNU Binutils) 2.31.1
Copyright (C) 2018 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or (at your option) a later version.
This program has absolutely no warranty.
calfee at dock-container:~/edi-workspace/buildroot$
/home/calfee/edi-workspace/buildroot/output/host/bin/arm-buildroot-linux-gnueabi-gcc
--version
arm-buildroot-linux-gnueabi-gcc.br_real (Buildroot
2019.11-git-00838-g196e3d2) 8.3.0

And then in another tree I checked out 2019.08.1, loaded in my old
defconfig and then started a build. Fairly quickly in the build I get
this link failure.

libtool: link: /home/calfee/edi-workspace/buildroot/output/host/bin/arm-buildroot-linux-gnueabi-gcc
-fno-strict-aliasing -fno-common -Wall -Wextra -Wundef -Wwrite-strings
-Wpointer-arith -Wmissing-declarations -Wredundant-decls
-Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2
-Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare
-Wstrict-aliasing -Wshadow -Winline -Wpacked
-Wmissing-format-attribute -Wmissing-noreturn -Winit-self
-Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds
-Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond
-Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference
-Wdouble-promotion -Wchar-subscripts -Wfloat-equal -Wpointer-sign
-Wno-deprecated-declarations -Wno-cast-function-type -Wno-unused-label
-Wnested-externs -Wmissing-prototypes -Wstrict-prototypes
-Wdeclaration-after-statement -Wimplicit-function-declaration
-Wold-style-definition -Wjump-misses-init -Wno-error=unused-parameter
-Wno-error=missing-field-initializers
-Wno-error=deprecated-declarations -Wno-error=cast-function-type
-Wno-error=unused-label -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os -Wl,--no-as-needed -o
dbus-update-activation-environment
dbus-update-activation-environment.o tool-common.o
../dbus/.libs/libdbus-1.so -Wl,-rpath
-Wl,/home/calfee/edi-workspace/buildroot/output/build/dbus-1.12.16/dbus/.libs
/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
warning: libpthread.so.0, needed by ../dbus/.libs/libdbus-1.so, not
found (try using -rpath or -rpath-link)

The missing file is in the output tree:
calfee at dock-container:~/edi-workspace/buildroot$ find output/ | grep
libpthread | xargs ls -l
-rwxr-xr-x 1 calfee calfee 148180 Oct  9 17:02
output/host/arm-buildroot-linux-gnueabi/sysroot/lib/libpthread-2.30.so
lrwxrwxrwx 1 calfee calfee     18 Oct  9 17:02
output/host/arm-buildroot-linux-gnueabi/sysroot/lib/libpthread.so.0 ->
libpthread-2.30.so
-rw-r--r-- 1 calfee calfee 347762 Oct  9 17:02
output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libpthread.a
lrwxrwxrwx 1 calfee calfee     25 Oct  9 17:02
output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libpthread.so
-> ../../lib/libpthread.so.0
-rwxr-xr-x 1 calfee calfee 148180 Oct  9 21:37
output/target/lib/libpthread-2.30.so
lrwxrwxrwx 1 calfee calfee     18 Oct  9 21:37
output/target/lib/libpthread.so.0 -> libpthread-2.30.so

So I guess as the failure suggested -rpath is not correct. I assume I
am missing some config option somewhere.

Any suggestions?

Thanks, Steve
