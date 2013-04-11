From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Apr 2013 19:39:44 +0200
Subject: [Buildroot] [PATCH] fs: add uimage support w/ example for cpio
In-Reply-To: <1365691684-30663-2-git-send-email-spenser@gillilanding.com>
References: <1365691684-30663-1-git-send-email-spenser@gillilanding.com>
 <1365691684-30663-2-git-send-email-spenser@gillilanding.com>
Message-ID: <20130411193944.058ed447@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

Thanks for your contribution!

On Thu, 11 Apr 2013 09:48:04 -0500, Spenser Gilliland wrote:
> From: Spenser Gilliland <Spenser309@gmail.com>
> 
> Adds uimage support for various root filesystems.  Uimage support is needed
> when using the bootm command in uboot.  This provides both a simple infrastructure
> similar to the current BR2_TARGET_ROOTFS_$(2)_GZ for adding compression. To define the a rootfs should have a UIMAGE wrapper simply create the BR2_TARGET_ROOTFS_$(2)_UIMAGE symbol.

Please wrap the commit log at ~80 columns.

>  # extra deps
> -ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
> +ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma) $$(if $$(BR2_TARGET_ROOTFS_$(2)_UIMAGE),host-uboot-tools)

Split the line:

ROOTFS_$(2)_DEPENDENCIES += host-fakeroot \
	$$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma) \
	$$(if $$(BR2_TARGET_ROOTFS_$(2)_UIMAGE),host-uboot-tools)

> +ifeq ($$(BR2_TARGET_ROOTFS_$(2)_UIMAGE),y)
> +ifeq ($$(BR2_TARGET_ROOTFS_$(2)_NONE),y)
> +	$$(call MKIMAGE_RAMDISK,none,$$@)
> +endif
> +ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
> +	$$(call MKIMAGE_RAMDISK,gzip,$$@.gz)
> +endif
> +ifeq ($$(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
> +	$$(call MKIMAGE_RAMDISK,bzip2,$$@.bz2)
> +endif
> +ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
> +	$$(call MKIMAGE_RAMDISK,lzma,$$@.lzma)
> +endif
> +endif

I am wondering: will we ever need this on something else than cpio?


> +config BR2_TARGET_ROOTFS_CPIO_UIMAGE
> +	bool "Add U-Boot header to the root filesystem"
> +	depends on BR2_TARGET_ROOTFS_CPIO
> +        help

Indentation should be one tab.

> +	  Add a u-boot header to the cpio root filesystem.  This allows 
> +	  the image to be booted by the bootm command in uboot.
> + 
>  choice
>          prompt "Compression method"
>          default BR2_TARGET_ROOTFS_CPIO_NONE

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
