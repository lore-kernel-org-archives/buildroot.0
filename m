From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 26 Dec 2008 15:36:03 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia: libmpd
Message-ID: <20081226153603.D0A6F76F25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-26 15:36:03 +0000 (Fri, 26 Dec 2008)
New Revision: 24551

Log:
package/multimedia: add libmpd package

Added:
   trunk/buildroot/package/multimedia/libmpd/
   trunk/buildroot/package/multimedia/libmpd/Config.in
   trunk/buildroot/package/multimedia/libmpd/libmpd-0.17.0-accept-glib-2.15.patch
   trunk/buildroot/package/multimedia/libmpd/libmpd-0.17.0-libdir-la.patch
   trunk/buildroot/package/multimedia/libmpd/libmpd.mk

Modified:
   trunk/buildroot/package/multimedia/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/Config.in	2008-12-26 14:56:03 UTC (rev 24550)
+++ trunk/buildroot/package/multimedia/Config.in	2008-12-26 15:36:03 UTC (rev 24551)
@@ -9,6 +9,7 @@
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
+source "package/multimedia/libmpd/Config.in"
 source "package/multimedia/libogg/Config.in"
 source "package/multimedia/libsndfile/Config.in"
 source "package/multimedia/libtheora/Config.in"

Added: trunk/buildroot/package/multimedia/libmpd/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/libmpd/Config.in	                        (rev 0)
+++ trunk/buildroot/package/multimedia/libmpd/Config.in	2008-12-26 15:36:03 UTC (rev 24551)
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBMPD
+	bool "libmpd"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GETTEXT
+	select BR2_PACKAGE_LIBINTL
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_PKGCONFIG
+	help
+	  High-level client library for accessing Music Player Daemon.
+	  LibMpd is a library that provides high-level, callback-based
+	  access to Music Player Daemon (mpd).
+
+	  http://gmpcwiki.sarine.nl/index.php?title=Libmpd

Added: trunk/buildroot/package/multimedia/libmpd/libmpd-0.17.0-accept-glib-2.15.patch
===================================================================
--- trunk/buildroot/package/multimedia/libmpd/libmpd-0.17.0-accept-glib-2.15.patch	                        (rev 0)
+++ trunk/buildroot/package/multimedia/libmpd/libmpd-0.17.0-accept-glib-2.15.patch	2008-12-26 15:36:03 UTC (rev 24551)
@@ -0,0 +1,17 @@
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: libmpd-0.17.0/configure.ac
+===================================================================
+--- libmpd-0.17.0.orig/configure.ac
++++ libmpd-0.17.0/configure.ac
+@@ -25,7 +25,7 @@
+ AC_SUBST(EXTRA_CFLAGS)
+ AC_SUBST(EXTRA_LDFLAGS)   
+ 
+-PKG_CHECK_MODULES([glib], glib-2.0 >= 2.16)
++PKG_CHECK_MODULES([glib], glib-2.0 >= 2.15)
+ AC_SUBST(glib_LIBS)
+ AC_SUBST(glib_CFLAGS)
+ 

Added: trunk/buildroot/package/multimedia/libmpd/libmpd-0.17.0-libdir-la.patch
===================================================================
--- trunk/buildroot/package/multimedia/libmpd/libmpd-0.17.0-libdir-la.patch	                        (rev 0)
+++ trunk/buildroot/package/multimedia/libmpd/libmpd-0.17.0-libdir-la.patch	2008-12-26 15:36:03 UTC (rev 24551)
@@ -0,0 +1,89 @@
+---
+ ltmain.sh |   39 +++++++++++++++++++++++++++++++++------
+ 1 file changed, 33 insertions(+), 6 deletions(-)
+
+Index: libmpd-0.17.0/ltmain.sh
+===================================================================
+--- libmpd-0.17.0.orig/ltmain.sh
++++ libmpd-0.17.0/ltmain.sh
+@@ -1056,7 +1056,9 @@
+ 	# line option must be used.
+ 	if test -z "$tagname"; then
+ 	  func_echo "unable to infer tagged configuration"
+-	  func_fatal_error "specify a tag with \`--tag'"
++	  $echo "$modename: defaulting to \`CC'"
++	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
++#	  func_fatal_error "specify a tag with \`--tag'"
+ #	else
+ #	  func_verbose "using $tagname tagged configuration"
+ 	fi
+@@ -2025,8 +2027,13 @@
+ 	  # At present, this check doesn't affect windows .dll's that
+ 	  # are installed into $libdir/../bin (currently, that works fine)
+ 	  # but it's something to keep an eye on.
+-	  test "$inst_prefix_dir" = "$destdir" && \
+-	    func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
++	  #
++	  # This breaks install into our staging area.  -PB
++	  # 
++	  # if test "$inst_prefix_dir" = "$destdir"; then
++	  #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
++	  #   exit $EXIT_FAILURE
++	  # fi
+ 
+ 	  if test -n "$inst_prefix_dir"; then
+ 	    # Stick the inst_prefix_dir data into the link command.
+@@ -5419,8 +5426,14 @@
+ 	    absdir="$abs_ladir"
+ 	    libdir="$abs_ladir"
+ 	  else
+-	    dir="$libdir"
+-	    absdir="$libdir"
++            # Adding 'libdir' from the .la file to our library search paths
++            # breaks crosscompilation horribly.  We cheat here and don't add
++            # it, instead adding the path where we found the .la.  -CL
++	    dir="$abs_ladir"
++	    absdir="$abs_ladir"
++	    libdir="$abs_ladir"
++	    #dir="$libdir"
++	    #absdir="$libdir"
+ 	  fi
+ 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
+ 	else
+@@ -5571,7 +5584,7 @@
+ 	  *)
+ 	    if test "$installed" = no; then
+ 	      notinst_deplibs="$notinst_deplibs $lib"
+-	      need_relink=yes
++	      need_relink=no
+ 	    fi
+ 	    ;;
+ 	  esac
+@@ -5901,6 +5914,16 @@
+ 	    # Add the search paths of all dependency libraries
+ 	    for deplib in $dependency_libs; do
+ 	      case $deplib in
++#		This interferes with crosscompilation. -CL
++#		else
++#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
++#		  if test -z "$libdir"; then
++#		    $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
++#		    exit 1
++#		  fi
++#		  if test "$absdir" != "$libdir"; then
++#		    $echo "$modename: warning: \`$deplib' seems to be moved" 1>&2
++#		  fi
+ 	      -L*) path="$deplib" ;;
+ 	      *.la)
+ 	        func_dirname "$deplib" "" "."
+@@ -8059,6 +8082,10 @@
+ 	    # Replace all uninstalled libtool libraries with the installed ones
+ 	    newdependency_libs=
+ 	    for deplib in $dependency_libs; do
++              # Replacing uninstalled with installed can easily break crosscompilation,
++              # since the installed path is generally the wrong architecture.  -CL
++              newdependency_libs="$newdependency_libs $deplib"
++              continue
+ 	      case $deplib in
+ 	      *.la)
+ 		func_basename "$deplib"

Added: trunk/buildroot/package/multimedia/libmpd/libmpd.mk
===================================================================
--- trunk/buildroot/package/multimedia/libmpd/libmpd.mk	                        (rev 0)
+++ trunk/buildroot/package/multimedia/libmpd/libmpd.mk	2008-12-26 15:36:03 UTC (rev 24551)
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libmpd
+#
+#############################################################
+LIBMPD_VERSION = 0.17.0
+LIBMPD_SOURCE = libmpd-$(LIBMPD_VERSION).tar.gz
+LIBMPD_SITE = http://download.sarine.nl/download/Programs/gmpc/$(LIBMPD_VERSION)/
+LIBMPD_AUTORECONF = YES
+LIBMPD_INSTALL_STAGING = YES
+LIBMPD_LIBTOOL_PATCH = NO
+LIBMPD_DEPENDENCIES = libglib2
+
+$(eval $(call AUTOTARGETS,package/multimedia,libmpd))
