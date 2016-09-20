From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Tue, 20 Sep 2016 09:34:34 +0200
Subject: [Buildroot] [PATCH 1/2] Buildroot v2016.08 configuration for
	Acmesystems Arietta G25
In-Reply-To: <1474356875-27902-1-git-send-email-biagio.hkr@gmail.com>
References: <1474356875-27902-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <1474356875-27902-2-git-send-email-biagio.hkr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update default configuration files for both 128MB and 256MB version :
  > Add support for the default kernel version,
  > Add support for AT91bootstrap v3.8.6

- Add 'post-build.sh' script to rename the AT91bootstrap binary file from
  'at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.6' to 'boot.bin'
  because the boot ROM code needs to load boot.bin to SRAM and run it

- Add 'post-image.sh' script and 'genimage.cfg' in order to build
  sdcard.img for Arietta-G25

- Update documentation and notes about how to build sdcard.img
  for Arietta G25 in the readme.txt file

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
---
 board/acmesystems/arietta-g25/genimage.cfg      | 14 +++------
 board/acmesystems/arietta-g25/post-build.sh     | 14 +++++++++
 board/acmesystems/arietta-g25/post-image.sh     |  2 +-
 board/acmesystems/arietta-g25/readme.txt        | 31 ++++++++++++--------
 configs/acmesystems_arietta_g25_128mb_defconfig | 38 ++++++++++++++-----------
 configs/acmesystems_arietta_g25_256mb_defconfig | 38 ++++++++++++++-----------
 6 files changed, 82 insertions(+), 55 deletions(-)
 create mode 100755 board/acmesystems/arietta-g25/post-build.sh

diff --git a/board/acmesystems/arietta-g25/genimage.cfg b/board/acmesystems/arietta-g25/genimage.cfg
index 1080b0e..d4e1648 100644
--- a/board/acmesystems/arietta-g25/genimage.cfg
+++ b/board/acmesystems/arietta-g25/genimage.cfg
@@ -2,16 +2,10 @@
 #
 image boot.vfat {
 	vfat {
-		file zImage {
-			image = "zImage"
-		}
-
-		file acme-arietta.dtb {
-			image = "at91-ariag25.dtb"
-		}
-
-		file boot.bin {
-			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.7.bin"
+		files = {
+			"zImage",
+			"at91-ariettag25.dtb",
+			"boot.bin"
 		}
 	}
 	size = 16M
diff --git a/board/acmesystems/arietta-g25/post-build.sh b/board/acmesystems/arietta-g25/post-build.sh
new file mode 100755
index 0000000..e8c8918
--- /dev/null
+++ b/board/acmesystems/arietta-g25/post-build.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+if [ -e ${BINARIES_DIR}/at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.6.bin ]; then 
+	if [ -e ${BINARIES_DIR}/boot.bin ]; then
+		mkdir ${BINARIES_DIR}/arietta-at91bootstrap3
+		mv ${BINARIES_DIR}/*.bin ${BINARIES_DIR}/arietta-at91bootstrap3
+		cp -v ${BINARIES_DIR}/arietta-at91bootstrap3/at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.6.bin ${BINARIES_DIR}/boot.bin
+	else
+		mv ${BINARIES_DIR}/at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.6.bin ${BINARIES_DIR}/boot.bin
+	fi
+else
+	echo "Cannot find the AT91bootstrap image for Arietta-G25"
+fi
+
diff --git a/board/acmesystems/arietta-g25/post-image.sh b/board/acmesystems/arietta-g25/post-image.sh
index c82b189..9cca1b1 100755
--- a/board/acmesystems/arietta-g25/post-image.sh
+++ b/board/acmesystems/arietta-g25/post-image.sh
@@ -6,7 +6,7 @@ GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 rm -rf "${GENIMAGE_TMP}"
 
-genimage                               \
+genimage                           \
 	--rootpath "${TARGET_DIR}"     \
 	--tmppath "${GENIMAGE_TMP}"    \
 	--inputpath "${BINARIES_DIR}"  \
diff --git a/board/acmesystems/arietta-g25/readme.txt b/board/acmesystems/arietta-g25/readme.txt
index 485e275..c712c8f 100644
--- a/board/acmesystems/arietta-g25/readme.txt
+++ b/board/acmesystems/arietta-g25/readme.txt
@@ -1,11 +1,16 @@
-Acmesystems Arietta G25
+Acme Systems Arietta G25
 
 Intro
 =====
 
-This default configuration will allow you to start experimenting with the
-buildroot environment for the Arietta G25. With the current configuration
-it will bring-up the board, and allow access through the serial console.
+Buildroot configuration for Arietta G25.
+This default configuration allows you to build a minimal root filesystem
+which includes the support for the serial console.
+The default configuration for Arietta G25 includes the getty program that
+enables you to log in through the serial console ttyS0.
+After the boot, to log in at the getty prompt use the following credentials:
+Username: root
+Password: acmesystems
 
 You can find additional informations, tutorials and a very comprehensive
 documentation on http://www.acmesystems.it/arietta.
@@ -13,8 +18,8 @@ documentation on http://www.acmesystems.it/arietta.
 Build instructions
 ==================
 
-To build an image for the arietta g25 choose the configuration
-corresponding to the arietta variant.
+To build an image for the Arietta G25 choose the configuration
+corresponding to the Arietta variant.
 
 For 128MB RAM variant type:
 
@@ -24,7 +29,11 @@ else for 256MB RAM variant type:
 
 $ make acmesystems_arietta_g25_256mb_defconfig
 
-then:
+To customize the configuration choosed type:
+
+$ make menuconfig
+
+When you are ready to start building Buildroot type:
 
 $ make
 
@@ -34,12 +43,10 @@ How to write the microSD card
 Once the build process is finished you will have an image called "sdcard.img"
 in the output/images/ directory.
 
-Copy the bootable "sdcard.img" onto an SD card with "dd":
+Write the bootable SD card image "sdcard.img" onto an SD card with "dd" command:
 
   $ sudo dd if=output/images/sdcard.img of=/dev/sdX
 
-Insert the microSD card into the arietta slot and power it.
+Insert the microSD card into the Arietta slot and power it.
 
-The image just built is fairly basic and the only output
-you will get is on serial console, please consider to use a DPI
-cable (http://www.acmesystems.it/DPI)
+To get the kernel log messages you can use a DPI cable (http://www.acmesystems.it/DPI)
diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
index e5ddf13..518d13e 100644
--- a/configs/acmesystems_arietta_g25_128mb_defconfig
+++ b/configs/acmesystems_arietta_g25_128mb_defconfig
@@ -1,30 +1,36 @@
 # Architecture
 BR2_arm=y
 
-# Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Kernel header
+BR2_KERNEL_HEADERS_4_7=y
 
-# Kernel
+# System configuration
+BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot"
+BR2_TARGET_GENERIC_ROOT_PASSWD="acmesystems"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/acmesystems/arietta-g25/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
+
+# Kernel configuration
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
-BR2_LINUX_KERNEL_XZ=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
+
+# Root filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
 
-# Bootloader
+# AT91bootstrap bootloader
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/tanzilli/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="cedbde4b36695b715f469f4872f47e5cc8115000"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/biagiom/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6-buildroot"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
 
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_PACKAGE_HOST_GENIMAGE=y
+# Host tools to build sdcard.img
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
index cf6f67b..a858a90 100644
--- a/configs/acmesystems_arietta_g25_256mb_defconfig
+++ b/configs/acmesystems_arietta_g25_256mb_defconfig
@@ -1,30 +1,36 @@
 # Architecture
 BR2_arm=y
 
-# Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Kernel header
+BR2_KERNEL_HEADERS_4_7=y
 
-# Kernel
+# System configuration
+BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot"
+BR2_TARGET_GENERIC_ROOT_PASSWD="acmesystems"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/acmesystems/arietta-g25/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
+
+# Kernel configuration
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
-BR2_LINUX_KERNEL_XZ=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
+
+# Root filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
 
-# Bootloader
+# AT91bootstrap bootloader
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/tanzilli/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="cedbde4b36695b715f469f4872f47e5cc8115000"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/biagiom/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6-buildroot"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
 
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_PACKAGE_HOST_GENIMAGE=y
+# Host tools to build sdcard.img
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.4
