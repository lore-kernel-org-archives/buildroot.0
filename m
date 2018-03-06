From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Mar 2018 11:58:57 +0100
Subject: [Buildroot] [git commit] configs/ci40: remove defconfig
Message-ID: <20180306110131.6E47B82257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49d2638276e2d464e016effa1f95a15545cf9208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the original submitter of this defconfig:

"""
I no longer have access to ci40 board. It would be difficult for me to
maintain it.
"""

And this defconfig currently fails to build with gcc 6.x. Therefore,
drop it.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306806

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml           |  1 -
 board/ci40/genimage.cfg  | 12 ---------
 board/ci40/post-build.sh |  4 ---
 board/ci40/readme.txt    | 65 ------------------------------------------------
 configs/ci40_defconfig   | 48 -----------------------------------
 5 files changed, 130 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 779565956f..f52487b35c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -104,7 +104,6 @@ beaglebone_defconfig: *defconfig
 beaglebone_qt5_defconfig: *defconfig
 chromebook_snow_defconfig: *defconfig
 ci20_defconfig: *defconfig
-ci40_defconfig: *defconfig
 csky_gx6605s_defconfig: *defconfig
 cubieboard2_defconfig: *defconfig
 engicam_imx6qdl_icore_defconfig: *defconfig
diff --git a/board/ci40/genimage.cfg b/board/ci40/genimage.cfg
deleted file mode 100644
index 0ffc91ce87..0000000000
--- a/board/ci40/genimage.cfg
+++ /dev/null
@@ -1,12 +0,0 @@
-# Minimal SD card image
-#
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
-}
diff --git a/board/ci40/post-build.sh b/board/ci40/post-build.sh
deleted file mode 100755
index 9af74c7a7e..0000000000
--- a/board/ci40/post-build.sh
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-
-# Copy to target
-cp ${BINARIES_DIR}/vmlinux.gz.itb ${TARGET_DIR}/fitImage
diff --git a/board/ci40/readme.txt b/board/ci40/readme.txt
deleted file mode 100644
index ba1eb93883..0000000000
--- a/board/ci40/readme.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-*********************
-* MIPS Creator CI40 *
-*********************
-
-This document details how to build and run a Buildroot system on the
-MIPS Creator CI40 platform. For more details about the CI40, see
-https://creatordev.io/ci40-iot-hub.html.
-
-How to build
-------------
-
-$ make ci40_defconfig
-$ make
-
-Prepare USB/MMC for boot
-------------------------
-
-On successful build, "sdcard.img" file will be created in 'output/images'
-folder.
-
-Use following command to write image to bootable device
-
-$ sudo dd if=./output/images/sdcard.img of=/dev/<your-microsd-or-usb-device>
-
-Booting from USB/MMC
---------------------
-
-The boot loader is already present in NOR flash. To boot your newly generated
-Linux and root filesystem, you need to interrupt U-Boot autoboot. Current
-U-Boot is configured with 2 seconds of boot-delay, after expiry of this
-boot-delay timeout U-Boot starts booting the default image. To interrupt
-autoboot, press any key before the boot-delay time expires, U-Boot will
-stop the autoboot process and give a U-Boot prompt. You can now boot to
-your preferred boot method as describe below:
-
-From USB
-  pistachio # run usbboot
-
-From SD-Card
-  pistachio # run mmcboot
-
-Persistent boot command
------------------------
-
-To boot automatically to your preferred boot method, use following command to
-make it persistent, for example to automatically boot to usb:
-
-  pistachio # setenv bootcmd run usbboot
-  pistachio # saveenv
-
-Flash new bootloader
---------------------
-
-The bootloader image will be available in the 'output/images' folder. To flash
-the new bootloader, copy it to the device and use the following command on the
-device:
-
-# flashcp -v u-boot-pistachio_marduk-<version>.img /dev/mtd0
-
-Online docs
------------
-
-Mostly for OpenWRT but it is applicable to Buildroot
-https://docs.creatordev.io/ci40/guides/openwrt-platform/#overview
-
diff --git a/configs/ci40_defconfig b/configs/ci40_defconfig
deleted file mode 100644
index 2ea3afe47d..0000000000
--- a/configs/ci40_defconfig
+++ /dev/null
@@ -1,48 +0,0 @@
-# architecture
-BR2_mipsel=y
-BR2_mips_32r2=y
-
-# linux header same as custom kernel ie 4.4.x
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
-
-# kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,CreatorDev,linux,openwrt-4.4.14)/linux-openwrt-4.4.14.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="pistachio"
-BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-# vmlinux.gz.itb image includes img/pistachio_marduk device tree
-BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="vmlinux.gz.itb"
-
-# bootloader flash support
-BR2_PACKAGE_MTD=y
-
-# wireless firmware
-BR2_PACKAGE_UCCP420WLAN=y
-
-# wireless package
-BR2_PACKAGE_WIRELESS_TOOLS=y
-BR2_PACKAGE_WPA_SUPPLICANT=y
-BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
-
-# bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pistachio_marduk"
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,CreatorDev,u-boot,v1.0.5)/u-boot-CreatorDev-v1.0.5.tar.gz"
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-pistachio_marduk-2015.10-v1.0.5.img"
-
-# fitimage / image generation
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/ci40/post-build.sh"
-
-# image generation
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ci40/genimage.cfg"
