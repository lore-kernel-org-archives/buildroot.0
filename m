From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 14 Dec 2009 20:13:44 +0100
Subject: [Buildroot] SYSROOT_DIR issue with external toolchains
Message-ID: <5f2b60912141113n33fa36f1mdd45dc55313301c3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm setting up Buildroot with the CodeSourcery GCC ARM toolchain and I've
run into a small issue with the toolchain SYSROOT_DIR being incorrect.

First I configured BR for external toolchain and ran make:

$ make
...
Checking external toolchain settings
Incorrect selection of the C library
make: *** [/home/bjornfor/raid/forks/buildroot/output/stamps/ext-toolchain-installed]
Error 255

So I've got an "Incorrect selection of the C library". Running with more
printouts:

$ make V=1
...
SYSROOT_DIR="/opt/codesourcery/arm-none-linux-gnueabi/libc"; if ! test
-f ${SYSROOT_DIR}/lib/ld-linux.so.* ; then echo "Incorrect selection
of the C library"

So it looks for libraries in
SYSROOT_DIR="/opt/codesourcery/arm-none-linux-gnueabi/libc" but the actual
sysroot is here:

$ arm-none-linux-gnueabi-gcc -print-sysroot
/opt/arm-2009q3/bin/../arm-none-linux-gnueabi/libc

Currently BR assings SYSROOT_DIR like this (in
toolchain/external-toolchain/ext-tool.mk):

SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured |
tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=)

Apparently this does not work for CodeSourcery GCC ARM toolchains.
How about doing it like this:

SYSROOT_DIR=$(shell $(TARGET_CC) -print-sysroot)

Is there any problem with this change? (I also tried the -print-sysroot flag on
my native gcc but it didn't print anything. Shouldn't it?)

Best regards,
Bj?rn Forsman
