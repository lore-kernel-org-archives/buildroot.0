From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Fri, 1 Apr 2016 10:01:45 +0200
Subject: [Buildroot] [PATCH 2/3] configs: atmel: add sama5d4 xplained sd
	card image generation
In-Reply-To: <1459497706-1663-1-git-send-email-ludovic.desroches@atmel.com>
References: <1459497706-1663-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1459497706-1663-2-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use genimage to generate a sd card with a fat partition (at91bootstrap,
u-boot, kernel, dtbs) and an ext4 partition (rootfs).

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 board/atmel/sama5d4_xplained_mmc/genimage.cfg  | 34 ++++++++++++++++++++++++++
 board/atmel/sama5d4_xplained_mmc/post-image.sh | 16 ++++++++++++
 configs/atmel_sama5d4_xplained_mmc_defconfig   |  5 +++-
 3 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 board/atmel/sama5d4_xplained_mmc/genimage.cfg
 create mode 100755 board/atmel/sama5d4_xplained_mmc/post-image.sh

diff --git a/board/atmel/sama5d4_xplained_mmc/genimage.cfg b/board/atmel/sama5d4_xplained_mmc/genimage.cfg
new file mode 100644
index 0000000..b23ebe4
--- /dev/null
+++ b/board/atmel/sama5d4_xplained_mmc/genimage.cfg
@@ -0,0 +1,34 @@
+# Image for SD card boot on Atmel SAMA5D4 Xplained boards
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"at91-sama5d4_xplained.dtb",
+			"at91-sama5d4_xplained_hdmi.dtb",
+			"at91-sama5d4_xplained_pda4.dtb",
+			"at91-sama5d4_xplained_pda7.dtb",
+			"at91-sama5d4_xplained_pda7b.dtb",
+			"boot.bin",
+			"u-boot.bin"
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
diff --git a/board/atmel/sama5d4_xplained_mmc/post-image.sh b/board/atmel/sama5d4_xplained_mmc/post-image.sh
new file mode 100755
index 0000000..c82b189
--- /dev/null
+++ b/board/atmel/sama5d4_xplained_mmc/post-image.sh
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
diff --git a/configs/atmel_sama5d4_xplained_mmc_defconfig b/configs/atmel_sama5d4_xplained_mmc_defconfig
index e0374d7..eb16ad7 100644
--- a/configs/atmel_sama5d4_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_defconfig
@@ -4,6 +4,7 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/sama5d4_xplained_mmc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
@@ -12,6 +13,8 @@ BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained at91-sama5d4_xplained_hdmi at91-sama5d4_xplained_pda4 at91-sama5d4_xplained_pda7 at91-sama5d4_xplained_pda7b"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
@@ -23,4 +26,4 @@ BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.2"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d4_xplained_mmc"
-BR2_PACKAGE_HOST_SAM_BA=y
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.5.0
