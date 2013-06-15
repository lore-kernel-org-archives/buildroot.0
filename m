From: piquemal michel <michel_piquemal@yahoo.fr>
Date: Sat, 15 Jun 2013 21:05:30 +0100 (BST)
Subject: [Buildroot] Building with uClibc 0.9.28, Linux 2.6.36
Message-ID: <1371326730.31593.YahooMailNeo@web171503.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to build a matching dev environment for a MIPSel embedded product that I bought.
It's based uClibc 0.9.28, Linux 2.6.36, I know...pretty old stuff.

I started off latest 05-13 buildroot menuconfig, setting up target HW, linux version.
While I could not select appropriate uClibC version I left default, but made some minor change in uclib.mk to reflect proper version and download location.

make fails when it comes to uClibC related stuff obviously.
First is default path for linux headers: I did uclibc menuconfig and changed path to ../linux (relative where uclibC is)
fix_includes then complained about detection for linux version: I added?
#define UTS_RELEASE "2.6.26" in linux include file version.h
and make went some bit further, but I'm stuck (log below).


I may not be far from target, but I fear I can go endlessly into such sort of dirty modding.
Are there some patches available to build environement with such an old uClibc version?
Or can anyone help into reaching the last mile and get such hacked setup successful?

Many thanks!




>>> ? Installing uClibc headers
/usr/bin/make -j1 -C /home/mpi/development/buildroot-2013.05/output/toolchain/uClibc-0.9.28 \
ARCH="mips" \
PREFIX=/home/mpi/development/buildroot-2013.05/output/toolchain/uClibc_dev/ \
DEVEL_PREFIX=/usr/ \
RUNTIME_PREFIX=/home/mpi/development/buildroot-2013.05/output/toolchain/uClibc_dev/ \
CROSS_COMPILE="/home/mpi/development/buildroot-2013.05/output/host/usr/bin/mipsel-buildroot-linux-uclibc-" \
UCLIBC_EXTRA_CFLAGS="" \
HOSTCC="/usr/bin/gcc" headers \
lib/crt1.o lib/crti.o lib/crtn.o \
install_headers
make[1]: Entering directory `/home/mpi/development/buildroot-2013.05/output/toolchain/uClibc-0.9.28'
+ ./extra/scripts/fix_includes.sh -k ../linux -t mips
Current kernel version is 2.6.36
-e?

Using kernel headers from 2.6.36 for architecture 'mips'
-e provided in directory ../linux
-e?

+ TOPDIR=. CC= /home/mpi/development/buildroot-2013.05/output/host/usr/bin/mipsel-buildroot-linux-uclibc-gcc /bin/sh extra/scripts/gen_bits_syscall_h.sh
mipsel-buildroot-linux-uclibc-gcc: error: ./include/asm/unistd.h: No such file or directory
mipsel-buildroot-linux-uclibc-gcc: fatal error: no input files
compilation terminated.
<stdin>:1:34: fatal error: ./include/asm/unistd.h: No such file or directory
compilation terminated.
+ cmp include/bits/sysnum.h include/bits/sysnum.h.new
+ mv -f include/bits/sysnum.h.new include/bits/sysnum.h
/usr/bin/make -C libc/sysdeps/linux/common headers
make[2]: Entering directory `/home/mpi/development/buildroot-2013.05/output/toolchain/uClibc-0.9.28/libc/sysdeps/linux/common'
ln -fs ../libc/sysdeps/linux/common/fpu_control.h ../../../..//include/
make[2]: Leaving directory `/home/mpi/development/buildroot-2013.05/output/toolchain/uClibc-0.9.28/libc/sysdeps/linux/common'
/usr/bin/make -C libc/sysdeps/linux/mips headers
make[2]: Entering directory `/home/mpi/development/buildroot-2013.05/output/toolchain/uClibc-0.9.28/libc/sysdeps/linux/mips'
ln -fs ../libc/sysdeps/linux/mips/sgidefs.h ../../../..//include/
ln -fs ../libc/sysdeps/linux/mips/fpu_control.h ../../../..//include/
make[2]: Leaving directory `/home/mpi/development/buildroot-2013.05/output/toolchain/uClibc-0.9.28/libc/sysdeps/linux/mips'
make[1]: *** No rule to make target `lib/crt1.o'. ?Stop.
make[1]: Leaving directory `/home/mpi/development/buildroot-2013.05/output/toolchain/uClibc-0.9.28'
make: *** [/home/mpi/development/buildroot-2013.05/output/toolchain/uClibc-0.9.28/.configured] Error 2
