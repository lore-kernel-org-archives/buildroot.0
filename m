From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 15 Apr 2016 12:56:05 -0300
Subject: [Buildroot] [PATCH v2 2/4] board/minnowboard: Unify Minnowboard and
	Minnowboard MAX boards
In-Reply-To: <1460735767-2577-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460735767-2577-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460735767-2577-3-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Given Minnowboard and Minnowboard MAX boards are very similar,
it's desirable to unify the support for them.

This commit does the following:

  1) Remove Minnowboard MAX's genimage.cfg, post-build.sh
     and post-image.sh. These are identical to Minnowboard's.

  2) Move Minnowboard MAX's linux config, and rename it.

     It would be lovely to have a single kernel config file.
     The kernel size penalty involved in adding support for
     all the peripherals on both boards is small enough to
     justify this.

     However, the original Minnowboard has some GPIO buttons
     that need to be registered by the kernel. This is not
     upstreamed, and hence we need to use the yocto v3.8 kernel
     to have this support.

  3) Rename each grub config to grub-{board}.cfg.

  4) Modify (the now unique) post-build script to use
     a different grub config, according to the board.

  5) Update both defconfigs, as per the above changes.

  6) Finally, update the readme.txt.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
--
Changes from v1:

  * New patch, not present in v1.
---
 board/minnowboard-max/genimage.cfg                 | 34 ----------------------
 board/minnowboard-max/post-build.sh                |  2 --
 board/minnowboard-max/post-image.sh                | 13 ---------
 board/minnowboard-max/readme.txt                   | 25 ----------------
 .../grub-minnowboard-max.cfg}                      |  0
 .../minnowboard/{grub.cfg => grub-minnowboard.cfg} |  0
 .../linux.config => minnowboard/linux-4.4.config}  |  0
 board/minnowboard/post-build.sh                    |  5 +++-
 board/minnowboard/readme.txt                       |  4 +++
 configs/minnowboard_defconfig                      |  1 +
 configs/minnowboard_max_defconfig                  |  7 +++--
 11 files changed, 13 insertions(+), 78 deletions(-)
 delete mode 100644 board/minnowboard-max/genimage.cfg
 delete mode 100755 board/minnowboard-max/post-build.sh
 delete mode 100755 board/minnowboard-max/post-image.sh
 delete mode 100644 board/minnowboard-max/readme.txt
 rename board/{minnowboard-max/grub.cfg => minnowboard/grub-minnowboard-max.cfg} (100%)
 rename board/minnowboard/{grub.cfg => grub-minnowboard.cfg} (100%)
 rename board/{minnowboard-max/linux.config => minnowboard/linux-4.4.config} (100%)

diff --git a/board/minnowboard-max/genimage.cfg b/board/minnowboard-max/genimage.cfg
deleted file mode 100644
index 6cf787430752..000000000000
--- a/board/minnowboard-max/genimage.cfg
+++ /dev/null
@@ -1,34 +0,0 @@
-# Create an image of the efi partition
-image efi-part.vfat {
-	vfat {
-		file startup.nsh {
-			image = "efi-part/startup.nsh"
-		}
-		file EFI {
-			image = "efi-part/EFI"
-		}
-		file bzImage {
-			image = "bzImage"
-		}
-	}
-	size=10M
-}
-
-# Create the sdcard image, pulling in
-#  * the image created by buildroot
-#  * the efi-partition created above
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xEF
-		image = "efi-part.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-		size = 512M
-	}
-}
diff --git a/board/minnowboard-max/post-build.sh b/board/minnowboard-max/post-build.sh
deleted file mode 100755
index 9f86d390f2ef..000000000000
--- a/board/minnowboard-max/post-build.sh
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-cp board/minnowboard-max/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
diff --git a/board/minnowboard-max/post-image.sh b/board/minnowboard-max/post-image.sh
deleted file mode 100755
index e90dd6b8cf10..000000000000
--- a/board/minnowboard-max/post-image.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh -e
-
-GENIMAGE_CFG="board/minnowboard-max/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-    --rootpath "${TARGET_DIR}" \
-    --tmppath "${GENIMAGE_TMP}" \
-    --inputpath "${BINARIES_DIR}" \
-    --outputpath "${BINARIES_DIR}" \
-    --config "${GENIMAGE_CFG}"
diff --git a/board/minnowboard-max/readme.txt b/board/minnowboard-max/readme.txt
deleted file mode 100644
index dfad2aba2123..000000000000
--- a/board/minnowboard-max/readme.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-How to get started with the Minnow Board MAX
-============================================
-
-1. Build
-
-  Apply the defconfig:
-
-  $ make minnowboard_max_defconfig
-
-  Add any additional packages required and build:
-
-  $ make
-
-2. Write the SD card
-
-  The build process will create a SD card image in output/images.
-  Write the image to an mSD card, insert into the Minnowboard MAX
-  and power the board on.
-
-  $ dd if=output/images/sdcard.img of=/dev/mmcblk0; sync
-
-3. Enjoy
-
-Additional information about this board can be found at
-http://www.minnowboard.org/ or http://wiki.minnowboard.org/MinnowBoard_MAX
diff --git a/board/minnowboard-max/grub.cfg b/board/minnowboard/grub-minnowboard-max.cfg
similarity index 100%
rename from board/minnowboard-max/grub.cfg
rename to board/minnowboard/grub-minnowboard-max.cfg
diff --git a/board/minnowboard/grub.cfg b/board/minnowboard/grub-minnowboard.cfg
similarity index 100%
rename from board/minnowboard/grub.cfg
rename to board/minnowboard/grub-minnowboard.cfg
diff --git a/board/minnowboard-max/linux.config b/board/minnowboard/linux-4.4.config
similarity index 100%
rename from board/minnowboard-max/linux.config
rename to board/minnowboard/linux-4.4.config
diff --git a/board/minnowboard/post-build.sh b/board/minnowboard/post-build.sh
index e3f4a92ec943..f3a11e99f0f5 100755
--- a/board/minnowboard/post-build.sh
+++ b/board/minnowboard/post-build.sh
@@ -1,2 +1,5 @@
 #!/bin/sh
-cp board/minnowboard/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
+# args from BR2_ROOTFS_POST_SCRIPT_ARGS
+# $2    board name
+
+cp -v board/minnowboard/grub-${2}.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
diff --git a/board/minnowboard/readme.txt b/board/minnowboard/readme.txt
index 3a24fdc162b8..9d59a2f4546a 100644
--- a/board/minnowboard/readme.txt
+++ b/board/minnowboard/readme.txt
@@ -7,6 +7,10 @@ How to get started with the MinnowBoard
 
   $ make minnowboard_defconfig
 
+  Or, for the Minnowboard MAX board:
+
+  $ make minnowboard_max_defconfig
+
   Add any additional packages required and build:
 
   $ make
diff --git a/configs/minnowboard_defconfig b/configs/minnowboard_defconfig
index 25c63ccbeead..f4afc86bf814 100644
--- a/configs/minnowboard_defconfig
+++ b/configs/minnowboard_defconfig
@@ -6,6 +6,7 @@ BR2_x86_atom=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPCH0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="minnowboard"
 
 # Linux headers same as kernel, a 3.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 05df9878ccf0..df1759d19f80 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -4,8 +4,9 @@ BR2_x86_atom=y
 
 # Misc
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard-max/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard-max/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="minnowboard-max"
 
 # Linux headers same as kernel, a 4.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
@@ -22,7 +23,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard-max/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.4.config"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
-- 
2.7.0
