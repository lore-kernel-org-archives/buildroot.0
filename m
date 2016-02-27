From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Feb 2016 21:58:43 +0100
Subject: [Buildroot] [PATCH v3] configs/olimex_imx233_olinuxino: switch
 to u-boot
In-Reply-To: <1456598432-4783-1-git-send-email-phil@zankapfel.net>
References: <1456075479-12750-1-git-send-email-phil@zankapfel.net>
 <1456598432-4783-1-git-send-email-phil@zankapfel.net>
Message-ID: <56D20E03.5030401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/27/16 19:40, Phil Eichinger wrote:
> mxs-bootlets broke somewhere in between toolchain version bumps.

 Specify explicitly that it fails to boot - perhaps even include the serial output.

> Directly boot u-boot, as this is supported now, but it requires updated
> partitioning (see readme.txt)
> 
> Drop mxs-bootlets patches, they aren't needed anymore.
> 
> Kernel is built as an uImage because the u-boot defconfig expects an
> uImage on the second partition.
> 
> Tested on iMX233-OLinuXino-MINI hardware.
> 
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> ---
> Changes v3 -> v2:
>  - Explain why an uImage is used
>  - Add tested on which hardware
>  - Set u-boot version to 2006.01
>   (suggested by Thomas Petazzoni)
> Changes v1 -> v2:
>  - Drop BR2_GLOBAL_PATCH_DIR (suggested by Baruch Siach)
> 
[snip]
> diff --git a/board/olimex/imx233_olinuxino/readme.txt b/board/olimex/imx233_olinuxino/readme.txt
> index 1c36a61..39dec77 100644
> --- a/board/olimex/imx233_olinuxino/readme.txt
> +++ b/board/olimex/imx233_olinuxino/readme.txt
> @@ -6,10 +6,11 @@ one or more of: hostapd, iw, wireless_tools and/or wpa_supplicant.
>  It also pulls up the console on the serial port, not on TV output.
>  
>  You'll need a spare MicroSD card with Freescale's special partition layout.
> -This is basically two partitions:
> +This is basically three partitions:
>  
> -1) Type 53, the bootstrap + bootloader/kernel partition, should be 16MB.
> -2) Anything you like, for this example an ext2 partition, type 83 (linux).
> +1) Type 53, the u-boot partition, should be 16MB.

 U-Boot

> +2) VFAT, place Kernel as uImage there

 2) VFAT, put the kernel uImage there

> +3) Anything you like, for this example an ext2 partition, type 83 (linux).
>  
>  Assuming you see your MicroSD card as /dev/sdc you'd need to do, as root
>  and from the buildroot project top level directory:
> @@ -43,15 +44,28 @@ and from the buildroot project top level directory:
>     p
>     2
>     <ENTER>
> +   +5M
> +   t
> +   2
> +   4
> +   n
> +   p
> +   3
> +   <ENTER>
>     <ENTER>
>     w
>  
>  4. Fill up the first (bootstrap + kernel) partition

 Fill up the first (U-Boot) partition

> -   # dd if=output/images/imx23_olinuxino_dev_linux.sb bs=512 of=/dev/sdc1 seek=4
> +   # dd if=output/images/u-boot.sd bs=512 of=/dev/sdc1
> +
> +5. Create VFAT Filesystem
> +   # mkfs.vfat /dev/sdc2
> +
> +6. Mount and copy output/images/uImage.imx23-olinuxino to the VFAT partition, rename to uImage

   # mount /dev/sdc2 /mnt
   # cp output/images/uImage.imx23-olinuxino /mnt/uImage
   # umount /mnt

>  
> -5. Fill up the second (filesystem) partition
> -   # dd if=output/images/rootfs.ext2 of=/dev/sdc2 bs=512
> +7. Fill up the third (filesystem) partition
> +   # dd if=output/images/rootfs.ext2 of=/dev/sdc3 bs=512
>  
> -6. Remove the MicroSD card from your linux PC and put it into your olinuxino.
> +8. Remove the MicroSD card from your linux PC and put it into your olinuxino.
>  
> -7. Boot! You're done!
> +9. Boot! You're done!
> diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
> index 2184ad8..d27909f 100644
> --- a/configs/olimex_imx233_olinuxino_defconfig
> +++ b/configs/olimex_imx233_olinuxino_defconfig
> @@ -1,40 +1,15 @@
> -# Architecture
>  BR2_arm=y
> -BR2_arm926t=y
> -

 Please keep the comments (as far as they're still appropriate).

 Also keep the explicit specification of the subarchitecture.

> -# Patches (mxs-bootlets)
> -BR2_GLOBAL_PATCH_DIR="board/olimex/imx233_olinuxino"
> -
> -# System
> -BR2_TARGET_GENERIC_GETTY=y
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> -
> -# Filesystem
> -BR2_TARGET_ROOTFS_EXT2=y
> -# BR2_TARGET_ROOTFS_TAR is not set
> -
> -# Linux headers same as kernel, a 3.18 series
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
> -
> -# Bootloader
> -BR2_TARGET_MXS_BOOTLETS=y
> -BR2_TARGET_MXS_BOOTLETS_CUSTOM_PATCH_DIR="board/olimex/imx233_olinuxino"
> -BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD=y
> -BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME="imx23_olinuxino_dev"
> -
> -# Kernel
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.2"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.18.config"
> -BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
> +BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x42000000"
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-olinuxino"
> -
> -# For automatic firmware loading
> -BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> -
> -# Firmware for WiFi
>  BR2_PACKAGE_LINUX_FIRMWARE=y
>  BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010=y
>  BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
> @@ -42,3 +17,9 @@ BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
>  BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
>  BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
>  BR2_PACKAGE_ZD1211_FIRMWARE=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_UBOOT=y

 Give an explicit version, not just the latest one (which will change all the
time, possibly in incompatible ways or breaking the build).


 Regards,
 Arnout

> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx23_olinuxino"
> +BR2_TARGET_UBOOT_FORMAT_SD=y
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
