From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 17 Mar 2015 18:51:57 -0400
Subject: [Buildroot] [PATCH 3/5] board/raspberrypi: add a genimage config
In-Reply-To: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <1426632719-4807-4-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a "genimage.cfg" genimage config file for the Raspberry
Pi, to use with a persistent rootfs. This config applies to all models,
i.e. A, B, A+, B+, and B2. The final generated "sdcard.img" image is
ready to use and contains the setup explained in the board readme.txt
file: a bootable vfat partition with the rpi-firmware files, and an ext4
rootfs partition.

The defconfig and readme file have been slightly changed to add the
generation of the rootfs.ext4 filesystem.

Tested on a Raspberry Pi B.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 board/raspberrypi/genimage.cfg   | 32 ++++++++++++++++++++++++++++++++
 board/raspberrypi/readme.txt     |  9 +++++++--
 configs/raspberrypi2_defconfig   |  5 +++++
 configs/raspberrypi_defconfig    |  5 +++++
 configs/raspberrypi_dt_defconfig |  5 +++++
 5 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 board/raspberrypi/genimage.cfg

diff --git a/board/raspberrypi/genimage.cfg b/board/raspberrypi/genimage.cfg
new file mode 100644
index 0000000..c674cab
--- /dev/null
+++ b/board/raspberrypi/genimage.cfg
@@ -0,0 +1,32 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "rpi-firmware/bcm2708-rpi-b.dtb",
+      "rpi-firmware/bcm2708-rpi-b-plus.dtb",
+      "rpi-firmware/bcm2709-rpi-2-b.dtb",
+      "rpi-firmware/bootcode.bin",
+      "rpi-firmware/config.txt",
+      "rpi-firmware/fixup.dat",
+      "rpi-firmware/start.elf",
+      "zImage"
+    }
+  }
+  size = 10M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+    size = 512M
+  }
+}
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index b513ca3..439d2f0 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -16,6 +16,9 @@ Buildroot, you have to choose whether you will use:
 
 Also, a good source of information is http://elinux.org/R-Pi_Hub
 
+Note: Buildroot already prepared an "sdcard.img" image for a persistent
+rootfs, but this document explains how to do it manually.
+
 How to build it
 ===============
 
@@ -61,6 +64,7 @@ After building, you should obtain this tree:
 
     output/images/
     +-- rootfs.tar                              [0]
+    +-- rootfs.ext4                             [0]
     +-- rpi-firmware/
     |   +-- bcm2708-rpi-b.dtb
     |   +-- bcm2708-rpi-b-plus.dtb
@@ -71,8 +75,9 @@ After building, you should obtain this tree:
     |   `-- start.elf
     `-- zImage
 
-[0] Note for Volatile: rootfs.tar will only be there if you kept
-    "tar the root filesystem" option selected in "Filesystem images".
+[0] Note for Volatile: rootfs.tar and rootfs.ext4 will only be there if
+    you kept "tar the root filesystem" and "ext2/3/4 root filesystem"
+    options selected in "Filesystem images".
 
 Prepare you SDCard
 ==================
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 3543307..fe61d94 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -24,3 +24,8 @@ BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
+
+# Image generation (persistent)
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_MEDIA_GENIMAGE_CFG="board/raspberrypi2/genimage.cfg"
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 835657c..d36f3c0 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -20,3 +20,8 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="c256eb9968c8997dce47350d2075e42f1b3991d3"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
+
+# Image generation (persistent)
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_MEDIA_GENIMAGE_CFG="board/raspberrypi/genimage.cfg"
diff --git a/configs/raspberrypi_dt_defconfig b/configs/raspberrypi_dt_defconfig
index 0c203bf..effc5d8 100644
--- a/configs/raspberrypi_dt_defconfig
+++ b/configs/raspberrypi_dt_defconfig
@@ -21,3 +21,8 @@ BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
+
+# Image generation (persistent)
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_MEDIA_GENIMAGE_CFG="board/raspberrypi/genimage.cfg"
-- 
2.3.3
