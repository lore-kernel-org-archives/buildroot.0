From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 14 Oct 2016 23:49:34 +0200
Subject: [Buildroot] [PATCH 1/4] toolchain/external: bump Linaro ARM to
 2016.05 for i686 hosts
In-Reply-To: <1476219900-13020-1-git-send-email-romain.naour@gmail.com>
References: <1476219900-13020-1-git-send-email-romain.naour@gmail.com>
Message-ID: <359be952-2c22-e01f-48a0-75edc9771d7e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 11/10/2016 ? 23:04, Romain Naour a ?crit :
> This Linaro release provide a new toolchain archive for i686 hosts, so update our
> old 2014.09.
> 
> Tested with Qemu qemu-2.4.1-11.fc23 and with HOSTARCH set to x86 in the Buildroot
> main Makefile.

According to the Host Requirements [1], this new toolchain needs at least glibc
2.14. So, no need to update the autobuilder exception in autobuild-run :)

Tested on a squeeze chroot:
./arm-linux-gnueabihf-gcc --version
./arm-linux-gnueabihf-gcc: /lib/libc.so.6: version `GLIBC_2.14' not found
(required by ./arm-linux-gnueabihf-gcc)

Best regards,
Romain

[1] https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/

> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> My host is a x86_64
> ---
>  toolchain/toolchain-external/Config.in             | 29 +---------------------
>  .../toolchain-external/toolchain-external.hash     |  3 +--
>  toolchain/toolchain-external/toolchain-external.mk |  7 ++----
>  3 files changed, 4 insertions(+), 35 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 2b17b7a..4293369 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -11,38 +11,11 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
>  	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
>  	depends on !BR2_STATIC_LIBS
>  
> -# Note: we use the same symbol for both Linaro toolchains.
> -# Since they have different dependencies (the host), we can
> -# give them different prompts and different help texts.
> -config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
> -	bool "Linaro ARM 2014.09"
> -	depends on BR2_arm
> -	depends on BR2_ARM_CPU_ARMV7A
> -	depends on BR2_HOSTARCH = "x86"
> -	depends on BR2_ARM_EABIHF
> -	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_SSP
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> -	select BR2_INSTALL_LIBSTDCPP
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> -	select BR2_TOOLCHAIN_HAS_FORTRAN
> -	help
> -	  Linaro toolchain for the ARM architecture. It uses Linaro
> -	  GCC 2014.09 (based on gcc 4.9), Linaro GDB 2013.10 (based on
> -	  GDB 7.6), eglibc 2.19, Binutils 2014.09 (based on 2.24). It
> -	  generates code that runs on all Cortex-A profile devices,
> -	  but tuned for the Cortex-A9. The code generated is Thumb 2,
> -	  with the hard floating point calling convention, and uses
> -	  the VFPv3-D16 FPU instructions.
> -
> -# See the note above.
>  config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
>  	bool "Linaro ARM 2016.05"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV7A
> -	depends on BR2_HOSTARCH = "x86_64"
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on BR2_ARM_EABIHF
>  	depends on !BR2_STATIC_LIBS
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
> index 9059175..b89b346 100644
> --- a/toolchain/toolchain-external/toolchain-external.hash
> +++ b/toolchain/toolchain-external/toolchain-external.hash
> @@ -35,8 +35,7 @@ sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2
>  sha256 25fbf0513ad7322b15cbaae964cafadcbb4c939f2708f57f40b8f9f2d601122b  arago-toolchain-2011.09-sources.tar.bz2
>  
>  # ARM and Aarch64 toolchains from Linaro
> -sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
> -sha256 eafeb3a5247e9ce31aa35d812e296fba5d5f1443e106d9bef9e38d3ee3ade006  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_src.tar.bz2
> +sha256 f1421c580ce977226f4fefc9c409b3b423260cc65a6e9dc6da88bb3478a521a0  gcc-linaro-5.3.1-2016.05-i686_arm-linux-gnueabihf.tar.xz
>  sha256 987941c9fffdf56ffcbe90e8984673c16648c477b537fcf43add22fa62f161cd  gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf.tar.xz
>  sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
>  sha256 bf5d3111dad5aa9aef0e955875fb7fc9e918cb24519af7014dd67a9e581a49b1  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_src.tar.bz2
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 6fd2742..d7fa9df 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -329,13 +329,10 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
>  endef
>  TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
> +TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/arm-linux-gnueabihf
>  ifeq ($(HOSTARCH),x86)
> -TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/14.09/components/toolchain/binaries
> -TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
> -TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_src.tar.bz2
> -TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_SYMLINK
> +TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-i686_arm-linux-gnueabihf.tar.xz
>  else
> -TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/arm-linux-gnueabihf
>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf.tar.xz
>  endif
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
> 
