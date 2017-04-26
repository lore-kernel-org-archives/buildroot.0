From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 26 Apr 2017 09:26:47 +0200
Subject: [Buildroot] [PATCH] Revert "lvm2: disable build with uClibc-ng"
Message-ID: <20170426072646.GA31873@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 66f136a9f64b880eefa769c1261916773d8f28c0.

Issue fixed with uClibc-ng update to 1.0.24.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/cryptsetup/Config.in    | 5 ++---
 package/dmraid/Config.in        | 5 ++---
 package/docker-engine/Config.in | 1 -
 package/lvm2/Config.in          | 6 ++----
 package/udisks/Config.in        | 6 ++----
 5 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 42cf3ab..3ca23ba 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # lvm2
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_UTIL_LINUX
@@ -16,7 +15,7 @@ config BR2_PACKAGE_CRYPTSETUP
 
 	  https://gitlab.com/cryptsetup/cryptsetup
 
-comment "cryptsetup needs a glibc toolchain w/ threads, dynamic library"
+comment "cryptsetup needs a glibc or uClibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_USES_UCLIBC
+		|| BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 61976bb..583f3f2 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_DMRAID
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # lvm2
 	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
@@ -13,7 +12,7 @@ config BR2_PACKAGE_DMRAID
 	  dmraid uses the Linux device-mapper to create devices with
 	  respective mappings for the ATARAID sets discovered.
 
-comment "dmraid needs a glibc toolchain w/ threads, dynamic library"
+comment "dmraid needs a glibc or uClibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_USES_UCLIBC
+		|| BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 8cde4a4..7cf0d9e 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -47,7 +47,6 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # lvm2
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_LVM2_APP_LIBRARY
 	help
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index b28b197..0f60649 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_LVM2
 	depends on !BR2_STATIC_LIBS # It fails to build statically
 	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # missing floorl(), nearbyintl()
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and disk
@@ -39,7 +38,6 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 
 endif
 
-comment "lvm2 needs a glibc toolchain w/ threads, dynamic library"
+comment "lvm2 needs a glibc or uClibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 475f498..029860f 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_UDISKS
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # lvm2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
@@ -41,8 +40,7 @@ comment "udisks needs udev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
 
-comment "udisks needs a glibc toolchain w/ wchar, threads, dynamic library"
+comment "udisks needs a glibc or uClibc toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL \
-		|| BR2_TOOLCHAIN_USES_UCLIBC
+		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
-- 
2.1.4
