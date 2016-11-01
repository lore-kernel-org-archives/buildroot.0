From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 15:02:24 +0100
Subject: [Buildroot] [git commit] configs/imx28evk: Generate the standard
	sdcard.img
Message-ID: <20161101140254.54B0A7FD35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=898538efef6b67791a1bad7eacc47e67bdb48e31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Generate the standard sdcard.img format that can be directly copied
to the SD card.

Remove the custom create-boot-sd.sh script and update the readme.txt
file accordingly.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
[Thomas: further tweaks to readme.txt.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/freescale/imx28evk/create-boot-sd.sh | 97 ------------------------------
 board/freescale/imx28evk/genimage.cfg      | 29 +++++++++
 board/freescale/imx28evk/post-image.sh     | 14 +++++
 board/freescale/imx28evk/readme.txt        |  7 +--
 configs/freescale_imx28evk_defconfig       | 10 +++
 5 files changed, 56 insertions(+), 101 deletions(-)

diff --git a/board/freescale/imx28evk/create-boot-sd.sh b/board/freescale/imx28evk/create-boot-sd.sh
deleted file mode 100755
index bce2212..0000000
--- a/board/freescale/imx28evk/create-boot-sd.sh
+++ /dev/null
@@ -1,97 +0,0 @@
-#!/bin/sh
-
-set -u
-set -e
-
-PROGNAME=$(basename $0)
-
-usage()
-{
-    echo "Create an SD card that boots on an i.MX28 EVK board."
-    echo
-    echo "Note: all data on the the card will be completely deleted!"
-    echo "Use with care!"
-    echo "Superuser permissions may be required to write to the device."
-    echo
-    echo "Usage: ${PROGNAME} <sd_block_device>"
-    echo "Arguments:"
-    echo "  <sd_block_device>     The device to be written to"
-    echo
-    echo "Example: ${PROGNAME} /dev/mmcblk0"
-    echo
-}
-
-if [ $# -ne 1 ]; then
-    usage
-    exit 1
-fi
-
-if [ $(id -u) -ne 0 ]; then
-    echo "${PROGNAME} must be run as root"
-    exit 1
-fi
-
-DEV=${1}
-
-# The partition name prefix depends on the device name:
-# - /dev/sde -> /dev/sde1
-# - /dev/mmcblk0 -> /dev/mmcblk0p1
-if echo ${DEV}|grep -q mmcblk ; then
-    PART="p"
-else
-    PART=""
-fi
-
-PART1=${DEV}${PART}1
-PART2=${DEV}${PART}2
-PART3=${DEV}${PART}3
-
-# Unmount the partitions if mounted
-umount ${PART1} || true
-umount ${PART2} || true
-umount ${PART3} || true
-
-# First, clear the card
-dd if=/dev/zero of=${DEV} bs=1M count=20
-
-sync
-
-# Partition the card.
-# SD layout for i.MX28 boot:
-# - Special partition type 53 at sector 2048, containing an SD-SB-encapsulated u-boot
-# - FAT partition containing zImage
-# - ext2/3 partition formatted as ext2 or ext3, containing the root filesystem.
-sfdisk --force -u S ${DEV} <<EOF
-2048,2000,53
-4048,16000,b
-20048,,L
-EOF
-
-sync
-
-# Copy the bootloader@offset 2048
-# (We need to skip the partition table in the .sd, too.)
-dd if=output/images/u-boot.sd of=${PART1} bs=1M
-
-# Prepare a temp dir for mounting partitions
-TMPDIR=$(mktemp -d)
- 
-# FAT partition: kernel
-mkfs.vfat ${PART2}
-mount ${PART2} ${TMPDIR}
-cp output/images/*Image ${TMPDIR}/
-cp output/images/*.dtb  ${TMPDIR}/ || true
-sync
-umount ${TMPDIR}
-
-# ext2 partition: root filesystem
-mkfs.ext2 ${PART3}
-mount ${PART3} ${TMPDIR}
-tar -C ${TMPDIR}/ -xf output/images/rootfs.tar
-sync
-umount ${TMPDIR}
-
-# Cleanup
-rmdir ${TMPDIR}
-sync
-echo Done
diff --git a/board/freescale/imx28evk/genimage.cfg b/board/freescale/imx28evk/genimage.cfg
new file mode 100644
index 0000000..4df432f
--- /dev/null
+++ b/board/freescale/imx28evk/genimage.cfg
@@ -0,0 +1,29 @@
+image kernel.vfat {
+	vfat {
+		files = {
+		"zImage", "imx28-evk.dtb"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+	partition boot {
+		partition-type = 0x53
+		image = "u-boot.sd"
+		offset = 1M
+		size = 16M
+	}
+
+	partition kernel {
+		partition-type = 0xC
+		image = "kernel.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/freescale/imx28evk/post-image.sh b/board/freescale/imx28evk/post-image.sh
new file mode 100755
index 0000000..b4ac460
--- /dev/null
+++ b/board/freescale/imx28evk/post-image.sh
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
diff --git a/board/freescale/imx28evk/readme.txt b/board/freescale/imx28evk/readme.txt
index cbf6aae..2920cb0 100644
--- a/board/freescale/imx28evk/readme.txt
+++ b/board/freescale/imx28evk/readme.txt
@@ -32,12 +32,11 @@ To determine the device associated to the SD card have a look in the
 
   cat /proc/partitions
 
-Run the following script as root on your SD card. This will partition the card
-and copy the bootloader, kernel and root filesystem as needed.
+Then, run the following command as root:
 
-*** WARNING! The script will destroy all the card content. Use with care! ***
+*** WARNING! The command will destroy all the card content. Use with care! ***
 
-  ./board/freescale/imx28evk/create-boot-sd.sh <your-sd-device>
+ sudo dd if=output/images/sdcard.img of=/dev/<your-microsd-device>
 
 Boot the i.MX28 EVK board
 =========================
diff --git a/configs/freescale_imx28evk_defconfig b/configs/freescale_imx28evk_defconfig
index a638462..790c338 100644
--- a/configs/freescale_imx28evk_defconfig
+++ b/configs/freescale_imx28evk_defconfig
@@ -22,3 +22,13 @@ BR2_TARGET_UBOOT_BOARDNAME="mx28evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_FORMAT_SD=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT4=y
+
+# To generate SD Image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imx28evk/post-image.sh"
