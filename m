From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Tue, 20 Sep 2016 09:34:35 +0200
Subject: [Buildroot] [PATCH 2/2] Buildroot v2016.08 configuration for
	Acmesystems Aria G25
In-Reply-To: <1474356875-27902-1-git-send-email-biagio.hkr@gmail.com>
References: <1474356875-27902-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <1474356875-27902-3-git-send-email-biagio.hkr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update default configuration files for both 128MB and 256MB version :
  > Add support for the default kernel version,
  > Add support for AT91bootstrap v3.8.6

- Add 'post-build.sh' script to rename the AT91bootstrap binary file from
  'at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.6' to 'boot.bin'
  because the boot ROM code needs to load boot.bin to SRAM and run it

- Add 'post-image.sh' script and 'genimage.cfg' in order to build
  sdcard.img for Aria-G25

- Update documentation and notes about how to build sdcard.img
  for Aria G25 in the readme.txt file

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
---
 board/acmesystems/aria-g25/genimage.cfg      | 29 ++++++++++++
 board/acmesystems/aria-g25/post-build.sh     | 14 ++++++
 board/acmesystems/aria-g25/post-image.sh     | 16 +++++++
 board/acmesystems/aria-g25/readme.txt        | 70 ++++++++++++++--------------
 configs/acmesystems_aria_g25_128mb_defconfig | 32 +++++++++----
 configs/acmesystems_aria_g25_256mb_defconfig | 32 +++++++++----
 6 files changed, 143 insertions(+), 50 deletions(-)
 create mode 100644 board/acmesystems/aria-g25/genimage.cfg
 create mode 100644 board/acmesystems/aria-g25/post-build.sh
 create mode 100644 board/acmesystems/aria-g25/post-image.sh

diff --git a/board/acmesystems/aria-g25/genimage.cfg b/board/acmesystems/aria-g25/genimage.cfg
new file mode 100644
index 0000000..a3f7301
--- /dev/null
+++ b/board/acmesystems/aria-g25/genimage.cfg
@@ -0,0 +1,29 @@
+# Minimal SD card image for the Acmesystems Aria-G25
+
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"at91-ariag25.dtb",
+			"boot.bin"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/acmesystems/aria-g25/post-build.sh b/board/acmesystems/aria-g25/post-build.sh
new file mode 100644
index 0000000..684726a
--- /dev/null
+++ b/board/acmesystems/aria-g25/post-build.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+if [ -e ${BINARIES_DIR}/at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.6.bin ]; then 
+	if [ -e ${BINARIES_DIR}/boot.bin ]; then
+		mkdir ${BINARIES_DIR}/aria-at91bootstrap3
+		mv ${BINARIES_DIR}/*.bin ${BINARIES_DIR}/aria-at91bootstrap3
+		cp -v ${BINARIES_DIR}/aria-at91bootstrap3/at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.6.bin ${BINARIES_DIR}/boot.bin
+	else
+		mv ${BINARIES_DIR}/at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.6.bin ${BINARIES_DIR}/boot.bin
+	fi
+else
+	echo "Cannot find the AT91bootstrap image for Aria-G25"
+fi
+
diff --git a/board/acmesystems/aria-g25/post-image.sh b/board/acmesystems/aria-g25/post-image.sh
new file mode 100644
index 0000000..9cca1b1
--- /dev/null
+++ b/board/acmesystems/aria-g25/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/acmesystems/aria-g25/readme.txt b/board/acmesystems/aria-g25/readme.txt
index 734ccd2..fbe8a3b 100644
--- a/board/acmesystems/aria-g25/readme.txt
+++ b/board/acmesystems/aria-g25/readme.txt
@@ -1,51 +1,53 @@
-Build instructions
-==================
+Acme Systems Aria G25
 
-As a regular user configure and then build:
+Intro
+=====
 
-$ make acmesystems_aria_g25_128mb_defconfig (128MB RAM variant)
-  or...
-$ make acmesystems_aria_g25_256mb_defconfig (256MB RAM variant)
+Buildroot configuration for Aria G25.
+This default configuration allows you to build a minimal root filesystem
+which includes the support for the serial console.
+The default configuration for Aria G25 includes the getty program that
+enables you to log in through the serial console ttyS0.
+After the boot, to log in at the getty prompt use the following credentials:
+Username: root
+Password: acmesystems
 
-$ make
+You can find additional informations, tutorials and a very comprehensive
+documentation on http://www.acmesystems.it/aria.
+
+Build instructions
+==================
 
-Writing to the MicroSD card
-===========================
+To build an image for the Aria G25 choose the configuration
+corresponding to the Aria variant.
 
-Assuming your Aria G25 baseboard has a MicroSD socket, for example with
-the Terra baseboard, you'll need a blank MicroSD (obviously) initialized
-in a particular way to be able to boot from it.
+For 128MB RAM variant type:
 
-Assuming the card is seen as /dev/sdb in your PC/laptop/other device
-you'll need to run the following commands as root or via sudo.
+$ make acmesystems_aria_g25_128mb_defconfig
 
-Make sure all of the card partitions are unmounted before starting.
+else for 256MB RAM variant type:
 
-First we'll need to create two partitions:
+$ make acmesystems_aria_g25_256mb_defconfig
 
-# sfdisk -uM /dev/sdb <<EOF
-,32,6
-;
-EOF
+To customize the configuration choosed type:
 
-Then we'll need to create the empty filesystems:
+$ make menuconfig
 
-# mkdosfs -n SD_BOOT /dev/sdb1
-# mkfs.ext4 -L SD_ROOT /dev/sdb2
+When you are ready to start building Buildroot type:
 
-We'll populate the first partition (boot) with the relevant files:
+$ make
 
-# mount /dev/sdb1 /mnt
-# cp output/images/at91bootstrap.bin /mnt/BOOT.BIN
-# cp output/images/zImage /mnt
-# cp output/images/at91-ariag25.dtb /mnt
-# umount /mnt
+How to write the microSD card
+=============================
 
-And the root filesystem afterwards:
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
 
-# mount /dev/sdb2 /mnt
-# tar -C /mnt output/images/rootfs.tar
-# umount /mnt
+Write the bootable SD card image "sdcard.img" onto an SD card with "dd" command:
 
-You're done, insert the MicroSD card in the slot and enjoy.
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Assuming your Aria G25 baseboard has a MicroSD socket, for example with
+the Terra baseboard, insert the microSD card into the baseboard slot and power it.
 
+To get the kernel log messages you can use a DPI cable (http://www.acmesystems.it/DPI)
diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
index c4d2cd6..0de281b 100644
--- a/configs/acmesystems_aria_g25_128mb_defconfig
+++ b/configs/acmesystems_aria_g25_128mb_defconfig
@@ -1,20 +1,36 @@
 # Architecture
 BR2_arm=y
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Kernel header
+BR2_KERNEL_HEADERS_4_7=y
 
-# Kernel
+# System configuration
+BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
+BR2_TARGET_GENERIC_ROOT_PASSWD="acmesystems"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/acmesystems/aria-g25/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/aria-g25/post-image.sh"
+
+# Kernel configuration
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
 
-# Bootloader
+# Root filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
+
+# AT91bootstrap bootloader
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/tanzilli/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="3f957cec253abc80fd10c733e5e596f46e1aef56"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/biagiom/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6-buildroot"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-128m"
+
+# Tools to build sdcard.img
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
index ba191c6..17dcb56 100644
--- a/configs/acmesystems_aria_g25_256mb_defconfig
+++ b/configs/acmesystems_aria_g25_256mb_defconfig
@@ -1,20 +1,36 @@
 # Architecture
 BR2_arm=y
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Kernel header
+BR2_KERNEL_HEADERS_4_7=y
 
-# Kernel
+# System configuration
+BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
+BR2_TARGET_GENERIC_ROOT_PASSWD="acmesystems"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/acmesystems/aria-g25/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/aria-g25/post-image.sh"
+
+# Kernel configuration
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
 
-# Bootloader
+# Root filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
+
+# AT91bootstrap bootloader
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/tanzilli/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="3f957cec253abc80fd10c733e5e596f46e1aef56"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/biagiom/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6-buildroot"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-256m"
+
+# Tools to build sdcard.img
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.4
