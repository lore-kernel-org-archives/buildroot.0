From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 May 2016 15:50:02 +0200
Subject: [Buildroot] [PATCH 2/2] boards/raspberrypi0: new board
In-Reply-To: <cover.1462715338.git.yann.morin.1998@free.fr>
References: <cover.1462715338.git.yann.morin.1998@free.fr>
Message-ID: <6566e90641147f226d7432b25723574dd92d5b69.1462715338.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for the rpi-0, which is basically a rpi (model A+) in a
smaller form-factor.

This one does not have an ethernet port, so we just remove it from the
configuration (or we could use the existing rasbperrypi_defconfig and
suffer froma longer boot time because of the waiting for eth0).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 board/raspberrypi/genimage-raspberrypi0.cfg | 30 +++++++++++++++++++++++++
 board/raspberrypi0                          |  1 +
 configs/raspberrypi0_defconfig              | 34 +++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 board/raspberrypi/genimage-raspberrypi0.cfg
 create mode 120000 board/raspberrypi0
 create mode 100644 configs/raspberrypi0_defconfig

diff --git a/board/raspberrypi/genimage-raspberrypi0.cfg b/board/raspberrypi/genimage-raspberrypi0.cfg
new file mode 100644
index 0000000..a38840c
--- /dev/null
+++ b/board/raspberrypi/genimage-raspberrypi0.cfg
@@ -0,0 +1,30 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "bcm2708-rpi-b-plus.dtb",
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
diff --git a/board/raspberrypi0 b/board/raspberrypi0
new file mode 120000
index 0000000..fcdafc8
--- /dev/null
+++ b/board/raspberrypi0
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
new file mode 100644
index 0000000..cec88bd
--- /dev/null
+++ b/configs/raspberrypi0_defconfig
@@ -0,0 +1,34 @@
+BR2_arm=y
+BR2_arm1176jzf_s=y
+BR2_ARM_EABIHF=y
+
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="26f3b72a9c049be10e6af196252283e1f6ab9d1f"
+BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
+
+# Build the DTBs for A/B from the kernel sources: the zero is the same
+# as the A+ model, just in a different form-factor 
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b-plus"
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
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0/post-image.sh"
-- 
2.7.4
