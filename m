From: =?UTF-8?q?Gr=C3=A9goire=20Delattre?= <greg@quimbo.fr>
Date: Fri, 12 Oct 2018 00:24:45 +0200
Subject: [Buildroot] [PATCH v2 1/1] board/pc: ensure grub.cfg is copied to
 target filesystem
In-Reply-To: <20181011214932.350ef220@windsurf>
References: <20181011214932.350ef220@windsurf>
Message-ID: <20181011222445.21185-1-greg@quimbo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gr?goire Delattre <gregoire.delattre@gmail.com>

Before this commit, the grub configuration file was copied to the
TARGET_DIR in a post-image hook, after the filesystem has been
generated. It was kinda working because the board/pc's grub
configuration and the default one are the same and the later was
copied during the build process of the grub2 package.

This commit ensures the custom board/pc grub configuration is copied at
the right time.

Signed-off-by: Gr?goire Delattre <gregoire.delattre@gmail.com>
---
 board/pc/post-build.sh           | 15 +++++++++++++++
 board/pc/post-image.sh           | 14 --------------
 configs/pc_x86_64_bios_defconfig |  3 ++-
 configs/pc_x86_64_efi_defconfig  |  3 ++-
 4 files changed, 19 insertions(+), 16 deletions(-)
 create mode 100755 board/pc/post-build.sh
 delete mode 100755 board/pc/post-image.sh

diff --git a/board/pc/post-build.sh b/board/pc/post-build.sh
new file mode 100755
index 0000000000..552d488160
--- /dev/null
+++ b/board/pc/post-build.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+
+set -e
+
+BOARD_DIR=$(dirname "$0")
+
+# Detect boot strategy, EFI or BIOS
+if [ -f "$BINARIES_DIR/efi-part/startup.nsh" ]; then
+    cp -f "$BOARD_DIR/grub-efi.cfg" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
+else
+    cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
+
+    # Copy grub 1st stage to binaries, required for genimage
+    cp -f "$HOST_DIR/lib/grub/i387-pc/boot.img" "$BINARIES_DIR"
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
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 1cfc0e424f..59e39a5ae7 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -19,7 +19,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
 
 # Linux headers same as kernel, a 4.18 series
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index bc99ca755b..b4190b9575 100644
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
 
 # Linux headers same as kernel, a 4.18 series
-- 
2.19.1
