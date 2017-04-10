From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 17:28:19 +0200
Subject: [Buildroot] [PATCH v7] Add defconfig for MIPS Creator ci40
In-Reply-To: <1491378735-6506-1-git-send-email-abhimanyu.v@gmail.com>
References: <1491378735-6506-1-git-send-email-abhimanyu.v@gmail.com>
Message-ID: <d89680b5-ad66-0fcc-a0ae-47132b0ad8c4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-04-17 09:52, Abhimanyu Vishwakarma wrote:
> From: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
> 
> Add post-image script to generate sdcard.img for
> preparing sdcard/usb device.

 This won't be true anymore... See below.
[snip]
> diff --git a/board/ci40/post-image.sh b/board/ci40/post-image.sh
> new file mode 100755
> index 0000000..4b7d492
> --- /dev/null
> +++ b/board/ci40/post-image.sh
> @@ -0,0 +1,5 @@
> +#!/usr/bin/env bash
> +
> +BOARD_DIR="$(dirname $0)"
> +
> +support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"

 The idea is to remove this script entirely and instead set
BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ci40/genimage.cfg"

> diff --git a/board/ci40/readme.txt b/board/ci40/readme.txt

 Excellent readme!

[snip]
> diff --git a/configs/ci40_defconfig b/configs/ci40_defconfig
> new file mode 100644
> index 0000000..7d21f87
> --- /dev/null
> +++ b/configs/ci40_defconfig
> @@ -0,0 +1,49 @@
> +# architecture
> +BR2_mipsel=y
> +BR2_mips_32r2=y
> +
> +# linux header same as custom kernel ie 4.4.x
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
> +
> +# kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,CreatorDev,linux,openwrt-4.4.14/linux-openwrt-4.4.14.tar.gz)"

 Minor nit: this should be

BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
github,CreatorDev,linux,openwrt-4.4.14)/linux-openwrt-4.4.14.tar.gz"

It expands to exactly the same thing, of course, but that way it looks more
familiar to people who are used to the github helper.


> +BR2_LINUX_KERNEL_DEFCONFIG="pistachio"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="vmlinux.gz.itb"
> +BR2_LINUX_KERNEL_IMAGE_NAME="vmlinux.gz.itb"

 This can actually be left empty - if empty, it defaults to
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME (cfr. help text).

> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="img/pistachio_marduk"

 There is something funny here... The dtb is not written to the SD card, and it
is not saved together with U-Boot. I suppose that it is linked into the
fitImage, but how does that work? Is any dtb that is built automatically linked
in, or does the kernel config specify which dtb to link in? In the latter case,
do we need to build the DTB from Buildroot?

 If the DTB is indeed built implicitly from vmlinux.gz.itb, then the DTS stuff
can be removed from the defconfig, but it's useful to keep a comment like this:

# .itb image includes img/pistachio_marduk device tree

> +
> +# bootloader flash support
> +BR2_PACKAGE_MTD=y
> +
> +# wireless firmware
> +BR2_PACKAGE_UCCP420WLAN=y
> +
> +# wireless package
> +BR2_PACKAGE_WIRELESS_TOOLS=y
> +BR2_PACKAGE_WPA_SUPPLICANT=y
> +BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
> +
> +# bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="pistachio_marduk"

 Shouldn't this be

BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pistachio_marduk"

? The above works because U-Boot has this legacy handling, but we really prefer
to use the proper Kconfig-based approach if possible.

> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,CreatorDev,u-boot,v1.0.5/u-boot-CreatorDev-v1.0.5.tar.gz)"

 Same here about github helper.

> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-pistachio_marduk-2015.10-v1.0.5.img"
> +
> +# fitimage / image generation
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

 Hm, we have a problem here... You need to enable this because it is used by the
linux build, but there is no dependency from linux on host-uboot-tools:

ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
LINUX_DEPENDENCIES += host-uboot-tools
endif

but since you use a custom image name, BR2_LINUX_KERNEL_UBOOT_IMAGE) isn't selected.

 That piece of code should probably be changed into

# If host-uboot-tools is selected by the user, assume it is needed to
# build a custom kernel image
ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)
LINUX_DEPENDENCIES += host-uboot-tools
endif

and also in linux/Config.in replace all selects of BR2_LINUX_KERNEL_UBOOT_IMAGE
with BR2_PACKAGE_HOST_UBOOT_TOOLS.

 I'll send an RFC patch for that, can you test it and add your tested-by tag?


 Regards,
 Arnout

> +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/ci40/post-build.sh"
> +
> +# image generation
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ci40/post-image.sh"
> +
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
