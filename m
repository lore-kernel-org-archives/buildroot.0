From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 22:38:19 +0200
Subject: [Buildroot] [git commit] configs/beaglebone: Use genimage to
	produce the SD card image
Message-ID: <20160606203833.4B6C781844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d0b7d3c27a6795667e1aeb18e9978e1a44361e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
[Thomas: added host dosfstools to the defconfig, needed to build a SD
card image with genimage when a FAT partition is listed in the
genimage configuration.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/beaglebone/post-image.sh | 14 ++++++++++++++
 board/beaglebone/readme.txt    | 30 +-----------------------------
 configs/beaglebone_defconfig   |  6 ++++++
 3 files changed, 21 insertions(+), 29 deletions(-)

diff --git a/board/beaglebone/post-image.sh b/board/beaglebone/post-image.sh
index 7441d07..ceeec68 100755
--- a/board/beaglebone/post-image.sh
+++ b/board/beaglebone/post-image.sh
@@ -2,5 +2,19 @@
 # post-image.sh for BeagleBone
 # 2014, Marcin Jabrzyk <marcin.jabrzyk@gmail.com>
 
+BOARD_DIR="$(dirname $0)"
+
 # copy the uEnv.txt to the output/images directory
 cp board/beaglebone/uEnv.txt $BINARIES_DIR/uEnv.txt
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
diff --git a/board/beaglebone/readme.txt b/board/beaglebone/readme.txt
index 089c49a..43ebe53 100644
--- a/board/beaglebone/readme.txt
+++ b/board/beaglebone/readme.txt
@@ -28,35 +28,7 @@ After building, you should get a tree like this:
   ????????? am335x-bone.dtb
   ????????? MLO
   ????????? rootfs.ext2
+  ????????? sdcard.img
   ????????? u-boot.img
   ????????? uEnv.txt
   ????????? zImage
-
-
-Prepare your SDCard
-===================
-
-You need to prepare first partition in fat32 and marked as bootable,
-and second where you will write rootfs.
-
-Copy the files to boot partition
-
-  $ cp MLO u-boot.img zImage uEnv.txt *.dtb /media/zzzzz
-
-where /media/zzzzz is the mount point.
-Then you need to write the rootfs image onto SDCard:
-
-  # dd if=rootfs.ext2 of=/dev/xxxxx
-
-where /dev/xxxxx is the second partition. Use:
-
-  # fdisk -l
-
-to check for correct one.
-
-Finish
-======
-
-Unmount all mounted SDCard partitions and insert the card to BeagleBone.
-Hold the "BOOT" button and apply power. Then release the "BOOT" button.
-The output is available on the serial console.
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index be803b9..99c845d 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -12,6 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
 # filesystem
 BR2_PACKAGE_AM33X_CM3=y
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Linux headers same as kernel, a 3.12 series
@@ -26,6 +27,11 @@ BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
 
+# host packages
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
