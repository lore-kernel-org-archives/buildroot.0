From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 21 Jun 2016 02:35:01 -0300
Subject: [Buildroot] [PATCH] minnowboard-max: Enable serial and HDMI consoles
Message-ID: <1466487301-7585-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following what's done in Raspberry Pi's defconfigs, let's
unify the consoles in Minnowboard Max defconfigs, providing
consoles on HDMI and serial port.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 board/minnowboard/post-build.sh             | 5 +++++
 board/minnowboard/readme.txt                | 3 +++
 configs/minnowboard_max-graphical_defconfig | 1 -
 configs/minnowboard_max_defconfig           | 1 -
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/board/minnowboard/post-build.sh b/board/minnowboard/post-build.sh
index f3a11e99f0f5..f03a607b9b4d 100755
--- a/board/minnowboard/post-build.sh
+++ b/board/minnowboard/post-build.sh
@@ -3,3 +3,8 @@
 # $2    board name
 
 cp -v board/minnowboard/grub-${2}.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
+
+# Add a console on tty1
+grep -qE '^tty0::' ${TARGET_DIR}/etc/inittab || \
+sed -i '/GENERIC_SERIAL/a\
+tty0::respawn:/sbin/getty -L  tty0 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
diff --git a/board/minnowboard/readme.txt b/board/minnowboard/readme.txt
index 8cf35b79c562..f76cd77c3403 100644
--- a/board/minnowboard/readme.txt
+++ b/board/minnowboard/readme.txt
@@ -23,6 +23,9 @@ How to get started with the MinnowBoard (MAX)
 
   $ dd if=output/images/sdcard.img of=/dev/mmcblk0; sync
 
+  The system starts two consoles: one on the serial port
+  and one on HDMI.
+
 3. Enjoy
 
 Additional information about this board can be found at
diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index a5f60a7e3c68..d84544be86c5 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -9,7 +9,6 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System configuration
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-BR2_TARGET_GENERIC_GETTY_PORT="tty0"
 BR2_ROOTFS_OVERLAY="board/minnowboard/fs-overlay-graphical"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 1bb22f9ec132..0adb382f0c4b 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -3,7 +3,6 @@ BR2_x86_64=y
 BR2_x86_atom=y
 
 # Misc
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
-- 
2.7.0
