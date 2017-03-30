From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 30 Mar 2017 08:29:37 +0300
Subject: [Buildroot] [PATCH] lvm2: disable build with uClibc-ng
Message-ID: <419d2c04c289c8baac8b8d29f3e85a91d07cb6c8.1490851777.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc-ng is missing implementation of floorl() and nearbyintl() from the math
library.

Fixes:
http://autobuild.buildroot.net/results/733/733c4d52f22d5f104b835d0f1c64e8a555ec1339/
http://autobuild.buildroot.net/results/9ce/9ce371b59f0113d10261ede919a7e4f2ce377b3c/
http://autobuild.buildroot.net/results/e48/e48fbec55160428b84c8d3b2ca957e8f6432c8e1/

and more.

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/cryptsetup/Config.in    | 5 +++--
 package/dmraid/Config.in        | 5 +++--
 package/docker-engine/Config.in | 1 +
 package/lvm2/Config.in          | 6 ++++--
 package/udisks/Config.in        | 6 ++++--
 5 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 3ca23ba72137..42cf3ab17a88 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # lvm2
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_UTIL_LINUX
@@ -15,7 +16,7 @@ config BR2_PACKAGE_CRYPTSETUP
 
 	  https://gitlab.com/cryptsetup/cryptsetup
 
-comment "cryptsetup needs a glibc or uClibc toolchain w/ threads, dynamic library"
+comment "cryptsetup needs a glibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 583f3f272cfb..61976bbb27c7 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DMRAID
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # lvm2
 	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
@@ -12,7 +13,7 @@ config BR2_PACKAGE_DMRAID
 	  dmraid uses the Linux device-mapper to create devices with
 	  respective mappings for the ATARAID sets discovered.
 
-comment "dmraid needs a glibc or uClibc toolchain w/ threads, dynamic library"
+comment "dmraid needs a glibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 7cf0d9e1ae59..8cde4a499bc2 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -47,6 +47,7 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # lvm2
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_LVM2_APP_LIBRARY
 	help
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 0f606494ba35..b28b1976da59 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LVM2
 	depends on !BR2_STATIC_LIBS # It fails to build statically
 	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # missing floorl(), nearbyintl()
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and disk
@@ -38,6 +39,7 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 
 endif
 
-comment "lvm2 needs a glibc or uClibc toolchain w/ threads, dynamic library"
+comment "lvm2 needs a glibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 029860fc5c4d..475f4986e1c7 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_UDISKS
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # lvm2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
@@ -40,7 +41,8 @@ comment "udisks needs udev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
 
-comment "udisks needs a glibc or uClibc toolchain w/ wchar, threads, dynamic library"
+comment "udisks needs a glibc toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL \
+		|| BR2_TOOLCHAIN_USES_UCLIBC
-- 
2.11.0
