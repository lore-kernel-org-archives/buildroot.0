From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Jun 2015 23:46:52 +0200
Subject: [Buildroot] [PATCH v2 1/1] board: add support for Warpboard
In-Reply-To: <1434988018-16391-1-git-send-email-lambertarthur22@gmail.com>
References: <1434988018-16391-1-git-send-email-lambertarthur22@gmail.com>
Message-ID: <558B254C.2090606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/15 17:46, Arthur LAMBERT wrote:
> This is a set of patch to add support for warpboard (Freescale board based on imx6sl)
> The patch contains :
>   - defconfig for warpboard
>   - kernel defconfig due to specific need for bluetooth/wifi
>   - linux patch from Fabio Estevam to fix device tree due to last change on warpboard schematics (rev 1.12)

 Two patches actually

>   - specific firmware file for warpboard bluetooth (nvram : brcmfmac4330-sdio.txt)
> 
> Changes v1 -> v2:

 Changelog should be below the Sob, separated by ---

>   - add specific kernel headers
>   - use wget download rather than git download for kernel
>   - fix version symbol for uboot
>   - add imx_usb_loader host utility
>   - remove bin firmware file and enable linux-firmware package instead
>   - fix command to enable bluetooth and fix protocol for hci in custom kernel config
> 
> Signed-off-by: Arthur LAMBERT <lambertarthur22@gmail.com>
---
Changes v1 -> v2:
 ...

> ---
>  board/freescale/warpboard/README                   |  50 ++++
>  board/freescale/warpboard/linux-4.0.config         | 278 +++++++++++++++++++++
>  .../linux/linux-001-add-sdm-firmware.patch         | 145 +++++++++++
>  .../linux/linux-002-replace-uart2-by-uart5.patch   | 103 ++++++++
>  .../lib/firmware/brcm/brcmfmac4330-sdio.txt        |  40 +++
>  configs/warpboard_defconfig                        |  42 ++++
>  6 files changed, 658 insertions(+)
>  create mode 100644 board/freescale/warpboard/README
>  create mode 100644 board/freescale/warpboard/linux-4.0.config
>  create mode 100644 board/freescale/warpboard/linux/linux-001-add-sdm-firmware.patch
>  create mode 100644 board/freescale/warpboard/linux/linux-002-replace-uart2-by-uart5.patch
>  create mode 100644 board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
>  create mode 100644 configs/warpboard_defconfig
> 
> diff --git a/board/freescale/warpboard/README b/board/freescale/warpboard/README
> new file mode 100644
> index 0000000..d21ab48
> --- /dev/null
> +++ b/board/freescale/warpboard/README
> @@ -0,0 +1,50 @@
> +Build
> +=====
> +
> +First, configure Buildroot for your WarpBoard.
> +  make warpboard_defconfig
> +
> +Build all components:
> +  make
> +
> +You will find in ./output/images/ the following files:
> +  - imx6sl-warp.dtb
> +  - rootfs.ext2
> +  - rootfs.tar
> +  - u-boot.imx
> +  - zImage
> +
> +Update uboot
> +============
> +
> +You will find a process written by by Fabio Estevam available in freescale repository on github :
> +https://raw.githubusercontent.com/Freescale/u-boot-fslc/patches-2015.04/board/warp/README by Fabio Estevam
> +
> +Update linux & rootfs
> +=====================
> +
> +Use ums command from uboot prompt to mount emmc as mass storage and update zImage, device tree and rootfs file
> +=> ums 0 mmc 0

 Could you also document how you get the images into uboot (I guess over USB
using imx-usb-loader).

> +
> +Fast way to update kernel image
> +===============================
> +
> +- Get new zImage and dtb file on the board by using scp through usb0

 There's no dropbear, so no scp...

 Actually I don't think this section is so useful, it's pretty generic
knowledge. It's much better to document what the layout of the eMMC is, and
where U-Boot and the device tree are stored.

> +-  Copy zImage, device tree file in boot partition :
> +  mkdir kernel
> +  mount -t vfat /dev/mmcblk0p1 kernel
> +  cp zImage  kernel/.
> +  cp imx6sl-warp.dtb  kernel/.
> +  sync
> +  umount kernel
> +  rm -r kernel
> +
> +Enable bluetooth
> +================
> +hciattach /dev/ttymxc4 any
> +hciconfig hci0 up
> +
> +Enable Wifi
> +==========
> +modprobe brcmfmac
> +ifconfig wlan0 up

 To do something useful, you'll also need a wpa-supplicant I guess...

 Since you anyway have a rootfs overlay, you could add init scripts to start
wifi and bluetooth. We don't usually do that, but I think it would be a good idea.


> diff --git a/board/freescale/warpboard/linux-4.0.config b/board/freescale/warpboard/linux-4.0.config

[snip]

> diff --git a/board/freescale/warpboard/linux/linux-001-add-sdm-firmware.patch b/board/freescale/warpboard/linux/linux-001-add-sdm-firmware.patch

 The patch naming convention no longer includes the linux- part, and we prefer
naming that corresponds to git format-patch output. So 0001-add-sdm-...

> new file mode 100644
> index 0000000..d9706c1
> --- /dev/null
> +++ b/board/freescale/warpboard/linux/linux-001-add-sdm-firmware.patch
> @@ -0,0 +1,145 @@

 Patches should have a description and Signed-off-by.

 But better yet, download it with BR2_LINUX_KERNEL_PATCH="http://... http://..."
instead of including it in buildroot.

[snip]

> diff --git a/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt b/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
> new file mode 100644
> index 0000000..9546246
> --- /dev/null
> +++ b/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
> @@ -0,0 +1,40 @@
> +# bcm94330wlsdgb.txt

 It would be good to document (either here or in the commit log) where this file
comes from.

[snip]

> diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
> new file mode 100644
> index 0000000..a8afa2c
> --- /dev/null
> +++ b/configs/warpboard_defconfig
> @@ -0,0 +1,42 @@
> +# architecture
> +BR2_arm=y
> +BR2_cortex_a9=y
> +
> +# system
> +BR2_TARGET_GENERIC_HOSTNAME="warpboard"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> +
> +# kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/Freescale/linux-fslc/tarball/38ec11d/linux-fslc-38ec11d.tar.gz"

 We usually use the full sha1, but then it becomes very long of course, so OK.

> +BR2_LINUX_KERNEL_PATCH="board/freescale/warpboard/linux/"

 We prefer to use BR2_GLOBAL_PATCH_DIR=board/freescale/warpboard/patches and
move the linux directory in there.

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/warpboard/linux-4.0.config"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-warp"
> +
> +# lock to 4.0 headers to avoid breaking with newer kernels
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="4.0"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y

 This section should come before the kernel itself, to match the .config ordering.


 Regards,
 Arnout

> +
> +# wifi firmware for brcm4330
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
> +
> +# bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="warp"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.04"
> +BR2_TARGET_UBOOT_FORMAT_IMX=y
> +
> +# host utility to flash warpboard
> +BR2_PACKAGE_HOST_IMX_USB_LOADER=y
> +
> +# rootfs
> +BR2_ROOTFS_OVERLAY="board/freescale/warpboard/rootfs_overlay"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
