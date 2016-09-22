From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 13:39:35 +0200
Subject: [Buildroot] [git commit] configs/acmesystems_aria_g25: update and
	add genimage handling
Message-ID: <20160922113958.741A5822D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b10d29ea7f860cd2b3e202306c4d8a79d14543e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- configs/acmesystems_aria_g25_128mb_defconfig,
  configs/acmesystems_aria_g25_256mb_defconfig :
  update default configuration files for both 128MB and 256MB version

- board/acmesystems/aria-g25/genimage.cfg
  board/acmesystems/aria-g25/post-image.sh :
  add support for genimage in order to build sdcard.img

- board/acmesystems/aria-g25/readme.txt : update documentation
  for Aria G25 and add notes about how to build sdcard.img

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/acmesystems/aria-g25/genimage.cfg      | 35 +++++++++++++++++
 board/acmesystems/aria-g25/post-image.sh     | 14 +++++++
 board/acmesystems/aria-g25/readme.txt        | 59 ++++++++++++----------------
 configs/acmesystems_aria_g25_128mb_defconfig | 30 ++++++++++----
 configs/acmesystems_aria_g25_256mb_defconfig | 30 ++++++++++----
 5 files changed, 121 insertions(+), 47 deletions(-)

diff --git a/board/acmesystems/aria-g25/genimage.cfg b/board/acmesystems/aria-g25/genimage.cfg
new file mode 100644
index 0000000..2e2eb12
--- /dev/null
+++ b/board/acmesystems/aria-g25/genimage.cfg
@@ -0,0 +1,35 @@
+# Minimal SD card image for the Acmesystems Aria G25
+
+image boot.vfat {
+	vfat {
+		file zImage {
+			image = "zImage"
+		}
+
+		file at91-ariag25.dtb {
+			image = "at91-ariag25.dtb"
+		}
+
+		file boot.bin {
+			image = "at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.6.bin"
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
diff --git a/board/acmesystems/aria-g25/post-image.sh b/board/acmesystems/aria-g25/post-image.sh
new file mode 100755
index 0000000..2846f56
--- /dev/null
+++ b/board/acmesystems/aria-g25/post-image.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage  \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
diff --git a/board/acmesystems/aria-g25/readme.txt b/board/acmesystems/aria-g25/readme.txt
index 734ccd2..cb9e9ab 100644
--- a/board/acmesystems/aria-g25/readme.txt
+++ b/board/acmesystems/aria-g25/readme.txt
@@ -1,51 +1,44 @@
+Acme Systems Aria G25
+
 Build instructions
 ==================
 
-As a regular user configure and then build:
-
-$ make acmesystems_aria_g25_128mb_defconfig (128MB RAM variant)
-  or...
-$ make acmesystems_aria_g25_256mb_defconfig (256MB RAM variant)
+To build an image for the Aria G25 choose the configuration
+corresponding to the Aria variant.
 
-$ make
+For 128MB RAM variant type:
 
-Writing to the MicroSD card
-===========================
+$ make acmesystems_aria_g25_128mb_defconfig
 
-Assuming your Aria G25 baseboard has a MicroSD socket, for example with
-the Terra baseboard, you'll need a blank MicroSD (obviously) initialized
-in a particular way to be able to boot from it.
+else for 256MB RAM variant type:
 
-Assuming the card is seen as /dev/sdb in your PC/laptop/other device
-you'll need to run the following commands as root or via sudo.
+$ make acmesystems_aria_g25_256mb_defconfig
 
-Make sure all of the card partitions are unmounted before starting.
+To customize the configuration choosed type:
 
-First we'll need to create two partitions:
+$ make menuconfig
 
-# sfdisk -uM /dev/sdb <<EOF
-,32,6
-;
-EOF
+When you are ready to start building Buildroot type:
 
-Then we'll need to create the empty filesystems:
+$ make
 
-# mkdosfs -n SD_BOOT /dev/sdb1
-# mkfs.ext4 -L SD_ROOT /dev/sdb2
+How to write the microSD card
+=============================
 
-We'll populate the first partition (boot) with the relevant files:
+Once the build process is finished you will have an image called
+"sdcard.img" in the output/images/ directory.
 
-# mount /dev/sdb1 /mnt
-# cp output/images/at91bootstrap.bin /mnt/BOOT.BIN
-# cp output/images/zImage /mnt
-# cp output/images/at91-ariag25.dtb /mnt
-# umount /mnt
+Write the bootable SD card image "sdcard.img" onto an SD card with
+"dd" command:
 
-And the root filesystem afterwards:
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
 
-# mount /dev/sdb2 /mnt
-# tar -C /mnt output/images/rootfs.tar
-# umount /mnt
+Assuming your Aria G25 baseboard has a MicroSD socket, for example
+with the Terra baseboard, insert the microSD card into the baseboard
+slot and power it.
 
-You're done, insert the MicroSD card in the slot and enjoy.
+To get the kernel log messages you can use a DPI cable
+(http://www.acmesystems.it/DPI)
 
+You can find additional informations, tutorials and a very
+comprehensive documentation on http://www.acmesystems.it/aria.
diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
index c4d2cd6..0ec210f 100644
--- a/configs/acmesystems_aria_g25_128mb_defconfig
+++ b/configs/acmesystems_aria_g25_128mb_defconfig
@@ -1,20 +1,36 @@
 # Architecture
 BR2_arm=y
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Kernel headers
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 
-# Kernel
+# System configuration
+BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/aria-g25/post-image.sh"
+
+# Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.4"
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
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-128m"
+
+# Tools to build sdcard.img
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
index ba191c6..a480287 100644
--- a/configs/acmesystems_aria_g25_256mb_defconfig
+++ b/configs/acmesystems_aria_g25_256mb_defconfig
@@ -1,20 +1,36 @@
 # Architecture
 BR2_arm=y
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Kernel headers
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 
-# Kernel
+# System configuration
+BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/aria-g25/post-image.sh"
+
+# Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.4"
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
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-256m"
+
+# Tools to build sdcard.img
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
