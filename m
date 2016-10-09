From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 22:47:18 +0200
Subject: [Buildroot] [git commit] configs/mx6udoo: Add initial support
Message-ID: <20161009204723.7EAFD81D44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ec127d8d87f3aa373be94fde2849de4e793131c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the initial support for mx6q/dl udoo boards.

For information about these boards, please visit:
http://www.udoo.org/

In linux.fragment we disable USB support for now because kernel 4.8
hangs on udoo board.

This is been addressed by Peter Chen's kernel patch series that provides
a standard way to reset a USB hub.

When such series hit mainline, then we can bump the kernel and remove
linux.fragment.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/udoo/genimage.cfg   | 48 +++++++++++++++++++++++++++++++++++++++++++++++
 board/udoo/linux.fragment |  1 +
 board/udoo/post-image.sh  | 14 ++++++++++++++
 board/udoo/readme.txt     | 17 +++++++++++++++++
 configs/mx6udoo_defconfig | 26 +++++++++++++++++++++++++
 5 files changed, 106 insertions(+)

diff --git a/board/udoo/genimage.cfg b/board/udoo/genimage.cfg
new file mode 100644
index 0000000..4361d54
--- /dev/null
+++ b/board/udoo/genimage.cfg
@@ -0,0 +1,48 @@
+# Minimal microSD card image for Udoo MX6Q/DL boards
+#
+# We mimic the .sdcard Freescale's image format for i.MX6:
+# * the microSD card must have 1 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 16 MB is containing zImage and dtbs,
+# * a single root filesystem partition is required (Ext4 in this case).
+#
+
+image boot.vfat {
+	vfat {
+		files = {
+			"imx6q-udoo.dtb",
+			"imx6dl-udoo.dtb",
+			"zImage"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition SPL {
+		in-partition-table = "no"
+		image = "SPL"
+		offset = 1K
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.img"
+		offset = 69K
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 16M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/udoo/linux.fragment b/board/udoo/linux.fragment
new file mode 100644
index 0000000..2acad15
--- /dev/null
+++ b/board/udoo/linux.fragment
@@ -0,0 +1 @@
+CONFIG_USB=n
diff --git a/board/udoo/post-image.sh b/board/udoo/post-image.sh
new file mode 100755
index 0000000..b4ac460
--- /dev/null
+++ b/board/udoo/post-image.sh
@@ -0,0 +1,14 @@
+#!/usr/bin/env bash
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+  --rootpath "${TARGET_DIR}" \
+  --tmppath "${GENIMAGE_TMP}" \
+  --inputpath "${BINARIES_DIR}" \
+  --outputpath "${BINARIES_DIR}" \
+  --config "${GENIMAGE_CFG}"
diff --git a/board/udoo/readme.txt b/board/udoo/readme.txt
new file mode 100644
index 0000000..acd05f6
--- /dev/null
+++ b/board/udoo/readme.txt
@@ -0,0 +1,17 @@
+Udoo MX6Q/DL board
+
+For information about MX6 Udoo boards:
+http://www.udoo.org/
+
+To build a minimal support for these boards:
+
+    $ make mx6udoo_defconfig
+    $ make
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a micro SD card:
+
+dd if=output/images/sdcard.img of=/dev/<your-microsd-device>
+
+For details about the medium image layout, see the definition in
+board/udoo/genimage.cfg.
diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
new file mode 100644
index 0000000..1ca2be4
--- /dev/null
+++ b/configs/mx6udoo_defconfig
@@ -0,0 +1,26 @@
+BR2_arm=y
+BR2_cortex_a9=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="udoo"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/udoo/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-udoo imx6dl-udoo"
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
