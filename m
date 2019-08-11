From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 21:58:05 +0200
Subject: [Buildroot] [git commit] configs/acmesystems_arietta_g25: bump
 Linux and AT91Bootstrap versions
Message-ID: <20190811195541.AFC12813EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42ea31c114f32a100923e51cb2b6b6d67c38ca3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Bump Linux version to 4.19
* Use default 'genimage' post-image script (support/scripts/genimage.sh)
  to build sdcard.img
* Bump AT91bootstrap version to 3.8.13

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139084
  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139083

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/acmesystems/arietta-g25/genimage.cfg      |  2 +-
 board/acmesystems/arietta-g25/post-image.sh     | 14 --------------
 configs/acmesystems_arietta_g25_128mb_defconfig | 10 ++++++----
 configs/acmesystems_arietta_g25_256mb_defconfig | 10 ++++++----
 4 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/board/acmesystems/arietta-g25/genimage.cfg b/board/acmesystems/arietta-g25/genimage.cfg
index 420f1b6be5..7c3112dd56 100644
--- a/board/acmesystems/arietta-g25/genimage.cfg
+++ b/board/acmesystems/arietta-g25/genimage.cfg
@@ -11,7 +11,7 @@ image boot.vfat {
 		}
 		
 		file boot.bin {
-			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.6.bin"
+			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.13.bin"
 		} 
 	}
 	size = 16M
diff --git a/board/acmesystems/arietta-g25/post-image.sh b/board/acmesystems/arietta-g25/post-image.sh
deleted file mode 100755
index 2846f56d72..0000000000
--- a/board/acmesystems/arietta-g25/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage  \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
index a68ac57ff7..d66d80d5ab 100644
--- a/configs/acmesystems_arietta_g25_128mb_defconfig
+++ b/configs/acmesystems_arietta_g25_128mb_defconfig
@@ -1,19 +1,21 @@
 # Architecture
 BR2_arm=y
+BR2_arm926t=y
 
 # Kernel headers
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # System configuration
 BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/arietta-g25/genimage.cfg"
 
 # Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
@@ -27,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
 
 # Tools to build sdcard.img
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
index ce9ebacb8d..5104291c48 100644
--- a/configs/acmesystems_arietta_g25_256mb_defconfig
+++ b/configs/acmesystems_arietta_g25_256mb_defconfig
@@ -1,19 +1,21 @@
 # Architecture
 BR2_arm=y
+BR2_arm926t=y
 
 # Kernel headers
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # System configuration
 BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/arietta-g25/genimage.cfg"
 
 # Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
@@ -27,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
 
 # Tools to build sdcard.img
