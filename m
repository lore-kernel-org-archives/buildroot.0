From: Raul Munoz <munoz0raul@gmail.com>
Date: Fri, 25 Aug 2017 12:56:59 -0300
Subject: [Buildroot] [PATCH 1/1] configs/toradex_colibri_imx6_defconfig: new
	board
Message-ID: <20170825155659.8819-1-munoz0raul@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support to Colibri i.MX6 Toradex module.

Based on commit e7127d25c56b9af237366dac79e3b4a67b306fa4,
since the module works pretty much the same as Apalis iMX6.

Signed-off-by: Raul Munoz <munoz0raul@gmail.com>
---
 board/toradex/colibri-imx6/genimage.cfg  | 15 ++++++++
 board/toradex/colibri-imx6/post-image.sh | 20 +++++++++++
 board/toradex/colibri-imx6/readme.txt    | 59 ++++++++++++++++++++++++++++++++
 board/toradex/colibri-imx6/uEnv.txt      |  7 ++++
 configs/toradex_colibri_imx6_defconfig   | 25 ++++++++++++++
 5 files changed, 126 insertions(+)
 create mode 100644 board/toradex/colibri-imx6/genimage.cfg
 create mode 100755 board/toradex/colibri-imx6/post-image.sh
 create mode 100644 board/toradex/colibri-imx6/readme.txt
 create mode 100644 board/toradex/colibri-imx6/uEnv.txt
 create mode 100644 configs/toradex_colibri_imx6_defconfig

diff --git a/board/toradex/colibri-imx6/genimage.cfg b/board/toradex/colibri-imx6/genimage.cfg
new file mode 100644
index 0000000..fe359bd
--- /dev/null
+++ b/board/toradex/colibri-imx6/genimage.cfg
@@ -0,0 +1,15 @@
+# Minimal SD card image for the Toradex Apalis i.MX6 COM
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
index 0000000..b95e175
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
index 0000000..f73d9f8
--- /dev/null
+++ b/board/toradex/colibri-imx6/readme.txt
@@ -0,0 +1,59 @@
+Toradex Colibri i.MX6 Computer on Module
+
+Intro
+=====
+
+The Colibri iMX6 is a small form-factor Computer on Module that comes
+in both quad core and dual core versions based on Freescale i.MX6Q and
+Freescale i.MX6D SoCs respectively. The Cortex A9 quad core and dual
+core CPU peaks at 1 GHz for commercial temperature variant, while the
+industrial temperature variant has a peak frequency of 800 MHz.
+
+https://www.toradex.com/computer-on-modules/colibri-arm-family/nxp-freescale-imx6
+
+It supports two carrier boards:
+
+Colibri Evaluation Board
+https://www.toradex.com/products/carrier-board/colibri-evaluation-carrier-board
+
+Iris Carrier Board
+https://www.toradex.com/products/carrier-board/iris-carrier-board
+
+Aster Carrier Board
+https://www.toradex.com/products/carrier-boards/aster-carrier-board
+
+Viola Carrier Board
+https://www.toradex.com/products/carrier-board/viola-carrier-board
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
index 0000000..4c28507
--- /dev/null
+++ b/board/toradex/colibri-imx6/uEnv.txt
@@ -0,0 +1,7 @@
+boot_file 'zImage'
+fdt_file 'imx6dl-colibri-eval-v3.dtb'
+sdargs 'ip=off root=/dev/mmcblk1p1 rw,noatime rootfstype=ext4 rootwait'
+sddtbload 'ext4load mmc 1:1 ${fdt_addr_r} boot/${fdt_file}'
+sdkernelload 'ext4load mmc 1:1 ${kernel_addr_r} boot/${boot_file}'
+bootcmd 'run setup; bootargs ${defargs} ${sdargs} ${setupargs} ${vidargs}; echo Booting from SD card...; run sddtbload; run sdkernelload; bootz ${kernel_addr_r} - ${fdt_addr_r}'
+
diff --git a/configs/toradex_colibri_imx6_defconfig b/configs/toradex_colibri_imx6_defconfig
new file mode 100644
index 0000000..b5d1965
--- /dev/null
+++ b/configs/toradex_colibri_imx6_defconfig
@@ -0,0 +1,25 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/toradex/colibri-imx6/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.toradex.com/linux-toradex.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3f68dc7c600c0354f5df7f06b931661319addafb"
+BR2_LINUX_KERNEL_DEFCONFIG="colibri_imx6"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-colibri-aster imx6dl-colibri-cam-eval-v3 imx6dl-colibri-eval-v3"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.toradex.com/u-boot-toradex.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="f0e414972b5b225e33ebe75574562266116746f9"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="colibri_imx6"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.9.5
