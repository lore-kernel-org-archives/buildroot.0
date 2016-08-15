From: Lothar Felten <lothar.felten@gmail.com>
Date: Mon, 15 Aug 2016 13:51:22 +0200
Subject: [Buildroot] [PATCH 1/1] configs: new defconfig for TI am335x-evm
Message-ID: <1471261882-5640-1-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a target config for the ti am335x-evm based on the AM335x CPU.
It also supports the beaglebone and beagleboneblack.
Device tree blobs for am335x-evm, am335x-evmsk, am335x-bone, am335x-boneblack
will be built and a sd card image is created with a post-image script.
The kernel and driver versions match the ti-processor-sdk 02.00.00.00.
Patches allow the use of old AM335x evm revisions (1 bit sd card) and JTAG
debugging.

Kernel JTAG patch:
By default the kernel will disable the JTAG clock, access via the JTAG port
will not work after the kernel booted. The AM335x-evm has a JTAG header fitted,
this patch keeps the JTAG clock alive.

Uboot SD card patch:
Early AM335x-evm boards can only use 1 bit communication to the SD card, on
newer board revisions this might be fixed.
Forcing 1 bit communication slows down the communication but will work
regardless if the SD card is attached via 1 or 4 bits.
If the board has a working 4 bit SD card interface, this patch can be removed,
this will speed up the access.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 board/ti/am335x-evm/genimage.cfg                   | 32 +++++++++++++
 .../0001-keep-jtag-clock-alive-for-debugger.patch  | 16 +++++++
 .../uboot/0001-mmc-force-1bit-bus-width.patch      | 35 +++++++++++++++
 board/ti/am335x-evm/post-image.sh                  | 22 +++++++++
 board/ti/am335x-evm/readme.txt                     | 52 ++++++++++++++++++++++
 board/ti/am335x-evm/uEnv.txt                       |  3 ++
 configs/am335x-evm_defconfig                       | 25 +++++++++++
 7 files changed, 185 insertions(+)
 create mode 100644 board/ti/am335x-evm/genimage.cfg
 create mode 100644 board/ti/am335x-evm/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
 create mode 100644 board/ti/am335x-evm/patches/uboot/0001-mmc-force-1bit-bus-width.patch
 create mode 100755 board/ti/am335x-evm/post-image.sh
 create mode 100644 board/ti/am335x-evm/readme.txt
 create mode 100644 board/ti/am335x-evm/uEnv.txt
 create mode 100644 configs/am335x-evm_defconfig

diff --git a/board/ti/am335x-evm/genimage.cfg b/board/ti/am335x-evm/genimage.cfg
new file mode 100644
index 0000000..c9de722
--- /dev/null
+++ b/board/ti/am335x-evm/genimage.cfg
@@ -0,0 +1,32 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"MLO",
+			"u-boot.img",
+			"zImage",
+			"uEnv.txt",
+			"am335x-evm.dtb",
+			"am335x-evmsk.dtb",
+			"am335x-bone.dtb",
+			"am335x-boneblack.dtb",
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+                image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 240M
+	}
+}
diff --git a/board/ti/am335x-evm/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch b/board/ti/am335x-evm/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
new file mode 100644
index 0000000..324915e
--- /dev/null
+++ b/board/ti/am335x-evm/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
@@ -0,0 +1,16 @@
+This patch keeps the debugSS clock alive, it clock the JTAG macro and enables
+access to the SoC via JTAG after the kernel booted.
+
+Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
+---
+diff -Naur linux-orig/arch/arm/mach-omap2/omap_hwmod_33xx_data.c linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+--- linux-orig/arch/arm/mach-omap2/omap_hwmod_33xx_data.c	2015-10-02 17:30:56.000000000 +0200
++++ linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593/arch/arm/mach-omap2/omap_hwmod_33xx_data.c	2016-08-15 11:28:55.017617612 +0200
+@@ -208,6 +208,7 @@
+ 	.name		= "debugss",
+ 	.class		= &am33xx_debugss_hwmod_class,
+ 	.clkdm_name	= "l3_aon_clkdm",
++	.flags		= (HWMOD_INIT_NO_IDLE|HWMOD_INIT_NO_RESET), /* keep debugSS clock alive for JTAG */
+ 	.main_clk	= "trace_clk_div_ck",
+ 	.prcm		= {
+ 		.omap4	= {
diff --git a/board/ti/am335x-evm/patches/uboot/0001-mmc-force-1bit-bus-width.patch b/board/ti/am335x-evm/patches/uboot/0001-mmc-force-1bit-bus-width.patch
new file mode 100644
index 0000000..c47500b
--- /dev/null
+++ b/board/ti/am335x-evm/patches/uboot/0001-mmc-force-1bit-bus-width.patch
@@ -0,0 +1,35 @@
+This patch forces tge MMC interface to work in 1-bit-mode.
+Early AM335x-evm boards can only use 1 bit communication to the SD card, on
+newer board revisions this might be fixed.
+
+Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
+---
+diff -Naur a/drivers/mmc/mmc.c b/drivers/mmc/mmc.c
+--- a/drivers/mmc/mmc.c	2016-05-16 16:40:32.000000000 +0200
++++ b/drivers/mmc/mmc.c	2016-07-11 13:23:13.235880737 +0200
+@@ -1351,25 +1351,6 @@
+ 	mmc->card_caps &= mmc->cfg->host_caps;
+ 
+ 	if (IS_SD(mmc)) {
+-		if (mmc->card_caps & MMC_MODE_4BIT) {
+-			cmd.cmdidx = MMC_CMD_APP_CMD;
+-			cmd.resp_type = MMC_RSP_R1;
+-			cmd.cmdarg = mmc->rca << 16;
+-
+-			err = mmc_send_cmd(mmc, &cmd, NULL);
+-			if (err)
+-				return err;
+-
+-			cmd.cmdidx = SD_CMD_APP_SET_BUS_WIDTH;
+-			cmd.resp_type = MMC_RSP_R1;
+-			cmd.cmdarg = 2;
+-			err = mmc_send_cmd(mmc, &cmd, NULL);
+-			if (err)
+-				return err;
+-
+-			mmc_set_bus_width(mmc, 4);
+-		}
+-
+ 		if (mmc->card_caps & MMC_MODE_HS)
+ 			mmc->tran_speed = 50000000;
+ 		else
diff --git a/board/ti/am335x-evm/post-image.sh b/board/ti/am335x-evm/post-image.sh
new file mode 100755
index 0000000..6b16f40
--- /dev/null
+++ b/board/ti/am335x-evm/post-image.sh
@@ -0,0 +1,22 @@
+#!/bin/sh
+# post-image.sh for ti am335x-evm
+# based on post-image from beagleboard
+# 2014, Marcin Jabrzyk <marcin.jabrzyk@gmail.com>
+# 2016, Lothar Felten <lothar.felten@gmail.com>
+
+BOARD_DIR="$(dirname $0)"
+
+# copy the uEnv.txt to the output/images directory
+cp board/ti/am335x-evm/uEnv.txt $BINARIES_DIR/uEnv.txt
+
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+    --rootpath "${TARGET_DIR}" \
+    --tmppath "${GENIMAGE_TMP}" \
+    --inputpath "${BINARIES_DIR}" \
+    --outputpath "${BINARIES_DIR}" \
+    --config "${GENIMAGE_CFG}"
diff --git a/board/ti/am335x-evm/readme.txt b/board/ti/am335x-evm/readme.txt
new file mode 100644
index 0000000..d3bd424
--- /dev/null
+++ b/board/ti/am335x-evm/readme.txt
@@ -0,0 +1,52 @@
+Texas Instuments AM335x Evaluation Module (TMDXEVM3358)
+
+Description
+===========
+
+This configuration will build a complete image for the AM335x-EVM.
+
+The configuration is based on the ti-processor-sdk-02.00.00.00.
+
+Device tree blobs for the evm-sk, and beaglebone variants are built too.
+
+
+How to build it
+===============
+
+Select the default configuration for the am335x-evm target:
+$ make am335x-evm_defconfig
+
+Optional: modify the configuration:
+$ make menuconfig
+
+Build:
+$ make
+
+
+Result of the build
+===================
+output/images/
+??? am335x-boneblack.dtb
+??? am335x-bone.dtb
+??? am335x-evm.dtb
+??? am335x-evmsk.dtb
+??? boot.vfat
+??? MLO
+??? rootfs.ext2
+??? rootfs.tar
+??? sdcard.img
+??? u-boot.img
+??? uEnv.txt
+??? zImage
+
+To copy the image file to the sdcard use dd:
+dd if=output/images/sdcard.img of=/dev/XXX
+
+
+Tested hardware
+===============
+am335x-evm (rev. 1.1A)
+beagleboneblack (rev. A5A)
+beaglebone (rev. A6)
+
+2016, Lothar Felten <lothar.felten@gmail.com>
diff --git a/board/ti/am335x-evm/uEnv.txt b/board/ti/am335x-evm/uEnv.txt
new file mode 100644
index 0000000..e09fff5
--- /dev/null
+++ b/board/ti/am335x-evm/uEnv.txt
@@ -0,0 +1,3 @@
+bootpart=0:1
+bootdir=
+uenvcmd=run loadimage;run loadramdisk;run findfdt;run loadfdt;run ramboot
diff --git a/configs/am335x-evm_defconfig b/configs/am335x-evm_defconfig
new file mode 100644
index 0000000..c834b17
--- /dev/null
+++ b/configs/am335x-evm_defconfig
@@ -0,0 +1,25 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_GLOBAL_PATCH_DIR="board/ti/am335x-evm/patches"
+BR2_KERNEL_HEADERS_4_1=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am335x-evm/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52c4aa7cdb93d61f8008f380135beaf7b8fa6593"
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-evmsk"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="MLO"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
1.9.1
