From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 21 Jul 2016 02:04:03 +0200
Subject: [Buildroot] bfin c++ problem
Message-ID: <20160721000402.GR22524@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

recently Thomas Petazzoni reported an issue for the internal
toolchain support in Buildroot targeting Blackfin to me.

It seem a simple c++ hello world program can't be compiled:
cat t.c
#include <iostream>
int main(void) { std::cout << "hello, world\n"; }

./output/host/usr/bin/bfin-buildroot-linux-uclibc-g++ -o t t.c                                                                                                         
/home/wbx/buildroot/output/host/usr/lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld:
t: hidden symbol `___gtdf2' in
/home/wbx/buildroot/output/host/usr/lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/libgcc.a(_gt_df.o)
is referenced by DSO
/home/wbx/buildroot/output/host/usr/lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld:
final link failed: Bad value
collect2: error: ld returned 1 exit status

It seems not specific to ___gtdf2, I have seen other symbols in
other buildsystems.

./output/host/usr/bin/bfin-buildroot-linux-uclibc-g++ -v                                                                                                               
Using built-in specs.
COLLECT_GCC=/home/wbx/buildroot/output/host/usr/bin/bfin-buildroot-linux-uclibc-g++.br_real
COLLECT_LTO_WRAPPER=/home/wbx/buildroot/output/host/usr/libexec/gcc/bfin-buildroot-linux-uclibc/6.1.0/lto-wrapper
Target: bfin-buildroot-linux-uclibc
Configured with: ./configure
--prefix=/home/wbx/buildroot/output/host/usr
--sysconfdir=/home/wbx/buildroot/output/host/etc --enable-static
--target=bfin-buildroot-linux-uclibc
--with-sysroot=/home/wbx/buildroot/output/host/usr/bfin-buildroot-linux-uclibc/sysroot
--disable-__cxa_atexit --with-gnu-ld --disable-libssp
--disable-multilib --with-gmp=/home/wbx/buildroot/output/host/usr
--with-mpfr=/home/wbx/buildroot/output/host/usr
--with-pkgversion='Buildroot 2016.08-git-01367-gdf60d48'
--with-bugurl=http://bugs.buildroot.net/ --disable-libquadmath
--disable-libsanitizer --disable-tls --disable-libmudflap
--enable-threads --with-mpc=/home/wbx/buildroot/output/host/usr
--without-isl --without-cloog --disable-decimal-float
--enable-languages=c,c++
--with-build-time-tools=/home/wbx/buildroot/output/host/usr/bfin-buildroot-linux-uclibc/bin
--enable-shared --disable-libgomp
Thread model: posix
gcc version 6.1.0 (Buildroot 2016.08-git-01367-gdf60d48) 

binutils 2.26.1, gcc 6.1.0 is used.

At least two patches are applied on top of gcc 6.1.0,
one for Bug 68468 and one for Bug 71721.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68468
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71721

ADI GNU Toolchain 2014R1 can compile the test program.

Does anyone have an idea?

best regards
 Waldemar
