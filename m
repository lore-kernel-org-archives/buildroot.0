From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 17:00:59 +0100
Subject: [Buildroot] [git commit] board: Add support for Acmesystems Arietta
	g25
Message-ID: <20160217160226.F03148074E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e173aeece51852d652c557546d9944ee42c91e4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a minimal working configuration for
Acmesystems Arietta g25.

[Peter: fix whitespace, use same-as-kernel for kernel headers version]
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/acmesystems/arietta-g25/genimage.cfg      | 35 +++++++++++++++++++
 board/acmesystems/arietta-g25/post-image.sh     | 16 +++++++++
 board/acmesystems/arietta-g25/readme.txt        | 45 +++++++++++++++++++++++++
 configs/acmesystems_arietta_g25_128mb_defconfig | 31 +++++++++++++++++
 configs/acmesystems_arietta_g25_256mb_defconfig | 31 +++++++++++++++++
 5 files changed, 158 insertions(+)

diff --git a/board/acmesystems/arietta-g25/genimage.cfg b/board/acmesystems/arietta-g25/genimage.cfg
new file mode 100644
index 0000000..1080b0e
--- /dev/null
+++ b/board/acmesystems/arietta-g25/genimage.cfg
@@ -0,0 +1,35 @@
+# Minimal SD card image for the Acmesystems Arietta G25
+#
+image boot.vfat {
+	vfat {
+		file zImage {
+			image = "zImage"
+		}
+
+		file acme-arietta.dtb {
+			image = "at91-ariag25.dtb"
+		}
+
+		file boot.bin {
+			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.7.bin"
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
diff --git a/board/acmesystems/arietta-g25/post-image.sh b/board/acmesystems/arietta-g25/post-image.sh
new file mode 100755
index 0000000..c82b189
--- /dev/null
+++ b/board/acmesystems/arietta-g25/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                               \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/acmesystems/arietta-g25/readme.txt b/board/acmesystems/arietta-g25/readme.txt
new file mode 100644
index 0000000..485e275
--- /dev/null
+++ b/board/acmesystems/arietta-g25/readme.txt
@@ -0,0 +1,45 @@
+Acmesystems Arietta G25
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Arietta G25. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+You can find additional informations, tutorials and a very comprehensive
+documentation on http://www.acmesystems.it/arietta.
+
+Build instructions
+==================
+
+To build an image for the arietta g25 choose the configuration
+corresponding to the arietta variant.
+
+For 128MB RAM variant type:
+
+$ make acmesystems_arietta_g25_128mb_defconfig
+
+else for 256MB RAM variant type:
+
+$ make acmesystems_arietta_g25_256mb_defconfig
+
+then:
+
+$ make
+
+How to write the microSD card
+=============================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Insert the microSD card into the arietta slot and power it.
+
+The image just built is fairly basic and the only output
+you will get is on serial console, please consider to use a DPI
+cable (http://www.acmesystems.it/DPI)
diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
new file mode 100644
index 0000000..44cb4e5
--- /dev/null
+++ b/configs/acmesystems_arietta_g25_128mb_defconfig
@@ -0,0 +1,31 @@
+# Architecture
+BR2_arm=y
+
+# Toolchain
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
+BR2_LINUX_KERNEL_XZ=y
+
+# Bootloader
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="git://github.com/tanzilli/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="cedbde4b36695b715f469f4872f47e5cc8115000"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
new file mode 100644
index 0000000..48a8190
--- /dev/null
+++ b/configs/acmesystems_arietta_g25_256mb_defconfig
@@ -0,0 +1,31 @@
+# Architecture
+BR2_arm=y
+
+# Toolchain
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
+BR2_LINUX_KERNEL_XZ=y
+
+# Bootloader
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="git://github.com/tanzilli/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="cedbde4b36695b715f469f4872f47e5cc8115000"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
