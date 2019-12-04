From: Arthur Courtel <arthur.courtel@smile.fr>
Date: Wed,  4 Dec 2019 11:54:30 +0100
Subject: [Buildroot] [PATCHv3 2/2] configs: add raspberrypi4 64bits defconfig
In-Reply-To: <20191204105430.943303-1-arthur.courtel@smile.fr>
References: <20191204105430.943303-1-arthur.courtel@smile.fr>
Message-ID: <20191204105430.943303-2-arthur.courtel@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This configuration builds a 64bit image for RaspberryPi 4.

Signed-off-by: Arthur Courtel <arthur.courtel@smile.fr>
---
V2->V3:
Add DTB overlay support for RPI4 and FPU_VFPV4 (suggested by Peter)

V1->V2:
Divide patch to replace deprecated overlay option in rpi3 defconfigs
---
 .../raspberrypi/genimage-raspberrypi4-64.cfg  | 30 ++++++++++++++
 board/raspberrypi4-64                         |  1 +
 configs/raspberrypi4_64_defconfig             | 39 +++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 board/raspberrypi/genimage-raspberrypi4-64.cfg
 create mode 120000 board/raspberrypi4-64
 create mode 100644 configs/raspberrypi4_64_defconfig

diff --git a/board/raspberrypi/genimage-raspberrypi4-64.cfg b/board/raspberrypi/genimage-raspberrypi4-64.cfg
new file mode 100644
index 0000000000..3c480e98f0
--- /dev/null
+++ b/board/raspberrypi/genimage-raspberrypi4-64.cfg
@@ -0,0 +1,30 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "bcm2711-rpi-4-b.dtb",
+      "rpi-firmware/cmdline.txt",
+      "rpi-firmware/config.txt",
+      "rpi-firmware/fixup4.dat",
+      "rpi-firmware/start4.elf",
+      "rpi-firmware/overlays",
+      "Image"
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
diff --git a/board/raspberrypi4-64 b/board/raspberrypi4-64
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypi4-64
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
new file mode 100644
index 0000000000..f013c4382c
--- /dev/null
+++ b/configs/raspberrypi4_64_defconfig
@@ -0,0 +1,39 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_ARM_FPU_VFPV4=y
+
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
+BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
+
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
-- 
2.23.0
