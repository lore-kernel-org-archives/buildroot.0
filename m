From: Mike Frampton <mikeframpo@gmail.com>
Date: Thu, 19 Nov 2020 22:08:54 +1300
Subject: [Buildroot] [PATCH v2 3/3] configs/qcom_db410c: new defconfig
In-Reply-To: <20201119090854.48955-1-mikeframpo@gmail.com>
References: <20201119090854.48955-1-mikeframpo@gmail.com>
Message-ID: <20201119090854.48955-4-mikeframpo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds a defconfig for the Qualcomm Dragonboard 410c SBC. This config
builds the qcom kernel 5.4 arm64 and assembles it into an abootimg which
can be booted on the device. Further instructions are provided in the
included readme.txt

Signed-off-by: Mike Frampton <mikeframpo@gmail.com>
---
 DEVELOPERS                      |  2 +
 board/qcom/db410c/post-image.sh | 20 +++++++
 board/qcom/db410c/readme.txt    | 93 +++++++++++++++++++++++++++++++++
 configs/qcom_db410c_defconfig   | 28 ++++++++++
 4 files changed, 143 insertions(+)
 create mode 100755 board/qcom/db410c/post-image.sh
 create mode 100644 board/qcom/db410c/readme.txt
 create mode 100644 configs/qcom_db410c_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 57a84a3604..caec89a1df 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1864,6 +1864,8 @@ F:	board/licheepi/
 F:	configs/licheepi_zero_defconfig
 
 N:	Mike Frampton <mikeframpo@gmail.com>
+F:	board/qcom/db410c/
+F:	configs/qcom_db410c_defconfig
 F:	package/qcom-db410c-firmware/
 
 N:	Mike Harmony <mike.harmony@snapav.com>
diff --git a/board/qcom/db410c/post-image.sh b/board/qcom/db410c/post-image.sh
new file mode 100755
index 0000000000..b33a219104
--- /dev/null
+++ b/board/qcom/db410c/post-image.sh
@@ -0,0 +1,20 @@
+#!/bin/bash
+
+set -e
+
+OUTIMG=$BINARIES_DIR/boot-db410c.img
+KERNEL_BUILD=$BUILD_DIR/linux-release_qcomlt-5.4
+
+cp $KERNEL_BUILD/arch/arm64/boot/dts/qcom/apq8016-sbc.dtb $BINARIES_DIR
+cp $KERNEL_BUILD/arch/arm64/boot/Image.gz $BINARIES_DIR
+
+# now assemble the bootimg
+cat $BINARIES_DIR/Image.gz $BINARIES_DIR/apq8016-sbc.dtb > $BINARIES_DIR/Image.gz+dtb
+echo "not a ramdisk" > $BINARIES_DIR/ramdisk.img
+
+abootimg --create $OUTIMG -k $BINARIES_DIR/Image.gz+dtb -r $BINARIES_DIR/ramdisk.img \
+	-c pagesize=2048 -c kerneladdr=0x80008000 -c ramdiskaddr=0x81000000 \
+	-c cmdline="root=/dev/mmcblk1p13 rw rootwait console=tty0 console=ttyMSM0,115200n8"
+
+echo "boot img written to $OUTIMG"
+
diff --git a/board/qcom/db410c/readme.txt b/board/qcom/db410c/readme.txt
new file mode 100644
index 0000000000..259dc7fd7c
--- /dev/null
+++ b/board/qcom/db410c/readme.txt
@@ -0,0 +1,93 @@
+Intro
+=====
+
+These instructions show you how to build a basic kernel and rootfs for the
+Dragonboard-410c. Terminal access is provided via the serial console.
+The provided defconfig builds an android bootimg, which is configured to be
+booted from an SD card.
+
+DB410c page at Qualcomm developer network:
+https://developer.qualcomm.com/hardware/dragonboard-410c
+
+DB410c documentation at 96boards:
+https://www.96boards.org/documentation/consumer/dragonboard/dragonboard410c/
+
+
+How to build
+============
+
+Create a .config by running:
+
+  $ make qcom_db410c_defconfig
+
+This will configure buildroot to build the kernel image, device tree binary,
+rootfs, and an android bootimg. The bootimg, containing kernelimg + devicetree,
+is bootable on the DB410c via the SD card.
+
+Once you have a .config, simply run:
+
+  $ make
+
+Result of the build
+-------------------
+
+After building, you should obtain this tree:
+
+    output/images/
+    +-- Image.gz
+    +-- apq8016-sbc.dtb
+    +-- rootfs.ext2
+    +-- boot-db410c.img
+
+
+How to set up the SD card
+=========================
+
+The bootloader on the DB410c expects the SD card to be formatted in a 
+particular way. The simplest way to set up the SD card correctly is to flash
+a prebuilt Debian image on to the card to set up the required partitions.
+
+The Debian image can be downloaded from:
+http://releases.linaro.org/96boards/dragonboard410c/linaro/debian/latest/dragonboard-410c-sdcard-developer-*.zip
+
+The instructions at this page explain how to copy it to the SD card (requires
+card 8GB or larger):
+https://www.96boards.org/documentation/consumer/dragonboard/dragonboard410c/installation/linux-sd.md.html
+
+Also note the instructions for setting the device's switches for SD card boot.
+
+After this process, the SD card should have partition lay as follows:
+
+  $ lsblk /dev/sdX
+    NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
+    sdX       8:16   1  7.4G  0 disk 
+    ??sdX1    8:17   1  512K  0 part 
+    ??sdX2    8:18   1  512K  0 part 
+    ??sdX3    8:19   1    1M  0 part 
+    ??sdX4    8:20   1  512K  0 part 
+    ??sdX5    8:21   1   16K  0 part 
+    ??sdX6    8:22   1    2M  0 part 
+    ??sdX7    8:23   1    2M  0 part 
+    ??sdX8    8:24   1    1K  0 part 
+    ??sdX9    8:25   1    2M  0 part 
+    ??sdX10   8:26   1    1M  0 part 
+    ??sdX11   8:27   1   64M  0 part 
+    ??sdX12   8:28   1    1M  0 part 
+    ??sdX13   8:29   1  3.8G  0 part 
+
+The bootimg should be placed in partition 11 and the rootfs in partition 13.
+
+How to write the SD card
+========================
+
+Copy the build bootimg "boot-db410c.img" onto the SD card with the command:
+
+  $ sudo dd if=output/images/boot-db410c.img of=/dev/sdX11
+
+Then copy the rootfs with:
+
+  $ sudo dd if=output/images/rootfs.ext2 of=/dev/sdX13
+
+Insert the SD card into the device and power it up. The system should start a
+console on UART 0.
+
diff --git a/configs/qcom_db410c_defconfig b/configs/qcom_db410c_defconfig
new file mode 100644
index 0000000000..732751c787
--- /dev/null
+++ b/configs/qcom_db410c_defconfig
@@ -0,0 +1,28 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a53=y
+
+# Toolchain options
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+
+# Firmware
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS=y
+BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO=y
+BR2_PACKAGE_QCOM_DB410C_FIRMWARE=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.linaro.org/landing-teams/working/qualcomm/kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="release/qcomlt-5.4"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="apq8016-sbc"
+
+# Filesystem/Image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_PACKAGE_HOST_ABOOTIMG=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qcom/db410c/post-image.sh"
+
-- 
2.25.1
