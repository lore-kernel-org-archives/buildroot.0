From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:27:28 +0100
Subject: [Buildroot] [git commit master] libgtk2: break the dependency of
	host-libgtk2 on host-cairo
Message-ID: <20100223202927.94F37776A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ce1f459b8bb0654a717124a1284b7204616ca199
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Making a full build of libgtk2 for the host is a pain, since it
requires host-cairo, which it turns requires a full X.org stack to be
compiled for the host.

Moreover, building libgtk2 for the host completely is useless: we only
need gdk-pixbuf-csource and gtk-update-icon-cache.

In this patch, we add a new
host-libgtk2-2.12.12-reduce-dependencies.patch, that is only applied
to libgtk2 when being built for the host. This patch removes a lot of
dependencies in configure.in, which allows to:

 * run make and make install in gdk-pixbuf/, which compiles and
   installs the gdk-pixbuf library and the gdk-pixbuf-csource utility

 * run make gtk-update-icon-cache in gtk/, which compiles the
   gtk-update-icon-cache utility, which is then installed manually

The compilation and installation steps of libgtk2 for the host are
therefore overriden, so as to not use the default behaviour, which
would attempt to build the full gtk library.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../host-libgtk2-2.12.12-reduce-dependencies.patch |  200 ++++++++++++++++++++
 package/libgtk2/libgtk2.mk                         |   29 +++-
 2 files changed, 226 insertions(+), 3 deletions(-)
 create mode 100644 package/libgtk2/host-libgtk2-2.12.12-reduce-dependencies.patch

diff --git a/package/libgtk2/host-libgtk2-2.12.12-reduce-dependencies.patch b/package/libgtk2/host-libgtk2-2.12.12-reduce-dependencies.patch
new file mode 100644
index 0000000..f0ac6bf
--- /dev/null
+++ b/package/libgtk2/host-libgtk2-2.12.12-reduce-dependencies.patch
@@ -0,0 +1,200 @@
+Index: gtk+-2.12.12/configure.in
+===================================================================
+--- gtk+-2.12.12.orig/configure.in	2008-09-13 02:01:07.000000000 +0200
++++ gtk+-2.12.12/configure.in	2010-02-21 10:42:40.000000000 +0100
+@@ -32,9 +32,6 @@
+ 
+ # required versions of other packages
+ m4_define([glib_required_version], [2.13.5])
+-m4_define([pango_required_version], [1.17.3])
+-m4_define([atk_required_version], [1.9.0])
+-m4_define([cairo_required_version], [1.2.0])
+ 
+ 
+ AC_INIT([gtk+], [gtk_version],
+@@ -239,12 +236,12 @@
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
+@@ -349,10 +346,7 @@
+ ## the version requirements since those make the module lists 
+ ## annoying to construct
+ PKG_CHECK_MODULES(BASE_DEPENDENCIES,
+-  [glib-2.0 >= glib_required_version dnl
+-   atk >= atk_required_version dnl
+-   pango >= pango_required_version dnl
+-   cairo >= cairo_required_version])
++  [glib-2.0 >= glib_required_version])
+ 
+ if test "$os_win32" != yes; then
+     # libtool option to control which symbols are exported
+@@ -1061,7 +1055,7 @@
+ GDK_PIXBUF_XLIB_EXTRA_CFLAGS=
+ GDK_PIXBUF_XLIB_EXTRA_LIBS=
+ 	
+-X_PACKAGES=fontconfig
++X_PACKAGES=
+ GDK_EXTRA_LIBS="$GDK_WLIBS"
+ GDK_EXTRA_CFLAGS=
+ 	
+@@ -1070,14 +1064,6 @@
+ GTK_DEP_LIBS_FOR_X=
+ 
+ if test "x$gdktarget" = "xx11"; then
+-  #
+-  # We use fontconfig very peripherally when decoding the default
+-  # settings.
+-  #
+-  if $PKG_CONFIG --exists fontconfig; then : ; else
+-    AC_MSG_ERROR([
+-*** fontconfig (http://www.fontconfig.org) is required by the X11 backend.])
+-  fi
+ 
+   #
+   # Check for basic X packages; we use pkg-config if available
+@@ -1124,16 +1110,6 @@
+   gtk_save_LIBS=$LIBS
+   LIBS="$x_libs_for_checks $LIBS"
+   
+-  # Sanity check for the X11 and Xext libraries. While everything we need from
+-  # Xext is optional, the chances a system has *none* of these things is so
+-  # small that we just unconditionally require it.
+-  AC_CHECK_FUNC(XOpenDisplay, :,
+-                AC_MSG_ERROR([*** libX11 not found. Check 'config.log' for more details.]))
+-  AC_CHECK_FUNC(XextFindDisplay, :,
+-                AC_MSG_ERROR([*** libXext not found. Check 'config.log' for more details.]))
+-  AC_CHECK_FUNC(XRenderQueryExtension, :,
+-                AC_MSG_ERROR([*** libXrender not found. Check 'config.log' for more details.]))
+-
+   # Check for xReply
+ 
+   AC_MSG_CHECKING([if <X11/extensions/XIproto.h> is needed for xReply])
+@@ -1418,48 +1394,6 @@
+   AM_CONDITIONAL(USE_DIRECTFB, false)
+ fi
+ 
+-
+-# Check for Pango flags
+-
+-if test "x$gdktarget" = "xwin32"; then
+-	PANGO_PACKAGES="pangowin32 pangocairo"
+-else
+-	PANGO_PACKAGES="pango pangocairo"
+-fi
+-
+-AC_MSG_CHECKING(Pango flags)
+-if $PKG_CONFIG --exists $PANGO_PACKAGES ; then
+-        PANGO_CFLAGS=`$PKG_CONFIG --cflags $PANGO_PACKAGES`
+-        PANGO_LIBS=`$PKG_CONFIG --libs $PANGO_PACKAGES`
+-
+-        AC_MSG_RESULT($PANGO_CFLAGS $PANGO_LIBS)
+-else
+-        AC_MSG_ERROR([
+-*** Pango not found. Pango built with Cairo support is required
+-*** to build GTK+. See http://www.pango.org for Pango information.
+-])
+-fi
+-
+-CFLAGS="$CFLAGS $PANGO_CFLAGS"
+-
+-if $PKG_CONFIG --uninstalled $PANGO_PACKAGES; then
+-        :
+-else
+-	gtk_save_LIBS="$LIBS"
+-        LIBS="$PANGO_LIBS $LIBS"
+-        AC_TRY_LINK_FUNC(pango_context_new, :, AC_MSG_ERROR([
+-*** Can't link to Pango. Pango is required to build
+-*** GTK+. For more information see http://www.pango.org]))
+-        LIBS="$gtk_save_LIBS"
+-fi
+-
+-CFLAGS="$saved_cflags"
+-LDFLAGS="$saved_ldflags"
+-
+-GDK_PACKAGES="$PANGO_PACKAGES"
+-if test "x$gdktarget" = "xx11"; then
+-  GDK_PACKAGES="$GDK_PACKAGES $X_PACKAGES"
+-fi
+ GDK_DEP_LIBS="$GDK_EXTRA_LIBS `$PKG_CONFIG --libs $GDK_PIXBUF_PACKAGES $GDK_PACKAGES` $GDK_PIXBUF_EXTRA_LIBS"
+ GDK_DEP_CFLAGS="`$PKG_CONFIG --cflags  gthread-2.0 $GDK_PIXBUF_PACKAGES $GDK_PACKAGES` $GDK_PIXBUF_EXTRA_CFLAGS $GDK_EXTRA_CFLAGS"
+ 
+@@ -1468,7 +1402,7 @@
+ # into the pkg-config files
+ #
+ if test $enable_explicit_deps != yes ; then
+-  GDK_PACKAGES="$PANGO_PACKAGES"
++  GDK_PACKAGES=
+   GDK_EXTRA_LIBS=
+ fi
+ 
+@@ -1479,39 +1413,10 @@
+ AC_SUBST(GDK_DEP_CFLAGS)
+ 
+ 
+-########################################
+-# Check for Accessibility Toolkit flags
+-########################################
+-
+-ATK_PACKAGES=atk
+-AC_MSG_CHECKING(ATK flags)
+-if $PKG_CONFIG --exists $ATK_PACKAGES ; then
+-        ATK_CFLAGS=`$PKG_CONFIG --cflags $ATK_PACKAGES`
+-        ATK_LIBS=`$PKG_CONFIG --libs $ATK_PACKAGES`
+-
+-        AC_MSG_RESULT($ATK_CFLAGS $ATK_LIBS)
+-else
+-        AC_MSG_ERROR([
+-*** Accessibility Toolkit not found. Accessibility Toolkit is required
+-*** to build GTK+.
+-])
+-fi
+-
+-if $PKG_CONFIG --uninstalled $ATK_PACKAGES; then
+-        :
+-else
+-	gtk_save_LIBS="$LIBS"
+-        LIBS="$ATK_LIBS $LIBS"
+-        AC_TRY_LINK_FUNC(atk_object_get_type, : , AC_MSG_ERROR([
+-                *** Cannot link to Accessibility Toolkit. Accessibility Toolkit is required
+-                *** to build GTK+]))
+-        LIBS="$gtk_save_LIBS"
+-fi
+-
+-GTK_PACKAGES="atk cairo"
++GTK_PACKAGES=
+ GTK_EXTRA_LIBS=
+ GTK_EXTRA_CFLAGS= 
+-GTK_DEP_LIBS="$GDK_EXTRA_LIBS $GTK_DEP_LIBS_FOR_X `$PKG_CONFIG --libs $GDK_PIXBUF_PACKAGES $PANGO_PACKAGES $GTK_PACKAGES_FOR_X $GTK_PACKAGES` $GTK_EXTRA_LIBS $GDK_PIXBUF_EXTRA_LIBS"
++GTK_DEP_LIBS="$GDK_EXTRA_LIBS $GTK_DEP_LIBS_FOR_X `$PKG_CONFIG --libs $GDK_PIXBUF_PACKAGES $GTK_PACKAGES_FOR_X $GTK_PACKAGES` $GTK_EXTRA_LIBS $GDK_PIXBUF_EXTRA_LIBS"
+ GTK_DEP_CFLAGS="`$PKG_CONFIG --cflags  gthread-2.0 $GDK_PIXBUF_PACKAGES $GDK_PACKAGES $GTK_PACKAGES` $GDK_PIXBUF_EXTRA_CFLAGS $GDK_EXTRA_CFLAGS $GTK_EXTRA_CFLAGS"
+ 
+ if test x"$os_win32" = xyes; then
+@@ -1601,17 +1506,6 @@
+ 
+ gtk_save_cppflags="$CPPFLAGS"
+ CPPFLAGS="$CPPFLAGS $GTK_DEP_CFLAGS"
+-			  
+-AC_CHECK_HEADER(cairo-pdf.h,,AC_MSG_ERROR([
+-*** Can't find cairo-pdf.h. You must build Cairo with the pdf
+-*** backend enabled.]))
+-
+-if test "$os_win32" != "yes"; then
+-  AC_CHECK_HEADER(cairo-ps.h,,AC_MSG_ERROR([
+-*** Can't find cairo-ps.h. You must build Cairo with the 
+-*** postscript backend enabled.]))
+-fi   
+-
+ CPPFLAGS="$gtk_save_cppflags"
+      
+ 			  	
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 626b2da..cc62c73 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -119,17 +119,40 @@ else
 LIBGTK2_CONF_OPT += --disable-cups
 endif
 
-HOST_LIBGTK2_DEPENDENCIES = host-cairo host-libglib2 host-pango host-atk
+# We do not build a full version of libgtk2 for the host, because that
+# requires compiling Cairo, Pango, ATK and X.org for the
+# host. Therefore, we patch it to remove dependencies, and we hack the
+# build to only build gdk-pixbuf-from-source and
+# gtk-update-icon-cache, which are the host tools needed to build Gtk
+# for the target.
+
+HOST_LIBGTK2_DEPENDENCIES = host-libglib2
+HOST_LIBGTK2_AUTORECONF = YES
 HOST_LIBGTK2_CONF_OPT = \
 		--disable-static \
 		--disable-glibtest \
 		--without-libtiff \
 		--without-libjpeg \
-		--with-x \
-		--with-gdktarget=x11 \
+		--with-gdktarget=none \
 		--disable-cups \
 		--disable-debug
 
+define HOST_LIBGTK2_PATCH_REDUCE_DEPENDENCIES_HOOK
+ toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME) host-*.patch
+endef
+
+HOST_LIBGTK2_POST_PATCH_HOOKS += HOST_LIBGTK2_PATCH_REDUCE_DEPENDENCIES_HOOK
+
+define HOST_LIBGTK2_BUILD_CMDS
+ $(HOST_MAKE_ENV) make -C $(@D)/gdk-pixbuf
+ $(HOST_MAKE_ENV) make -C $(@D)/gtk gtk-update-icon-cache
+endef
+
+define HOST_LIBGTK2_INSTALL_CMDS
+ $(HOST_MAKE_ENV) make -C $(@D)/gdk-pixbuf install
+ cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/usr/bin
+endef
+
 $(eval $(call AUTOTARGETS,package,libgtk2))
 $(eval $(call AUTOTARGETS,package,libgtk2,host))
 
-- 
1.6.3.3
