From: Craig Lawton-Devine <craig.lawtondevine@googlemail.com>
Date: Thu, 11 Mar 2010 13:36:32 +0000
Subject: [Buildroot] generating gdb for the target
Message-ID: <d51100e91003110536q4d7a3482h5de85f085605cbf3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for your post
(http://lists.busybox.net/pipermail/buildroot/2009-March/026585.html),
I'm sure it saved me a great deal of time trying to find the cause of
the problem on my system.

Unfortunately I haven't been able to solve it yet though (despite your
detailed post) as things have moved on since then.

To confirm it is the same problem here's a snippet from
./output/build/gdb-6.8-target/gdb/config.log:
configure:23001: checking for ELF support in BFD
configure:23025:
/home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/staging/usr/bin/i386-linux-uclibc-gcc
-Os -pipe -Os  -I/home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/staging/usr/include
-I/home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/staging/include
--sysroot=/home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/staging/
-isysroot /home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/staging
-mtune=i386 -march=i386 -o conftest -Os -pipe -Os
-I/home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/staging/usr/include
-I/home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/staging/include
--sysroot=/home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/staging/
-isysroot /home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/staging
-mtune=i386 -march=i386
-L/home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/staging/lib
-L/home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/staging/usr/lib
--sysroot=/home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/staging/
-Wno-error -I/home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/toolchain/gdb-6.8/gdb/../include
-I../bfd -I/home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/toolchain/gdb-6.8/gdb/../bfd
 -L../bfd -L../libiberty  conftest.c -lbfd -liberty  -lncurses -lm
>&5
/home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/staging/usr/lib/libiberty.a(cplus-dem.o):
In function `strtol':
/usr/include/stdlib.h:336: undefined reference to `__strtol_internal'
/home/craig/buildroot-attempt-20100302/buildroot-2010.02/output/staging/usr/lib/libiberty.a(unlink-if-ordinary.o):
In function `lstat':
/usr/include/sys/stat.h:443: undefined reference to `__lxstat'
collect2: ld returned 1 exit status

As you can see the library search path is:
output/staging/lib
output/staging/usr/lib
../bfd
../libiberty

So I altered output/toolchain/gdb-6.8/gdb/configure around line 23001
(# Add ELF support to GDB, but only if BFD includes ELF support) as
follows:
-LDFLAGS="$LDFLAGS -L../bfd -L../libiberty"
+LDFLAGS="-L../bfd -L../libiberty $LDFLAGS"
-LIBS="$LIBS -lbfd -liberty $intl"
+LIBS="-lbfd -liberty $intl $LIBS"

and then
rm output/build/gdb-6.8-target/.configured
rm output/build/gdb-6.8-target/gdb/config.cache
make

Unfortunately this resulted in the same "Symbol format `elf32-i386'
unknown." error when running gdb on the target.
So I either have not triggered the re-build properly with the altered
'configure' script or the change I made was incorrect.

I'd really appreciate if you or someone else can point me in the right
direction, as I'm beginner at buildroot.

Thanks again for your original post!

Regards,
Craig Lawton-Devine
