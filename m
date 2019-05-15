From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 May 2019 16:00:29 +0200
Subject: [Buildroot] [PATCH 1/1] linux: xenomai: use URL for the
 ADEOS/IPIPE patch
In-Reply-To: <20190515090251.20668-1-sebastien.szymanski@armadeus.com>
References: <20190515090251.20668-1-sebastien.szymanski@armadeus.com>
Message-ID: <20190515160029.1e85d845@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 May 2019 11:02:51 +0200
S?bastien Szymanski <sebastien.szymanski@armadeus.com> wrote:

> diff --git a/linux/Config.ext.in b/linux/Config.ext.in
> index 32dacbdf06..4db694c2b8 100644
> --- a/linux/Config.ext.in
> +++ b/linux/Config.ext.in
> @@ -22,18 +22,22 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI
>  
>  	  However, it is recommended to use the latest version of the
>  	  Adeos/Ipipe patch available at
> -	  http://download.gna.org/adeos/patches
> +	  https://xenomai.org/downloads/ipipe/
>  
>  	  Xenomai is know to support Blackfin, SH4, x86, ARM, NIOS2
>  	  and PowerPC architectures.
>  
> -config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
> -	string "Path for Adeos patch file"
> +config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH_URL

I don't think it makes sense to rename the option just for this. The
behavior is backward compatible, and adding the _URL prefix is not
really necessary.

> +	string "Path/URL for Adeos patch file"
> +	default BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH if BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH != "" # legacy
>  	depends on BR2_LINUX_KERNEL_EXT_XENOMAI
>  	help
> -	  Optionally, explicitly specify the Adeos patch to use.
> -	  Download it at http://download.gna.org/adeos/patches
> -	  and verify that your kernel version in buildroot matches.
> +	  Optionally, explicitly specify where to find the Adeos
> +	  patch to use.
> +	  Examples:
> +	  https://xenomai.org/downloads/ipipe/v4.x/arm/ipipe-core-4.19.33-arm-2.patch
> +	  or file:///home/foo/ipipe-core-4.19.33-arm-2.patch
> +	  Please verify that your kernel version in Buildroot matches.
>  
>  comment "xenomai needs a uClibc or glibc toolchain w/ threads"
>  	depends on BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS
> diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
> index d066bb32ac..e16f76ffb5 100644
> --- a/linux/linux-ext-xenomai.mk
> +++ b/linux/linux-ext-xenomai.mk
> @@ -7,11 +7,17 @@
>  LINUX_EXTENSIONS += xenomai
>  
>  # Adeos patch version
> -XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
> -ifeq ($(XENOMAI_ADEOS_PATCH),)
> +XENOMAI_ADEOS_PATCH_URL = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH_URL))
> +ifneq ($(XENOMAI_ADEOS_PATCH_URL),)
> +XENOMAI_ADEOS_PATCH = $(shell basename $(XENOMAI_ADEOS_PATCH_URL))

You can use $(basename ...) instead of $(shell basename ...)

> +LINUX_EXTRA_DOWNLOADS += $(XENOMAI_ADEOS_PATCH_URL)
> +BR_NO_CHECK_HASH_FOR += $(XENOMAI_ADEOS_PATCH)
> +endif

Is this really backward compatible with a value of
XENOMAI_ADEOS_PATCH_URL = board/foo/ipipe-core-<version>.patch ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
