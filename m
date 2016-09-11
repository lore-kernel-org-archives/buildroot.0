From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 23:27:37 +0200
Subject: [Buildroot] [git commit] board/freescale: use the common genimage
	template
Message-ID: <20160911212807.185F38042D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e768aa1dc6457752ab5e41c612feb8d62d0e11b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The boards imx6dlsabreauto, imx6dlsabresd, imx6qsabreauto, imx6qsabresd,
imx6sxsabresd were referring to board/freescale/create-boot-sd.sh for
the sdcard image generation.

This commit:
* Removes board/freescale/create-boot-sd.sh
* Uses the common Freescale genimage template instead.
  The offset of the first partition was 1MB in the script and is
  modified to 8MB in the template.
* Fixes the readme.txt file accordingly

Signed-off-by: Georges Savoundararadj <savoundg@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/freescale/create-boot-sd.sh           | 93 -----------------------------
 board/freescale/imx6sabre/readme.txt        | 10 +++-
 configs/freescale_imx6dlsabreauto_defconfig |  6 ++
 configs/freescale_imx6dlsabresd_defconfig   |  6 ++
 configs/freescale_imx6qsabreauto_defconfig  |  6 ++
 configs/freescale_imx6qsabresd_defconfig    |  6 ++
 configs/freescale_imx6sxsabresd_defconfig   |  6 ++
 7 files changed, 37 insertions(+), 96 deletions(-)

diff --git a/board/freescale/create-boot-sd.sh b/board/freescale/create-boot-sd.sh
deleted file mode 100755
index af45115..0000000
--- a/board/freescale/create-boot-sd.sh
+++ /dev/null
@@ -1,93 +0,0 @@
-#!/bin/sh
-
-set -u
-set -e
-
-PROGNAME=$(basename $0)
-
-usage()
-{
-    echo "Create an SD card that boots on an i.MX53/6 board."
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
-
-# Unmount the partitions if mounted
-umount ${PART1} || true
-umount ${PART2} || true
-
-# First, clear the card
-dd if=/dev/zero of=${DEV} bs=1M count=20
-
-sync
-
-# Partition the card.
-# SD layout for i.MX6 boot:
-# - Bootloader at offset 1024
-# - FAT partition starting at 1MB offset, containing uImage and *.dtb
-# - ext2/3 partition formatted as ext2 or ext3, containing the root filesystem.
-sfdisk ${DEV} <<EOF
-32,480,b
-512,,L
-EOF
-
-sync
-
-# Copy the bootloader@offset 1024
-dd if=output/images/u-boot.imx of=${DEV} obs=512 seek=2
-
-# Prepare a temp dir for mounting partitions
-TMPDIR=$(mktemp -d)
-
-# FAT partition: kernel and DTBs
-mkfs.vfat ${PART1}
-mount ${PART1} ${TMPDIR}
-cp output/images/*Image ${TMPDIR}/
-cp output/images/*.dtb  ${TMPDIR}/ || true
-sync
-umount ${TMPDIR}
-
-# ext2 partition: root filesystem
-mkfs.ext2 ${PART2}
-mount ${PART2} ${TMPDIR}
-tar -C ${TMPDIR}/ -xf output/images/rootfs.tar
-sync
-umount ${TMPDIR}
-
-# Cleanup
-rmdir ${TMPDIR}
-sync
-echo Done
diff --git a/board/freescale/imx6sabre/readme.txt b/board/freescale/imx6sabre/readme.txt
index 6c44e22..e409d8f 100644
--- a/board/freescale/imx6sabre/readme.txt
+++ b/board/freescale/imx6sabre/readme.txt
@@ -62,12 +62,16 @@ To determine the device associated to the SD card have a look in the
 
   cat /proc/partitions
 
-Run the following script as root on your SD card. This will partition the card
-and copy the bootloader, kernel, DTBs and root filesystem as needed.
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a microSD card. Launch the following
+command as root:
+
+  dd if=./output/images/sdcard.img of=/dev/<your-microsd-device>
 
 *** WARNING! The script will destroy all the card content. Use with care! ***
 
-  ./board/freescale/create-boot-sd.sh <your-sd-device>
+For details about the medium image layout, see the definition in
+board/freescale/common/genimage.cfg.template.
 
 Boot the SABRE board
 ====================
diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index a58ab5d..5a8d4ce 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -23,8 +23,14 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabreauto"
 
 # filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 
+# required tools to create the microSD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabreauto"
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index ecb5f8b..c01bf7a 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -23,8 +23,14 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabresd"
 
 # filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 
+# required tools to create the microSD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabresd"
diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 6ed33ee..b9a9446 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -23,8 +23,14 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto"
 
 # filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 
+# required tools to create the microSD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index bd01f05..b7419b0 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -23,8 +23,14 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
 
 # filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 
+# required tools to create the microSD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
index 2519f49..9f8df63 100644
--- a/configs/freescale_imx6sxsabresd_defconfig
+++ b/configs/freescale_imx6sxsabresd_defconfig
@@ -21,8 +21,14 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb"
 
 # filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 
+# required tools to create the microSD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
