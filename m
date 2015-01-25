From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 19:02:00 +0100
Subject: [Buildroot] [PATCH 1/1] board: add support for the VIA VAB-820
 board
In-Reply-To: <1422000168-19305-2-git-send-email-imrehg@gmail.com>
References: <1422000168-19305-1-git-send-email-imrehg@gmail.com>
 <1422000168-19305-2-git-send-email-imrehg@gmail.com>
Message-ID: <20150125190200.39f26831@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This generally looks very good, I only have a few minor comments.

On Fri, 23 Jan 2015 16:02:48 +0800, imrehg at gmail.com wrote:

> +The results of the build should be these files in the default setting:

results -> result.

> +Important: pay attention which partition you ar modifying so you don't

ar -> are.

> +Finally copy the root file system as well onto the mounted /dev/sdX1
> +rootfs partition:

I guess you meant "mounted /dev/sdX2" here, no?

> +On the VAB-820 board make sure the jumper J11 (just next to the SD card
> +slot) is sorted betweek  the two pins towards the center of the board.

"sorted betweek" ? I guess you meant "between", but even with this, I
don't understand what it means.

> diff --git a/configs/via_imx6_vab820_defconfig b/configs/via_imx6_vab820_defconfig
> new file mode 100644
> index 0000000..167a90a
> --- /dev/null
> +++ b/configs/via_imx6_vab820_defconfig
> @@ -0,0 +1,38 @@
> +# architecture
> +BR2_arm=y
> +BR2_cortex_a9=y
> +
> +# toolchain
> +BR2_DEPRECATED=y

This is not needed.

> +BR2_KERNEL_HEADERS_3_0=y
> +BR2_DEFAULT_KERNEL_HEADERS="3.0.101"

Use instead:

BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.0.101"

> +BR2_GCC_VERSION_4_7_X=y
> +
> +# system
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
> +
> +# kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/viaembedded/vab820-kernel-bsp.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="via_3.0.35"
> +BR2_LINUX_KERNEL_DEFCONFIG="imx6"
> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
> +BR2_LINUX_KERNEL_UBOOT_IMAGE=y
> +BR2_LINUX_KERNEL_UIMAGE=y
> +
> +# bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="mx6q_sabrelite"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/viaembedded/vab820-uboot-bsp.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="via_3.0.35"
> +BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/via/imx6_vab820"
> +BR2_TARGET_UBOOT_FORMAT_BIN=y
> +
> +# rootfs
> +BR2_TARGET_ROOTFS_TAR=y
> +BR2_TARGET_ROOTFS_TAR_GZIP=y

Compressing the rootfs tarball is not necessary.

Other than that, looks good to me! Can you fix those minor issues and
resend an updated patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
