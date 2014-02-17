From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 17 Feb 2014 10:58:46 +0100
Subject: [Buildroot] [PATCH] lvm2: disable static builds
Message-ID: <1392631126-15817-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PREFER_STATIC_LIB is defined it still try to build the shared
executables and it fails.

Fixes:
http://autobuild.buildroot.net/results/b0b/b0b386969459dda9c294f1ccb4927ca225fa6bdd/

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/cryptsetup/Config.in | 5 +++--
 package/dmraid/Config.in     | 5 +++--
 package/lvm2/Config.in       | 5 +++--
 package/udisks/Config.in     | 6 ++++--
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 28073f4..9fbe74c 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_LARGEFILE # lvm2, util-linux
 	depends on BR2_USE_MMU # lvm2
+	depends on !BR2_PREFER_STATIC_LIB # lvm2
 	depends on BR2_USE_WCHAR # util-linux
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
@@ -14,6 +15,6 @@ config BR2_PACKAGE_CRYPTSETUP
 
 	  https://code.google.com/p/cryptsetup/
 
-comment "cryptsetup needs a toolchain w/ largefile, wchar"
+comment "cryptsetup needs a toolchain w/ largefile, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR  || BR2_PREFER_STATIC_LIB
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index bfdd89b..90aca29 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DMRAID
 	bool "dmraid"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # lvm2
+	depends on !BR2_PREFER_STATIC_LIB # lvm2
 	# triggers gcc ice
 	depends on !BR2_arc
 	select BR2_PACKAGE_LVM2
@@ -12,7 +13,7 @@ config BR2_PACKAGE_DMRAID
 	  dmraid uses the Linux device-mapper to create devices with
 	  respective mappings for the ATARAID sets discovered.
 
-comment "dmraid needs a toolchain w/ largefile"
+comment "dmraid needs a toolchain w/ largefile, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE
+	depends on !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
 	depends on !BR2_arc
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 5d6209fc1..3f8a52d 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LVM2
 	bool "lvm2 & device mapper"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # needs fork()
+	depends on !BR2_PREFER_STATIC_LIB # It fails to build statically
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and disk
@@ -33,6 +34,6 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 
 endif
 
-comment "lvm2 needs a toolchain w/ largefile"
+comment "lvm2 needs a toolchain w/ largefile, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE
+	depends on !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index e9539a3..b398260 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_UDISKS
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
 	depends on BR2_USE_MMU # lvm2
+	depends on !BR2_PREFER_STATIC_LIB # lvm2
 	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_UDEV_ALL_EXTRAS
 	select BR2_PACKAGE_DBUS
@@ -36,8 +37,9 @@ config BR2_PACKAGE_UDISKS_LVM2
 
 endif
 
-comment "udisks needs udev /dev management and a toolchain w/ wchar, threads"
+comment "udisks needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_avr32
 	depends on BR2_USE_MMU
 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS  || \
+		BR2_PREFER_STATIC_LIB
-- 
1.9.0
