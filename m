From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 22:12:28 +0200
Subject: [Buildroot] [PATCH] Add support for Digilent Zybo (Xilinx
 Zynq-7000)
In-Reply-To: <2a3f44ad-9013-6af8-08f7-bec58222b43d@gmail.com>
References: <2a3f44ad-9013-6af8-08f7-bec58222b43d@gmail.com>
Message-ID: <20160612221228.6ae1379a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for this contribution! See below for a number of comments.

On Sun, 22 May 2016 17:50:56 +0200, Sebastien Van Cauwenberghe wrote:
> [PATCH] Add support for Digilent Zybo (Xilinx Zynq-7000)

Not need to repeat the title of the commit in the commit log. Also, the
commit title should rather be:

	configs: add defconfig for Digilent Zybo

> diff --git a/board/digilent/zybo/readme.txt b/board/digilent/zybo/readme.txt
> new file mode 100644
> index 0000000..f9ff939
> --- /dev/null
> +++ b/board/digilent/zybo/readme.txt
> @@ -0,0 +1,75 @@
> +This is the buildroot board support for the Digilent Zybo. The Zybo is
> +a development board based on the Xilinx Zynq-7000 based All-Programmable
> +System-On-Chip.
> +
> +Zybo information including schematics, reference designs, and manuals are
> +available from http://store.digilentinc.com/zybo-zynq-7000-arm-fpga-soc-trainer-board/ .
> +
> +Steps to create a working system for Zybo:
> +
> +1) make zynq_zybo_defconfig
> +2) make
> +3) copy files BOOT.BIN, u-boot-dtb.img, rootfs.cpio.uboot,
> +	uImage, zynq-zybo.dtb into your SD card

Please use genimage to generate a ready-to-use SD card image. You can
check many of the other board configurations in Buildroot that are
doing this.

Also, why do you use an initramfs for the rootfs rather than the more
traditional ext4 partition next to the FAT partition? This would be the
preferred method for the defconfig in Buildroot.

> +Resulting system
> +----------------
> +A FAT32 partition should be created at the beginning of the SD Card
> +and the following files should be installed:
> +	/BOOT.BIN
> +	/zynq-zybo.dtb
> +	/uImage
> +	/rootfs-cpio.uboot
> +	/u-boot-dtb.img
> +
> +
> +All needed files can be taken from output/images/
> +
> +BOOT.BIN, uImage and u-boot-dtb.img are direct copies of the same files
> +available on output/images/

All of this can be simplified once you generate a complete SD card
image with genimage.

> +There is a patch attached that redefines the U-Boot's environment
> +to work with Buildroot out-of-the-box.

Why do you patch the U-Boot built-in environment instead of providing
an uEnv.txt file?

> +The serial console is accessible on the host on /dev/ttyUSB1 at 115200 bauds.

Saying it's on /dev/ttyUSB1 on the host is wrong. It might be on your
machine, but it might be on ttyUSB0 on mine, or on ttyUSB2. There is no
point in giving this information, since you don't know.

> diff --git a/configs/zynq_zybo_defconfig b/configs/zynq_zybo_defconfig
> new file mode 100644
> index 0000000..e2c8841
> --- /dev/null
> +++ b/configs/zynq_zybo_defconfig
> @@ -0,0 +1,25 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_ARM_ENABLE_NEON=y
> +# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set

Please leave this option to the default.

> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
> +BR2_BINUTILS_VERSION_2_26_X=y

Please leave this to the default.

> +BR2_GCC_VERSION_5_X=y

Ditto.

> +BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
> +BR2_LINUX_KERNEL=y

Please use a fixed kernel version.

> +BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
> +BR2_LINUX_KERNEL_UIMAGE=y
> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"

Can you try to use zImage instead, which is now the standard format on
ARM?

> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zybo"
> +BR2_TARGET_ROOTFS_CPIO=y
> +BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +BR2_TARGET_ROOTFS_CPIO_UIMAGE=y

As suggested above, what about using an ext4 filesystem instead?

> +BR2_TARGET_UBOOT=y

Please used a fixed version of U-Boot.

> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_PATCH="$(TOPDIR)/board/digilent/zybo/uboot"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zybo"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_ZYNQ_IMAGE=y

Could you rework your patch according to the above suggestions? With
those suggestions taken into account, your patch could be merged in
Buildroot.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
