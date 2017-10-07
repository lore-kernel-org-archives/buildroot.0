From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 7 Oct 2017 11:57:48 +0200
Subject: [Buildroot] [PATCH 4/8] toolchain/external: hide versions too
 old for the current arch
In-Reply-To: <56ab77ea28f24c9495de8a7ca8822c61a1642f97.1504431850.git.yann.morin.1998@free.fr>
References: <cover.1504431850.git.yann.morin.1998@free.fr>
 <56ab77ea28f24c9495de8a7ca8822c61a1642f97.1504431850.git.yann.morin.1998@free.fr>
Message-ID: <ae5be870-2ae4-966f-0cd6-261d02db7d1d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

This patch needs to be rebased on master after the last linaro toolchain version
bump (sorry ;-) )

Le 03/09/2017 ? 11:44, Yann E. MORIN a ?crit?:
> Hide the toolchains if the arch requires a gcc version more recent
> than the one they provide.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../toolchain-external/toolchain-external-codescape-img-mips/Config.in  | 1 +
>  .../toolchain-external/toolchain-external-codescape-mti-mips/Config.in  | 1 +
>  .../toolchain-external-codesourcery-aarch64/Config.in                   | 1 +
>  .../toolchain-external/toolchain-external-codesourcery-amd64/Config.in  | 1 +
>  .../toolchain-external/toolchain-external-codesourcery-arm/Config.in    | 2 ++
>  .../toolchain-external/toolchain-external-codesourcery-mips/Config.in   | 2 ++
>  .../toolchain-external/toolchain-external-codesourcery-niosII/Config.in | 1 +
>  .../toolchain-external/toolchain-external-linaro-aarch64/Config.in      | 1 +
>  toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in    | 2 ++
>  toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in  | 2 ++
>  toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in  | 1 +
>  11 files changed, 15 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
> index e29c4dcb87..8b2eab0ad2 100644
> --- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
>  	bool "Codescape IMG GNU Linux Toolchain 2016.05"
>  	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el

Having

> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5

and
	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

looks redundant...

Also where BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9 is selected when you use a packaged
toolchain ?
With the complete series applied I can't select a packaged external toolchain.

Try with to select the Linaro toolchain with this defconfig:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y

Best regards,
Romain

>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
> index efe6f8527e..db191fd1be 100644
> --- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
>  	bool "Codescape MTI GNU Linux Toolchain 2016.05"
>  	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT) || \
>  		BR2_MIPS_CPU_MIPS32R5 || (BR2_MIPS_CPU_MIPS64R5 && !BR2_MIPS_SOFT_FLOAT)
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
> index 66a032e9ac..24cbcffa29 100644
> --- a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
>  	bool "CodeSourcery AArch64 2014.11"
>  	depends on BR2_aarch64
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
>  	# a57/a53 and a72/a53 appeared in gcc-6 or were broken before
>  	depends on !BR2_cortex_a57_a53 && !BR2_cortex_a72_a53
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
> index 101e227af9..50c5a20019 100644
> --- a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
>  	bool "Sourcery CodeBench AMD64 2016.11"
>  	depends on BR2_x86_64
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_x86_jaguar || BR2_x86_steamroller
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
> index e1a7891007..b91daa5c81 100644
> --- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
>  	bool "Sourcery CodeBench ARM 2014.05"
>  	depends on BR2_arm
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
>  	# a15/a7 appeared in gcc-4.9, a17/a7 in gcc-5, a57/a53 and a72/a53
>  	# in gcc-6, or they each were broken earlier than that.
>  	depends on !BR2_cortex_a15_a7 && !BR2_cortex_a17_a7
> @@ -35,5 +36,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
>  
>  comment "Sourcery CodeBench toolchains available for the EABI ABI"
>  	depends on BR2_arm
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
>  	depends on !BR2_ARM_EABI
>  	depends on !BR2_STATIC_LIBS
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
> index 6a13ae6cd6..734f0e4c7c 100644
> --- a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
> @@ -2,6 +2,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
>  	bool "Sourcery CodeBench MIPS 2016.05"
>  	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>  	depends on BR2_MIPS_CPU_MIPS32R2 || BR2_MIPS_CPU_MIPS64R2
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
>  	# Unsupported MIPS cores
>  	depends on !BR2_mips_interaptiv
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> @@ -89,5 +90,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
>  	      Select BR2_SOFT_FLOAT
>  
>  comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 and n64"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
>  	depends on BR2_MIPS_NABI32
>  	depends on !BR2_STATIC_LIBS
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
> index 341bc2ab44..7563995eb6 100644
> --- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
>  	bool "Sourcery CodeBench Nios-II 2017.05"
>  	depends on BR2_nios2
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on !BR2_STATIC_LIBS
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
> index caa5ed340a..71ae73adb8 100644
> --- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
>  	bool "Linaro AArch64 2017.02"
>  	depends on BR2_aarch64
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on !BR2_STATIC_LIBS
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
> index f538eb7eb3..f5bbbaaad8 100644
> --- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
> @@ -1,11 +1,13 @@
>  comment "Linaro toolchains available for Cortex-A + EABIhf"
>  	depends on BR2_arm
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
>  	depends on !BR2_STATIC_LIBS
>  
>  config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
>  	bool "Linaro ARM 2017.02"
>  	depends on BR2_arm
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on BR2_ARM_EABIHF
> diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
> index 14c7481f81..64e97eeea7 100644
> --- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
> @@ -1,11 +1,13 @@
>  comment "Linaro toolchains available for Cortex-A + EABIhf"
>  	depends on BR2_armeb
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
>  	depends on !BR2_STATIC_LIBS
>  
>  config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
>  	bool "Linaro armeb 2017.02"
>  	depends on BR2_armeb
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on BR2_ARM_EABIHF
> diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> index f438ea765d..8e4344a83d 100644
> --- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
>  	bool "Synopsys ARC 2016.09 toolchain"
>  	depends on BR2_arc
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  	depends on BR2_HOSTARCH = "x86_64"
>  	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
>  	select BR2_INSTALL_LIBSTDCPP
> 
