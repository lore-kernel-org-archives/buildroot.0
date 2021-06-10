From: Hanspeter Portner <dev@open-music-kontrollers.ch>
Date: Thu, 10 Jun 2021 12:57:39 +0200
Subject: [Buildroot] [PATCH 1/1] configs/toradex_colibri_imx6: initial commit
Message-ID: <20210610105739.488491-1-dev@open-music-kontrollers.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based on configs/toradex_apalis_imx6 with Toradex' mainline linux/uboot
branches.

Tested on:
  Module:    'Toradex Col IMX6DL 512MB V1.0A'
  Evalboard: 'Toradex Col Evaluation V3.2A'

Signed-off-by: Hanspeter Portner <dev@open-music-kontrollers.ch>
---
 board/toradex/colibri-imx6/genimage.cfg  | 15 +++++++
 board/toradex/colibri-imx6/post-image.sh | 20 +++++++++
 board/toradex/colibri-imx6/readme.txt    | 53 ++++++++++++++++++++++++
 board/toradex/colibri-imx6/uEnv.txt      |  7 ++++
 configs/toradex_colibri_imx6_defconfig   | 25 +++++++++++
 5 files changed, 120 insertions(+)
 create mode 100644 board/toradex/colibri-imx6/genimage.cfg
 create mode 100755 board/toradex/colibri-imx6/post-image.sh
 create mode 100644 board/toradex/colibri-imx6/readme.txt
 create mode 100644 board/toradex/colibri-imx6/uEnv.txt
 create mode 100644 configs/toradex_colibri_imx6_defconfig

diff --git a/board/toradex/colibri-imx6/genimage.cfg b/board/toradex/colibri-imx6/genimage.cfg
new file mode 100644
index 0000000000..91c927c723
--- /dev/null
+++ b/board/toradex/colibri-imx6/genimage.cfg
@@ -0,0 +1,15 @@
+# Minimal SD card image for the Toradex Colibri i.MX6 COM
+#
+# It does not need a boot section for a bootloader since it is booted
+# from its internal flash memory (eMMC).
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+    size = 512M
+  }
+}
diff --git a/board/toradex/colibri-imx6/post-image.sh b/board/toradex/colibri-imx6/post-image.sh
new file mode 100755
index 0000000000..b95e175a29
--- /dev/null
+++ b/board/toradex/colibri-imx6/post-image.sh
@@ -0,0 +1,20 @@
+#!/usr/bin/env bash
+
+GENIMAGE_CFG="$(dirname $0)/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+# copy the uEnv.txt to the output/images directory
+cp board/toradex/colibri-imx6/uEnv.txt $BINARIES_DIR/uEnv.txt
+
+rm -rf "${GENIMAGE_TMP}"
+
+# generate rootfs.img
+genimage \
+  --rootpath "${TARGET_DIR}" \
+  --tmppath "${GENIMAGE_TMP}" \
+  --inputpath "${BINARIES_DIR}" \
+  --outputpath "${BINARIES_DIR}" \
+  --config "${GENIMAGE_CFG}"
+
+RET=${?}
+exit ${RET}
diff --git a/board/toradex/colibri-imx6/readme.txt b/board/toradex/colibri-imx6/readme.txt
new file mode 100644
index 0000000000..50078db173
--- /dev/null
+++ b/board/toradex/colibri-imx6/readme.txt
@@ -0,0 +1,53 @@
+Toradex Colibri i.MX6 Computer on Module
+
+Intro
+=====
+
+The Colibri iMX6 is a SODIMM sized computer module based on NXP?/Freescale
+i.MX 6 SoC. The module targets a wide range of applications, including:
+Medical Devices, Navigation, Industrial Automation, HMIs, Avionics,
+Entertainment system, POS, Data Acquisition, Thin Clients, Robotics, Gaming
+and much more. It offers a wide range of interfaces from simple GPIOs, industry
+standard I2C, SPI, CAN, and UART buses through to high speed USB 2.0 interfaces
+and a 16/32bit external memory bus (parallel bus). The HDMI interface makes it
+very easy to connect large, full HD resolution displays
+
+https://www.toradex.com/computer-on-modules/colibri-arm-family/nxp-freescale-imx6
+
+It supports one carrier boards:
+
+Colibri Evaluation Board
+https://www.toradex.com/products/carrier-board/colibri-evaluation-board
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make toradex_colibri_imx6_defconfig
+
+Compile everything and build the rootfs image:
+
+    $ make
+
+How to boot the image
+=====================
+
+The board only boots from its internal flash memory eMMC, so the
+bootloader image should be copied to it, following the procedures
+described in Toradex website.
+
+http://developer.toradex.com/knowledge-base/flashing-linux-on-imx6-modules
+
+Buildroot prepares a "sdcard.img" in output/images/ with the kernel
+image, device tree and a root filesystem, ready to be dumped on an SD
+card.
+
+    $ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+
+To boot from the SD card, you should change the U-Boot
+environment. Since U-Boot is running from internal eMMC, you will need
+to access its command line prompt and manually set the necessary
+variables to boot from the external SD card. For convenience, you can
+use uEnv.txt provided in output/images/ as a reference to create the
+necessary U-Boot variables to boot from the SD card.
diff --git a/board/toradex/colibri-imx6/uEnv.txt b/board/toradex/colibri-imx6/uEnv.txt
new file mode 100644
index 0000000000..e8fec787aa
--- /dev/null
+++ b/board/toradex/colibri-imx6/uEnv.txt
@@ -0,0 +1,7 @@
+setenv boot_file 'zImage'
+setenv fdt_file 'imx6dl-colibri-eval-v3.dtb'
+setenv sdargs 'ip=off root=/dev/mmcblk0p1 rw,noatime rootfstype=ext4 rootwait'
+setenv sddtbload 'ext2load mmc 1:1 ${fdt_addr_r} boot/${fdt_file}'
+setenv sdkernelload 'ext2load mmc 1:1 ${kernel_addr_r} boot/${boot_file}'
+setenv bootcmd 'run setup; setenv bootargs ${defargs} ${sdargs} ${setupargs} ${vidargs}; echo Booting from SD card...; run sddtbload; run sdkernelload; bootz ${kernel_addr_r} - ${fdt_addr_r}'
+run bootcmd
diff --git a/configs/toradex_colibri_imx6_defconfig b/configs/toradex_colibri_imx6_defconfig
new file mode 100644
index 0000000000..0e50381579
--- /dev/null
+++ b/configs/toradex_colibri_imx6_defconfig
@@ -0,0 +1,25 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/toradex/colibri-imx6/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.toradex.com/linux-toradex.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="toradex_5.4.y"
+BR2_LINUX_KERNEL_DEFCONFIG="toradex-imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-colibri-eval-v3"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.toradex.com/u-boot-toradex.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="toradex_2020.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="colibri_imx6"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.31.1
