From: David Lechner <david@lechnology.com>
Date: Sun, 30 Oct 2016 18:32:26 -0500
Subject: [Buildroot] [PATCH 4/4] board/lego/ev3: Use ev3dev linux ext for
	ev3dev drivers
In-Reply-To: <1477870346-4941-1-git-send-email-david@lechnology.com>
References: <1477870346-4941-1-git-send-email-david@lechnology.com>
Message-ID: <1477870346-4941-5-git-send-email-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This uses the ev3dev linux extension to compile the ev3dev drivers for
LEGO MINDSTORMS EV3.

Signed-off-by: David Lechner <david@lechnology.com>
---
 board/lego/ev3/linux_defconfig                     | 10 +++++++--
 .../0001-Create-empty-drivers-lego-Kconfig.patch   | 24 ----------------------
 board/lego/ev3/readme.txt                          |  4 ++--
 configs/lego_ev3_defconfig                         |  4 +---
 4 files changed, 11 insertions(+), 31 deletions(-)
 delete mode 100644 board/lego/ev3/patches/linux/0001-Create-empty-drivers-lego-Kconfig.patch

diff --git a/board/lego/ev3/linux_defconfig b/board/lego/ev3/linux_defconfig
index 998e6da..c26a241 100644
--- a/board/lego/ev3/linux_defconfig
+++ b/board/lego/ev3/linux_defconfig
@@ -80,6 +80,12 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
 # CONFIG_FIRMWARE_IN_KERNEL is not set
+CONFIG_LEGO_DRIVERS=y
+CONFIG_LEGOEV3_I2C=y
+CONFIG_LEGOEV3_BATTERY=y
+CONFIG_LEGOEV3_SOUND=y
+# CONFIG_LEGO_USER_DEVICES is not set
+CONFIG_WEDO=m
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
@@ -164,8 +170,8 @@ CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
 # CONFIG_LOGO_LINUX_CLUT224 is not set
-CONFIG_SOUND=m
-CONFIG_SND=m
+CONFIG_SOUND=y
+CONFIG_SND=y
 CONFIG_SND_SEQUENCER=m
 CONFIG_SND_SEQ_DUMMY=m
 CONFIG_SND_HRTIMER=m
diff --git a/board/lego/ev3/patches/linux/0001-Create-empty-drivers-lego-Kconfig.patch b/board/lego/ev3/patches/linux/0001-Create-empty-drivers-lego-Kconfig.patch
deleted file mode 100644
index 614d53d..0000000
--- a/board/lego/ev3/patches/linux/0001-Create-empty-drivers-lego-Kconfig.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 72c5727488f10160abfadcc77dd9763c4408b5e9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
-Date: Sat, 15 Oct 2016 16:23:31 +0200
-Subject: [PATCH] Create empty drivers/lego/Kconfig
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
----
- drivers/lego/Kconfig | 1 +
- 1 file changed, 1 insertion(+)
- create mode 100644 drivers/lego/Kconfig
-
-diff --git a/drivers/lego/Kconfig b/drivers/lego/Kconfig
-new file mode 100644
-index 0000000..d7cbf4f
---- /dev/null
-+++ b/drivers/lego/Kconfig
-@@ -0,0 +1 @@
-+# Empty Kconfig just to make source from drivers/Kconfig succeed.
--- 
-2.9.3
-
diff --git a/board/lego/ev3/readme.txt b/board/lego/ev3/readme.txt
index 878dd2e..b1cfecf 100644
--- a/board/lego/ev3/readme.txt
+++ b/board/lego/ev3/readme.txt
@@ -4,8 +4,7 @@ Intro
 =====
 
 This is the buildroot basic board support for the Lego Mindstorms EV3
-programmable brick. No support for sensors and drivers is provided for the
-moment.
+programmable brick.
 
 The Lego Mindstorms EV3 brick comprises a Texas Instruments AM1808 SoC, with
 an ARM 926EJ-S main processor running at 300 MHz.
@@ -17,6 +16,7 @@ See:
 The buildroot configuration uses the Linux kernel of the ev3dev project.
 See:
 - https://github.com/ev3dev/ev3-kernel/
+- https://github.com/ev3dev/lego-linux-drivers/
 - http://www.ev3dev.org/
 
 How it works
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index e96a689..1b4a26f 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -2,9 +2,6 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# patches
-BR2_GLOBAL_PATCH_DIR="board/lego/ev3/patches"
-
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
@@ -20,6 +17,7 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v4.4.19-15-ev3dev-ev3_1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/lego/ev3/linux_defconfig"
 BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_EXT_EV3DEV=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.7.4
