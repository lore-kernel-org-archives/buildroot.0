From: Neil Armstrong <narmstrong@baylibre.com>
Date: Mon,  6 Aug 2018 08:50:08 +0000
Subject: [Buildroot] [PATCH 2/2] board: Add Libre Computer AML-S905X-CC
 board support
In-Reply-To: <1533545408-11248-1-git-send-email-narmstrong@baylibre.com>
References: <1533545408-11248-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1533545408-11248-3-git-send-email-narmstrong@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for the Libre Computer AML-S905X-CC based
on an Amlogic S905X SoCs.

The board features :
- 4xCortex-A53 Cores
- 1 or 2Gib or DDR4
- RS232 TTL Header
- MicroUSB for Power Only
- HDMI 2.0b output + CEC
- CVBS + Audio Jack
- 10/100 Ethernet
- 4xUSB2.0
- IR Receiver
- SDCard
- eMMC optional slot
- 40pin connector partially RPi compatible
- 8Pin I2S 7.1 connector
- 3Pin SPDIF connector

The board is entirely supported since U-boot 2018.01 and Linux 4.14.

The Buildroot support is done with upstream only package and the
previously submitted "aml-s905x-cc-fip" package to generate a valid
bootable SDCard image.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 DEVELOPERS                                     |  2 +
 board/librecomputer/aml-s905x-cc/extlinux.conf |  6 +++
 board/librecomputer/aml-s905x-cc/genimage.cfg  | 11 +++++
 board/librecomputer/aml-s905x-cc/post-build.sh |  5 ++
 board/librecomputer/aml-s905x-cc/post-image.sh | 64 ++++++++++++++++++++++++++
 board/librecomputer/aml-s905x-cc/readme.txt    | 50 ++++++++++++++++++++
 configs/aml-s905x-cc_defconfig                 | 30 ++++++++++++
 7 files changed, 168 insertions(+)
 create mode 100644 board/librecomputer/aml-s905x-cc/extlinux.conf
 create mode 100644 board/librecomputer/aml-s905x-cc/genimage.cfg
 create mode 100755 board/librecomputer/aml-s905x-cc/post-build.sh
 create mode 100755 board/librecomputer/aml-s905x-cc/post-image.sh
 create mode 100644 board/librecomputer/aml-s905x-cc/readme.txt
 create mode 100644 configs/aml-s905x-cc_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 66d2c51..6f18f93 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1460,6 +1460,8 @@ F:	package/libevdev/
 
 N:	Neil Armstrong <narmstrong@baylibre.com>
 F:	boot/aml-s905x-cc-fip/
+F:	board/librecomputer/aml-s905x-cc
+F:	configs/aml-s905x-cc_defconfig
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
diff --git a/board/librecomputer/aml-s905x-cc/extlinux.conf b/board/librecomputer/aml-s905x-cc/extlinux.conf
new file mode 100644
index 0000000..aa58a2c
--- /dev/null
+++ b/board/librecomputer/aml-s905x-cc/extlinux.conf
@@ -0,0 +1,6 @@
+default buildroot
+
+label buildroot
+kernel /boot/Image
+devicetree /boot/meson-gxl-s905x-libretech-cc.dtb
+append console=ttyAML0,115200 root=/dev/mmcblk1p1 rootwait rw
diff --git a/board/librecomputer/aml-s905x-cc/genimage.cfg b/board/librecomputer/aml-s905x-cc/genimage.cfg
new file mode 100644
index 0000000..f559e35
--- /dev/null
+++ b/board/librecomputer/aml-s905x-cc/genimage.cfg
@@ -0,0 +1,11 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+		offset = 1048576
+	}
+}
diff --git a/board/librecomputer/aml-s905x-cc/post-build.sh b/board/librecomputer/aml-s905x-cc/post-build.sh
new file mode 100755
index 0000000..1f5ff6a
--- /dev/null
+++ b/board/librecomputer/aml-s905x-cc/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/librecomputer/aml-s905x-cc/post-image.sh b/board/librecomputer/aml-s905x-cc/post-image.sh
new file mode 100755
index 0000000..c6bbe6f
--- /dev/null
+++ b/board/librecomputer/aml-s905x-cc/post-image.sh
@@ -0,0 +1,64 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+mkdir ${BINARIES_DIR}/fip/tmp
+cp ${BINARIES_DIR}/u-boot.bin ${BINARIES_DIR}/fip/tmp/bl33.bin
+cp ${BINARIES_DIR}/fip/bl31.img ${BINARIES_DIR}/fip/tmp/bl31.img
+
+${BINARIES_DIR}/fip/blx_fix.sh ${BINARIES_DIR}/fip/bl30.bin \
+		${BINARIES_DIR}/fip/tmp/zero_tmp \
+		${BINARIES_DIR}/fip/tmp/bl30_zero.bin \
+		${BINARIES_DIR}/fip/bl301.bin \
+		${BINARIES_DIR}/fip/tmp/bl301_zero.bin \
+		${BINARIES_DIR}/fip/tmp/bl30_new.bin bl30
+
+python ${BINARIES_DIR}/fip/acs_tool.pyc ${BINARIES_DIR}/fip/bl2.bin \
+		${BINARIES_DIR}/fip/tmp/bl2_acs.bin \
+		${BINARIES_DIR}/fip/acs.bin 0
+
+${BINARIES_DIR}/fip/blx_fix.sh ${BINARIES_DIR}/fip/tmp/bl2_acs.bin \
+		${BINARIES_DIR}/fip/tmp/zero_tmp \
+		${BINARIES_DIR}/fip/tmp/bl2_zero.bin \
+		${BINARIES_DIR}/fip/bl21.bin \
+		${BINARIES_DIR}/fip/tmp/bl21_zero.bin \
+		${BINARIES_DIR}/fip/tmp/bl2_new.bin bl2
+
+${BINARIES_DIR}/fip/aml_encrypt_gxl --bl3enc \
+		--input ${BINARIES_DIR}/fip/tmp/bl30_new.bin
+
+${BINARIES_DIR}/fip/aml_encrypt_gxl --bl3enc \
+		--input ${BINARIES_DIR}/fip/tmp/bl31.img
+
+${BINARIES_DIR}/fip/aml_encrypt_gxl --bl3enc \
+		--input ${BINARIES_DIR}/fip/tmp/bl33.bin
+
+${BINARIES_DIR}/fip/aml_encrypt_gxl --bl2sig \
+		--input ${BINARIES_DIR}/fip/tmp/bl2_new.bin \
+		--output ${BINARIES_DIR}/fip/tmp/bl2.n.bin.sig
+
+${BINARIES_DIR}/fip/aml_encrypt_gxl --bootmk \
+		--output ${BINARIES_DIR}/fip/tmp/u-boot.bin \
+		--bl2 ${BINARIES_DIR}/fip/tmp/bl2.n.bin.sig \
+		--bl30 ${BINARIES_DIR}/fip/tmp/bl30_new.bin.enc \
+		--bl31 ${BINARIES_DIR}/fip/tmp/bl31.img.enc \
+		--bl33 ${BINARIES_DIR}/fip/tmp/bl33.bin.enc
+
+dd if=${BINARIES_DIR}/fip/tmp/u-boot.bin.sd.bin \
+   of=${BINARIES_DIR}/sdcard.img \
+   bs=1 count=444 conv=sync,notrunc
+
+dd if=${BINARIES_DIR}/fip/tmp/u-boot.bin.sd.bin \
+   of=${BINARIES_DIR}/sdcard.img \
+   bs=512 skip=1 seek=1 conv=fsync,notrunc
diff --git a/board/librecomputer/aml-s905x-cc/readme.txt b/board/librecomputer/aml-s905x-cc/readme.txt
new file mode 100644
index 0000000..ee699dc
--- /dev/null
+++ b/board/librecomputer/aml-s905x-cc/readme.txt
@@ -0,0 +1,50 @@
+Libre Computer AML-S905X-CC
+
+Intro
+=====
+To be able to use AML-S905X-CC board with the images generated by
+Buildroot, you have to prepare the SDCard or eMMC.
+
+How to build it
+===============
+
+  $ make aml-s905-cc_defconfig
+
+Then you can edit the build options using
+
+  $ make menuconfig
+
+Compile all and build rootfs image:
+
+  $ make
+
+Note: you will need to have access to the network, since Buildroot will
+download the packages' sources.
+
+Result of the build
+-------------------
+
+After building, you should obtain this tree:
+
+    output/images/
+    +-- Image
+    +-- boot.vfat
+    +-- meson-gxl-s905x-libretech-cc.dtb
+    +-- rootfs.ext2
+    +-- rootfs.ext4
+    +-- rootfs.tar
+    +-- sdcard.img
+    `-- u-boot.bin
+
+How to write the SD card or eMMC
+================================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card or eMMC with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Insert the SDcard into your AML-S905X-CC, and power it up. Your new system
+should come up now.
diff --git a/configs/aml-s905x-cc_defconfig b/configs/aml-s905x-cc_defconfig
new file mode 100644
index 0000000..cb2550b
--- /dev/null
+++ b/configs/aml-s905x-cc_defconfig
@@ -0,0 +1,30 @@
+# Architecture
+BR2_aarch64=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="aml-s905x-cc"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/librecomputer/aml-s905x-cc/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/librecomputer/aml-s905x-cc/post-image.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_BUILD_DEFAULT_DTS=y
+BR2_LINUX_KERNEL_USE_INTREE_DTS=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxl-s905x-libretech-cc"
+BR2_LINUX_KERNEL_IMAGE=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="libretech-cc"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="libretech-cc"
+BR2_TARGET_AML_S905X_CC_FIP=y
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.4
