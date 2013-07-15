From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:35 -0500
Subject: [Buildroot] [PATCH 52/67] udisks: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-53-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

minor cleanups

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/udisks/Config.in | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index a50b3ea..dca23ea 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -1,12 +1,13 @@
 config BR2_PACKAGE_UDISKS
 	bool "udisks"
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
 	depends on BR2_USE_MMU # lvm2
 	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_UDEV_ALL_EXTRAS
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
+	depends on BR2_USE_WCHAR # dbus-glib -> glib2
 	select BR2_PACKAGE_SG3_UTILS
 	select BR2_PACKAGE_POLKIT
 	select BR2_PACKAGE_PARTED
@@ -24,12 +25,16 @@ config BR2_PACKAGE_UDISKS
 
 	  http://www.freedesktop.org/wiki/Software/udisks
 
+if BR2_PACKAGE_UDISKS
+
 config BR2_PACKAGE_UDISKS_LVM2
 	bool "lvm2 support"
-	depends on BR2_PACKAGE_UDISKS
 	select BR2_PACKAGE_LVM2_APP_LIBRARY
 	help
 	  Enable LVM2 support
 
-comment "udisks requires /dev mgmnt set to udev under System configuration"
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+endif
+
+comment "udisks requires /dev mgmnt set to udev under System configuration and a toolchain with WCHAR and threading support"
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
