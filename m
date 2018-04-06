From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 22:21:15 +0200
Subject: [Buildroot] [PATCH] package/llvm: add dependency on shared
 libraries
In-Reply-To: <a05eea9c-d124-84b5-2a75-903f4748f06f@smile.fr>
References: <20180406093958.9392-1-valentin.korenblit@smile.fr>
 <20180406164141.53fbe576@windsurf>
 <a05eea9c-d124-84b5-2a75-903f4748f06f@smile.fr>
Message-ID: <20180406222115.14f6cc2c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 6 Apr 2018 17:03:04 +0200, Valentin Korenblit wrote:

> >> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>  
> > Interestingly, I haven't seen any failure of LLVM related to static
> > libraries reported by the autobuilders.  
> 
> I think llvm should compile correctly but mesa3d has --enable-llvm-shared-libs.
> We can disable that option if BR2_STATIC_ONLY.

LLVM doesn't build properly with BR2_STATIC_LIBS. The following defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_LLVM=y

fails to build with:

[ 60%] Linking CXX shared module ../../LLVMHello.so
/home/thomas/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/6.4.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: /home/thomas/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/6.4.0/../../../
../arm-buildroot-linux-uclibcgnueabihf/lib/libstdc++.a(eh_globals.o)(.text.__cxa_get_globals_fast+0x10): R_ARM_TLS_LE32 relocation not permitted in shared object
/home/thomas/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/6.4.0/../../../../arm-buildroot-linux-uclibcgnueabihf/lib/libstdc++.a(eh_globals.o): In function `__cxa_get_globals_fast':
eh_globals.cc:(.text.__cxa_get_globals_fast+0x10): dangerous relocation: unsupported relocation
/home/thomas/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/6.4.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: /home/thomas/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/6.4.0/../../../
../arm-buildroot-linux-uclibcgnueabihf/lib/libstdc++.a(eh_globals.o)(.text.__cxa_get_globals+0x10): R_ARM_TLS_LE32 relocation not permitted in shared object
/home/thomas/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/6.4.0/../../../../arm-buildroot-linux-uclibcgnueabihf/lib/libstdc++.a(eh_globals.o): In function `__cxa_get_globals':
eh_globals.cc:(.text.__cxa_get_globals+0x10): dangerous relocation: unsupported relocation
/home/thomas/buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libc.a(__uClibc_main.os): In function `__uClibc_fini':
__uClibc_main.c:(.text+0x164): undefined reference to `__fini_array_end'
__uClibc_main.c:(.text+0x168): undefined reference to `__fini_array_start'
__uClibc_main.c:(.text+0x16c): undefined reference to `__fini_array_start'
/home/thomas/buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libc.a(__uClibc_main.os): In function `__uClibc_main':
__uClibc_main.c:(.text+0x580): undefined reference to `__preinit_array_start'
__uClibc_main.c:(.text+0x584): undefined reference to `__preinit_array_start'
__uClibc_main.c:(.text+0x588): undefined reference to `__preinit_array_end'
__uClibc_main.c:(.text+0x58c): undefined reference to `__init_array_start'
__uClibc_main.c:(.text+0x590): undefined reference to `__init_array_end'
__uClibc_main.c:(.text+0x594): undefined reference to `__init_array_start'
/home/thomas/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/6.4.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../../LLVMHello.so: hidden symbol `__fini_array_end' isn't defined
/home/thomas/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/6.4.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: final link failed: Bad value
collect2: error: ld returned 1 exit status
lib/Transforms/Hello/CMakeFiles/LLVMHello.dir/build.make:94: recipe for target 'lib/LLVMHello.so' failed
make[4]: *** [lib/LLVMHello.so] Error 1

So basically, it's trying to build a shared library.

Could you fix up your patch to propagate the !BR2_STATIC_LIBS
dependency to:

 1. The Config.in comment in package/llvm/Config.in

 2. The mesa3d package that selects BR2_PACKAGE_LLVM

And send an updated version ?

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
