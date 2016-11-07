From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 7 Nov 2016 23:28:27 +0100
Subject: [Buildroot] [PATCH v4 08/22]
 toolchain-external-codesourcery-arm: new package
In-Reply-To: <20161107012017.22505-9-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
 <20161107012017.22505-9-arnout@mind.be>
Message-ID: <45d9a787-b339-5377-acf1-727a27f8bf75@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 07/11/2016 ? 02:20, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This commit adds a new package for the Sourcery CodeBench external
> toolchain for the ARM architecture.
> 
> The legacy implementation is removed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
> v4: add PREFIX definition, remove legacy implementation.
> ---
>  toolchain/toolchain-external/Config.in             | 37 ++--------------------
>  .../toolchain-external-codesourcery-arm/Config.in  | 33 +++++++++++++++++++
>  .../Config.in.options                              |  9 ++++++
>  .../toolchain-external-codesourcery-arm.hash       |  3 ++
>  .../toolchain-external-codesourcery-arm.mk         | 13 ++++++++
>  .../toolchain-external/toolchain-external.hash     |  3 --
>  toolchain/toolchain-external/toolchain-external.mk |  5 +--
>  7 files changed, 61 insertions(+), 42 deletions(-)
>  create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
>  create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options
>  create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash
>  create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index bffb9fd..dfc8e70 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -17,6 +17,7 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Con
>  
>  # ARM (use Linaro toolchain by default)
>  source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in"
>  
>  comment "Linaro toolchains available for Cortex-A + EABIhf"
>  	depends on BR2_armeb
> @@ -45,40 +46,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
>  	  generated is Thumb 2, with the hard floating point calling
>  	  convention, and uses the VFPv3-D16 FPU instructions.
>  
> -config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
> -	bool "Sourcery CodeBench ARM 2014.05"
> -	depends on BR2_arm
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> -	depends on BR2_ARM_EABI
> -	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_SSP
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> -	select BR2_INSTALL_LIBSTDCPP
> -	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> -	help
> -	  Sourcery CodeBench toolchain for the ARM architecture, from
> -	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
> -	  2.18 and gdb 7.7.50, kernel headers 3.13. It has support
> -	  for the following variants:
> -	    - ARMv5TE, little endian, soft-float, glibc
> -	      Select ARM926T, ARM10T, XScale or another ARMv5 core
> -	      Select BR2_SOFT_FLOAT
> -	    - ARMv4T, little endian, soft-float, glibc
> -	      Select ARM720T, ARM920T, ARM922T or another ARMv4 core
> -	      Select BR2_SOFT_FLOAT
> -	    - ARMv7-A, Thumb 2, little endian, soft-float, glibc
> -	      Select Cortex-A8, Cortex-A9 or another ARMv7-A core
> -	      Select BR2_SOFT_FLOAT
> -	      Set BR2_TARGET_OPTIMIZATION to -mthumb
> -
> -comment "Sourcery CodeBench toolchains available for the EABI ABI"
> -	depends on BR2_arm
> -	depends on !BR2_ARM_EABI
> -	depends on !BR2_STATIC_LIBS
> -
>  config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
>  	bool "Arago ARMv7 2011.09"
>  	depends on BR2_arm
> @@ -577,7 +544,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
>  	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arcle
>  	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arceb
>  	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
> -	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
>  	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
>  	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
>  	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
> @@ -635,6 +601,7 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Con
>  
>  # ARM
>  source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options"
>  
>  if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
>  
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
> new file mode 100644
> index 0000000..037985b
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
> @@ -0,0 +1,33 @@
> +config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
> +	bool "Sourcery CodeBench ARM 2014.05"
> +	depends on BR2_arm
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on BR2_ARM_EABI
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	select BR2_TOOLCHAIN_HAS_SSP
> +	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	help
> +	  Sourcery CodeBench toolchain for the ARM architecture, from
> +	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
> +	  2.18 and gdb 7.7.50, kernel headers 3.13. It has support
> +	  for the following variants:
> +	    - ARMv5TE, little endian, soft-float, glibc
> +	      Select ARM926T, ARM10T, XScale or another ARMv5 core
> +	      Select BR2_SOFT_FLOAT
> +	    - ARMv4T, little endian, soft-float, glibc
> +	      Select ARM720T, ARM920T, ARM922T or another ARMv4 core
> +	      Select BR2_SOFT_FLOAT
> +	    - ARMv7-A, Thumb 2, little endian, soft-float, glibc
> +	      Select Cortex-A8, Cortex-A9 or another ARMv7-A core
> +	      Select BR2_SOFT_FLOAT
> +	      Set BR2_TARGET_OPTIMIZATION to -mthumb
> +
> +comment "Sourcery CodeBench toolchains available for the EABI ABI"
> +	depends on BR2_arm
> +	depends on !BR2_ARM_EABI
> +	depends on !BR2_STATIC_LIBS
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options
> new file mode 100644
> index 0000000..7f3654d
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options
> @@ -0,0 +1,9 @@
> +if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
> +
> +config BR2_TOOLCHAIN_EXTERNAL_PREFIX
> +	default "arm-none-linux-gnueabi"
> +
> +config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
> +	default "toolchain-external-codesourcery-arm"
> +
> +endif
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash
> new file mode 100644
> index 0000000..535f4aa
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> +sha256 e16a5b1e41d7ff1e74161f9405182001bc8d1360d89564e73911032e6966cc0d  arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk
> new file mode 100644
> index 0000000..f96a0e0
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# toolchain-external-codesourcery-arm
> +#
> +################################################################################
> +
> +TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_VERSION = 2014.05-29
> +
> +TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_SITE = http://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
> +TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_SOURCE = arm-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
> +TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_ACTUAL_SOURCE_TARBALL = arm-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
> +
> +$(eval $(toolchain-external-package))
> diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
> index 945bf21..d2cf44b 100644
> --- a/toolchain/toolchain-external/toolchain-external.hash
> +++ b/toolchain/toolchain-external/toolchain-external.hash
> @@ -6,9 +6,6 @@ sha256 e424e90d8481d942a40266d78d1488726561fed3ec38403094f98055e61889d0  blackfi
>  sha256 c65b1b4b918d5185349d62a3b7bf43b4b21e1175c52598ec047ca56b3f11d857  blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
>  
>  # Mentor's Sourcery CodeBench Lite toolchains
> -# ARM
> -sha256 39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> -sha256 e16a5b1e41d7ff1e74161f9405182001bc8d1360d89564e73911032e6966cc0d  arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2
>  # NiosII
>  sha256 750639290744adda931c81fa2cd2ffc2bde972488047824dcfaa53c42562191d  sourceryg++-2016.05-10-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
>  sha256 3dc1c2685c0472059547dd7becb5dc991541b8176af39fa7aa5f601d38b9879a  sourceryg++-2016.05-10-nios2-linux-gnu.src.tar.bz2
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 410ff18..f8d22b4 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -80,10 +80,7 @@ define TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
>  		$(TAR) --strip-components=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
>  endef
>  
> -ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
> -TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
> -TOOLCHAIN_EXTERNAL_SOURCE = arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> -else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A),y)
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
>  TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
>  TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = arago-toolchain-2011.09-sources.tar.bz2
> 
