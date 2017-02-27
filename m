From: Abhimanyu V <abhimanyu.vishwakarma@imgtec.com>
Date: Mon, 27 Feb 2017 19:08:01 +0530
Subject: [Buildroot] [PATCH v3 3/3] Add defconfig for MIPS Creator ci40
In-Reply-To: <1488202681-9744-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
References: <1488202681-9744-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
Message-ID: <1488202681-9744-3-git-send-email-abhimanyu.vishwakarma@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>

Also add post-build script to create fitImage which is used
by u-boot to boot the device. It also add post-image script
to generate sdcard.img for preparing sdcard/usb device

Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Reviewed-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
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

 board/ci40/create_fitImage.sh | 29 ++++++++++++++++++++++
 board/ci40/fitImage.its       | 52 +++++++++++++++++++++++++++++++++++++++
 board/ci40/genimage.cfg       | 13 ++++++++++
 board/ci40/post-image.sh      | 15 ++++++++++++
 board/ci40/readme.txt         | 57 +++++++++++++++++++++++++++++++++++++++++++
 configs/ci40_defconfig        | 47 +++++++++++++++++++++++++++++++++++
 6 files changed, 213 insertions(+)
 create mode 100755 board/ci40/create_fitImage.sh
 create mode 100644 board/ci40/fitImage.its
 create mode 100644 board/ci40/genimage.cfg
 create mode 100755 board/ci40/post-image.sh
 create mode 100644 board/ci40/readme.txt
 create mode 100644 configs/ci40_defconfig

diff --git a/board/ci40/create_fitImage.sh b/board/ci40/create_fitImage.sh
new file mode 100755
index 0000000..6ad9b3a
--- /dev/null
+++ b/board/ci40/create_fitImage.sh
@@ -0,0 +1,29 @@
+#!/bin/sh
+
+# inputs
+BOARD_DIR="$(dirname $0)"
+FIT_ITS_FILE=$BOARD_DIR/fitImage.its
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+UIMAGE=$BINARIES_DIR/uImage
+
+#output
+MODIFIED_FIT_ITS=$BINARIES_DIR/fitImage.its
+FITIMAGE=$BINARIES_DIR/fitImage
+
+# Extract kernel load address and entry address from uImage
+load=0x$($MKIMAGE -l $UIMAGE | grep "Load Address: " | sed 's/Load Address: //g')
+entry=0x$($MKIMAGE -l $UIMAGE | grep "Entry Point:  " | sed 's/Entry Point:  //g')
+
+# Create a copy of fitImage.its file and replace these address in that file
+cp $FIT_ITS_FILE $MODIFIED_FIT_ITS
+sed -i "s/load = <0>;/load = <$load>;/1" $MODIFIED_FIT_ITS
+sed -i "s/entry = <0>;/entry = <$entry>;/1" $MODIFIED_FIT_ITS
+
+# copy vmlinux.bin.gz to output/images, it is used in .its file
+cp -a $LINUX_DIR/arch/mips/boot/vmlinux.bin.gz $BINARIES_DIR
+
+# create fitImage
+$MKIMAGE -f $MODIFIED_FIT_ITS $FITIMAGE
+
+# copy to target
+cp -a $FITIMAGE $TARGET_DIR/fitImage
diff --git a/board/ci40/fitImage.its b/board/ci40/fitImage.its
new file mode 100644
index 0000000..0812eb3
--- /dev/null
+++ b/board/ci40/fitImage.its
@@ -0,0 +1,52 @@
+/*
+ * Description file for fitImage
+ */
+
+/dts-v1/;
+
+/ {
+	description = "Buildroot CI40 FTD Image";
+	#address-cells = <1>;
+
+	images {
+		kernel at 1 {
+			description = "Linux kernel";
+			data = /incbin/("./vmlinux.bin.gz");
+			type = "kernel";
+			arch = "mips";
+			os = "linux";
+			compression = "gzip";
+			load = <0>;
+			entry = <0>;
+			hash at 1 {
+				algo = "crc32";
+			};
+			hash at 2 {
+				algo = "sha1";
+			};
+		};
+		marduk-fdt at 1 {
+			description = "CI40 Flattened Device Tree blob";
+			data = /incbin/("./pistachio_marduk.dtb");
+			type = "flat_dt";
+			arch = "mips";
+			compression = "none";
+			hash at 1 {
+				algo = "crc32";
+			};
+			hash at 2 {
+				algo = "sha1";
+			};
+		};
+	};
+
+	configurations {
+		default = "config at 1";
+		config at 1 {
+			description = "CI40 dtb";
+			kernel = "kernel at 1";
+			fdt = "marduk-fdt at 1";
+		};
+	};
+};
+
diff --git a/board/ci40/genimage.cfg b/board/ci40/genimage.cfg
new file mode 100644
index 0000000..8b4303a
--- /dev/null
+++ b/board/ci40/genimage.cfg
@@ -0,0 +1,13 @@
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
+    size = 256M # Maximum firmware size in partition is 268M
+  }
+}
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
index 0000000..252c19d
--- /dev/null
+++ b/board/ci40/readme.txt
@@ -0,0 +1,57 @@
+*********************
+* MIPS Creator CI40 *
+*********************
+
+The 'ci40_defconfig' will create a root filesystem and a fitImage
+under the 'output/images/' directory. This document will try to explain how
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
+Here you have the instructions to boot from the two of them. You have to
+choose the one you prefer:
+
+From USB
+  pistachio # run usbboot
+
+From SD-Card
+  pistachio # run mmcboot
+
+Booting from network (nfsboot)
+------------------------------
+Prepare nfs root and extract rootfs.tar file into it.
+
+  pistachio # setenv serverip <server-ip-address>
+  pistachio # setenv rootpath <nfs root path>
+  pistachio # run netboot
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
+mostly for openwrt but it also applicable on buildroot
+https://docs.creatordev.io/ci40/guides/openwrt-platform/#overview
+
+Prebuilt uboot
+--------------
+http://downloads.creatordev.io/?q=u-boot/
diff --git a/configs/ci40_defconfig b/configs/ci40_defconfig
new file mode 100644
index 0000000..cf5972e
--- /dev/null
+++ b/configs/ci40_defconfig
@@ -0,0 +1,47 @@
+# architecture
+BR2_mipsel=y
+BR2_mips_32r2=y
+
+# linux header same as custom kernel ie 4.4.x
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/CreatorDev/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="openwrt-4.4.14"
+BR2_LINUX_KERNEL_DEFCONFIG="pistachio"
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
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/CreatorDev/u-boot/archive/v1.0.4.tar.gz"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-pistachio_marduk-2015.10-v1.0.4.img"
+
+# fitimage / image generation
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ci40/create_fitImage.sh"
+
+# image generation
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ci40/post-image.sh"
+
-- 
2.7.4
