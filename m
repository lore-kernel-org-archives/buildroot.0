From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 16:18:26 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] board/pc: ensure grub.cfg
 is copied to target filesystem
Message-ID: <20190123151902.0B65480FC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6140d6762b6fcb8fa64a0cf06f79bc3e637396de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Before this commit, the grub configuration file was copied to the
TARGET_DIR in a post-image hook, after the filesystem has been
generated. It was kinda working because the board/pc's grub
configuration and the default one are the same and the later was
copied during the build process of the grub2 package.

This commit ensures the custom board/pc grub configuration is copied at
the right time.

Signed-off-by: Gr??goire Delattre <gregoire.delattre@gmail.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0b28397a9bed339e9aca2acfe51b1f0c68dbee65)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/pc/post-build.sh           | 15 +++++++++++++++
 board/pc/post-image.sh           | 14 --------------
 configs/pc_x86_64_bios_defconfig |  3 ++-
 configs/pc_x86_64_efi_defconfig  |  3 ++-
 4 files changed, 19 insertions(+), 16 deletions(-)

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
index 47787bc118..6d9432d307 100644
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
