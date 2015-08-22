From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Sat, 22 Aug 2015 22:01:27 +0200
Subject: [Buildroot] [PATCH 3/4] board/raspberrypi: generate a medium image
In-Reply-To: <1440273688-92868-1-git-send-email-benoit@wsystem.com>
References: <1440273688-92868-1-git-send-email-benoit@wsystem.com>
Message-ID: <1440273688-92868-3-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Automate the generation of an sdcard.img medium image, ready to be
written to the SD card, while leaving the manual procedure available for
custom needs.

genimage is used, so no commands need to be run as root by Buildroot.

The layout of the generated image is adjusted automatically if an
initramfs is selected in the configuration.

The instructions in readme.txt are updated accordingly. The layout of
the generated image is described in this file.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 board/raspberrypi/genimage-persistent-rootfs.cfg | 22 +++++++
 board/raspberrypi/genimage-volatile-rootfs.cfg   | 17 +++++
 board/raspberrypi/genimage.sh                    | 15 +++++
 board/raspberrypi/readme.txt                     | 79 +++++++++++++++++-------
 configs/raspberrypi2_defconfig                   |  6 +-
 configs/raspberrypi_defconfig                    |  6 +-
 6 files changed, 121 insertions(+), 24 deletions(-)
 create mode 100644 board/raspberrypi/genimage-persistent-rootfs.cfg
 create mode 100644 board/raspberrypi/genimage-volatile-rootfs.cfg
 create mode 100755 board/raspberrypi/genimage.sh

diff --git a/board/raspberrypi/genimage-persistent-rootfs.cfg b/board/raspberrypi/genimage-persistent-rootfs.cfg
new file mode 100644
index 0000000..e519ca6
--- /dev/null
+++ b/board/raspberrypi/genimage-persistent-rootfs.cfg
@@ -0,0 +1,22 @@
+image boot.vfat {
+	vfat {
+		extraargs = "-F 16 -n BOOT"
+	}
+	size = 10M
+	mountpoint = "/"
+}
+
+image sdcard.img {
+	hdimage {}
+
+	partition boot {
+		partition-type = 0x0e
+		bootable = true
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/raspberrypi/genimage-volatile-rootfs.cfg b/board/raspberrypi/genimage-volatile-rootfs.cfg
new file mode 100644
index 0000000..488bd81
--- /dev/null
+++ b/board/raspberrypi/genimage-volatile-rootfs.cfg
@@ -0,0 +1,17 @@
+image boot.vfat {
+	vfat {
+		extraargs = "-F 32 -n BOOT"
+	}
+	size = 50M
+	mountpoint = "/"
+}
+
+image sdcard.img {
+	hdimage {}
+
+	partition boot {
+		partition-type = 0x0c
+		bootable = true
+		image = "boot.vfat"
+	}
+}
diff --git a/board/raspberrypi/genimage.sh b/board/raspberrypi/genimage.sh
new file mode 100755
index 0000000..663335c
--- /dev/null
+++ b/board/raspberrypi/genimage.sh
@@ -0,0 +1,15 @@
+#!/bin/bash -e
+
+BOARD_DIR="board/raspberrypi"
+RPI_FW_BIN_DIR="${BINARIES_DIR}/rpi-firmware"
+if grep "^BR2_TARGET_ROOTFS_INITRAMFS=y$" "${BR2_CONFIG}" &>/dev/null; then
+	GENIMAGE_CFG="${BOARD_DIR}/genimage-volatile-rootfs.cfg"
+else
+	GENIMAGE_CFG="${BOARD_DIR}/genimage-persistent-rootfs.cfg"
+fi
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -Rf "${GENIMAGE_TMP}"
+genimage --rootpath "${RPI_FW_BIN_DIR}" --tmppath "${GENIMAGE_TMP}" \
+	--inputpath "${BINARIES_DIR}" --outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 168fab5..d63e71e 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -33,7 +33,11 @@ And for model 2 B:
 
   $ make raspberrypi2_defconfig
 
-If you want to use a persistent rootfs, skip to "Build the rootfs", below.
+If you want to use a persistent rootfs, the generated ext4 rootfs image fits its
+contents with only a small (but sensible) margin of free space by default, so
+you might want to adjust "Filesystem images"/"ext2/3/4 root filesystem"/
+"size in blocks (leave at 0 for auto calculation)" depending on your needs, then
+skip to "Build the rootfs", below.
 
 For a volatile rootfs, you have to slightly adjust the configuration:
 
@@ -41,7 +45,7 @@ For a volatile rootfs, you have to slightly adjust the configuration:
     * Select "Filesystem images"
     * Select "initial RAM filesystem linked into linux kernel"
 
-You may also deselect "tar the root filesystem".
+You may also deselect "ext2/3/4 root filesystem" and "tar the root filesystem".
 
 Build the rootfs
 ----------------
@@ -61,38 +65,66 @@ Result of the build
 After building, you should obtain this tree:
 
     output/images/
-    +-- rootfs.cpio                 [0]
-    +-- rootfs.tar                  [1]
+    +-- boot.vfat                   [0]
+    +-- sdcard.img                  [1]
+    +-- rootfs.cpio                 [2]
+    +-- rootfs.ext2                 [3]
+    +-- rootfs.ext4 -> rootfs.ext2  [3]
+    +-- rootfs.tar                  [4]
     +-- rpi-firmware/
-    |   +-- bcm2708-rpi-b.dtb       [2]
-    |   +-- bcm2708-rpi-b-plus.dtb  [3]
-    |   +-- bcm2709-rpi-2-b.dtb     [4]
+    |   +-- bcm2708-rpi-b.dtb       [5]
+    |   +-- bcm2708-rpi-b-plus.dtb  [6]
+    |   +-- bcm2709-rpi-2-b.dtb     [7]
     |   +-- bootcode.bin
-    |   +-- cmdline.txt             [5]
+    |   +-- cmdline.txt             [8]
     |   +-- config.txt
     |   +-- fixup.dat
     |   +-- start.elf
-    |   `-- zImage                  [6]
-    `-- zImage                      [7]
+    |   `-- zImage                  [9]
+    `-- zImage                      [10]
 
-[0] rootfs.cpio will only be there if you selected a volatile rootfs.
-[1] Note for volatile: rootfs.tar will only be there if you kept
+[0] Image of the VFAT boot filesystem containing the files from
+    output/images/rpi-firmware.
+
+[1] Medium image ready to be written to your SD card.
+    For the volatile rootfs, it contains a single partition, filled with
+    boot.vfat.
+    For the persistent rootfs, it contains two partitions:
+    one filled with boot.vfat and one filled with rootfs.ext4.
+
+[2] rootfs.cpio will only be there if you selected a volatile rootfs.
+[3] Note for volatile: rootfs.ext* will only be there if you kept
+    "ext2/3/4 root filesystem" option selected in "Filesystem images".
+[4] Note for volatile: rootfs.tar will only be there if you kept
     "tar the root filesystem" option selected in "Filesystem images".
 
-[2] Required for models A and B, generated by raspberrypi_defconfig.
-[3] Required for models A+ and B+, generated by raspberrypi_defconfig.
-[4] Required for model 2, generated by raspberrypi2_defconfig.
+[5] Required for models A and B, generated by raspberrypi_defconfig.
+[6] Required for models A+ and B+, generated by raspberrypi_defconfig.
+[7] Required for model 2, generated by raspberrypi2_defconfig.
 
-[5] Generated by Buildroot, but optional for the firmware.
+[8] Generated by Buildroot, but optional for the firmware.
 
-[6] Kernel image marked for the firmware as supporting Device Tree.
+[9] Kernel image marked for the firmware as supporting Device Tree.
     Note: The kernel image file name is defined in config.txt like this:
     kernel=zImage
-[7] Original kernel image.
+[10] Original kernel image.
 
 Prepare your SD card
 ====================
 
+If you want to follow a manual procedure, then skip to "Manual procedure",
+below.
+
+Write (as root!) the generated medium image to your SD card (adjust 'sdX' to
+match your device):
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+
+Skip to "Finish", below.
+
+Manual procedure
+----------------
+
 For more information, visit
 http://elinux.org/RPi_Advanced_Setup#Advanced_SD_card_setup
 
@@ -119,7 +151,7 @@ output/images/rpi-firmware:
 
   $ cp output/images/rpi-firmware/* /mnt/mountpointboot
 
-If you use a volatile rootfs, skip to "Finish", below. For a persistent
+If you use a volatile rootfs, skip to "Unmount", below. For a persistent
 rootfs, there are further steps to do.
 
 Extract (as root!) the contents of the rootfs.tar archive into the second
@@ -127,15 +159,18 @@ partition you created above:
 
   $ sudo tar xf ./output/images/rootfs.tar -C /mnt/mountpointroot
 
-Finish
-======
+Unmount
+-------
 
 Unmount all the partitions:
 
   $ sudo umount /mnt/mountpointboot
   $ sudo umount /mnt/mountpointroot     (only for persistent rootfs)
 
-And eject your SD card from your computer SD card reader.
+Finish
+======
+
+Eject your SD card from your computer SD card reader.
 
 Insert the SD card into your Raspberry Pi, and power it up. Your new system
 should come up, now.
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index bfbf243..73dc290 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -27,4 +27,8 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2709-rpi-2-b"
 BR2_PACKAGE_RPI_FIRMWARE=y
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh board/raspberrypi2/genimage.sh"
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 5ded72f..58f4cab 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -26,4 +26,8 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b bcm2708-rpi-b-plus"
 BR2_PACKAGE_RPI_FIRMWARE=y
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh board/raspberrypi/genimage.sh"
-- 
2.1.4
