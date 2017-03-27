From: Jagan Teki <jagan@openedev.com>
Date: Mon, 27 Mar 2017 13:48:05 +0530
Subject: [Buildroot] [PATCH v2] board: Add support for Engicam i.CoreM6
	Quad/Dual boards
Message-ID: <1490602685-4077-1-git-send-email-jagan@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

Add initial support for Engicam i.CoreM6 Quad/Dual boards
with below features:
- U-Boot 2017.01
- Linux 4.10
- Default packages from buildroot

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Matteo Lisi <matteo.lisi@engicam.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- Created icorem6 family board on engicam
- Added Quad/Dual SOM boards support
- Created well defined readme.tx with referance to board/freescale/imx6q-sabresd/
- s/imx6q_icore_defconfig/engicam_/imx6q_icore_defconfig
- Updated DEVELOPERS file
- Created genimage.cfg with added SPL and u-boot-dtb.img partitions
- Removed Latest source configs and updated with fixed version source for U-Boot, Linux
- Add board link on readme.txt
- Removed BR2_TARGET_ROOTFS_TAR_XZ=y
- Created post-image.sh with referance to board/freescale/imx6q-sabresd/

 DEVELOPERS                            |  4 +++
 board/engicam/icorem6/genimage.cfg    | 46 +++++++++++++++++++++++++
 board/engicam/icorem6/post-image.sh   | 54 ++++++++++++++++++++++++++++++
 board/engicam/icorem6/readme.txt      | 63 +++++++++++++++++++++++++++++++++++
 configs/engicam_imx6q_icore_defconfig | 40 ++++++++++++++++++++++
 5 files changed, 207 insertions(+)
 create mode 100644 board/engicam/icorem6/genimage.cfg
 create mode 100755 board/engicam/icorem6/post-image.sh
 create mode 100644 board/engicam/icorem6/readme.txt
 create mode 100644 configs/engicam_imx6q_icore_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 215a3b4..47b5093 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -794,6 +794,10 @@ F:	package/angularjs/
 N:	Ilias Apalodimas <apalos@gmail.com>
 F:	package/keepalived/
 
+N:	Jagan Teki <jagan@amarulasolutions.com>
+F:	board/engicam/
+F:	configs/engicam_imx6q_icore_defconfig
+
 N:	James Knight <james.knight@rockwellcollins.com>
 F:	package/atkmm/
 F:	package/cairomm/
diff --git a/board/engicam/icorem6/genimage.cfg b/board/engicam/icorem6/genimage.cfg
new file mode 100644
index 0000000..68b9d62
--- /dev/null
+++ b/board/engicam/icorem6/genimage.cfg
@@ -0,0 +1,46 @@
+# Minimal SD card image for the Freescale boards Template
+#
+# We mimic the .sdcard Freescale's image format:
+# * the SD card must have 1 kB free space at the beginning,
+# * U-Boot is dumped like SPL at 1K and u-boot-dtb.img at 69K offsets.
+# * a FAT partition at offset 8 MB is containing zImage/uImage and DTB files
+# * a single root filesystem partition is required (ext2, ext3 or ext4)
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      %FILES%
+    }
+  }
+  size = 16M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition SPL {
+    in-partition-table = "no"
+    image = "SPL"
+    offset = 1024
+  }
+
+  partition u-boot-dtb {
+    in-partition-table = "no"
+    image = "u-boot-dtb.img"
+    offset = 69K
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+    offset = 8M
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+}
diff --git a/board/engicam/icorem6/post-image.sh b/board/engicam/icorem6/post-image.sh
new file mode 100755
index 0000000..75c8999
--- /dev/null
+++ b/board/engicam/icorem6/post-image.sh
@@ -0,0 +1,54 @@
+#!/usr/bin/env bash
+
+#
+# dtb_list extracts the list of DTB files from BR2_LINUX_KERNEL_INTREE_DTS_NAME
+# in ${BR_CONFIG}, then prints the corresponding list of file names for the
+# genimage configuration file
+#
+dtb_list()
+{
+	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
+
+	for dt in $DTB_LIST; do
+		echo -n "\"$dt.dtb\", "
+	done
+}
+
+#
+# linux_image extracts the Linux image format from BR2_LINUX_KERNEL_UIMAGE in
+# ${BR_CONFIG}, then prints the corresponding file name for the genimage
+# configuration file
+#
+linux_image()
+{
+	if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" ${BR2_CONFIG}; then
+		echo "\"uImage\""
+	else
+		echo "\"zImage\""
+	fi
+}
+
+main()
+{
+	local FILES="$(dtb_list) $(linux_image)"
+	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
+	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+	sed -e "s/%FILES%/${FILES}/" \
+		 board/engicam/icorem6/genimage.cfg > ${GENIMAGE_CFG}
+
+	rm -rf "${GENIMAGE_TMP}"
+
+	genimage \
+		--rootpath "${TARGET_DIR}" \
+		--tmppath "${GENIMAGE_TMP}" \
+		--inputpath "${BINARIES_DIR}" \
+		--outputpath "${BINARIES_DIR}" \
+		--config "${GENIMAGE_CFG}"
+
+	rm -f ${GENIMAGE_CFG}
+
+	exit $?
+}
+
+main $@
diff --git a/board/engicam/icorem6/readme.txt b/board/engicam/icorem6/readme.txt
new file mode 100644
index 0000000..b700c34
--- /dev/null
+++ b/board/engicam/icorem6/readme.txt
@@ -0,0 +1,63 @@
+**************************************
+Engicam i.CoreM6 Quad/Dual Starter Kit
+**************************************
+
+This file documents the Buildroot support for the Engicam i.CoreM6
+Quad/Dual Starter Kit boards.
+
+i.CoreM6 S/DL/D/Q:
+http://www.engicam.com/en/products/embedded/som/sodimm/i-core-m6s-dl-d-q
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+Build
+=====
+
+First, configure Buildroot for the Engicam i.CoreM6 SD boards:
+
+  make engicam_imx6q_icore_defconfig
+
+Build all components:
+
+  make
+
+You will find the following files in output/images/:
+  - imx6q-icore.dtb
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - SPL
+  - u-boot-dtb.img
+  - uImage
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template.
+
+Boot the i.CoreM6 boards with SD boot:
+=====================================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- connect 3-wire RS232 serial port J28 on board, and connect with other
+  serial end or USB cable(if serial-to-usb converter used) using
+  a terminal emulator at 115200 bps, 8n1;
+- close JM3 for sd boot.
+- power on the board.
+
+Enjoy!
diff --git a/configs/engicam_imx6q_icore_defconfig b/configs/engicam_imx6q_icore_defconfig
new file mode 100644
index 0000000..84ffd96
--- /dev/null
+++ b/configs/engicam_imx6q_icore_defconfig
@@ -0,0 +1,40 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
+
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/engicam/icorem6/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6q_icore_mmc"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-icore"
-- 
1.9.1
