From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 23:25:32 +0200
Subject: [Buildroot] [git commit] package/lvm2: disable for musl toolchains
Message-ID: <20161025212733.BC9198082D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6874d691cea4a37f1cfcec0e7cf124f283fc30ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lvm2 doesn't build with musl toolchains due to several assignment of read-only
variable like stdin, stdout and stderr.
Also, it use mallinfo function which is not available with musl.

These issues has been reported upstream [2] but some of them remains
even with the latest stable release 2.02.163.

Fixes:
http://autobuild.buildroot.net/results/3d4df873a3d4fa199e03d8aa8694eafeac474e5a
[...]

[1] http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
[2] https://www.redhat.com/archives/linux-lvm/2016-February/msg00024.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptsetup/Config.in    | 6 ++++--
 package/dmraid/Config.in        | 6 ++++--
 package/docker-engine/Config.in | 1 +
 package/lvm2/Config.in          | 6 ++++--
 package/udisks/Config.in        | 5 +++--
 5 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index cd95956..d2bf3b4 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
+	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
 	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
@@ -15,6 +16,7 @@ config BR2_PACKAGE_CRYPTSETUP
 
 	  https://gitlab.com/cryptsetup/cryptsetup
 
-comment "cryptsetup needs a toolchain w/ wchar, threads, dynamic library"
+comment "cryptsetup needs a glibc or uClibc toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 4a8cf61..583f3f2 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DMRAID
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
+	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
 	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
@@ -11,6 +12,7 @@ config BR2_PACKAGE_DMRAID
 	  dmraid uses the Linux device-mapper to create devices with
 	  respective mappings for the ATARAID sets discovered.
 
-comment "dmraid needs a toolchain w/ threads, dynamic library"
+comment "dmraid needs a glibc or uClibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 5c4e0ee..b99b121 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -42,6 +42,7 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
+	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_LVM2_APP_LIBRARY
 	help
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index b3a6593..23dff70 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_LVM2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # needs fork()
 	depends on !BR2_STATIC_LIBS # It fails to build statically
+	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and disk
@@ -34,6 +36,6 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 
 endif
 
-comment "lvm2 needs a toolchain w/ threads, dynamic library"
+comment "lvm2 needs a glibc or uClibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 8b8fd28..029860f 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_UDISKS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
+	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
@@ -39,7 +40,7 @@ comment "udisks needs udev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
 
-comment "udisks needs a toolchain w/ wchar, threads, dynamic library"
+comment "udisks needs a glibc or uClibc toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
