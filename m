From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  1 Nov 2015 19:07:40 +0100
Subject: [Buildroot] [PATCH v6 04/33] package/{efl packages}: reorder
	select/depends
In-Reply-To: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
References: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1446401289-9059-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As noticed by Yann [1], move the package dependencies
before selected packages/options.

[1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v6: new patch
---
 package/efl/libelementary/Config.in       |  4 ++--
 package/enlightenment/Config.in           | 22 +++++++++++-----------
 package/expedite/Config.in                |  6 +++---
 package/libevas-generic-loaders/Config.in |  4 ++--
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
index 4f62592..fcc7025 100644
--- a/package/efl/libelementary/Config.in
+++ b/package/efl/libelementary/Config.in
@@ -3,12 +3,12 @@ comment "libelementary needs a toolchain w/ threads, dynamic library"
 
 config BR2_PACKAGE_LIBELEMENTARY
 	bool "libelementary"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBEVAS
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_LIBEDJE
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
-	depends on !BR2_STATIC_LIBS
 	help
 	  Elementary is a widget toolkit and EFL wrapper and convenience
 	  library to make it easy to build applications and tools with UIs
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 58f8f39..9dad571 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -1,5 +1,16 @@
 config BR2_PACKAGE_ENLIGHTENMENT
 	bool "enlightenment"
+	# libevas-generic-loaders-svg -> librsvg -> glib2 / pango
+	depends on BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP
+	# libedbus -> dbus
+	# libedbus -> glib2, libevas
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# libedbus -> dbus, efl libraries
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_XORG7
+	# libevas-generic-loaders-svg -> librsvg -> pango -> cairo
+	depends on BR2_ARCH_HAS_ATOMICS
 	select BR2_PACKAGE_EFL
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_LIBECORE_X
@@ -17,17 +28,6 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
 	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
-	# libevas-generic-loaders-svg -> librsvg -> glib2 / pango
-	depends on BR2_USE_WCHAR
-	depends on BR2_INSTALL_LIBSTDCPP
-	# libedbus -> dbus
-	# libedbus -> glib2, libevas
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# libedbus -> dbus, efl libraries
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_XORG7
-	# libevas-generic-loaders-svg -> librsvg -> pango -> cairo
-	depends on BR2_ARCH_HAS_ATOMICS
 	help
 	  Enlightenment, also known simply as E, is a stacking window
 	  manager for the X Window System which can be used alone or
diff --git a/package/expedite/Config.in b/package/expedite/Config.in
index de6a056..e60510b 100644
--- a/package/expedite/Config.in
+++ b/package/expedite/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_EXPEDITE
 	bool "expedite"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEVAS
-	select BR2_PACKAGE_LIBEET
 	depends on BR2_PACKAGE_EFL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	select BR2_PACKAGE_LIBEET
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEVAS
 	help
 	  Expedite is the official Evas benchmark tool. It can test different
 	  engines, such as X11, XRender, OpenGL (also ES variant), SDL,
diff --git a/package/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
index 72d4adb..f42f8a6 100644
--- a/package/libevas-generic-loaders/Config.in
+++ b/package/libevas-generic-loaders/Config.in
@@ -14,13 +14,13 @@ if BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 
 config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
 	bool "SVG loader"
-	select BR2_PACKAGE_LIBRSVG
-	select BR2_PACKAGE_CAIRO
 	depends on BR2_USE_MMU # librsvg -> glib2
 	depends on BR2_USE_WCHAR # librsvg -> glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
 	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	select BR2_PACKAGE_LIBRSVG
+	select BR2_PACKAGE_CAIRO
 	help
 	  This option enables the Evas generic SVG loader
 
-- 
2.4.3
