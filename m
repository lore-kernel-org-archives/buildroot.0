From: Abhimanyu Vishwakarma <abhimanyu.v@gmail.com>
Date: Tue,  4 Apr 2017 17:18:18 +0530
Subject: [Buildroot] [PATCH v6] Add defconfig for MIPS Creator ci40
Message-ID: <1491306498-18165-1-git-send-email-abhimanyu.v@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>

Add post-image script to generate sdcard.img for
preparing sdcard/usb device.

Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
---
 Changes v1->v2
  - No change
 Changes v2->v3 (Suggested by Arnout)
  - Remove uImage and add fitImage generation
  - Tidy readme.txt
  - Tidy ci40_defconfig, remove custom toolchain and add wifi helper packages
  Some changes are not done:
  - Using git-helper:
    - Custom kernel doesnt provide tar file, so it didnt work for me
 Changes v3->v4 (Suggested by Arnout)
  - Use github helper for getting kernel/u-boot
  - rename fitImage.its -> fitImage.its.in to reflect as template file,
    remove hardcoded dtb filename
  - Find dtb file in output/images directory and use first dtb in fitImage
  - Remove image size from genimage.cfg
  - Tidy readme.txt and add section to explain how to stop u-boot autoboot,
    how to make it persistent, and other grammar
 Changes v4->v5 (Suggested by Thomas)
  - Use fixed kernel entry addr
  - Generate vmlinux.bin.gz from generate vmlinux.bin
  - Remove generating uImage (not required for anything now)
 Changes v5->v6
  - Use kernel generate fitimage
  - bump up u-boot version
  - Change emailid from imgtec.com -> personal id

 board/ci40/genimage.cfg  | 12 +++++++++
 board/ci40/post-build.sh |  6 +++++
 board/ci40/post-image.sh | 15 +++++++++++
 board/ci40/readme.txt    | 70 ++++++++++++++++++++++++++++++++++++++++++++++++
 configs/ci40_defconfig   | 49 +++++++++++++++++++++++++++++++++
 5 files changed, 152 insertions(+)
 create mode 100644 board/ci40/genimage.cfg
 create mode 100755 board/ci40/post-build.sh
 create mode 100755 board/ci40/post-image.sh
 create mode 100644 board/ci40/readme.txt
 create mode 100644 configs/ci40_defconfig

diff --git a/board/ci40/genimage.cfg b/board/ci40/genimage.cfg
new file mode 100644
index 0000000..0ffc91c
--- /dev/null
+++ b/board/ci40/genimage.cfg
@@ -0,0 +1,12 @@
+# Minimal SD card image
+#
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+  }
+}
diff --git a/board/ci40/post-build.sh b/board/ci40/post-build.sh
new file mode 100755
index 0000000..0cd06b7
--- /dev/null
+++ b/board/ci40/post-build.sh
@@ -0,0 +1,6 @@
+#!/bin/bash
+
+FITIMAGE=$BINARIES_DIR/vmlinux.gz.itb
+
+# Copy to target
+cp -a $FITIMAGE $TARGET_DIR/fitImage
diff --git a/board/ci40/post-image.sh b/board/ci40/post-image.sh
new file mode 100755
index 0000000..18e76aa
--- /dev/null
+++ b/board/ci40/post-image.sh
@@ -0,0 +1,15 @@
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
+
diff --git a/board/ci40/readme.txt b/board/ci40/readme.txt
new file mode 100644
index 0000000..2fde2b8
--- /dev/null
+++ b/board/ci40/readme.txt
@@ -0,0 +1,70 @@
+*********************
+* MIPS Creator CI40 *
+*********************
+
+The 'ci40_defconfig' will create a root filesystem and a fitImage
+under the 'output/images/' directory. This document explains how
+to use them in order to run Buildroot in the MIPS Creator CI40 board.
+
+Prepare USB/MMC for boot
+------------------------
+It can be done 2 ways:
+
+1. Using "sdcard.img" file created in output/images folder
+
+Use following command to write image to bootable device
+
+# dd if=./output/images/sdcard.img of=/dev/<your-microsd-or-usb-device>
+
+2. Manually preparing USB/MMC device
+
+Extract the generated root filesystem "rootfs.tar" into a ext4 formatted
+USB drive or SD-Card.
+
+Booting from USB/MMC
+--------------------
+The boot loader is already present in NOR flash. To boot your newly generated
+Linux and root filesystem, you need to interrupt U-Boot autoboot. Current U-Boot
+is configured with 2 seconds of boot-delay, after expiry of this boot-delay
+timeout U-Boot start booting default image. To interrupt autoboot, press any
+key before the boot-delay time expires, U-Boot will stops the autoboot process
+and gives a U-Boot prompt. You can now boot to your preferred boot method as
+describe below:
+
+From USB
+  pistachio # run usbboot
+
+From SD-Card
+  pistachio # run mmcboot
+
+Booting from network (nfsboot)
+------------------------------
+Prepare nfs root (See Buildroot manual) and extract rootfs.tar file into it.
+
+  pistachio # setenv serverip <server-ip-address>
+  pistachio # setenv rootpath <nfs root path>
+  pistachio # run netboot
+
+Persistent boot command
+-----------------------
+To boot automatically to your preferred boot method, use following command to
+make it persistent, for example to automatically boot to usb:
+
+  pistachio # setenv bootcmd run usbboot
+  pistachio # saveenv
+
+Flash new bootloader
+--------------------
+After booting with above method. Copy file u-boot-pistachio_marduk-2015.10-v1.0.4.img
+to /tmp. Use following command to flash new bootloader:
+
+# flashcp -v /tmp/u-boot-pistachio_marduk-2015.10-v1.0.4.img /dev/mtd0
+
+Online docs
+-----------
+Mostly for OpenWRT but it is applicable to Buildroot
+https://docs.creatordev.io/ci40/guides/openwrt-platform/#overview
+
+Prebuilt uboot
+--------------
+http://downloads.creatordev.io/?q=u-boot/
diff --git a/configs/ci40_defconfig b/configs/ci40_defconfig
new file mode 100644
index 0000000..7d21f87
--- /dev/null
+++ b/configs/ci40_defconfig
@@ -0,0 +1,49 @@
+# architecture
+BR2_mipsel=y
+BR2_mips_32r2=y
+
+# linux header same as custom kernel ie 4.4.x
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,CreatorDev,linux,openwrt-4.4.14/linux-openwrt-4.4.14.tar.gz)"
+BR2_LINUX_KERNEL_DEFCONFIG="pistachio"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="vmlinux.gz.itb"
+BR2_LINUX_KERNEL_IMAGE_NAME="vmlinux.gz.itb"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="img/pistachio_marduk"
+
+# bootloader flash support
+BR2_PACKAGE_MTD=y
+
+# wireless firmware
+BR2_PACKAGE_UCCP420WLAN=y
+
+# wireless package
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="pistachio_marduk"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,CreatorDev,u-boot,v1.0.5/u-boot-CreatorDev-v1.0.5.tar.gz)"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-pistachio_marduk-2015.10-v1.0.5.img"
+
+# fitimage / image generation
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ci40/post-build.sh"
+
+# image generation
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ci40/post-image.sh"
+
-- 
2.7.4
