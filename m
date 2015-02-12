From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Thu, 12 Feb 2015 17:33:47 -0500
Subject: [Buildroot] [RFC 2/2] boards/raspberrypi: add a sample genimage
	config
In-Reply-To: <1423780427-7493-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1423780427-7493-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <1423780427-7493-3-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a "persistent.cfg" genimage config file for the
Raspberry Pi, to use with a persistent rootfs. The final generated
"sdcard.img" image is ready to use and contains the setup explained in
the board readme.txt file: a bootable vfat partition with the
rpi-firmware files, and an ext4 rootfs partition.

The defconfig and readme file have been slightly changed to add the
generation of the rootfs.ext4 filesystem.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 board/raspberrypi/genimage/persistent.cfg | 29 +++++++++++++++++++++++++++++
 board/raspberrypi/readme.txt              |  9 +++++++--
 configs/raspberrypi_defconfig             |  4 ++++
 3 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 board/raspberrypi/genimage/persistent.cfg

diff --git a/board/raspberrypi/genimage/persistent.cfg b/board/raspberrypi/genimage/persistent.cfg
new file mode 100644
index 0000000..9919cc5
--- /dev/null
+++ b/board/raspberrypi/genimage/persistent.cfg
@@ -0,0 +1,29 @@
+image boot.vfat {
+  vfat {
+    files = {
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
index ead9227..832c746 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -11,6 +11,9 @@ Buildroot, you have to choose whether you will use:
 
 Also, a good source of information is http://elinux.org/R-Pi_Hub
 
+Note: Buildroot already prepared an "sdcard.img" image for a persistent
+rootfs, but this document explains how to do it manually.
+
 How to build it
 ===============
 
@@ -56,6 +59,7 @@ After building, you should obtain this tree:
 
     output/images/
     +-- rootfs.tar                              [0]
+    +-- rootfs.ext4                             [0]
     +-- rpi-firmware/
     |   +-- bcm2708-rpi-b.dtb                   [1]
     |   +-- bcm2708-rpi-b-plus.dtb              [1]
@@ -65,8 +69,9 @@ After building, you should obtain this tree:
     |   `-- start.elf
     `-- zImage
 
-[0] Note for Volatile: rootfs.tar will only be there if you kept
-    "tar the root filesystem" option selected in "Filesystem images".
+[0] Note for Volatile: rootfs.tar and rootfs.ext4 will only be there if
+    you kept "tar the root filesystem" and "ext2/3/4 root filesystem"
+    options selected in "Filesystem images".
 
 [1] The DTBs (Device Tree Blobs) will only be present if you setup
     Buildroot to install the DTBs from the rpi-firmware package, and
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 835657c..26ebfb4 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -20,3 +20,7 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="c256eb9968c8997dce47350d2075e42f1b3991d3"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
+
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_ROOTFS_GENIMAGE_CFG="board/raspberrypi/genimage/persistent.cfg"
-- 
2.3.0
