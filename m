From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 1 Mar 2017 09:30:43 +0100
Subject: [Buildroot] [PATCH 2/5] board/minnowboard: remove support for
	minnowboard
In-Reply-To: <20170301083046.13226-1-arnout@mind.be>
References: <20170301083046.13226-1-arnout@mind.be>
Message-ID: <20170301083046.13226-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The scripts used for the minnowboards were generic for MinnowBoard and
MinnowBoard MAX. Since we removed the original MinnowBoard, this isn't
necessary anymore.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Separate commit because we may not want to do this: it doesn't hurt to
have this generic mechanism, and if later someone wants to re-add
MinnowBoard or add support for a new generation of the board, it's
convenient to still have it around.
---
 board/minnowboard/{grub-minnowboard-max.cfg => grub.cfg} | 0
 board/minnowboard/post-build.sh                          | 4 +---
 configs/minnowboard_max-graphical_defconfig              | 1 -
 configs/minnowboard_max_defconfig                        | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)
 rename board/minnowboard/{grub-minnowboard-max.cfg => grub.cfg} (100%)

diff --git a/board/minnowboard/grub-minnowboard-max.cfg b/board/minnowboard/grub.cfg
similarity index 100%
rename from board/minnowboard/grub-minnowboard-max.cfg
rename to board/minnowboard/grub.cfg
diff --git a/board/minnowboard/post-build.sh b/board/minnowboard/post-build.sh
index 45f7b527f3..24b8c0539e 100755
--- a/board/minnowboard/post-build.sh
+++ b/board/minnowboard/post-build.sh
@@ -1,8 +1,6 @@
 #!/bin/sh
-# args from BR2_ROOTFS_POST_SCRIPT_ARGS
-# $2    board name
 
-cp -v board/minnowboard/grub-${2}.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
+cp -v board/minnowboard/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
 
 # Add a console on tty1
 if [ -e ${TARGET_DIR}/etc/inittab ]; then
diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 1b95d8e5a1..ac363361ed 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -12,7 +12,6 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/minnowboard/fs-overlay-graphical"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="minnowboard-max"
 
 # Host packages
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 63190eaa48..fe43b5287c 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -6,7 +6,6 @@ BR2_x86_atom=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="minnowboard-max"
 
 # Linux headers same as kernel, a 4.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
-- 
2.11.0
