From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 13:56:41 +0200
Subject: [Buildroot] [PATCH 1/5] aarch64: add big endian(aarch64_be)
	support
In-Reply-To: <1437391542-13590-2-git-send-email-bamvor.zhangjian@huawei.com>
References: <1437391542-13590-1-git-send-email-bamvor.zhangjian@huawei.com>
 <1437391542-13590-2-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <20150720135641.5608d679@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zhang,

Thanks for this new iteration!

On Mon, 20 Jul 2015 19:25:38 +0800, Zhang Jian(Bamvor) wrote:

> diff --git a/Makefile b/Makefile
> index b1bcf78..35818f0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -329,7 +329,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
>  	-e s/arcle/arc/ \
>  	-e s/arceb/arc/ \
>  	-e s/arm.*/arm/ -e s/sa110/arm/ \
> -	-e s/aarch64/arm64/ \
> +	-e s/aarch64.*/arm64/ \
>  	-e s/bfin/blackfin/ \
>  	-e s/parisc64/parisc/ \
>  	-e s/powerpc64.*/powerpc/ \
> diff --git a/arch/Config.in b/arch/Config.in
> index 94397b3..875f412 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -59,7 +59,16 @@ config BR2_armeb
>  	  http://en.wikipedia.org/wiki/ARM
>  
>  config BR2_aarch64
> -	bool "AArch64"
> +	bool "AArch64 (little endian)"
> +	select BR2_ARCH_IS_64
> +	select BR2_ARCH_HAS_MMU_MANDATORY
> +	help
> +	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
> +	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
> +	  http://en.wikipedia.org/wiki/ARM
> +
> +config BR2_aarch64_be
> +	bool "AArch64 (big endian)"
>  	select BR2_ARCH_IS_64
>  	select BR2_ARCH_HAS_MMU_MANDATORY
>  	help
> @@ -347,7 +356,7 @@ if BR2_arm || BR2_armeb
>  source "arch/Config.in.arm"
>  endif
>  
> -if BR2_aarch64
> +if BR2_aarch64 || BR2_aarch64_be
>  source "arch/Config.in.aarch64"
>  endif
>  
> diff --git a/arch/Config.in.aarch64 b/arch/Config.in.aarch64
> index 2e79870..9830302 100644
> --- a/arch/Config.in.aarch64
> +++ b/arch/Config.in.aarch64
> @@ -1,8 +1,11 @@
>  config BR2_ARCH
>  	default "aarch64"	if BR2_aarch64
> +	default "aarch64_be"	if BR2_aarch64_be
>  
>  config BR2_ENDIAN
> -	default "LITTLE"
> +	default "LITTLE" if BR2_aarch64
> +	default "BIG"	 if BR2_aarch64_be
>  
>  config BR2_ARCH_HAS_ATOMICS
>  	default y
> +

The changes above have already been applied to Buildroot. Please make
sure to base your patches on the latest master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
