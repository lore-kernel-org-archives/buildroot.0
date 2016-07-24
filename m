From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 16:41:44 +0200
Subject: [Buildroot] [PATCH 1/1] Texas Instruments am335x-evm support
In-Reply-To: <1468514026-4457-1-git-send-email-lothar.felten@gmail.com>
References: <1468514026-4457-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160724164144.46755639@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The commit title should be:

	configs: new defconfig for TI am335x-evm

or something similar.


> diff --git a/board/ti/am335x-evm/kernel.config b/board/ti/am335x-evm/kernel.config
> new file mode 100644
> index 0000000..39b1bd3
> --- /dev/null
> +++ b/board/ti/am335x-evm/kernel.config

This kernel configuration is very very verbose. Could you instead use
the omap2plus_defconfig from the kernel?

> diff --git a/board/ti/am335x-evm/patches/linux/0004-keep-jtag-clock-alive-for-debugger.patch b/board/ti/am335x-evm/patches/linux/0004-keep-jtag-clock-alive-for-debugger.patch

Why 0004 ?

Also, all patches should have a description + Signed-off-by.

> new file mode 100644
> index 0000000..0192e64
> --- /dev/null
> +++ b/board/ti/am335x-evm/patches/linux/0004-keep-jtag-clock-alive-for-debugger.patch
> @@ -0,0 +1,10 @@
> +--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c	2016-01-08 21:16:11.000000000 +0100
> ++++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c	2016-03-10 10:47:15.209992555 +0100
> +@@ -208,6 +208,7 @@
> + 	.name		= "debugss",
> + 	.class		= &am33xx_debugss_hwmod_class,
> + 	.clkdm_name	= "l3_aon_clkdm",
> ++	.flags		= (HWMOD_INIT_NO_IDLE|HWMOD_INIT_NO_RESET), /* keep debugSS clock alive for JTAG */
> + 	.main_clk	= "trace_clk_div_ck",
> + 	.prcm		= {
> + 		.omap4	= {
> diff --git a/board/ti/am335x-evm/patches/uboot/0001-mmc-force-1bit-bus-width.patch b/board/ti/am335x-evm/patches/uboot/0001-mmc-force-1bit-bus-width.patch
> new file mode 100644
> index 0000000..ecaabaa
> --- /dev/null
> +++ b/board/ti/am335x-evm/patches/uboot/0001-mmc-force-1bit-bus-width.patch

Ditto: missing description + Signed-off-by.

> @@ -0,0 +1,29 @@
> +diff -Naur a/drivers/mmc/mmc.c b/drivers/mmc/mmc.c
> +--- a/drivers/mmc/mmc.c	2016-05-16 16:40:32.000000000 +0200
> ++++ b/drivers/mmc/mmc.c	2016-07-11 13:23:13.235880737 +0200
> +@@ -1351,25 +1351,6 @@
> + 	mmc->card_caps &= mmc->cfg->host_caps;
> + 
> + 	if (IS_SD(mmc)) {
> +-		if (mmc->card_caps & MMC_MODE_4BIT) {
> +-			cmd.cmdidx = MMC_CMD_APP_CMD;
> +-			cmd.resp_type = MMC_RSP_R1;
> +-			cmd.cmdarg = mmc->rca << 16;
> +-
> +-			err = mmc_send_cmd(mmc, &cmd, NULL);
> +-			if (err)
> +-				return err;
> +-
> +-			cmd.cmdidx = SD_CMD_APP_SET_BUS_WIDTH;
> +-			cmd.resp_type = MMC_RSP_R1;
> +-			cmd.cmdarg = 2;
> +-			err = mmc_send_cmd(mmc, &cmd, NULL);
> +-			if (err)
> +-				return err;
> +-
> +-			mmc_set_bus_width(mmc, 4);
> +-		}
> +-
> + 		if (mmc->card_caps & MMC_MODE_HS)
> + 			mmc->tran_speed = 50000000;
> + 		else
> diff --git a/board/ti/am335x-evm/post-image.sh b/board/ti/am335x-evm/post-image.sh
> new file mode 100755
> index 0000000..6b16f40
> --- /dev/null
> +++ b/board/ti/am335x-evm/post-image.sh
> @@ -0,0 +1,22 @@
> +#!/bin/sh
> +# post-image.sh for ti am335x-evm
> +# based on post-image from beagleboard
> +# 2014, Marcin Jabrzyk <marcin.jabrzyk@gmail.com>
> +# 2016, Lothar Felten <lothar.felten@gmail.com>
> +
> +BOARD_DIR="$(dirname $0)"
> +
> +# copy the uEnv.txt to the output/images directory
> +cp board/ti/am335x-evm/uEnv.txt $BINARIES_DIR/uEnv.txt
> +
> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage \
> +    --rootpath "${TARGET_DIR}" \
> +    --tmppath "${GENIMAGE_TMP}" \
> +    --inputpath "${BINARIES_DIR}" \
> +    --outputpath "${BINARIES_DIR}" \
> +    --config "${GENIMAGE_CFG}"
> diff --git a/board/ti/am335x-evm/readme.txt b/board/ti/am335x-evm/readme.txt
> new file mode 100644
> index 0000000..f25c8ea
> --- /dev/null
> +++ b/board/ti/am335x-evm/readme.txt
> @@ -0,0 +1,62 @@
> +Texas Instuments AM335x Evaluation Module (TMDXEVM3358)
> +
> +Description
> +===========
> +
> +This configuration will build a complete image for the AM335x-EVM, including
> +SGX530 graphics acceleation support (only included in the 3354/8/9) and Qt5.
> +
> +The configuration is based on the ti-processor-sdk-02.00.00.00.
> +
> +Device tree blobs for the evm-sk, and beaglebone variants are built too.
> +
> +
> +How to build it
> +===============
> +
> +Select the default configuration for the am335x-evm target:
> +$ make am335x-evm_defconfig
> +
> +Optional: modify the configuration:
> +$ make menuconfig
> +
> +Build:
> +$ make
> +
> +
> +Result of the build
> +===================
> +output/images/
> +??? am335x-boneblack.dtb
> +??? am335x-bone.dtb
> +??? am335x-evm.dtb
> +??? am335x-evmsk.dtb
> +??? boot.vfat
> +??? MLO
> +??? rootfs.ext2
> +??? rootfs.tar
> +??? sdcard.img
> +??? u-boot.img
> +??? uEnv.txt
> +??? zImage
> +
> +To copy the image file to the sdcard use dd:
> +dd if=output/images/sdcard.img of=/dev/XXX
> +
> +
> +Tested hardware
> +===============
> +am335x-evm (rev. 1.1A):
> +/usr/bin/sha512sum

Testing sha512sum doesn't seem like a very useful test.

> +/usr/lib/qt/examples/opengl/hellowindow/hellowindow 
> +/usr/bin/OGLES2MagicLantern
> +
> +beagleboneblack (rev. A5A): 
> +/usr/bin/sha512sum
> +/usr/lib/qt/examples/opengl/hellowindow/hellowindow 
> +/usr/bin/OGLES2MagicLantern
> +
> +beaglebone (rev. A6):
> +/usr/bin/sha512sum
> +
> +2016, Lothar Felten <lothar.felten@gmail.com>
> diff --git a/board/ti/am335x-evm/uEnv.txt b/board/ti/am335x-evm/uEnv.txt
> new file mode 100644
> index 0000000..e09fff5
> --- /dev/null
> +++ b/board/ti/am335x-evm/uEnv.txt
> @@ -0,0 +1,3 @@
> +bootpart=0:1
> +bootdir=
> +uenvcmd=run loadimage;run loadramdisk;run findfdt;run loadfdt;run ramboot
> diff --git a/configs/am335x-evm_defconfig b/configs/am335x-evm_defconfig
> new file mode 100644
> index 0000000..a5c0edf
> --- /dev/null
> +++ b/configs/am335x-evm_defconfig
> @@ -0,0 +1,36 @@
> +BR2_arm=y
> +BR2_cortex_a8=y
> +BR2_KERNEL_HEADERS_4_1=y
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

Why normally want a minimal default toolchain, i.e uClibc and no C++.

> +BR2_ENABLE_LOCALE_PURGE=y
> +BR2_ENABLE_LOCALE_WHITELIST="C en_US"

Leave the default for this.

> +BR2_TARGET_GENERIC_HOSTNAME="TI am335x-evm"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y

Ditto.

> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am335x-evm/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52c4aa7cdb93d61f8008f380135beaf7b8fa6593"
> +BR2_LINUX_KERNEL_PATCH="board/ti/am335x-evm/patches/linux/"

You could use BR2_GLOBAL_PATCH_DIR instead, to group the Linux and
U-Boot patches.

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/ti/am335x-evm/kernel.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-evmsk"
> +BR2_PACKAGE_FBV=y
> +BR2_PACKAGE_QT5=y
> +BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
> +BR2_PACKAGE_QT5BASE_EXAMPLES=y
> +BR2_PACKAGE_QT5BASE_EGLFS=y
> +BR2_PACKAGE_QT5QUICKCONTROLS=y
> +BR2_PACKAGE_TI_SGX_DEMOS=y

We want our defconfigs to be minimal ones, i.e without any special
package enabled.

> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y

Please indicate a specific version of U-Boot (use the "Custom version")
possibility.

> +BR2_TARGET_UBOOT_PATCH="board/ti/am335x-evm/patches/uboot"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="MLO"
> +BR2_PACKAGE_HOST_GENIMAGE=y

You also need:

BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_MTOOLS=y

because your genimage configuration is building a FAT partition.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
