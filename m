From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 22:58:14 +0200
Subject: [Buildroot] [git commit] configs/lego_ev3: bump kernel to 4.4 series
Message-ID: <20161015205836.7910781F03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46a373e2f59356f70a551507b7b8dc2943fe49ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump kernel revision used by lego_ev3_defconfig to the latest tag from
ev3dev, as suggested by Peter. This is a 4.4 series kernel, which has the
added benefit of not necessitating a specific gcc to boot.

We need a patch to create an empty drivers/lego/Kconfig file for the build
to succeed though, as the ev3dev kernel normally expects a drivers tree to
be checked out there.

Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Create-empty-drivers-lego-Kconfig.patch   | 24 ++++++++++++++++++++++
 board/lego/ev3/readme.txt                          | 10 +++------
 configs/lego_ev3_defconfig                         | 14 ++++++-------
 3 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/board/lego/ev3/patches/linux/0001-Create-empty-drivers-lego-Kconfig.patch b/board/lego/ev3/patches/linux/0001-Create-empty-drivers-lego-Kconfig.patch
new file mode 100644
index 0000000..614d53d
--- /dev/null
+++ b/board/lego/ev3/patches/linux/0001-Create-empty-drivers-lego-Kconfig.patch
@@ -0,0 +1,24 @@
+From 72c5727488f10160abfadcc77dd9763c4408b5e9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
+Date: Sat, 15 Oct 2016 16:23:31 +0200
+Subject: [PATCH] Create empty drivers/lego/Kconfig
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
+---
+ drivers/lego/Kconfig | 1 +
+ 1 file changed, 1 insertion(+)
+ create mode 100644 drivers/lego/Kconfig
+
+diff --git a/drivers/lego/Kconfig b/drivers/lego/Kconfig
+new file mode 100644
+index 0000000..d7cbf4f
+--- /dev/null
++++ b/drivers/lego/Kconfig
+@@ -0,0 +1 @@
++# Empty Kconfig just to make source from drivers/Kconfig succeed.
+-- 
+2.9.3
+
diff --git a/board/lego/ev3/readme.txt b/board/lego/ev3/readme.txt
index 3c0bd2e..7d9ec4f 100644
--- a/board/lego/ev3/readme.txt
+++ b/board/lego/ev3/readme.txt
@@ -16,11 +16,8 @@ See:
 
 The buildroot configuration uses the Linux kernel of the ev3dev project.
 See:
-- http://botbench.com/blog/2013/07/31/lego-mindstorms-ev3-source-code-available/
-- https://github.com/mindboards/ev3sources
-
-Note that the EV3 configuration uses gcc 4.7, as the boot is broken with gcc
-4.8.
+- https://github.com/ev3dev/ev3-kernel/
+- http://www.ev3dev.org/
 
 How it works
 ============
@@ -61,13 +58,12 @@ After building, you should obtain this tree:
     ????????? rootfs.ext3 -> rootfs.ext2
     ????????? uImage
 
-
 Prepare your SDcard
 ===================
 
 The following ??SD card layout is recommended:
 
-- First partition formated with a FAT filesystem, containing the uImage.
+- First partition formatted with a FAT filesystem, containing the uImage.
 - Second partition formatted as ext2 or ext3, containing the root filesystem.
 
 Create the SDcard partition table
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index d49fa06..1ddc4f9 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -2,23 +2,23 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# toolchain
-# Use gcc 4.7, as gcc 4.8 breaks the boot.
-BR2_GCC_VERSION_4_7_X=y
+# patches
+BR2_GLOBAL_PATCH_DIR="board/lego/ev3/patches"
 
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 
-# Linux headers same as kernel, a 3.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mindboards/ev3dev-kernel.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v3.3.0-2-ev3dev_0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/ev3dev/ev3dev-kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v4.4.19-15-ev3dev-ev3_1"
 BR2_LINUX_KERNEL_DEFCONFIG="ev3dev"
+BR2_LINUX_KERNEL_UIMAGE=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
