From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 01 Dec 2017 21:00:40 -0000
Subject: [Buildroot] [git commit] configs/at91: refactor to use genimage.sh
Message-ID: <20171201205314.795AC7FFA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb7e90bf68379a8e82762255d7855ffcf788d99c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prefer the commom genimage.sh instead of a custom post-image.sh script.

Cc: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/atmel/at91sam9x5ek_mmc/post-image.sh | 20 --------------------
 configs/at91sam9x5ek_mmc_defconfig         |  3 ++-
 configs/at91sam9x5ek_mmc_dev_defconfig     |  3 ++-
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/board/atmel/at91sam9x5ek_mmc/post-image.sh b/board/atmel/at91sam9x5ek_mmc/post-image.sh
deleted file mode 100755
index b560fd3..0000000
--- a/board/atmel/at91sam9x5ek_mmc/post-image.sh
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-echo --rootpath "${TARGET_DIR}"
-echo --tmppath "${GENIMAGE_TMP}"
-echo --inputpath "${BINARIES_DIR}"
-echo --outputpath "${BINARIES_DIR}"
-echo --config "${GENIMAGE_CFG}"
-
-genimage                               \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
diff --git a/configs/at91sam9x5ek_mmc_defconfig b/configs/at91sam9x5ek_mmc_defconfig
index 5ccbdb9..6964d58 100644
--- a/configs/at91sam9x5ek_mmc_defconfig
+++ b/configs/at91sam9x5ek_mmc_defconfig
@@ -6,7 +6,8 @@ BR2_arm926t=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Creation of the SD card image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/at91sam9x5ek_mmc/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/at91sam9x5ek_mmc/genimage.cfg"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index e84bae3..931cf7d 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -15,7 +15,8 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 # Needed for usb-utils
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 # Creation of the SD card image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/at91sam9x5ek_mmc/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/at91sam9x5ek_mmc/genimage.cfg"
 
 # Kernel
 BR2_LINUX_KERNEL=y
