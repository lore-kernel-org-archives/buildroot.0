From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 22:09:56 +0200
Subject: [Buildroot] [PATCH] ne10: bump to v1.2.1
In-Reply-To: <20200501152558.17598-1-cody.guldner@rockwellcollins.com>
References: <20200430205812.130906-1>
 <20200501152558.17598-1-cody.guldner@rockwellcollins.com>
Message-ID: <20200501200956.GF3687@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cody, All,

On 2020-05-01 10:25 -0500, Cody Guldner spake thusly:
> Signed-off-by: Cody Guldner <cody.guldner@rockwellcollins.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> 
> ---
> Changes v1 -> v2:
> 	- Retain the previous SoB line in ne10 patch
> 	- Move _ARCH_SUPPORTS symbol to the top of the Config.in file
> 	- Remove v from the downloaded tarball in ne10.hash
> 	- Fix incorrectly setting NE10_LINUX_TARGET_ARCH
> ---
>  ...on-t-hard-code-thumb-code-generation.patch | 29 ++++++++++---------
>  package/ne10/Config.in                        | 19 +++++++-----
>  package/ne10/ne10.hash                        |  2 +-
>  package/ne10/ne10.mk                          |  6 ++--
>  4 files changed, 31 insertions(+), 25 deletions(-)
> 
> diff --git a/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch b/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
> index f140a60441..0aa6fd2ba1 100644
> --- a/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
> +++ b/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
> @@ -1,29 +1,30 @@
> -From 9ff39800cec5f1dabba246b253794582d611bc6d Mon Sep 17 00:00:00 2001
> -From: Baruch Siach <baruch@tkos.co.il>
> -Date: Fri, 20 Feb 2015 10:44:15 -0600
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Cody Guldner <cody.guldner@rockwellcollins.com>
> +Date: Tue, 14 Apr 2020 09:12:01 -0500
>  Subject: [PATCH] CMakeLists: don't hard code thumb code generation
>  
> -Migrating to version 1.2.0
> +Migrating to version 1.2.1
>  
>  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> +Signed-off-by: Cody Guldner <cody.guldner@rockwellcollins.com>
>  ---
>   CMakeLists.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index fdf01ec..34ae26e 100644
> +index fc2a5e3..25da215 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -84,7 +84,7 @@ if(ANDROID_PLATFORM)
> -     ${ANDROID_TOOLCHAIN_PATH}/arm-linux-androideabi-ar
> -     ${ANDROID_TOOLCHAIN_PATH}/arm-linux-androideabi-ranlib")
> +@@ -135,7 +135,7 @@ if(ANDROID_PLATFORM)
> +     ${CMAKE_C_FLAGS}")
>   elseif(GNULINUX_PLATFORM)
> --    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfpu=vfp3")
> -+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -march=armv7-a -mfpu=vfp3")
> -     set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfpu=neon")
> - elseif(IOS_PLATFORM)
> -     #set minimal target ios version.If not provided this option, Xcode
> +     if(${NE10_TARGET_ARCH} STREQUAL "armv7")
> +-      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfpu=vfp3 -funsafe-math-optimizations")
> ++      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -march=armv7-a -mfpu=vfp3 -funsafe-math-optimizations")
> +       set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfpu=neon")
> +       # Turn on asm optimization for Linux on ARM v7.
> +       set(NE10_ASM_OPTIMIZATION on)
>  -- 
> -1.9.1
> +2.23.0
>  
> diff --git a/package/ne10/Config.in b/package/ne10/Config.in
> index 8d375793db..68cb7f4cb3 100644
> --- a/package/ne10/Config.in
> +++ b/package/ne10/Config.in
> @@ -1,17 +1,20 @@
> +config BR2_PACKAGE_NE10_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64
> +	default y if BR2_arm && (BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4)
> +
>  config BR2_PACKAGE_NE10
>  	bool "ne10"
> -	depends on BR2_arm
> -	depends on BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4
> +	depends on BR2_PACKAGE_NE10_ARCH_SUPPORTS
>  	help
>  	  The Ne10 project has been set up to provide a set of common,
>  	  useful functions which have been heavily optimized for the
> -	  ARM Architecture and provide consistent well tested behavior
> -	  that can be easily incorporated into applications. C
> -	  interfaces to the functions are provided for both assembler
> -	  and NEON implementations.
> +	  ARM and AArch64 Architecture and provide consistent well
> +	  tested behavior that can be easily incorporated into
> +	  applications. C interfaces to the functions are provided for
> +	  both assembler and NEON implementations.
>  
>  	  http://projectne10.github.io/Ne10/
>  
>  comment "ne10 needs a toolchain w/ neon"
> -	depends on BR2_arm
> -	depends on !(BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4)
> +	depends on !BR2_PACKAGE_NE10_ARCH_SUPPORTS
> diff --git a/package/ne10/ne10.hash b/package/ne10/ne10.hash
> index 2c56215c1c..cdb6e013a1 100644
> --- a/package/ne10/ne10.hash
> +++ b/package/ne10/ne10.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  450dac5bb3a2351019ae23792e97c3bf965d16a21c0598b73cea9fbc3b3a56af  ne10-1.2.0.tar.gz
> +sha256  dd1a96610c0692cc80154ae123edd5d25e6e0a3f81d0c16a96425f3ef57b9929  ne10-1.2.1.tar.gz
>  sha256  eb48041c8e0ad556cf72f2a6eff89c893aa5702bba4e163ca7798cce07e6c55e  doc/LICENSE
> diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
> index 2af664be39..58652c0459 100644
> --- a/package/ne10/ne10.mk
> +++ b/package/ne10/ne10.mk
> @@ -4,13 +4,15 @@
>  #
>  ################################################################################
>  
> -NE10_VERSION = 1.2.0
> +NE10_VERSION = 1.2.1
>  NE10_SITE = $(call github,projectNe10,Ne10,v$(NE10_VERSION))
>  NE10_LICENSE = BSD-3-Clause or Apache-2.0
>  NE10_LICENSE_FILES = doc/LICENSE
>  NE10_INSTALL_STAGING = YES
>  
> -NE10_CONF_OPTS = -DGNULINUX_PLATFORM=ON
> +NE10_CONF_OPTS = \
> +	-DGNULINUX_PLATFORM=ON \
> +	-DNE10_LINUX_TARGET_ARCH=$(if $(BR2_aarch64),aarch64,armv7)
>  
>  ifeq ($(BR2_STATIC_LIBS),)
>  NE10_CONF_OPTS += \
> -- 
> 2.23.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
