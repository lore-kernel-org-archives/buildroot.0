From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 15:20:39 +0100
Subject: [Buildroot] [PATCH 2/2] board: Add support for Engicam i.CoreM6
 Quad
In-Reply-To: <1489489266-23161-2-git-send-email-jagan@openedev.com>
References: <1489489266-23161-1-git-send-email-jagan@openedev.com>
 <1489489266-23161-2-git-send-email-jagan@openedev.com>
Message-ID: <20170319152039.6d0770f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 16:31:06 +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Add initial support for Engicam i.CoreM6 Quad board with
> below features:
> - U-Boot 2017.03 with mmc boot
> - Linux 4.10.1
> - Default packages from buildroot
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Matteo Lisi <matteo.lisi@engicam.com>
> Cc: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Thanks for this patch! I have a few comments, see below.

> diff --git a/board/engicam/readme.txt b/board/engicam/readme.txt
> new file mode 100644
> index 0000000..55fdf53
> --- /dev/null
> +++ b/board/engicam/readme.txt
> @@ -0,0 +1,38 @@

Here, a few details about the board, like a link to the webpage, etc.
would be nice.

> +Buildroot build:

Look at other readme.txt files to see how they are structured, and the
section titles they are using. board/freescale/imx6sabre/readme.txt is
a good example.

> +----------------
> +
> +- Building for i.CoreM6 Quad/Dual Starter Kit
> +
> +$ make ARCH=arm imx6q_icore_defconfig
> +$ make ARCH=arm menuconfig
> +$ make ARCH=arm CROSS_COMPILE=arm-unknown-linux-gnueabi- -j 12

ARCH and CROSS_COMPILE are completely useless for Buildroot.

Also, your defconfig should be named engicam_imx6q_icore_defconfig.

> +images copy:
> +-----------
> +
> +$ cd output/images
> +
> +- Flash the SPL image into the micro SD card:
> +
> +$ sudo dd if=SPL of=/dev/mmcblk0 bs=1k seek=1; sync
> +
> +- Flash the u-boot-dtb.img image into the micro SD card:
> +
> +$ sudo dd if=u-boot-dtb.img of=/dev/mmcblk0 bs=1k seek=69; sync
> +
> +- Copy output/images/uImage to mmc card first partition
> +
> +- Copy output/images/imx6q-icore.dtb to mmc card first partition
> +
> +- Copy output/images/rootfs.tar.xz to mmc card second partition and untar there.

Please replace all of this by using genimage so that Buildroot directly
produces a ready-to-use SD card image. There are numerous examples in
the Buildroot tree for i.MX6 platforms.

> diff --git a/configs/imx6q_icore_defconfig b/configs/imx6q_icore_defconfig
> new file mode 100644
> index 0000000..9c3ff4b
> --- /dev/null
> +++ b/configs/imx6q_icore_defconfig
> @@ -0,0 +1,33 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_ARM_ENABLE_NEON=y
> +BR2_ARM_ENABLE_VFP=y
> +BR2_ARM_FPU_VFPV3=y
> +
> +# System
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_TAR_XZ=y

No real point in having both an ext2 filesystem and a tar filesystem.

> +# Bootloader
> +BR2_TARGET_UBOOT=y

Please use a fixed version of U-Boot.

> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_LATEST_VERSION=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6q_icore_mmc"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="SPL"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_LATEST_VERSION=y

Please used a fixed version of the kernel. Also, remember to set the
kernel headers version properly. See
configs/freescale_imx6qsabresd_defconfig for a good defconfig.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
