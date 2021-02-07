From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  7 Feb 2021 16:55:34 +0100
Subject: [Buildroot] [PATCH] configs/avenger96_defconfig: add support for
 Arrow Avenger96 board
Message-ID: <20210207155534.7211-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Very similar to the other stm32mp157-based boards, except that we use the
multi_v7 defconfig for ease of maintenance.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                    |  2 +
 .../overlay/boot/extlinux/extlinux.conf       |  4 ++
 board/arrow/avenger96/readme.txt              | 39 +++++++++++++++++++
 .../common/stm32mp157/post-image.sh           |  2 +
 configs/avenger96_defconfig                   | 33 ++++++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/arrow/avenger96/readme.txt
 create mode 100644 configs/avenger96_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index d2d94102b0..361ee2f35a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2026,6 +2026,7 @@ N:	Pedro Aguilar <paguilar@paguilar.org>
 F:	package/libunistring/
 
 N:	Peter Korsgaard <peter@korsgaard.com>
+F:	board/arrow/avenger96/
 F:	board/beagleboneai/
 F:	board/minnowboard/
 F:	board/librecomputer/lafrite/
@@ -2035,6 +2036,7 @@ F:	board/orangepi/
 F:	board/pandaboard/
 F:	board/roseapplepi/
 F:	boot/shim/
+F:	configs/avenger96_defconfig
 F:	configs/beagleboneai_defconfig
 F:	configs/lafrite_defconfig
 F:	configs/minnowboard_max-graphical_defconfig
diff --git a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..5d506b3dae
--- /dev/null
+++ b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32mp157c-dk2-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32mp157a-dhcor-avenger96.dtb
+  append root=/dev/mmcblk1p4 rootwait
diff --git a/board/arrow/avenger96/readme.txt b/board/arrow/avenger96/readme.txt
new file mode 100644
index 0000000000..b99361a7e0
--- /dev/null
+++ b/board/arrow/avenger96/readme.txt
@@ -0,0 +1,39 @@
+Arrow Avenger96
+
+Intro
+=====
+
+This configuration supports the Arrow Avenger96 board:
+
+https://wiki.dh-electronics.com/index.php/Avenger96
+
+How to build
+============
+
+ $ make avenger96_defconfig
+ $ make
+
+How to write the microSD card
+=============================
+
+Once the build process is finished you will have an image called
+"sdcard.img" in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an microSD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Boot the board
+==============
+
+ (1) Configure the boot switches for boot from microsd: 1-0-1
+
+ (2) Insert the microSD card in the slow
+
+ (3) Plug a serial adapter (beware: 1v8 levels!) to the low speed
+     expansion connector
+
+ (4) Plug in power cable
+
+ (5) The system will start, with the console on UART, but also visible
+     on the screen.
diff --git a/board/stmicroelectronics/common/stm32mp157/post-image.sh b/board/stmicroelectronics/common/stm32mp157/post-image.sh
index eec3cb739d..363c3127cf 100755
--- a/board/stmicroelectronics/common/stm32mp157/post-image.sh
+++ b/board/stmicroelectronics/common/stm32mp157/post-image.sh
@@ -14,6 +14,8 @@ atf_image()
 		echo "tf-a-stm32mp157c-dk2.stm32"
 	elif grep -Eq "DTB_FILE_NAME=stm32mp157a-dk1.dtb" <<< ${ATF_VARIABLES}; then
                 echo "tf-a-stm32mp157a-dk1.stm32"
+	elif grep -Eq "DTB_FILE_NAME=stm32mp157a-avenger96.dtb" <<< ${ATF_VARIABLES}; then
+                echo "tf-a-stm32mp157a-avenger96.stm32"
 	fi
 }
 
diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
new file mode 100644
index 0000000000..6fea029bf8
--- /dev/null
+++ b/configs/avenger96_defconfig
@@ -0,0 +1,33 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+BR2_ROOTFS_OVERLAY="board/arrow/avenger96/overlay/"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
+BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157a-dhcor-avenger96"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp15xx-dhcor-avenger96"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.20.1
