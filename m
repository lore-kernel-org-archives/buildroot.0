From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Apr 2016 23:19:25 +0200
Subject: [Buildroot] [git commit] board/minnowboard: Unify Minnowboard and
	Minnowboard MAX boards
Message-ID: <20160418211944.A49668041C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c084e951989ca18db4c36b32021727601cf8422
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: mention MAX in readme title]
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/minnowboard-max/genimage.cfg                 | 34 ----------------------
 board/minnowboard-max/post-build.sh                |  2 --
 board/minnowboard-max/post-image.sh                | 13 ---------
 board/minnowboard-max/readme.txt                   | 25 ----------------
 .../grub-minnowboard-max.cfg}                      |  0
 .../minnowboard/{grub.cfg => grub-minnowboard.cfg} |  0
 .../linux.config => minnowboard/linux-4.4.config}  |  0
 board/minnowboard/post-build.sh                    |  5 +++-
 board/minnowboard/readme.txt                       |  8 +++--
 configs/minnowboard_defconfig                      |  1 +
 configs/minnowboard_max_defconfig                  |  7 +++--
 11 files changed, 15 insertions(+), 80 deletions(-)

diff --git a/board/minnowboard-max/genimage.cfg b/board/minnowboard-max/genimage.cfg
deleted file mode 100644
index 6cf7874..0000000
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
index 9f86d39..0000000
--- a/board/minnowboard-max/post-build.sh
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-cp board/minnowboard-max/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
diff --git a/board/minnowboard-max/post-image.sh b/board/minnowboard-max/post-image.sh
deleted file mode 100755
index e90dd6b..0000000
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
index dfad2ab..0000000
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
index e3f4a92..f3a11e9 100755
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
index 3a24fdc..8cf35b7 100644
--- a/board/minnowboard/readme.txt
+++ b/board/minnowboard/readme.txt
@@ -1,5 +1,5 @@
-How to get started with the MinnowBoard
-========================================
+How to get started with the MinnowBoard (MAX)
+=============================================
 
 1. Build
 
@@ -7,6 +7,10 @@ How to get started with the MinnowBoard
 
   $ make minnowboard_defconfig
 
+  Or, for the Minnowboard MAX board:
+
+  $ make minnowboard_max_defconfig
+
   Add any additional packages required and build:
 
   $ make
diff --git a/configs/minnowboard_defconfig b/configs/minnowboard_defconfig
index 25c63cc..f4afc86 100644
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
index dfa1b6c..7c418c5 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -5,8 +5,9 @@ BR2_x86_atom=y
 # Misc
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard-max/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard-max/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="minnowboard-max"
 
 # Linux headers same as kernel, a 4.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
@@ -23,7 +24,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard-max/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.4.config"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
