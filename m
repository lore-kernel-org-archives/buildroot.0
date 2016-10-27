From: Maik Scholz <Scholz.Maik@t-online.de>
Date: Thu, 27 Oct 2016 21:48:51 +0200
Subject: [Buildroot] PATCH Working config for Raspberry PI 3 in aarch64 mode
In-Reply-To: <a17fc93a-ff61-1093-b28e-45043a696a83@t-online.de>
References: <a17fc93a-ff61-1093-b28e-45043a696a83@t-online.de>
Message-ID: <01fe8921-f6b3-28e5-4593-7c198790e473@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test with:

patch -p1 <
../../buildroot_aarch64/outgoing/0001-rpi3-aarch64-defconfig.patch
make raspberrypi3_aarch64_defconfig
make
dd if=output/images/sdcard.img of=/dev/sdc bs=1024

 From 361ad2e2087c0a4675d8222604cb20b648611e2b Mon Sep 17 00:00:00 2001
From: Your Name <you@example.com>
Date: Thu, 27 Oct 2016 20:27:12 +0200
Subject: [PATCH 1/1] -

Signed-off-by: Your Name <you@example.com>
---
  .../raspberrypi/genimage-raspberrypi3-aarch64.cfg  | 31
++++++++++++++++++++++
  board/raspberrypi/post-image-aarch64.sh            | 23 ++++++++++++++++
  configs/raspberrypi3_aarch64_defconfig             | 20 ++++++++++++++
  package/rpi-firmware/Config.in                     |  2 +-
  package/rpi-firmware/rpi-firmware.hash             |  1 +
  package/rpi-firmware/rpi-firmware.mk               |  3 ++-
  6 files changed, 78 insertions(+), 2 deletions(-)
  create mode 100644 board/raspberrypi/genimage-raspberrypi3-aarch64.cfg
  create mode 100755 board/raspberrypi/post-image-aarch64.sh
  create mode 100644 configs/raspberrypi3_aarch64_defconfig

diff --git a/board/raspberrypi/genimage-raspberrypi3-aarch64.cfg
b/board/raspberrypi/genimage-raspberrypi3-aarch64.cfg
new file mode 100644
index 0000000..4168eb4
--- /dev/null
+++ b/board/raspberrypi/genimage-raspberrypi3-aarch64.cfg
@@ -0,0 +1,31 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "bcm2710-rpi-3-b.dtb",
+      "rpi-firmware/bootcode.bin",
+      "rpi-firmware/cmdline.txt",
+      "rpi-firmware/config.txt",
+      "rpi-firmware/fixup.dat",
+      "rpi-firmware/start.elf",
+      "rpi-firmware/overlays",
+      "kernel8.img"
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
diff --git a/board/raspberrypi/post-image-aarch64.sh
b/board/raspberrypi/post-image-aarch64.sh
new file mode 100755
index 0000000..efb6723
--- /dev/null
+++ b/board/raspberrypi/post-image-aarch64.sh
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+BOARD_NAME="$(basename ${BOARD_DIR})"
+GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}-aarch64.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+# copy Image to kernel8.img
+cp ${BINARIES_DIR}/Image ${BINARIES_DIR}/kernel8.img
+
+echo "add arm_64bit=1 in ${BINARIES_DIR}/rpi-firmware/config.txt"
+grep -v '^kernel=' output/images/rpi-firmware/config.txt | grep -v
'^arm_64bit=' | cat > ${BINARIES_DIR}/rpi-firmware/config.txt
+echo "arm_64bit=1" >> ${BINARIES_DIR}/rpi-firmware/config.txt
+
+genimage                           \
+    --rootpath "${TARGET_DIR}"     \
+    --tmppath "${GENIMAGE_TMP}"    \
+    --inputpath "${BINARIES_DIR}"  \
+    --outputpath "${BINARIES_DIR}" \
+    --config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/configs/raspberrypi3_aarch64_defconfig
b/configs/raspberrypi3_aarch64_defconfig
new file mode 100644
index 0000000..af273fe
--- /dev/null
+++ b/configs/raspberrypi3_aarch64_defconfig
@@ -0,0 +1,20 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image-aarch64.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4bed59909b28ded144d99a6aaa165ac7b89d3eb7"
+BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b"
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index c2983aa..7b37a30 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -1,6 +1,6 @@
  config BR2_PACKAGE_RPI_FIRMWARE
      bool "rpi-firmware"
-    depends on BR2_arm
+    depends on BR2_arm || BR2_aarch64
      help
        RaspberryPi Firmware
        Pre-compiled binaries of the current bootloader and GPU firmware
diff --git a/package/rpi-firmware/rpi-firmware.hash
b/package/rpi-firmware/rpi-firmware.hash
index 6dd2163..5758b28 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,3 @@
  # Locally computed
  sha256
f7b649ac837a4a9c12a8f96962da310ca4efd6658621d89286b421b8784a4980
rpi-firmware-ad8608c08b122b2c228dba0ff5070d6e9519faf5.tar.gz
+sha256 ca5f11da6cbf677a871c0282f3a0dddf2f2d9f22216c9660bcf4d7ce4d2a5376
rpi-firmware-ec5a517ed6051974a5a09f7b7811d21c443a7c74.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk
b/package/rpi-firmware/rpi-firmware.mk
index bf5c9dd..b460f75 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,8 @@
  #
  ################################################################################

-RPI_FIRMWARE_VERSION = ad8608c08b122b2c228dba0ff5070d6e9519faf5
+#RPI_FIRMWARE_VERSION = ad8608c08b122b2c228dba0ff5070d6e9519faf5
+RPI_FIRMWARE_VERSION = ec5a517ed6051974a5a09f7b7811d21c443a7c74
  RPI_FIRMWARE_SITE = $(call
github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
  RPI_FIRMWARE_LICENSE = BSD-3c
  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.7.4
