From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 10:03:23 +0100
Subject: [Buildroot] [git commit] gtkmm3: bump to version 3.18.0
Message-ID: <20160322090347.8FDF680503@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ee94a224b70edbcb86d0502f5dbe0a58537a3bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required to nicely match the previous libgtk3 major version bump.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gtkmm3/Config.in   | 16 ++++++++++------
 package/gtkmm3/gtkmm3.hash |  4 ++--
 package/gtkmm3/gtkmm3.mk   | 13 +------------
 3 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index 238a8cd..8859f6e 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -1,3 +1,12 @@
+comment "gtkmm3 needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "gtkmm3 needs an OpenGL EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+
 config BR2_PACKAGE_GTKMM3
 	bool "gtkmm3"
 	# Broken on existing external/internal nios2 toolchains,
@@ -11,6 +20,7 @@ config BR2_PACKAGE_GTKMM3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
+	depends on BR2_PACKAGE_HAS_LIBEGL # libgtk3 -> libepoxy
 	select BR2_PACKAGE_ATKMM
 	select BR2_PACKAGE_CAIROMM
 	select BR2_PACKAGE_GLIBMM
@@ -21,9 +31,3 @@ config BR2_PACKAGE_GTKMM3
 	  The gtkmm3 package is a set of C++ bindings for GTK 3.
 
 	  http://www.gtkmm.org/
-
-comment "gtkmm3 needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
index 49e2f76..fcbadab 100644
--- a/package/gtkmm3/gtkmm3.hash
+++ b/package/gtkmm3/gtkmm3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.14/gtkmm-3.14.0.sha256sum
-sha256	d9f528a62c6ec226fa08287c45c7465b2dce5aae5068e9ac48d30a64a378e48b	gtkmm-3.14.0.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.18/gtkmm-3.18.0.sha256sum
+sha256	829fa113daed74398c49c3f2b7672807f58ba85d0fa463f5bc726e1b0138b86b	gtkmm-3.18.0.tar.xz
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index 034cdf9..a895d85 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GTKMM3_VERSION_MAJOR = 3.14
+GTKMM3_VERSION_MAJOR = 3.18
 GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).0
 GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
 GTKMM3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
@@ -13,15 +13,4 @@ GTKMM3_LICENSE_FILES = COPYING COPYING.tools
 GTKMM3_INSTALL_STAGING = YES
 GTKMM3_DEPENDENCIES = atkmm cairomm glibmm libgtk3 libsigc pangomm host-pkgconf
 
-# Explicit use of C++11 to build with newer *mm dependencies that require C++11.
-#
-# The most recent release of *mm-related libraries require C++11. This project's
-# dependencies (ex. libpangomm) are updated and enforce the C++11 standard.
-# Since the gtkmm3 must match the libgtk3 version, the useable version of
-# gtkmm3 does not have this enforcement; however, to build with the most
-# recent version of the dependencies, gtkmm3 requires to be built with
-# `-std=c++11`. The following enforces C++11 standard. When libgtk3 is updated,
-# followed by a gtkmm3 update, this flag modification can be removed.
-GTKMM3_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -std=c++11"
-
 $(eval $(autotools-package))
