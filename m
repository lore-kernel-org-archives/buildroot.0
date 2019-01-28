From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Jan 2019 23:22:13 +0100
Subject: [Buildroot] [PATCH v2 1/1] toolchain: update AArch32/AArch64
 toolchains to 8-2-2019.01
In-Reply-To: <20190128170533.16555-1-joakim.bech@linaro.org>
References: <20190128133500.7515-1-joakim.bech@linaro.org>
 <20190128170533.16555-1-joakim.bech@linaro.org>
Message-ID: <f01f063d-4b46-62b9-12f4-1cba370a3029@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Joakim,

 Thanks for this updated patch, but you haven't taken into account the rest of
Thomas's comments.

 I'll repeat them below for your convenience.


On 28/01/2019 18:05, Joakim Bech wrote:
[snip]
> +config BR2_KERNEL_HEADERS_5_00
> +	bool "Linux 5.00.x kernel headers"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00

 Adding support for the 5.0 headers should be a separate patch. See commit
649883d2c9957b7a7fcf81c4475f848ad8865ca1 for an example how it was done for 4.20.

 Also, please call it 5.0 and not 5.00.

 And also some new comments:

[snip]
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> index cda90f7517..90e44d5c3b 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> @@ -2,3 +2,8 @@
>  md5 319ca548ff05b0ec1008988a7e5ab619 gcc-arm-8.2-2018.11-x86_64-aarch64-linux-gnu.tar.xz
>  # locally calculated
>  sha256 0142366da2f30feb1c366997cbdaa02286c8f1aa527c0fc177ee5ce8e77970fc gcc-arm-8.2-2018.11-x86_64-aarch64-linux-gnu.tar.xz

 Remove the existing hashes: they are no longer used since the version has
changed. In other words, every line of this file should be updated, except for
the # locally calculated.

> +
> +# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2019.01/gcc-arm-8.2-2019.01-x86_64-aarch64-linux-gnu.tar.xz.asc
> +md5 ed467a18abc7cf81d53c0cf6014b1867 gcc-arm-8.2-2019.01-x86_64-aarch64-linux-gnu.tar.xz
> +# locally calculated
> +sha256 6683d51b0dd61a91ab1e8e478a0a8a50ccb34d5590c84aa36697e956b16f14a1 gcc-arm-8.2-2019.01-x86_64-aarch64-linux-gnu.tar.xz
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
> index 0398bd1297..bb9c658639 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2018.11
> +TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2019.01
>  TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)
>  
>  TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-linux-gnu.tar.xz
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in> index 0449737889..69c2f7425e 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> @@ -4,7 +4,7 @@ comment "Arm toolchains available for Cortex-A + EABIhf"
>  	depends on !BR2_STATIC_LIBS
>  
>  config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
> -	bool "Arm ARM 2018.11"
> +	bool "Arm ARM 2019.01"
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
>  	depends on BR2_HOSTARCH = "x86_64"
> @@ -14,7 +14,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
>  	select BR2_TOOLCHAIN_HAS_SSP
>  	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	select BR2_INSTALL_LIBSTDCPP
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	help

 The help text here also says which GDB, GCC, binutils and kernel headers
versions it is using. Please update that to the actual versions.

[snip]
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index 08a79ee4d9..48eb1ea080 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -123,6 +123,10 @@ choice
>  	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
>  	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
>  
> +config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_00
> +	bool "5.00.x"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
> +

 Note that this bit belongs to the patch that adds the 5.0 version.

>  config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_20
>  	bool "4.20.x"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
> 

 And finally, there is also an ARM aarch64-be toolchain that should be updated.

 Regards,
 Arnout
