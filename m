From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  6 Nov 2013 16:34:34 +0100
Subject: [Buildroot] [PATCH v3 1/5] system: move init system option above
	/dev management.
In-Reply-To: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1383752078-25315-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The option to choose init system was below the one for /dev management.
As Systemd forces the use of udev, it is logical to swap them.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 system/Config.in |   60 +++++++++++++++++++++++++++---------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 4c80087..1fe4127 100644
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
 
@@ -118,7 +89,7 @@ config BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SYSTEMD
 
-comment 'systemd needs udev /dev management and a toolchain w/ largefile, wchar, IPv6, threads'
+comment 'systemd requires largefile, wchar, IPv6, threads and udev support'
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && \
 		     BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && \
 		     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV)
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
