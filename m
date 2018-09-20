From: =?UTF-8?q?Gr=C3=A9goire=20Delattre?= <greg@quimbo.fr>
Date: Thu, 20 Sep 2018 16:33:19 +0200
Subject: [Buildroot] [PATCH 1/1] board/pc: improve image generation
Message-ID: <20180920143318.21284-1-greg@quimbo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gr?goire Delattre <gregoire.delattre@gmail.com>

Copy the grub configuration files before creating the filesystem
image.

Signed-off-by: Gr?goire Delattre <gregoire.delattre@gmail.com>
---
 board/pc/post-build.sh           | 12 ++++++++++++
 board/pc/post-image.sh           | 14 --------------
 board/pc/pre-genimage.sh         |  8 ++++++++
 configs/pc_x86_64_bios_defconfig |  3 ++-
 configs/pc_x86_64_efi_defconfig  |  3 ++-
 5 files changed, 24 insertions(+), 16 deletions(-)
 create mode 100755 board/pc/post-build.sh
 delete mode 100755 board/pc/post-image.sh
 create mode 100755 board/pc/pre-genimage.sh

diff --git a/board/pc/post-build.sh b/board/pc/post-build.sh
new file mode 100755
index 0000000000..55f4cf1a96
--- /dev/null
+++ b/board/pc/post-build.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+set -e
+
+BOARD_DIR=$(dirname "$0")
+
+# Detect boot strategy, EFI or BIOS
+if [ -f "$BINARIES_DIR/efi-part/startup.nsh" ]; then
+  cp -f "$BOARD_DIR/grub-efi.cfg" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
+else
+  cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
+fi
diff --git a/board/pc/post-image.sh b/board/pc/post-image.sh
deleted file mode 100755
index bdd0847ec5..0000000000
--- a/board/pc/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-
-# Detect boot strategy, EFI or BIOS
-if [ -f ${BINARIES_DIR}/efi-part/startup.nsh ]; then
-  cp -f ${BOARD_DIR}/grub-efi.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
-else
-  cp -f ${BOARD_DIR}/grub-bios.cfg ${TARGET_DIR}/boot/grub/grub.cfg
-  # Copy grub 1st stage to binaries, required for genimage
-  cp -f ${HOST_DIR}/lib/grub/i386-pc/boot.img ${BINARIES_DIR}
-fi
-
-exit $?
diff --git a/board/pc/pre-genimage.sh b/board/pc/pre-genimage.sh
new file mode 100755
index 0000000000..21066c0296
--- /dev/null
+++ b/board/pc/pre-genimage.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+set -e
+
+[ -f "$TARGET_DIR/boot/grub/grub.cfg" ] || exit 0
+
+# Copy grub 1st stage to binaries, required for genimage
+cp -f "$HOST_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 47787bc118..8c3e8994d9 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -19,7 +19,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/pre-genimage.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
 
 # Linux headers same as kernel, a 4.13 series
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 67ba5bcf5b..6a93eacfa3 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -22,7 +22,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-efi.cfg"
 
 # Linux headers same as kernel, a 4.13 series
-- 
2.19.0
