From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri,  7 Jun 2013 18:18:48 -0500
Subject: [Buildroot] [PATCH v10 03/13] libgtk2: bump to version 2.24.18 and
	drop DirectFB
In-Reply-To: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
References: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370647138-26623-4-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Drop DirectFB support from libgtk2
* bump libgtk2 to version 2.24.18
---
 package/libgtk2/Config.in                         |   13 ++---
 package/libgtk2/libgtk2-reduce-dependencies.patch |   51 +++++++++++----------
 package/libgtk2/libgtk2.mk                        |   27 ++++-------
 3 files changed, 40 insertions(+), 51 deletions(-)

diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 88f4cc1..462b0b6 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -8,11 +8,11 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_GDK_PIXBUF
-	select BR2_PACKAGE_FONTCONFIG if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	help
@@ -29,6 +29,3 @@ config BR2_PACKAGE_LIBGTK2_DEMO
 
 comment "libgtk2 requires a toolchain with WCHAR and C++ support"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
-
-comment "WARNING: Libgtk2 directfb backend is deprecated"
-	depends on BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_XORG7
diff --git a/package/libgtk2/libgtk2-reduce-dependencies.patch b/package/libgtk2/libgtk2-reduce-dependencies.patch
index 5bb9db9..e9be429 100644
--- a/package/libgtk2/libgtk2-reduce-dependencies.patch
+++ b/package/libgtk2/libgtk2-reduce-dependencies.patch
@@ -3,21 +3,23 @@ dependencies on graphic backends such as X.org or DirectFB. Gtk does
 not fully build in this mode, but it builds sufficiently to build the
 host tools that are needed to build the target Gtk.
 
+Changes:
+	Ported to 2.24.18
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 ---
- configure.in |   34 +++++++++++++++++++++++++++-------
- 1 file changed, 27 insertions(+), 7 deletions(-)
-
-Index: b/configure.in
+Index: libgtk2-2.24.18/configure.ac
 ===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -259,12 +259,12 @@
+--- libgtk2-2.24.18.orig/configure.ac	2013-05-13 07:02:44.000000000 -0500
++++ libgtk2-2.24.18/configure.ac	2013-05-27 02:12:09.947030335 -0500
+@@ -258,12 +258,13 @@
    gdktarget=x11
  fi
  
 -AC_ARG_WITH(gdktarget, [  --with-gdktarget=[[x11/win32/quartz/directfb]] select non-default GDK target],
-+AC_ARG_WITH(gdktarget, [  --with-gdktarget=[[x11/win32/quartz/directfb/none]] select non-default GDK target],
++AC_ARG_WITH(gdktarget,
++				[  --with-gdktarget=[[x11/win32/quartz/directfb/none]] select non-default GDK target],
  	gdktarget=$with_gdktarget)
  
  AC_SUBST(gdktarget)
@@ -27,7 +29,7 @@ Index: b/configure.in
    *) AC_MSG_ERROR([Invalid target for GDK: use x11, quartz, directfb or win32.]);;
  esac
  
-@@ -374,11 +374,15 @@
+@@ -372,11 +373,15 @@
  ## annoying to construct
  PKG_CHECK_MODULES(BASE_DEPENDENCIES,
    [glib-2.0 >= glib_required_version dnl
@@ -37,16 +39,16 @@ Index: b/configure.in
     gdk-pixbuf-2.0 >= gdk_pixbuf_required_version])
  
 +if test "x$gdktarget" != "xnone"; then
-+   PKG_CHECK_MODULES(BASE_DEPENDENCIES,
-+	[atk >= atk_required_version dnl
-+	 pango >= pango_required_version dnl
-+	 cairo >= cairo_required_version])
++	PKG_CHECK_MODULES(BASE_DEPENDENCIES,
++		[atk >= atk_required_version dnl
++		 pango >= pango_required_version dnl
++		 cairo >= cairo_required_version])
 +fi
 +
  ## In addition to checking that cairo is present, we also need to
  ## check that the correct cairo backend is there. E.g. if the GDK
  ## target is win32 we need the cairo-win32 backend and so on.
-@@ -389,8 +393,11 @@
+@@ -387,8 +392,11 @@
  if test "x$cairo_backend" = "xx11"; then
     cairo_backend=xlib
  fi
@@ -54,13 +56,13 @@ Index: b/configure.in
 -  [cairo-$cairo_backend >= cairo_required_version])
 +
 +if test "x$gdktarget" != "xnone"; then
-+   PKG_CHECK_MODULES(CAIRO_BACKEND,
-+	[cairo-$cairo_backend >= cairo_required_version])
++	PKG_CHECK_MODULES(CAIRO_BACKEND,
++		[cairo-$cairo_backend >= cairo_required_version])
 +fi
  
  PKG_CHECK_MODULES(GMODULE, [gmodule-2.0])
  
-@@ -1281,6 +1288,7 @@
+@@ -1279,6 +1287,7 @@
    AM_CONDITIONAL(USE_DIRECTFB, false)
  fi
  
@@ -68,7 +70,7 @@ Index: b/configure.in
  
  # Check for Pango flags
  
-@@ -1326,6 +1334,8 @@
+@@ -1324,6 +1333,8 @@
    GDK_PACKAGES="$PANGO_PACKAGES gio-2.0 gdk-pixbuf-2.0 cairo-$cairo_backend"
  fi
  
@@ -77,16 +79,15 @@ Index: b/configure.in
  GDK_DEP_LIBS="$GDK_EXTRA_LIBS `$PKG_CONFIG --libs $GDK_PACKAGES` $MATH_LIB"
  GDK_DEP_CFLAGS="`$PKG_CONFIG --cflags  gthread-2.0 $GDK_PACKAGES` $GDK_EXTRA_CFLAGS"
  #
-@@ -1344,6 +1354,8 @@
+@@ -1341,6 +1352,7 @@
+ AC_SUBST(GDK_DEP_LIBS)
  AC_SUBST(GDK_DEP_CFLAGS)
  
- 
 +if test "x$gdktarget" != "xnone"; then
-+
+ 
  ########################################
  # Check for Accessibility Toolkit flags
- ########################################
-@@ -1374,6 +1386,10 @@
+@@ -1372,6 +1384,10 @@
  fi
  
  GTK_PACKAGES="atk cairo gdk-pixbuf-2.0 gio-2.0"
@@ -97,7 +98,7 @@ Index: b/configure.in
  if test "x$gdktarget" = "xx11"; then
    GTK_PACKAGES="$GTK_PACKAGES pangoft2"
  fi
-@@ -1529,6 +1545,8 @@
+@@ -1533,6 +1549,8 @@
  gtk_save_cppflags="$CPPFLAGS"
  CPPFLAGS="$CPPFLAGS $GTK_DEP_CFLAGS $GDK_DEP_CFLAGS"
  
@@ -106,7 +107,7 @@ Index: b/configure.in
  AC_CHECK_HEADER(cairo-pdf.h,,AC_MSG_ERROR([
  *** Can't find cairo-pdf.h. You must build Cairo with the pdf
  *** backend enabled.]))
-@@ -1543,6 +1561,8 @@
+@@ -1547,6 +1565,8 @@
  *** svg backend enabled.]))
  fi   
  
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 8192958..8ac455b 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK2_VERSION_MAJOR = 2.24
-LIBGTK2_VERSION_MINOR = 10
+LIBGTK2_VERSION_MINOR = 18
 LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).$(LIBGTK2_VERSION_MINOR)
 
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
@@ -74,19 +74,14 @@ LIBGTK2_CONF_OPT = --disable-glibtest \
 
 LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango atk gdk-pixbuf
 
-ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-	LIBGTK2_CONF_OPT += --with-gdktarget=directfb
-	LIBGTK2_DEPENDENCIES += directfb
-endif
-
-ifeq ($(BR2_PACKAGE_XORG7),y)
-	LIBGTK2_CONF_OPT += \
-		--with-x \
-		--x-includes=$(STAGING_DIR)/usr/include/X11 \
-		--x-libraries=$(STAGING_DIR)/usr/lib \
-		--with-gdktarget=x11
-	LIBGTK2_DEPENDENCIES += xlib_libXcomposite fontconfig xlib_libX11 \
-		xlib_libXext xlib_libXrender
+# Xorg dependencies
+LIBGTK2_CONF_OPT += \
+	--with-x \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib \
+	--with-gdktarget=x11
+LIBGTK2_DEPENDENCIES += xlib_libXcomposite fontconfig xlib_libX11 \
+	xlib_libXext xlib_libXrender
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
 	LIBGTK2_CONF_OPT += --enable-xinerama
@@ -122,10 +117,6 @@ ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
 	LIBGTK2_DEPENDENCIES += xlib_libXdamage
 endif
 
-else
-	LIBGTK2_CONF_OPT += --without-x
-endif
-
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 LIBGTK2_DEPENDENCIES += libpng
 else
-- 
1.7.1
