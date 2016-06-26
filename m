From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 22:10:48 +0200
Subject: [Buildroot] [PATCH 1/2] package: add Odroid BL bootloader
 binaries
In-Reply-To: <1466950062-31783-2-git-send-email-andi@etezian.org>
References: <1466950062-31783-1-git-send-email-andi@etezian.org>
 <1466950062-31783-2-git-send-email-andi@etezian.org>
Message-ID: <20160626221048.02818b93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 17:07:41 +0300, Andi Shyti wrote:

> The above files are provided by the hardkernel u-boot from
> 
>  https://github.com/hardkernel/u-boot/tree/odroidxu3-v2012.07

So the source code for those binary files is not available at all?


> +config BR2_PACKAGE_ODROID_XU_BL
> +	bool "odroid-xu-bl"

	depends on BR2_arm

would be good to have here

Also, I think this package should be included in the Bootloaders menu
rather than the firmware menu. Maybe we should name it
odroid-xu-bootloader or odroid-xu-boot so that it is clear what it does.

> +++ b/package/odroid-xu-bl/odroid-xu-bl.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# odroid-xu-bl
> +#
> +################################################################################
> +
> +ODROID_XU_BL_VERSION = odroidxu3-v2012.07
> +ODROID_XU_BL_SITE = $(call github,hardkernel,u-boot,$(ODROID_XU_BL_VERSION))

It's a bit annoying that we end up downloading an entire U-Boot source
tree, and in fact not use it except for those 3 files.

In fact, why don't you simply build this U-Boot version with the U-Boot
package that already exists in Buildroot, and then use:

BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="sd_fuse/hardkernel_1mb_uboot/bl1.bin.hardkernel sd_fuse/hardkernel_1mb_uboot/bl2.bin.hardkernel.1mb_uboot sd_fuse/hardkernel_1mb_uboot/tzsw.bin.hardkernel"

To ask Buildroot to install the pre-built binaries as if they were SPL
images. The only issue is that BR2_TARGET_UBOOT_SPL_NAME currently only
installs a single image, but it can easily be changed. And it was
actually already proposed in https://patchwork.ozlabs.org/patch/595980/.

Can you investigate such a solution?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
