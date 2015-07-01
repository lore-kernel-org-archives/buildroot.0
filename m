From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jul 2015 15:30:04 +0200
Subject: [Buildroot] [PATCH v4 1/1] board: add support for WarPboard
In-Reply-To: <1435742562-31718-1-git-send-email-lambertarthur22@gmail.com>
References: <1435742562-31718-1-git-send-email-lambertarthur22@gmail.com>
Message-ID: <20150701153004.6fc35912@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arthur,

On Wed,  1 Jul 2015 11:22:42 +0200, Arthur LAMBERT wrote:

> +- Put warpboard in USB download mode
> +  closing the jumper j2  on daugther board
> +- Load u-boot.imx in warpboard by using imx usb loader from host utility
> +  $ ./imx_usb output/images/u-boot.imx

Can you confirm that:

$ output/host/usr/bin/imx_usb output/images/u-boot.imx

> +- Uboot will appear in minicom
> +- Use the default environment variables:
> + => env default -f -a
> + => saveenv
> +- run the DFU command in uboot prompt:
> + => dfu 0 mmc 0
> +- transfer uboot into flash by running this command in host side:

and:

> + $ sudo dfu-util -D output/images/u-boot.imx -a boot

$ sudo output/host/usr/bin/dfu-util -D output/images/u-boot.imx -a boot

is OK ?

This makes it clear which dfu_util and imx_usb programs should be
executed.

> +Use ums command from uboot prompt to mount emmc as mass storage and update
> +zImage, device tree (imx6sl-warp.dtb) and rootfs file (rootfs.tar)
> +=> ums 0 mmc 0
> +
> +Put zimage and dtb file in warp-vfat and extract rootfs.tar in warp-rootfs
> +partition.

Maybe indicate it should be extracted as root.

> diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
> new file mode 100644
> index 0000000..13e90cd
> --- /dev/null
> +++ b/configs/warpboard_defconfig
> @@ -0,0 +1,42 @@
> +# architecture
> +BR2_arm=y
> +BR2_cortex_a9=y
> +
> +# patches
> +BR2_GLOBAL_PATCH_DIR="board/freescale/warpboard/patches/"
> +
> +# lock to 4.0 headers to avoid breaking with newer kernels
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="4.0"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
> +
> +# system
> +BR2_TARGET_GENERIC_HOSTNAME="warpboard"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> +
> +# rootfs overlay
> +BR2_ROOTFS_OVERLAY="board/freescale/warpboard/rootfs_overlay"
> +
> +# kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/Freescale/linux-fslc/tarball/38ec11d/linux-fslc-38ec11d.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-warp"
> +
> +# wifi firmware for brcm4330
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
> +
> +# uboot
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="warp"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07-rc2"
> +BR2_TARGET_UBOOT_FORMAT_IMX=y
> +
> +# host utility
> +BR2_PACKAGE_HOST_DFU_UTIL=y
> +BR2_PACKAGE_HOST_IMX_USB_LOADER=y

You're not enabling an ext2 filesystem (which is good since you don't
use it). But you still mention it in your document:

+You will find in ./output/images/ the following files:
+  - imx6sl-warp.dtb
+  - rootfs.ext2
+  - rootfs.tar
+  - u-boot.imx
+  - zImage

No need to resend just for that, just confirm me that my proposals are
OK, and I'll fix when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
