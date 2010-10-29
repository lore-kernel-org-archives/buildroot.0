From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Oct 2010 20:06:24 +0200
Subject: [Buildroot] [git commit master 1/1] libgtk2: bump to version 2.22.0
	and undeprecate Gtk/DirectFB
Message-ID: <20101029181143.3C8D38D41D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=35b4322ee89ca106b69589590ca124f6bd95c660
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Finally, we bump Gtk from the old and ancient 2.12 version to the
latest 2.22.0 version currently available.

The DirectFB support is Gtk 2.22 compiles again thanks to the work of
Lionel Landwerlin (it was broken in every Gtk version between 2.12 and
2.20). Therefore, Gtk on DirectFB is no longer marked as deprecated.

In addition to this, we :

 * Upgrade the "reduce-dependencies" patch

 * Remove the "configure" and "no-tests" patches which do not seem to
   be useful anymore

 * Add a libtool patch

We also remove references to a non-existant 2.15 gtk version in
libgtk2.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/Config.in                          |    8 +-
 ... host-libgtk2-2.20.1-reduce-dependencies.patch} |  140 ++++-------
 package/libgtk2/libgtk2-2.12.6-configure.patch     |  256 --------------------
 package/libgtk2/libgtk2-2.12.6-no-tests.patch      |   11 -
 package/libgtk2/libgtk2.mk                         |    9 +-
 5 files changed, 58 insertions(+), 366 deletions(-)
 rename package/libgtk2/{host-libgtk2-2.12.12-reduce-dependencies.patch => host-libgtk2-2.20.1-reduce-dependencies.patch} (50%)
 delete mode 100644 package/libgtk2/libgtk2-2.12.6-configure.patch
 delete mode 100644 package/libgtk2/libgtk2-2.12.6-no-tests.patch

diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index bb01bef..38b0b47 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -4,15 +4,11 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
 	select BR2_PACKAGE_CAIRO_PDF
+	select BR2_PACKAGE_CAIRO_SVG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_GDK_PIXBUF
-	# libgtk2 on DirectFB is deprecated because it is no longer
-	# supported in recent versions of Gtk. We will remove support
-	# for Gtk over DirectFB in the next Buildroot version unless
-	# support for DirectFB in mainline Gtk is improved in the mean
-	# time.
-	depends on BR2_PACKAGE_XORG7||(BR2_PACKAGE_DIRECTFB && BR2_DEPRECATED)
+	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	help
diff --git a/package/libgtk2/host-libgtk2-2.12.12-reduce-dependencies.patch b/package/libgtk2/host-libgtk2-2.20.1-reduce-dependencies.patch
similarity index 50%
rename from package/libgtk2/host-libgtk2-2.12.12-reduce-dependencies.patch
rename to package/libgtk2/host-libgtk2-2.20.1-reduce-dependencies.patch
index f0ac6bf..49acf75 100644
--- a/package/libgtk2/host-libgtk2-2.12.12-reduce-dependencies.patch
+++ b/package/libgtk2/host-libgtk2-2.20.1-reduce-dependencies.patch
@@ -1,18 +1,18 @@
-Index: gtk+-2.12.12/configure.in
+Hack the configure.in file to add a "none" gdktarget which removes
+dependencies on graphic backends such as X.org or DirectFB. Gtk does
+not fully build in this mode, but it builds sufficiently to build the
+host tools that are needed to build the target Gtk.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.in |  101 ++---------------------------------------------------------
+ 1 file changed, 4 insertions(+), 97 deletions(-)
+
+Index: gtk+-2.22.0/configure.in
 ===================================================================
---- gtk+-2.12.12.orig/configure.in	2008-09-13 02:01:07.000000000 +0200
-+++ gtk+-2.12.12/configure.in	2010-02-21 10:42:40.000000000 +0100
-@@ -32,9 +32,6 @@
- 
- # required versions of other packages
- m4_define([glib_required_version], [2.13.5])
--m4_define([pango_required_version], [1.17.3])
--m4_define([atk_required_version], [1.9.0])
--m4_define([cairo_required_version], [1.2.0])
- 
- 
- AC_INIT([gtk+], [gtk_version],
-@@ -239,12 +236,12 @@
+--- gtk+-2.22.0.orig/configure.in
++++ gtk+-2.22.0/configure.in
+@@ -258,12 +258,12 @@
    gdktarget=x11
  fi
  
@@ -27,64 +27,29 @@ Index: gtk+-2.12.12/configure.in
    *) AC_MSG_ERROR([Invalid target for GDK: use x11, quartz, directfb or win32.]);;
  esac
  
-@@ -349,10 +346,7 @@
- ## the version requirements since those make the module lists 
+@@ -373,9 +373,6 @@
  ## annoying to construct
  PKG_CHECK_MODULES(BASE_DEPENDENCIES,
--  [glib-2.0 >= glib_required_version dnl
+   [glib-2.0 >= glib_required_version dnl
 -   atk >= atk_required_version dnl
 -   pango >= pango_required_version dnl
--   cairo >= cairo_required_version])
-+  [glib-2.0 >= glib_required_version])
+-   cairo >= cairo_required_version dnl
+    gdk-pixbuf-2.0 >= gdk_pixbuf_required_version])
+ 
+ ## In addition to checking that cairo is present, we also need to
+@@ -388,8 +385,6 @@
+ if test "x$cairo_backend" = "xx11"; then
+    cairo_backend=xlib
+ fi
+-PKG_CHECK_MODULES(CAIRO_BACKEND,
+-  [cairo-$cairo_backend >= cairo_required_version])
  
  if test "$os_win32" != yes; then
      # libtool option to control which symbols are exported
-@@ -1061,7 +1055,7 @@
- GDK_PIXBUF_XLIB_EXTRA_CFLAGS=
- GDK_PIXBUF_XLIB_EXTRA_LIBS=
- 	
--X_PACKAGES=fontconfig
-+X_PACKAGES=
- GDK_EXTRA_LIBS="$GDK_WLIBS"
- GDK_EXTRA_CFLAGS=
- 	
-@@ -1070,14 +1064,6 @@
- GTK_DEP_LIBS_FOR_X=
- 
- if test "x$gdktarget" = "xx11"; then
--  #
--  # We use fontconfig very peripherally when decoding the default
--  # settings.
--  #
--  if $PKG_CONFIG --exists fontconfig; then : ; else
--    AC_MSG_ERROR([
--*** fontconfig (http://www.fontconfig.org) is required by the X11 backend.])
--  fi
- 
-   #
-   # Check for basic X packages; we use pkg-config if available
-@@ -1124,16 +1110,6 @@
-   gtk_save_LIBS=$LIBS
-   LIBS="$x_libs_for_checks $LIBS"
-   
--  # Sanity check for the X11 and Xext libraries. While everything we need from
--  # Xext is optional, the chances a system has *none* of these things is so
--  # small that we just unconditionally require it.
--  AC_CHECK_FUNC(XOpenDisplay, :,
--                AC_MSG_ERROR([*** libX11 not found. Check 'config.log' for more details.]))
--  AC_CHECK_FUNC(XextFindDisplay, :,
--                AC_MSG_ERROR([*** libXext not found. Check 'config.log' for more details.]))
--  AC_CHECK_FUNC(XRenderQueryExtension, :,
--                AC_MSG_ERROR([*** libXrender not found. Check 'config.log' for more details.]))
--
-   # Check for xReply
- 
-   AC_MSG_CHECKING([if <X11/extensions/XIproto.h> is needed for xReply])
-@@ -1418,48 +1394,6 @@
-   AM_CONDITIONAL(USE_DIRECTFB, false)
+@@ -1270,50 +1265,6 @@
  fi
  
--
+ 
 -# Check for Pango flags
 -
 -if test "x$gdktarget" = "xwin32"; then
@@ -122,26 +87,30 @@ Index: gtk+-2.12.12/configure.in
 -CFLAGS="$saved_cflags"
 -LDFLAGS="$saved_ldflags"
 -
--GDK_PACKAGES="$PANGO_PACKAGES"
+-# Pull in gio-unix for GDesktopAppInfo usage, see at least gdkapplaunchcontext-x11.c
 -if test "x$gdktarget" = "xx11"; then
--  GDK_PACKAGES="$GDK_PACKAGES $X_PACKAGES"
+-  GDK_PACKAGES="$PANGO_PACKAGES gio-unix-2.0 $X_PACKAGES gdk-pixbuf-2.0 cairo-$cairo_backend"
+-else
+-  GDK_PACKAGES="$PANGO_PACKAGES gio-2.0 gdk-pixbuf-2.0 cairo-$cairo_backend"
 -fi
- GDK_DEP_LIBS="$GDK_EXTRA_LIBS `$PKG_CONFIG --libs $GDK_PIXBUF_PACKAGES $GDK_PACKAGES` $GDK_PIXBUF_EXTRA_LIBS"
- GDK_DEP_CFLAGS="`$PKG_CONFIG --cflags  gthread-2.0 $GDK_PIXBUF_PACKAGES $GDK_PACKAGES` $GDK_PIXBUF_EXTRA_CFLAGS $GDK_EXTRA_CFLAGS"
- 
-@@ -1468,7 +1402,7 @@
+-
+ GDK_DEP_LIBS="$GDK_EXTRA_LIBS `$PKG_CONFIG --libs $GDK_PACKAGES`"
+ GDK_DEP_CFLAGS="`$PKG_CONFIG --cflags  gthread-2.0 $GDK_PACKAGES` $GDK_EXTRA_CFLAGS"
+ #
+@@ -1321,7 +1272,7 @@
  # into the pkg-config files
  #
  if test $enable_explicit_deps != yes ; then
--  GDK_PACKAGES="$PANGO_PACKAGES"
-+  GDK_PACKAGES=
+-  GDK_PACKAGES="$PANGO_PACKAGES gdk-pixbuf-2.0"
++  GDK_PACKAGES="gdk-pixbuf-2.0"
    GDK_EXTRA_LIBS=
  fi
  
-@@ -1479,39 +1413,10 @@
+@@ -1331,37 +1282,7 @@
+ AC_SUBST(GDK_DEP_LIBS)
  AC_SUBST(GDK_DEP_CFLAGS)
  
- 
+-
 -########################################
 -# Check for Accessibility Toolkit flags
 -########################################
@@ -171,20 +140,15 @@ Index: gtk+-2.12.12/configure.in
 -        LIBS="$gtk_save_LIBS"
 -fi
 -
--GTK_PACKAGES="atk cairo"
-+GTK_PACKAGES=
- GTK_EXTRA_LIBS=
- GTK_EXTRA_CFLAGS= 
--GTK_DEP_LIBS="$GDK_EXTRA_LIBS $GTK_DEP_LIBS_FOR_X `$PKG_CONFIG --libs $GDK_PIXBUF_PACKAGES $PANGO_PACKAGES $GTK_PACKAGES_FOR_X $GTK_PACKAGES` $GTK_EXTRA_LIBS $GDK_PIXBUF_EXTRA_LIBS"
-+GTK_DEP_LIBS="$GDK_EXTRA_LIBS $GTK_DEP_LIBS_FOR_X `$PKG_CONFIG --libs $GDK_PIXBUF_PACKAGES $GTK_PACKAGES_FOR_X $GTK_PACKAGES` $GTK_EXTRA_LIBS $GDK_PIXBUF_EXTRA_LIBS"
- GTK_DEP_CFLAGS="`$PKG_CONFIG --cflags  gthread-2.0 $GDK_PIXBUF_PACKAGES $GDK_PACKAGES $GTK_PACKAGES` $GDK_PIXBUF_EXTRA_CFLAGS $GDK_EXTRA_CFLAGS $GTK_EXTRA_CFLAGS"
- 
- if test x"$os_win32" = xyes; then
-@@ -1601,17 +1506,6 @@
- 
+-GTK_PACKAGES="atk cairo gdk-pixbuf-2.0 gio-2.0"
++GTK_PACKAGES="gdk-pixbuf-2.0"
+ if test "x$gdktarget" = "xx11"; then
+   GTK_PACKAGES="$GTK_PACKAGES pangoft2"
+ fi
+@@ -1517,20 +1438,6 @@
  gtk_save_cppflags="$CPPFLAGS"
- CPPFLAGS="$CPPFLAGS $GTK_DEP_CFLAGS"
--			  
+ CPPFLAGS="$CPPFLAGS $GTK_DEP_CFLAGS $GDK_DEP_CFLAGS"
+ 
 -AC_CHECK_HEADER(cairo-pdf.h,,AC_MSG_ERROR([
 -*** Can't find cairo-pdf.h. You must build Cairo with the pdf
 -*** backend enabled.]))
@@ -193,6 +157,10 @@ Index: gtk+-2.12.12/configure.in
 -  AC_CHECK_HEADER(cairo-ps.h,,AC_MSG_ERROR([
 -*** Can't find cairo-ps.h. You must build Cairo with the 
 -*** postscript backend enabled.]))
+-
+-  AC_CHECK_HEADER(cairo-svg.h,,AC_MSG_ERROR([
+-*** Can't find cairo-svg.h. You must build Cairo with the
+-*** svg backend enabled.]))
 -fi   
 -
  CPPFLAGS="$gtk_save_cppflags"
diff --git a/package/libgtk2/libgtk2-2.12.6-configure.patch b/package/libgtk2/libgtk2-2.12.6-configure.patch
deleted file mode 100644
index ea60d2d..0000000
--- a/package/libgtk2/libgtk2-2.12.6-configure.patch
+++ /dev/null
@@ -1,256 +0,0 @@
-diff -urN libgtk2-2.12.6-0rig/configure libgtk2-2.12.6/configure
---- libgtk2-2.12.6-0rig/configure	2008-01-29 04:38:14.000000000 +0100
-+++ libgtk2-2.12.6/configure	2008-07-08 10:54:39.000000000 +0200
-@@ -5094,7 +5094,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux* | k*bsd*-gnu)
-+*-linux-gnu | linux* | k*bsd*-gnu)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
-@@ -6973,7 +6973,7 @@
-   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
-   lt_cv_sys_global_symbol_to_c_name_address="sed -n -e 's/^: \([^ ]*\) $/  {\\\"\1\\\", (lt_ptr) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"\2\", (lt_ptr) \&\2},/p'"
-   ;;
--linux* | k*bsd*-gnu)
-+*-linux-gnu | linux* | k*bsd*-gnu)
-   if test "$host_cpu" = ia64; then
-     symcode='[ABCDGIRSTW]'
-     lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
-@@ -7943,7 +7943,7 @@
-       lt_prog_compiler_static='-Bstatic'
-       ;;
- 
--    linux* | k*bsd*-gnu)
-+    *-linux-gnu | linux* | k*bsd*-gnu)
-       case $cc_basename in
-       icc* | ecc*)
- 	lt_prog_compiler_wl='-Wl,'
-@@ -8402,7 +8402,7 @@
-       archive_expsym_cmds='sed "s,^,_," $export_symbols >$output_objdir/$soname.expsym~$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--retain-symbols-file,$output_objdir/$soname.expsym ${wl}--image-base,`expr ${RANDOM-$$} % 4096 / 2 \* 262144 + 1342177280` -o $lib'
-       ;;
- 
--    gnu* | linux* | k*bsd*-gnu)
-+    *-linux-gnu | gnu* | linux* | k*bsd*-gnu)
-       if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
- 	tmp_addflag=
- 	case $cc_basename,$host_cpu in
-@@ -9336,6 +9336,7 @@
-   if (lt_freq[lt_foo] == 1) { print lt_foo; }
- }'`
-   sys_lib_search_path_spec=`echo $lt_search_path_spec`
-+
- else
-   sys_lib_search_path_spec="/lib /usr/lib /usr/local/lib"
- fi
-@@ -9667,8 +9668,9 @@
-   dynamic_linker=no
-   ;;
- 
-+
- # This must be Linux ELF.
--linux* | k*bsd*-gnu)
-+*-linux-gnu | linux* | k*bsd*-gnu)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
-@@ -9681,8 +9683,22 @@
-   # Some rework will be needed to allow for fast_install
-   # before this can be enabled.
-   hardcode_into_libs=yes
--  sys_lib_search_path_spec="/usr/lib${libsuff} /lib${libsuff} /usr/local/lib${libsuff}"
--  sys_lib_dlsearch_path_spec="/usr/lib${libsuff} /lib${libsuff}"
-+  #  sys_lib_dlsearch_path_spec="/usr/lib${libsuff} /lib${libsuff}"
-+  # Buildroot: New sys_lib_search_path_spec taken from atk!
-+if test "$GCC" = yes; then
-+  sys_lib_search_path_spec=`$CC -print-search-dirs | grep "^libraries:" | $SED -e "s/^libraries://" -e "s,=/,/,g"`
-+  if echo "$sys_lib_search_path_spec" | grep ';' >/dev/null ; then
-+    # if the path contains ";" then we assume it to be the separator
-+    # otherwise default to the standard path separator (i.e. ":") - it is
-+    # assumed that no part of a normal pathname contains ";" but that should
-+    # okay in the real world where ";" in dirpaths is itself problematic.
-+    sys_lib_search_path_spec=`echo "$sys_lib_search_path_spec" | $SED -e 's/;/ /g'`
-+  else
-+    sys_lib_search_path_spec=`echo "$sys_lib_search_path_spec" | $SED  -e "s/$PATH_SEPARATOR/ /g"`
-+  fi
-+else
-+  sys_lib_search_path_spec="/lib /usr/lib /usr/local/lib"
-+fi
- 
-   # Append ld.so.conf contents to the search path
-   if test -f /etc/ld.so.conf; then
-@@ -10780,6 +10796,7 @@
-   # Now quote all the things that may contain metacharacters while being
-   # careful not to overquote the AC_SUBSTed values.  We take copies of the
-   # variables and quote the copies for generation of the libtool script.
-+
-   for var in echo old_CC old_CFLAGS AR AR_FLAGS EGREP RANLIB LN_S LTCC LTCFLAGS NM \
-     SED SHELL STRIP \
-     libname_spec library_names_spec soname_spec extract_expsyms_cmds \
-@@ -12109,7 +12126,7 @@
-     hardcode_libdir_flag_spec_CXX='${wl}-rpath ${wl}$libdir'
-     hardcode_libdir_separator_CXX=:
-     ;;
--  linux* | k*bsd*-gnu)
-+  *-linux-gnu | linux* | k*bsd*-gnu)
-     case $cc_basename in
-       KCC*)
- 	# Kuck and Associates, Inc. (KAI) C++ Compiler
-@@ -12680,7 +12697,7 @@
-   postdeps_CXX=
-   ;;
- 
--linux*)
-+*-linux-gnu | linux*)
-   case `$CC -V 2>&1 | sed 5q` in
-   *Sun\ C*)
-     # Sun C++ 5.9
-@@ -12884,7 +12901,7 @@
- 	    ;;
- 	esac
- 	;;
--      linux* | k*bsd*-gnu)
-+      *-linux-gnu | linux* | k*bsd*-gnu)
- 	case $cc_basename in
- 	  KCC*)
- 	    # KAI C++ Compiler
-@@ -13636,7 +13653,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux* | k*bsd*-gnu)
-+*-linux-gnu | linux* | k*bsd*-gnu)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
-@@ -13649,7 +13666,24 @@
-   # Some rework will be needed to allow for fast_install
-   # before this can be enabled.
-   hardcode_into_libs=yes
--  sys_lib_search_path_spec="/usr/lib${libsuff} /lib${libsuff} /usr/local/lib${libsuff}"
-+
-+  # sys_lib_search_path_spec="/usr/lib${libsuff} /lib${libsuff} /usr/local/lib${libsuff}"
-+  # Buildroot: New sys_lib_search_path_spec taken from atk!
-+if test "$GCC" = yes; then
-+  sys_lib_search_path_spec=`$CC -print-search-dirs | grep "^libraries:" | $SED -e "s/^libraries://" -e "s,=/,/,g"`
-+  if echo "$sys_lib_search_path_spec" | grep ';' >/dev/null ; then
-+    # if the path contains ";" then we assume it to be the separator
-+    # otherwise default to the standard path separator (i.e. ":") - it is
-+    # assumed that no part of a normal pathname contains ";" but that should
-+    # okay in the real world where ";" in dirpaths is itself problematic.
-+    sys_lib_search_path_spec=`echo "$sys_lib_search_path_spec" | $SED -e 's/;/ /g'`
-+  else
-+    sys_lib_search_path_spec=`echo "$sys_lib_search_path_spec" | $SED  -e "s/$PATH_SEPARATOR/ /g"`
-+  fi
-+else
-+  sys_lib_search_path_spec="/lib /usr/lib /usr/local/lib"
-+fi
-+
-   sys_lib_dlsearch_path_spec="/usr/lib${libsuff} /lib${libsuff}"
- 
-   # Append ld.so.conf contents to the search path
-@@ -14586,7 +14620,7 @@
-       lt_prog_compiler_static_F77='-Bstatic'
-       ;;
- 
--    linux* | k*bsd*-gnu)
-+    *-linux-gnu | linux* | k*bsd*-gnu)
-       case $cc_basename in
-       icc* | ecc*)
- 	lt_prog_compiler_wl_F77='-Wl,'
-@@ -15045,7 +15079,7 @@
-       archive_expsym_cmds_F77='sed "s,^,_," $export_symbols >$output_objdir/$soname.expsym~$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--retain-symbols-file,$output_objdir/$soname.expsym ${wl}--image-base,`expr ${RANDOM-$$} % 4096 / 2 \* 262144 + 1342177280` -o $lib'
-       ;;
- 
--    gnu* | linux* | k*bsd*-gnu)
-+    gnu* | *-linux-gnu | linux* | k*bsd*-gnu)
-       if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
- 	tmp_addflag=
- 	case $cc_basename,$host_cpu in
-@@ -16239,7 +16273,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux* | k*bsd*-gnu)
-+*-linux-gnu | linux* | k*bsd*-gnu)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
-@@ -16252,7 +16286,23 @@
-   # Some rework will be needed to allow for fast_install
-   # before this can be enabled.
-   hardcode_into_libs=yes
--  sys_lib_search_path_spec="/usr/lib${libsuff} /lib${libsuff} /usr/local/lib${libsuff}"
-+  # sys_lib_search_path_spec="/usr/lib${libsuff} /lib${libsuff} /usr/local/lib${libsuff}"
-+  # Buildroot: New sys_lib_search_path_spec taken from atk!
-+if test "$GCC" = yes; then
-+  sys_lib_search_path_spec=`$CC -print-search-dirs | grep "^libraries:" | $SED -e "s/^libraries://" -e "s,=/,/,g"`
-+  if echo "$sys_lib_search_path_spec" | grep ';' >/dev/null ; then
-+    # if the path contains ";" then we assume it to be the separator
-+    # otherwise default to the standard path separator (i.e. ":") - it is
-+    # assumed that no part of a normal pathname contains ";" but that should
-+    # okay in the real world where ";" in dirpaths is itself problematic.
-+    sys_lib_search_path_spec=`echo "$sys_lib_search_path_spec" | $SED -e 's/;/ /g'`
-+  else
-+    sys_lib_search_path_spec=`echo "$sys_lib_search_path_spec" | $SED  -e "s/$PATH_SEPARATOR/ /g"`
-+  fi
-+else
-+  sys_lib_search_path_spec="/lib /usr/lib /usr/local/lib"
-+fi
-+
-   sys_lib_dlsearch_path_spec="/usr/lib${libsuff} /lib${libsuff}"
- 
-   # Append ld.so.conf contents to the search path
-@@ -17169,7 +17219,7 @@
-       lt_prog_compiler_static_GCJ='-Bstatic'
-       ;;
- 
--    linux* | k*bsd*-gnu)
-+    *-linux-gnu | linux* | k*bsd*-gnu)
-       case $cc_basename in
-       icc* | ecc*)
- 	lt_prog_compiler_wl_GCJ='-Wl,'
-@@ -17628,7 +17678,7 @@
-       archive_expsym_cmds_GCJ='sed "s,^,_," $export_symbols >$output_objdir/$soname.expsym~$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--retain-symbols-file,$output_objdir/$soname.expsym ${wl}--image-base,`expr ${RANDOM-$$} % 4096 / 2 \* 262144 + 1342177280` -o $lib'
-       ;;
- 
--    gnu* | linux* | k*bsd*-gnu)
-+    gnu* | *-linux-gnu | linux* | k*bsd*-gnu)
-       if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
- 	tmp_addflag=
- 	case $cc_basename,$host_cpu in
-@@ -18842,7 +18892,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux* | k*bsd*-gnu)
-+*-linux-gnu | linux* | k*bsd*-gnu)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
-@@ -18855,7 +18905,22 @@
-   # Some rework will be needed to allow for fast_install
-   # before this can be enabled.
-   hardcode_into_libs=yes
--  sys_lib_search_path_spec="/usr/lib${libsuff} /lib${libsuff} /usr/local/lib${libsuff}"
-+  #sys_lib_search_path_spec="/usr/lib${libsuff} /lib${libsuff} /usr/local/lib${libsuff}"
-+  # Buildroot: New sys_lib_search_path_spec taken from atk!
-+if test "$GCC" = yes; then
-+  sys_lib_search_path_spec=`$CC -print-search-dirs | grep "^libraries:" | $SED -e "s/^libraries://" -e "s,=/,/,g"`
-+  if echo "$sys_lib_search_path_spec" | grep ';' >/dev/null ; then
-+    # if the path contains ";" then we assume it to be the separator
-+    # otherwise default to the standard path separator (i.e. ":") - it is
-+    # assumed that no part of a normal pathname contains ";" but that should
-+    # okay in the real world where ";" in dirpaths is itself problematic.
-+    sys_lib_search_path_spec=`echo "$sys_lib_search_path_spec" | $SED -e 's/;/ /g'`
-+  else
-+    sys_lib_search_path_spec=`echo "$sys_lib_search_path_spec" | $SED  -e "s/$PATH_SEPARATOR/ /g"`
-+  fi
-+else
-+  sys_lib_search_path_spec="/lib /usr/lib /usr/local/lib"
-+fi
-   sys_lib_dlsearch_path_spec="/usr/lib${libsuff} /lib${libsuff}"
- 
-   # Append ld.so.conf contents to the search path
diff --git a/package/libgtk2/libgtk2-2.12.6-no-tests.patch b/package/libgtk2/libgtk2-2.12.6-no-tests.patch
deleted file mode 100644
index ea92433..0000000
--- a/package/libgtk2/libgtk2-2.12.6-no-tests.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/Makefile.in	2008-01-28 22:38:09.000000000 -0500
-+++ b/Makefile.in	2008-02-11 12:52:45.000000000 -0500
-@@ -330,7 +330,7 @@ sharedstatedir = @sharedstatedir@
- sysconfdir = @sysconfdir@
- target_alias = @target_alias@
- 
--SRC_SUBDIRS = gdk-pixbuf gdk gtk modules demos tests perf contrib
-+SRC_SUBDIRS = gdk-pixbuf gdk gtk modules demos perf contrib
- SUBDIRS = po po-properties $(SRC_SUBDIRS) docs m4macros
- 
- # require automake 1.4
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index d6f2324..e19025d 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -3,8 +3,8 @@
 # libgtk2.0
 #
 #############################################################
-LIBGTK2_VERSION_MAJOR:=2.12
-LIBGTK2_VERSION_MINOR:=12
+LIBGTK2_VERSION_MAJOR:=2.22
+LIBGTK2_VERSION_MINOR:=0
 LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).$(LIBGTK2_VERSION_MINOR)
 
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.bz2
@@ -90,11 +90,6 @@ else
 	LIBGTK2_CONF_OPT += --without-x
 endif
 
-# Buildroot does not support JPEG2000 library
-ifeq ($(LIBGTK2_VERSION_MAJOR),2.15)
-LIBGTK2_CONF_OPT += --without-libjasper
-endif
-
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 LIBGTK2_DEPENDENCIES += libpng
 else
-- 
1.7.1
