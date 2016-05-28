From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 15:33:49 +0200
Subject: [Buildroot] [PATCH v2 2/4] toolchain: add bfin support
In-Reply-To: <20160513121557.GA30570@waldemar-brodkorb.de>
References: <20160513121557.GA30570@waldemar-brodkorb.de>
Message-ID: <20160528153349.7a4e1cee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 May 2016 14:15:57 +0200, Waldemar Brodkorb wrote:

> -config BR2_GCC_TARGET_CPU
> +config BR2_TARGET_CPU

This seems wrong. Why are you doing this?

> +	string "Target CPU"

And this?

>  	default bf606		if BR2_bf606
>  	default bf607		if BR2_bf607
>  	default bf608		if BR2_bf608
> @@ -98,7 +99,7 @@ config BR2_GCC_TARGET_CPU
>  	default bf549		if BR2_bf549
>  	default bf561		if BR2_bf561
>  
> -config BR2_GCC_TARGET_CPU_REVISION
> +config BR2_TARGET_CPU_REVISION

Ditto here.

At the very least, it needs to be explained in the commit log,
including the impact on the Blackfin external toolchain support.
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 46f05ff..6bf4ef1 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -189,6 +189,7 @@ endif
>  ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
>  HOST_GCC_COMMON_CONF_OPTS += --with-abi=$(BR2_GCC_TARGET_ABI)
>  endif
> +

Useless change.

>  ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
>  ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)

So you essentially broke this code by renaming the options.

>  HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index efa84e9..cfa2c9b 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -125,6 +125,7 @@ config BR2_UCLIBC_TARGET_ARCH
>  	string
>  	default "arc"	   if BR2_arcle || BR2_arceb
>  	default "arm"	   if BR2_arm	|| BR2_armeb
> +	default "bfin"	   if BR2_bfin
>  	default "m68k"	   if BR2_m68k
>  	default "mips"	   if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>  	default "powerpc"  if BR2_powerpc
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index fc30c6e..b9ba677 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -40,7 +40,6 @@ choice
>  
>  config BR2_TOOLCHAIN_BUILDROOT
>  	bool "Buildroot toolchain"
> -	depends on !BR2_bfin
>  	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
>  
>  config BR2_TOOLCHAIN_EXTERNAL

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
