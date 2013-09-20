From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 20 Sep 2013 14:24:02 +0200
Subject: [Buildroot] [PATCH v2 1/6] system: move init system option above
	/dev management.
In-Reply-To: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1379679847-16141-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The option to choose init system was below the one for /dev management.
As Systemd forces the use of udev, it is logical to swap them.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 system/Config.in |   58 +++++++++++++++++++++++++++---------------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 9d4e837..1fe4127 100644
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
-comment "udev requires a toolchain with LARGEFILE + WCHAR support"
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

@@ -128,6 +99,35 @@ config BR2_INIT_NONE

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
+comment "udev requires a toolchain with LARGEFILE + WCHAR support"
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
--
1.7.9.5
