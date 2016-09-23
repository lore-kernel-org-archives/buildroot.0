From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 08:06:34 +0200
Subject: [Buildroot] [git commit] configs/acmesystems_arietta_g25: update
	kernel and at91bootstrap3
Message-ID: <20160923060646.730578225F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85af101ceab5fb433a5757ea05db7d851e1ce376
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- configs/acmesystems_arietta_g25_128mb_defconfig,
  configs/acmesystems_arietta_g25_256mb_defconfig :
  update default configuration files for both 128MB and 256MB version

- board/acmesystems/arietta-g25/genimage.cfg
  board/acmesystems/arietta-g25/post-image.sh :
  improve 'post-image.sh' and 'genimage.cfg' used to build sdcard.img

- board/acmesystems/arietta-g25/readme.txt :
  update documentation for Arietta G25

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
Acked-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Reviewed-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/acmesystems/arietta-g25/genimage.cfg      | 12 ++++-----
 board/acmesystems/arietta-g25/post-image.sh     |  4 +--
 board/acmesystems/arietta-g25/readme.txt        | 14 ++++++----
 configs/acmesystems_arietta_g25_128mb_defconfig | 36 ++++++++++++++-----------
 configs/acmesystems_arietta_g25_256mb_defconfig | 36 ++++++++++++++-----------
 5 files changed, 58 insertions(+), 44 deletions(-)

diff --git a/board/acmesystems/arietta-g25/genimage.cfg b/board/acmesystems/arietta-g25/genimage.cfg
index 1080b0e..420f1b6 100644
--- a/board/acmesystems/arietta-g25/genimage.cfg
+++ b/board/acmesystems/arietta-g25/genimage.cfg
@@ -1,18 +1,18 @@
 # Minimal SD card image for the Acmesystems Arietta G25
-#
+
 image boot.vfat {
 	vfat {
 		file zImage {
 			image = "zImage"
 		}
-
+		
 		file acme-arietta.dtb {
-			image = "at91-ariag25.dtb"
+			image = "at91-ariettag25.dtb"
 		}
-
+		
 		file boot.bin {
-			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.7.bin"
-		}
+			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.6.bin"
+		} 
 	}
 	size = 16M
 }
diff --git a/board/acmesystems/arietta-g25/post-image.sh b/board/acmesystems/arietta-g25/post-image.sh
index c82b189..2846f56 100755
--- a/board/acmesystems/arietta-g25/post-image.sh
+++ b/board/acmesystems/arietta-g25/post-image.sh
@@ -6,11 +6,9 @@ GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 rm -rf "${GENIMAGE_TMP}"
 
-genimage                               \
+genimage  \
 	--rootpath "${TARGET_DIR}"     \
 	--tmppath "${GENIMAGE_TMP}"    \
 	--inputpath "${BINARIES_DIR}"  \
 	--outputpath "${BINARIES_DIR}" \
 	--config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/board/acmesystems/arietta-g25/readme.txt b/board/acmesystems/arietta-g25/readme.txt
index 485e275..f356b0a 100644
--- a/board/acmesystems/arietta-g25/readme.txt
+++ b/board/acmesystems/arietta-g25/readme.txt
@@ -1,4 +1,4 @@
-Acmesystems Arietta G25
+Acme Systems Arietta G25
 
 Intro
 =====
@@ -13,8 +13,8 @@ documentation on http://www.acmesystems.it/arietta.
 Build instructions
 ==================
 
-To build an image for the arietta g25 choose the configuration
-corresponding to the arietta variant.
+To build an image for the Arietta G25 choose the configuration
+corresponding to the Arietta variant.
 
 For 128MB RAM variant type:
 
@@ -24,7 +24,11 @@ else for 256MB RAM variant type:
 
 $ make acmesystems_arietta_g25_256mb_defconfig
 
-then:
+To customize the configuration chosen type:
+
+$ make menuconfig
+
+When you are ready to start building Buildroot type:
 
 $ make
 
@@ -38,7 +42,7 @@ Copy the bootable "sdcard.img" onto an SD card with "dd":
 
   $ sudo dd if=output/images/sdcard.img of=/dev/sdX
 
-Insert the microSD card into the arietta slot and power it.
+Insert the microSD card into the Arietta slot and power it.
 
 The image just built is fairly basic and the only output
 you will get is on serial console, please consider to use a DPI
diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
index e5ddf13..a68ac57 100644
--- a/configs/acmesystems_arietta_g25_128mb_defconfig
+++ b/configs/acmesystems_arietta_g25_128mb_defconfig
@@ -1,30 +1,36 @@
 # Architecture
 BR2_arm=y
 
-# Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Kernel headers
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 
-# Kernel
+# System configuration
+BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
+
+# Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.4"
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
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
 
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_PACKAGE_HOST_GENIMAGE=y
+# Tools to build sdcard.img
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
index cf6f67b..ce9ebac 100644
--- a/configs/acmesystems_arietta_g25_256mb_defconfig
+++ b/configs/acmesystems_arietta_g25_256mb_defconfig
@@ -1,30 +1,36 @@
 # Architecture
 BR2_arm=y
 
-# Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Kernel headers
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 
-# Kernel
+# System configuration
+BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
+
+# Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.4"
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
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
 
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_PACKAGE_HOST_GENIMAGE=y
+# Tools to build sdcard.img
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
