From: Ubaldo Porcheddu <ubaldo@eja.it>
Date: Sat, 23 Apr 2016 20:12:50 +0000
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3 with
	symlink
Message-ID: <1461442370-22393-1-git-send-email-ubaldo@eja.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ubaldo Porcheddu <ubaldo@eja.it>
---
 board/raspberrypi/genimage-raspberrypi3.cfg | 30 ++++++++++++++++++++++++
 board/raspberrypi/readme.txt                | 10 ++++++--
 board/raspberrypi3                          |  1 +
 configs/raspberrypi3_defconfig              | 36 +++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 board/raspberrypi/genimage-raspberrypi3.cfg
 create mode 120000 board/raspberrypi3
 create mode 100644 configs/raspberrypi3_defconfig

diff --git a/board/raspberrypi/genimage-raspberrypi3.cfg b/board/raspberrypi/genimage-raspberrypi3.cfg
new file mode 100644
index 0000000..7ba89c5
--- /dev/null
+++ b/board/raspberrypi/genimage-raspberrypi3.cfg
@@ -0,0 +1,30 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "bcm2710-rpi-3-b.dtb",
+      "rpi-firmware/bootcode.bin",
+      "rpi-firmware/cmdline.txt",
+      "rpi-firmware/config.txt",
+      "rpi-firmware/fixup.dat",
+      "rpi-firmware/start.elf",
+      "kernel-marked/zImage"
+    }
+  }
+  size = 32M
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
+  }
+}
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 896be2d..a170f8f 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -6,7 +6,8 @@ Intro
 These instructions apply to all models of the Raspberry Pi:
   - the original models A and B,
   - the "enhanced" models A+ and B+,
-  - the model B2 (aka Raspberry Pi 2).
+  - the model B2 (aka Raspberry Pi 2)
+  - the model B3 (aka Raspberry Pi 3).
 
 How to build it
 ===============
@@ -21,10 +22,14 @@ For models A, B, A+ or B+:
 
   $ make raspberrypi_defconfig
 
-And for model 2 B:
+For model 2 B:
 
   $ make raspberrypi2_defconfig
 
+For model 3 B:
+
+  $ make raspberrypi3_defconfig
+
 Build the rootfs
 ----------------
 
@@ -46,6 +51,7 @@ After building, you should obtain this tree:
     +-- bcm2708-rpi-b.dtb           [1]
     +-- bcm2708-rpi-b-plus.dtb      [1]
     +-- bcm2709-rpi-2-b.dtb         [1]
+    +-- bcm2710-rpi-3-b.dtb         [1]
     +-- boot.vfat
     +-- kernel-marked/zImage        [2]
     +-- rootfs.ext4
diff --git a/board/raspberrypi3 b/board/raspberrypi3
new file mode 120000
index 0000000..fcdafc8
--- /dev/null
+++ b/board/raspberrypi3
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
new file mode 100644
index 0000000..80ce908
--- /dev/null
+++ b/configs/raspberrypi3_defconfig
@@ -0,0 +1,36 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 4.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="20fe468af4bb40fec0f81753da4b20a8bfc259c9"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b"
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
-- 
1.9.1
