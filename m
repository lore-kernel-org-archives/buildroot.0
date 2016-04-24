From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 24 Apr 2016 11:18:47 +0200
Subject: [Buildroot] [PATCH v5 5/5] beaglebone: adds barebox bootloader
	defconfig
In-Reply-To: <cover.1461489060.git.pieter@boesman.nl>
References: <cover.1461489060.git.pieter@boesman.nl>
Message-ID: <e985e29f4fde53336379f3e8902dcff2f5d1f543.1461489060.git.pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Builds the barebox MLO and bootloader.
* Generates a bootable SD card image with boot and rootfs partitions.
* Barebox integrates a perfectly good device-tree for the bbb, so no dtb is
  being generated with the kernel.

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 board/beaglebone/barebox/barebox.env/boot/sd      | 11 ++++++
 board/beaglebone/barebox/barebox.env/config-board |  4 +++
 board/beaglebone/barebox/genimage.cfg             | 32 +++++++++++++++++
 board/beaglebone/barebox/post-image.sh            | 17 +++++++++
 configs/beaglebone_barebox_defconfig              | 43 +++++++++++++++++++++++
 5 files changed, 107 insertions(+)
 create mode 100644 board/beaglebone/barebox/barebox.env/boot/sd
 create mode 100644 board/beaglebone/barebox/barebox.env/config-board
 create mode 100644 board/beaglebone/barebox/genimage.cfg
 create mode 100755 board/beaglebone/barebox/post-image.sh
 create mode 100644 configs/beaglebone_barebox_defconfig

diff --git a/board/beaglebone/barebox/barebox.env/boot/sd b/board/beaglebone/barebox/barebox.env/boot/sd
new file mode 100644
index 0000000..0cd1be6
--- /dev/null
+++ b/board/beaglebone/barebox/barebox.env/boot/sd
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+global.bootm.image=/boot/zImage
+
+# Default to using the barebox built-in dtb
+# global.bootm.oftree=/boot/oftree
+
+# No initrd
+# global.bootm.initrd=<path to initrd>
+
+global.linux.bootargs.dyn.root="root=/dev/mmcblk0p2 rootfstype=ext4 rootwait"
diff --git a/board/beaglebone/barebox/barebox.env/config-board b/board/beaglebone/barebox/barebox.env/config-board
new file mode 100644
index 0000000..cd7b26d
--- /dev/null
+++ b/board/beaglebone/barebox/barebox.env/config-board
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+global.boot.default=sd
+
diff --git a/board/beaglebone/barebox/genimage.cfg b/board/beaglebone/barebox/genimage.cfg
new file mode 100644
index 0000000..a058ce9
--- /dev/null
+++ b/board/beaglebone/barebox/genimage.cfg
@@ -0,0 +1,32 @@
+image boot.vfat {
+	vfat {
+		file MLO {
+			image = "barebox-am33xx-beaglebone-mlo.img"
+		}
+		file barebox.bin {
+			image = "barebox-am33xx-beaglebone.img"
+		}
+		files = {
+			"barebox.env",
+			"zImage"
+		}
+	}
+	size = 32M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		in-partition-table = "yes"
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/beaglebone/barebox/post-image.sh b/board/beaglebone/barebox/post-image.sh
new file mode 100755
index 0000000..149ffb1
--- /dev/null
+++ b/board/beaglebone/barebox/post-image.sh
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+	--rootpath "${TARGET_DIR}" \
+	--tmppath "${GENIMAGE_TMP}" \
+	--inputpath "${BINARIES_DIR}" \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
+
diff --git a/configs/beaglebone_barebox_defconfig b/configs/beaglebone_barebox_defconfig
new file mode 100644
index 0000000..ef86e89
--- /dev/null
+++ b/configs/beaglebone_barebox_defconfig
@@ -0,0 +1,43 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_ARM_EABIHF=y
+
+# system
+BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
+BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
+
+# filesystem
+BR2_PACKAGE_AM33X_CM3=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+
+# bootloader
+BR2_TARGET_BAREBOX=y
+BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="am335x"
+BR2_TARGET_BAREBOX_IMAGE_FILE="images/barebox-am33xx-beaglebone.img"
+BR2_TARGET_BAREBOX_CUSTOM_ENV=y
+BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH="board/beaglebone/barebox/barebox.env"
+BR2_TARGET_BAREBOX_2=y
+BR2_TARGET_BAREBOX_2_BOARD_DEFCONFIG="am335x_mlo"
+BR2_TARGET_BAREBOX_2_IMAGE_FILE="images/barebox-am33xx-beaglebone-mlo.img"
+
+# use board/beaglebone/genimage.cfg to generate boot.vfat and sdcard.img
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/barebox/post-image.sh"
+BR2_PACKAGE_HOST_GENIMAGE=y
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.2"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
+BR2_LINUX_KERNEL_ZIMAGE=y
+
+# use the barebox built-in dtb
+# BR2_LINUX_KERNEL_DTS_SUPPORT is not set
-- 
2.5.0
