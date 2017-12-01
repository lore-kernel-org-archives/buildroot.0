From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 01 Dec 2017 21:00:40 -0000
Subject: [Buildroot] [git commit] configs/atmel: refactor to use genimage.sh
Message-ID: <20171201205314.6A3687FFA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9957d2c89decd6ad63b144df2fb10837eb43250f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prefer the commom genimage.sh instead of a custom post-image.sh script.

Cc: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/atmel/sama5d27_som1_ek_mmc/post-image.sh   | 14 --------------
 board/atmel/sama5d2_xplained_mmc/post-image.sh   | 14 --------------
 board/atmel/sama5d3_xplained_mmc/post-image.sh   | 14 --------------
 board/atmel/sama5d4_xplained_mmc/post-image.sh   | 14 --------------
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig |  3 ++-
 configs/atmel_sama5d2_xplained_mmc_defconfig     |  3 ++-
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig |  3 ++-
 configs/atmel_sama5d3_xplained_mmc_defconfig     |  3 ++-
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig |  3 ++-
 configs/atmel_sama5d4_xplained_mmc_defconfig     |  3 ++-
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig |  3 ++-
 11 files changed, 14 insertions(+), 63 deletions(-)

diff --git a/board/atmel/sama5d27_som1_ek_mmc/post-image.sh b/board/atmel/sama5d27_som1_ek_mmc/post-image.sh
deleted file mode 100755
index 359b4c9..0000000
--- a/board/atmel/sama5d27_som1_ek_mmc/post-image.sh
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
-genimage                               \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
diff --git a/board/atmel/sama5d2_xplained_mmc/post-image.sh b/board/atmel/sama5d2_xplained_mmc/post-image.sh
deleted file mode 100755
index 359b4c9..0000000
--- a/board/atmel/sama5d2_xplained_mmc/post-image.sh
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
-genimage                               \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
diff --git a/board/atmel/sama5d3_xplained_mmc/post-image.sh b/board/atmel/sama5d3_xplained_mmc/post-image.sh
deleted file mode 100755
index 359b4c9..0000000
--- a/board/atmel/sama5d3_xplained_mmc/post-image.sh
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
-genimage                               \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
diff --git a/board/atmel/sama5d4_xplained_mmc/post-image.sh b/board/atmel/sama5d4_xplained_mmc/post-image.sh
deleted file mode 100755
index 359b4c9..0000000
--- a/board/atmel/sama5d4_xplained_mmc/post-image.sh
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
-genimage                               \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index 0dddaf5..3752129 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -8,7 +8,8 @@ BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/sama5d27_som1_ek_mmc/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d27_som1_ek_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
diff --git a/configs/atmel_sama5d2_xplained_mmc_defconfig b/configs/atmel_sama5d2_xplained_mmc_defconfig
index 9b65a56..8889978 100644
--- a/configs/atmel_sama5d2_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_defconfig
@@ -4,7 +4,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/sama5d2_xplained_mmc/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d2_xplained_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index 8745bf4..23a2582 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -18,7 +18,8 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 # Needed for usb-utils
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 # Creation of the SD card image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/sama5d2_xplained_mmc/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d2_xplained_mmc/genimage.cfg"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
index 798c655..4ddb171 100644
--- a/configs/atmel_sama5d3_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_defconfig
@@ -3,7 +3,8 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/sama5d3_xplained_mmc/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d3_xplained_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index eca8664..a335148 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -17,7 +17,8 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 # Needed for usb-utils
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 # Creation of the SD card image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/sama5d3_xplained_mmc/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d3_xplained_mmc/genimage.cfg"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/atmel_sama5d4_xplained_mmc_defconfig b/configs/atmel_sama5d4_xplained_mmc_defconfig
index 073489f..b8b21e7 100644
--- a/configs/atmel_sama5d4_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_defconfig
@@ -4,7 +4,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/sama5d4_xplained_mmc/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d4_xplained_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index 69893c3..c31f15a 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -18,7 +18,8 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 # Needed for usb-utils
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 # Creation of the SD card image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/sama5d4_xplained_mmc/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d4_xplained_mmc/genimage.cfg"
 
 # Kernel
 BR2_LINUX_KERNEL=y
