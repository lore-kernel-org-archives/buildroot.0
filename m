From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 17 Mar 2014 15:59:23 +0100
Subject: [Buildroot] Few questions external toolchain
In-Reply-To: <530E6EC9.6090400@gmail.com>
References: <530B8CEA.90306@gmail.com> <530C6DD2.4070605@gmail.com>
 <CAAXf6LUbFzxUgz+kkes-f7TO0as40kDuaF+v6BG2neWEBeR-hw@mail.gmail.com>
 <530E1C12.9090400@gmail.com> <530E60FF.6090300@mind.be>
 <530E6EC9.6090400@gmail.com>
Message-ID: <CAAXf6LViJ2jLz36qkfTkyTiMH+G5aLsZ+qA_Sbkq16Av+kvfKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marco,

On Wed, Feb 26, 2014 at 11:46 PM, Marco Trapanese
<marcotrapanese@gmail.com> wrote:
> Il 26/02/2014 22:47, Arnout Vandecappelle ha scritto:
>
>> This smells like our external toolchain logic doesn't properly locate and
>> copy the sysroot. Can you verify if output/staging/usr/lib/crt1.o exists?
>
>
>
> Yes, it exists!
>
>
>
>> Perhaps if you can give the URL of this external toolchain, we can have a
>> look? Regards, Arnout
>
>
>
> https://github.com/embest-tech/fsl-linaro-toolchain
>

I finally took some time to look into this, sorry for the long delay.
I can indeed reproduce this problem:

$ BR2_DEBUG_WRAPPER=2 ./output/host/usr/bin/arm-linux-gcc /tmp/test.c
Toolchain wrapper executing:
    '/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/arm-linux-gcc'
    '--sysroot'
    '/home/tdescham/repo/contrib/buildroot-toolchain-marco/output/host/usr/arm-buildroot-linux-gnueabi/sysroot'
    '-mabi=aapcs-linux'
    '-msoft-float'
    '-marm'
    '-pipe'
    '-mfloat-abi=soft'
    '-march=armv5te'
    '-mcpu=arm926ej-s'
    '/tmp/test.c'
/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
cannot find crt1.o: No such file or directory
/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
cannot find crti.o: No such file or directory
/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
cannot find -lgcc_s
/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
cannot find -lc
/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
cannot find -lgcc_s
/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld:
cannot find crtn.o: No such file or directory
collect2: ld returned 1 exit status


./output/host/usr/bin/arm-linux-gcc -print-file-name=crt1.o
crt1.o


The details of gcc provided with the toolchain:
./output/host/usr/bin/arm-linux-gcc -v
Using built-in specs.
COLLECT_GCC=/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/arm-linux-gcc
COLLECT_LTO_WRAPPER=/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../libexec/gcc/arm-fsl-linux-gnueabi/4.6.2/lto-wrapper
Target: arm-fsl-linux-gnueabi
Configured with:
/work/build/.build/src/gcc-linaro-4.6-2011.06-0/configure
--build=i686-build_pc-linux-gnu --host=i686-build_pc-linux-gnu
--target=arm-fsl-linux-gnueabi
--prefix=/work/fsl-linaro-toolchain-2.13
--with-sysroot=/work/fsl-linaro-toolchain-2.13/arm-fsl-linux-gnueabi/multi-libs
--enable-languages=c,c++ --with-pkgversion='Freescale MAD -- Linaro
2011.07 -- Built at 2011/08/10 09:20' --enable-__cxa_atexit
--disable-libmudflap --disable-libgomp --disable-libssp
--with-gmp=/work/build/.build/arm-fsl-linux-gnueabi/build/static
--with-mpfr=/work/build/.build/arm-fsl-linux-gnueabi/build/static
--with-mpc=/work/build/.build/arm-fsl-linux-gnueabi/build/static
--with-ppl=/work/build/.build/arm-fsl-linux-gnueabi/build/static
--with-cloog=/work/build/.build/arm-fsl-linux-gnueabi/build/static
--with-libelf=/work/build/.build/arm-fsl-linux-gnueabi/build/static
--with-host-libstdcxx='-static-libgcc -Wl,-Bstatic,-lstdc++,-Bdynamic
-lm -L/work/build/.build/arm-fsl-linux-gnueabi/build/static/lib -lpwl'
--enable-threads=posix --enable-target-optspace --enable-plugin
--enable-multilib
--with-local-prefix=/work/fsl-linaro-toolchain-2.13/arm-fsl-linux-gnueabi/multi-libs
--disable-nls --enable-c99 --enable-long-long --with-system-zlib
Thread model: posix
gcc version 4.6.2 20110630 (prerelease) (Freescale MAD -- Linaro
2011.07 -- Built at 2011/08/10 09:20)


Looking at why crt1.o is not found, using strace, following locations are tried:

8119  access("/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/armv5/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../lib/gcc/armv5/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/lib/arm-fsl-linux-gnueabi/4.6.2/armv5/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/lib/armv5/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/buildroot-toolchain-marco/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv5/lib/arm-fsl-linux-gnueabi/4.6.2/armv5/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/buildroot-toolchain-marco/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv5/lib/armv5/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/buildroot-toolchain-marco/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv5/usr/lib/arm-fsl-linux-gnueabi/4.6.2/armv5/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/buildroot-toolchain-marco/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv5/usr/lib/armv5/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../lib/gcc/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/lib/arm-fsl-linux-gnueabi/4.6.2/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/lib/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/buildroot-toolchain-marco/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv5/lib/arm-fsl-linux-gnueabi/4.6.2/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/buildroot-toolchain-marco/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv5/lib/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/buildroot-toolchain-marco/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv5/usr/lib/arm-fsl-linux-gnueabi/4.6.2/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)
8119  access("/home/tdescham/repo/contrib/buildroot-toolchain-marco/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/armv5/usr/lib/crt1.o",
R_OK) = -1 ENOENT (No such file or directory)


while the real location is:
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crt1.o


If I check the original toolchain directly (outside of
buildroot):./bin/arm-linux-gcc -print-file-name=crt1.o
/home/tdescham/repo/contrib/fsl-linaro-toolchain/bin/../arm-fsl-linux-gnueabi/multi-libs/default/usr/lib/crt1.o


So at least the original toolchain can find its crt1.o.

Going back to buildroot, here are some variables determined in the
external toolchain logic:
SYSROOT_DIR=/home/tdescham/repo/contrib/fsl-linaro-toolchain/arm-fsl-linux-gnueabi/multi-libs/default/
ARCH_SYSROOT_DIR=/home/tdescham/repo/contrib/fsl-linaro-toolchain/arm-fsl-linux-gnueabi/multi-libs/armv5/
ARCH_LIB_DIR=lib
SUPPORT_LIB_DIR=
ARCH_SUBDIR=/home/tdescham/repo/contrib/fsl-linaro-toolchain/arm-fsl-linux-gnueabi/multi-libs/armv5/

During copying of the toolchain files, I do see following message:

ln: target '/home/tdescham/repo/contrib/buildroot-toolchain-marco/output/host/usr/arm-buildroot-linux-gnueabi/sysroot//home/tdescham/repo/contrib/fsl-linaro-toolchain/arm-fsl-linux-gnueabi/multi-libs/armv5/'
is not a directory: No such file or directory
Symlinking /home/tdescham/repo/contrib/buildroot-toolchain-marco/output/host/usr/arm-buildroot-linux-gnueabi/sysroot//home/tdescham/repo/contrib/fsl-linaro-toolchain/arm-fsl-linux-gnueabi/multi-libs/armv5/
-> ./../../../../../../../../../

and this message originates from:
toolchain/helpers.mk:158:               echo "Symlinking
$(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}" ; \

meaning that ARCH_SUBDIR is not supposed to be an absolute path.
ARCH_SUBDIR is determined as follows:
ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e
"s:^$${SYSROOT_DIR}(.*)/$$:\1:"`

which essentially strips off SYSROOT_DIR from the beginning of ARCH_SYSROOT_DIR.
However, there is no common part between both variables in this toolchain:

SYSROOT_DIR=/home/tdescham/repo/contrib/fsl-linaro-toolchain/arm-fsl-linux-gnueabi/multi-libs/default/
ARCH_SYSROOT_DIR=/home/tdescham/repo/contrib/fsl-linaro-toolchain/arm-fsl-linux-gnueabi/multi-libs/armv5/

so the logic of determining ARCH_SUBDIR is not correct in this case.
Looking at the strace output given above, the expected ARCH_SUBDIR is
'armv5'.

However, I don't know what is the best way to handle this.
One could try to find the greatest common path between SYSROOT_DIR and
ARCH_SYSROOT_DIR
(/home/tdescham/repo/contrib/fsl-linaro-toolchain/arm-fsl-linux-gnueabi/multi-libs/)
and strip that from ARCH_SYSROOT_DIR to get ARCH_SUBDIR, which would
fix this use case, but sounds not right.

Any input appreciated,

Best regards,
Thomas
