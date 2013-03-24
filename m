From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:27 +0100
Subject: [Buildroot] [PATCH 03/22] libgtk2: use non-host specific patch
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libgtk2 package was using a host-<foo>.patch that should be
applied only on the host variant of the package. Unfortunately, with
the patch model rework, this doesn't work anymore: Buildroot tries to
apply the patch twice, for some reason.

But instead of fixing the patch model, it is probably a lot better to
fix this patch itself, which is the only usage of host-only patch in
Buildroot.

So instead of simply removing code that detects dependencies in gtk2's
configure.in script, we use a condition based on the value of
gdktarget. And it turns out that it makes the patch shorter.

However, it requires autoreconfiguring the libgtk2 target package,
because we are now modifying its configure.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libgtk2/host-libgtk2-reduce-dependencies.patch |  168 --------------------
 package/libgtk2/libgtk2-reduce-dependencies.patch  |  117 ++++++++++++++
 package/libgtk2/libgtk2.mk                         |    2 +
 3 files changed, 119 insertions(+), 168 deletions(-)
 delete mode 100644 package/libgtk2/host-libgtk2-reduce-dependencies.patch
 create mode 100644 package/libgtk2/libgtk2-reduce-dependencies.patch

diff --git a/package/libgtk2/host-libgtk2-reduce-dependencies.patch b/package/libgtk2/host-libgtk2-reduce-dependencies.patch
deleted file mode 100644
index 091eeb0..0000000
--- a/package/libgtk2/host-libgtk2-reduce-dependencies.patch
+++ /dev/null
@@ -1,168 +0,0 @@
-Hack the configure.in file to add a "none" gdktarget which removes
-dependencies on graphic backends such as X.org or DirectFB. Gtk does
-not fully build in this mode, but it builds sufficiently to build the
-host tools that are needed to build the target Gtk.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.in |  101 ++---------------------------------------------------------
- 1 file changed, 4 insertions(+), 97 deletions(-)
-
-Index: gtk+-2.24.8/configure.in
-===================================================================
---- gtk+-2.24.8.orig/configure.in
-+++ gtk+-2.24.8/configure.in
-@@ -259,12 +259,12 @@
-   gdktarget=x11
- fi
- 
--AC_ARG_WITH(gdktarget, [  --with-gdktarget=[[x11/win32/quartz/directfb]] select non-default GDK target],
-+AC_ARG_WITH(gdktarget, [  --with-gdktarget=[[x11/win32/quartz/directfb/none]] select non-default GDK target],
- 	gdktarget=$with_gdktarget)
- 
- AC_SUBST(gdktarget)
- case $gdktarget in
--  x11|win32|quartz|directfb) ;;
-+  x11|win32|quartz|directfb|none) ;;
-   *) AC_MSG_ERROR([Invalid target for GDK: use x11, quartz, directfb or win32.]);;
- esac
- 
-@@ -374,9 +374,6 @@
- ## annoying to construct
- PKG_CHECK_MODULES(BASE_DEPENDENCIES,
-   [glib-2.0 >= glib_required_version dnl
--   atk >= atk_required_version dnl
--   pango >= pango_required_version dnl
--   cairo >= cairo_required_version dnl
-    gdk-pixbuf-2.0 >= gdk_pixbuf_required_version])
- 
- ## In addition to checking that cairo is present, we also need to
-@@ -389,8 +386,6 @@
- if test "x$cairo_backend" = "xx11"; then
-    cairo_backend=xlib
- fi
--PKG_CHECK_MODULES(CAIRO_BACKEND,
--  [cairo-$cairo_backend >= cairo_required_version])
- 
- if test "$os_win32" != yes; then
-     # libtool option to control which symbols are exported
-@@ -1280,50 +1275,6 @@
- fi
- 
- 
--# Check for Pango flags
--
--if test "x$gdktarget" = "xwin32"; then
--	PANGO_PACKAGES="pangowin32 pangocairo"
--else
--	PANGO_PACKAGES="pango pangocairo"
--fi
--
--AC_MSG_CHECKING(Pango flags)
--if $PKG_CONFIG --exists $PANGO_PACKAGES ; then
--        PANGO_CFLAGS=`$PKG_CONFIG --cflags $PANGO_PACKAGES`
--        PANGO_LIBS=`$PKG_CONFIG --libs $PANGO_PACKAGES`
--
--        AC_MSG_RESULT($PANGO_CFLAGS $PANGO_LIBS)
--else
--        AC_MSG_ERROR([
--*** Pango not found. Pango built with Cairo support is required
--*** to build GTK+. See http://www.pango.org for Pango information.
--])
--fi
--
--CFLAGS="$CFLAGS $PANGO_CFLAGS"
--
--if $PKG_CONFIG --uninstalled $PANGO_PACKAGES; then
--        :
--else
--	gtk_save_LIBS="$LIBS"
--        LIBS="$PANGO_LIBS $LIBS"
--        AC_TRY_LINK_FUNC(pango_context_new, :, AC_MSG_ERROR([
--*** Can't link to Pango. Pango is required to build
--*** GTK+. For more information see http://www.pango.org]))
--        LIBS="$gtk_save_LIBS"
--fi
--
--CFLAGS="$saved_cflags"
--LDFLAGS="$saved_ldflags"
--
--# Pull in gio-unix for GDesktopAppInfo usage, see at least gdkapplaunchcontext-x11.c
--if test "x$gdktarget" = "xx11"; then
--  GDK_PACKAGES="$PANGO_PACKAGES gio-unix-2.0 $X_PACKAGES gdk-pixbuf-2.0 cairo-$cairo_backend"
--else
--  GDK_PACKAGES="$PANGO_PACKAGES gio-2.0 gdk-pixbuf-2.0 cairo-$cairo_backend"
--fi
--
- GDK_DEP_LIBS="$GDK_EXTRA_LIBS `$PKG_CONFIG --libs $GDK_PACKAGES` $MATH_LIB"
- GDK_DEP_CFLAGS="`$PKG_CONFIG --cflags  gthread-2.0 $GDK_PACKAGES` $GDK_EXTRA_CFLAGS"
- #
-@@ -1331,7 +1282,7 @@
- # into the pkg-config files
- #
- if test $enable_explicit_deps != yes ; then
--  GDK_PACKAGES="$PANGO_PACKAGES gdk-pixbuf-2.0"
-+  GDK_PACKAGES="gdk-pixbuf-2.0"
-   GDK_EXTRA_LIBS=
- fi
- 
-@@ -1341,37 +1292,7 @@
- AC_SUBST(GDK_DEP_LIBS)
- AC_SUBST(GDK_DEP_CFLAGS)
- 
--
--########################################
--# Check for Accessibility Toolkit flags
--########################################
--
--ATK_PACKAGES=atk
--AC_MSG_CHECKING(ATK flags)
--if $PKG_CONFIG --exists $ATK_PACKAGES ; then
--        ATK_CFLAGS=`$PKG_CONFIG --cflags $ATK_PACKAGES`
--        ATK_LIBS=`$PKG_CONFIG --libs $ATK_PACKAGES`
--
--        AC_MSG_RESULT($ATK_CFLAGS $ATK_LIBS)
--else
--        AC_MSG_ERROR([
--*** Accessibility Toolkit not found. Accessibility Toolkit is required
--*** to build GTK+.
--])
--fi
--
--if $PKG_CONFIG --uninstalled $ATK_PACKAGES; then
--        :
--else
--	gtk_save_LIBS="$LIBS"
--        LIBS="$ATK_LIBS $LIBS"
--        AC_TRY_LINK_FUNC(atk_object_get_type, : , AC_MSG_ERROR([
--                *** Cannot link to Accessibility Toolkit. Accessibility Toolkit is required
--                *** to build GTK+]))
--        LIBS="$gtk_save_LIBS"
--fi
--
--GTK_PACKAGES="atk cairo gdk-pixbuf-2.0 gio-2.0"
-+GTK_PACKAGES="gdk-pixbuf-2.0"
- if test "x$gdktarget" = "xx11"; then
-   GTK_PACKAGES="$GTK_PACKAGES pangoft2"
- fi
-@@ -1527,20 +1448,6 @@
- gtk_save_cppflags="$CPPFLAGS"
- CPPFLAGS="$CPPFLAGS $GTK_DEP_CFLAGS $GDK_DEP_CFLAGS"
- 
--AC_CHECK_HEADER(cairo-pdf.h,,AC_MSG_ERROR([
--*** Can't find cairo-pdf.h. You must build Cairo with the pdf
--*** backend enabled.]))
--
--if test "$os_win32" != "yes"; then
--  AC_CHECK_HEADER(cairo-ps.h,,AC_MSG_ERROR([
--*** Can't find cairo-ps.h. You must build Cairo with the 
--*** postscript backend enabled.]))
--
--  AC_CHECK_HEADER(cairo-svg.h,,AC_MSG_ERROR([
--*** Can't find cairo-svg.h. You must build Cairo with the
--*** svg backend enabled.]))
--fi   
--
- CPPFLAGS="$gtk_save_cppflags"
-      
- 			  	
diff --git a/package/libgtk2/libgtk2-reduce-dependencies.patch b/package/libgtk2/libgtk2-reduce-dependencies.patch
new file mode 100644
index 0000000..5bb9db9
--- /dev/null
+++ b/package/libgtk2/libgtk2-reduce-dependencies.patch
@@ -0,0 +1,117 @@
+Hack the configure.in file to add a "none" gdktarget which removes
+dependencies on graphic backends such as X.org or DirectFB. Gtk does
+not fully build in this mode, but it builds sufficiently to build the
+host tools that are needed to build the target Gtk.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.in |   34 +++++++++++++++++++++++++++-------
+ 1 file changed, 27 insertions(+), 7 deletions(-)
+
+Index: b/configure.in
+===================================================================
+--- a/configure.in
++++ b/configure.in
+@@ -259,12 +259,12 @@
+   gdktarget=x11
+ fi
+ 
+-AC_ARG_WITH(gdktarget, [  --with-gdktarget=[[x11/win32/quartz/directfb]] select non-default GDK target],
++AC_ARG_WITH(gdktarget, [  --with-gdktarget=[[x11/win32/quartz/directfb/none]] select non-default GDK target],
+ 	gdktarget=$with_gdktarget)
+ 
+ AC_SUBST(gdktarget)
+ case $gdktarget in
+-  x11|win32|quartz|directfb) ;;
++  x11|win32|quartz|directfb|none) ;;
+   *) AC_MSG_ERROR([Invalid target for GDK: use x11, quartz, directfb or win32.]);;
+ esac
+ 
+@@ -374,11 +374,15 @@
+ ## annoying to construct
+ PKG_CHECK_MODULES(BASE_DEPENDENCIES,
+   [glib-2.0 >= glib_required_version dnl
+-   atk >= atk_required_version dnl
+-   pango >= pango_required_version dnl
+-   cairo >= cairo_required_version dnl
+    gdk-pixbuf-2.0 >= gdk_pixbuf_required_version])
+ 
++if test "x$gdktarget" != "xnone"; then
++   PKG_CHECK_MODULES(BASE_DEPENDENCIES,
++	[atk >= atk_required_version dnl
++	 pango >= pango_required_version dnl
++	 cairo >= cairo_required_version])
++fi
++
+ ## In addition to checking that cairo is present, we also need to
+ ## check that the correct cairo backend is there. E.g. if the GDK
+ ## target is win32 we need the cairo-win32 backend and so on.
+@@ -389,8 +393,11 @@
+ if test "x$cairo_backend" = "xx11"; then
+    cairo_backend=xlib
+ fi
+-PKG_CHECK_MODULES(CAIRO_BACKEND,
+-  [cairo-$cairo_backend >= cairo_required_version])
++
++if test "x$gdktarget" != "xnone"; then
++   PKG_CHECK_MODULES(CAIRO_BACKEND,
++	[cairo-$cairo_backend >= cairo_required_version])
++fi
+ 
+ PKG_CHECK_MODULES(GMODULE, [gmodule-2.0])
+ 
+@@ -1281,6 +1288,7 @@
+   AM_CONDITIONAL(USE_DIRECTFB, false)
+ fi
+ 
++if test "x$gdktarget" != "xnone"; then
+ 
+ # Check for Pango flags
+ 
+@@ -1326,6 +1334,8 @@
+   GDK_PACKAGES="$PANGO_PACKAGES gio-2.0 gdk-pixbuf-2.0 cairo-$cairo_backend"
+ fi
+ 
++fi # gdktarget != none
++
+ GDK_DEP_LIBS="$GDK_EXTRA_LIBS `$PKG_CONFIG --libs $GDK_PACKAGES` $MATH_LIB"
+ GDK_DEP_CFLAGS="`$PKG_CONFIG --cflags  gthread-2.0 $GDK_PACKAGES` $GDK_EXTRA_CFLAGS"
+ #
+@@ -1344,6 +1354,8 @@
+ AC_SUBST(GDK_DEP_CFLAGS)
+ 
+ 
++if test "x$gdktarget" != "xnone"; then
++
+ ########################################
+ # Check for Accessibility Toolkit flags
+ ########################################
+@@ -1374,6 +1386,10 @@
+ fi
+ 
+ GTK_PACKAGES="atk cairo gdk-pixbuf-2.0 gio-2.0"
++else # gdktarget != none
++GTK_PACKAGES="gdk-pixbuf-2.0"
++fi # gdktarget != none
++
+ if test "x$gdktarget" = "xx11"; then
+   GTK_PACKAGES="$GTK_PACKAGES pangoft2"
+ fi
+@@ -1529,6 +1545,8 @@
+ gtk_save_cppflags="$CPPFLAGS"
+ CPPFLAGS="$CPPFLAGS $GTK_DEP_CFLAGS $GDK_DEP_CFLAGS"
+ 
++if test "x$gdktarget" != "xnone"; then
++
+ AC_CHECK_HEADER(cairo-pdf.h,,AC_MSG_ERROR([
+ *** Can't find cairo-pdf.h. You must build Cairo with the pdf
+ *** backend enabled.]))
+@@ -1543,6 +1561,8 @@
+ *** svg backend enabled.]))
+ fi   
+ 
++fi # gdktarget != none
++
+ CPPFLAGS="$gtk_save_cppflags"
+      
+ 			  	
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index e6a9d84..b1ce99a 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -12,6 +12,8 @@ LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJ
 LIBGTK2_INSTALL_STAGING = YES
 LIBGTK2_INSTALL_TARGET = YES
 
+LIBGTK2_AUTORECONF = YES
+
 LIBGTK2_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no \
 		ac_cv_func_strtod=yes \
-- 
1.7.9.5
