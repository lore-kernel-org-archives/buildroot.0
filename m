From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 01:28:10 +0100
Subject: [Buildroot] [git commit] system: move init system option above /dev
	management.
Message-ID: <20131111002942.6FDAD9BB7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b90a82cda00d4f5c449e5bb89621d48b1691e37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option to choose init system was below the one for /dev management.
As Systemd forces the use of udev, it is logical to swap them.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in |   58 +++++++++++++++++++++++++++---------------------------
 1 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 6418d52..266e709 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -67,35 +67,6 @@ config BR2_TARGET_GENERIC_PASSWD_METHOD
 	default "sha-512"   if BR2_TARGET_GENERIC_PASSWD_SHA512
 
 choice
-	prompt "/dev management"
-	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
-
-config BR2_ROOTFS_DEVICE_CREATION_STATIC
-	bool "Static using device table"
-
-config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
-	bool "Dynamic using devtmpfs only"
-
-config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
-	bool "Dynamic using mdev"
-	select BR2_PACKAGE_BUSYBOX
-
-config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	bool "Dynamic using udev"
-	depends on BR2_LARGEFILE # udev
-	depends on BR2_USE_WCHAR # udev
-	depends on !BR2_PREFER_STATIC_LIB # udev -> kmod
-	select BR2_PACKAGE_UDEV
-
-comment "udev needs a toolchain w/ largefile, wchar"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
-
-comment "udev doesn't work with 'prefer static libraries'"
-	depends on BR2_PREFER_STATIC_LIB
-
-endchoice
-
-choice
 	prompt "Init system"
 	default BR2_INIT_BUSYBOX
 
@@ -129,6 +100,35 @@ config BR2_INIT_NONE
 
 endchoice
 
+choice
+	prompt "/dev management"
+	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
+
+config BR2_ROOTFS_DEVICE_CREATION_STATIC
+	bool "Static using device table"
+
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
+	bool "Dynamic using devtmpfs only"
+
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
+	bool "Dynamic using mdev"
+	select BR2_PACKAGE_BUSYBOX
+
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	bool "Dynamic using udev"
+	depends on BR2_LARGEFILE # udev
+	depends on BR2_USE_WCHAR # udev
+	depends on !BR2_PREFER_STATIC_LIB # udev -> kmod
+	select BR2_PACKAGE_UDEV
+
+comment "udev needs a toolchain w/ largefile, wchar"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+
+comment "udev doesn't work with 'prefer static libraries'"
+	depends on BR2_PREFER_STATIC_LIB
+
+endchoice
+
 config BR2_ROOTFS_DEVICE_TABLE
 	string "Path to the permission tables"
 	default "system/device_table.txt"
