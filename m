From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:15:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20080306181525.65E0D120221@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:15:25 -0800 (Thu, 06 Mar 2008)
New Revision: 21205

Log:
updated glib2

Added:
   trunk/buildroot/package/libglib2/libglib2-2.15.4-libdir-la.patch
   trunk/buildroot/package/libglib2/libglib2-2.15.4-mkenums-nowarn.patch
   trunk/buildroot/package/libglib2/libglib2-2.15.4-pkgconfig-cc.patch

Removed:
   trunk/buildroot/package/libglib2/glib-gettextize-dir.patch
   trunk/buildroot/package/libglib2/glib-mkenums-nowarn.patch
   trunk/buildroot/package/libglib2/glibconfig-sysdefs.h
   trunk/buildroot/package/libglib2/glibinclude.patch
   trunk/buildroot/package/libglib2/gtk-doc.patch
   trunk/buildroot/package/libglib2/libdir-la.patch

Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Deleted: trunk/buildroot/package/libglib2/glib-gettextize-dir.patch
===================================================================
--- trunk/buildroot/package/libglib2/glib-gettextize-dir.patch	2008-03-06 18:15:06 UTC (rev 21204)
+++ trunk/buildroot/package/libglib2/glib-gettextize-dir.patch	2008-03-06 18:15:25 UTC (rev 21205)
@@ -1,11 +0,0 @@
---- glib-2.12.3/glib-gettextize.in.orig	2005-12-06 20:57:14.000000000 -0700
-+++ glib-2.12.3/glib-gettextize.in	2007-01-09 21:21:41.000000000 -0700
-@@ -49,7 +49,7 @@
-     ;;
- esac
- 
--gettext_dir=$prefix/share/glib-2.0/gettext
-+gettext_dir=@datadir@/glib-2.0/gettext
- 
- while test $# -gt 0; do
-   case "$1" in

Deleted: trunk/buildroot/package/libglib2/glib-mkenums-nowarn.patch
===================================================================
--- trunk/buildroot/package/libglib2/glib-mkenums-nowarn.patch	2008-03-06 18:15:06 UTC (rev 21204)
+++ trunk/buildroot/package/libglib2/glib-mkenums-nowarn.patch	2008-03-06 18:15:25 UTC (rev 21205)
@@ -1,8 +0,0 @@
---- glib-2.6.5/gobject/glib-mkenums.in.orig	2006-06-15 21:28:23.436946024 -0600
-+++ glib-2.6.5/gobject/glib-mkenums.in	2006-06-15 21:28:35.417124760 -0600
-@@ -1,4 +1,4 @@
--#!@PERL_PATH@ -w
-+#!@PERL_PATH@
- 
- # glib-mkenums.pl 
- # Information about the current enumeration

Deleted: trunk/buildroot/package/libglib2/glibconfig-sysdefs.h
===================================================================
--- trunk/buildroot/package/libglib2/glibconfig-sysdefs.h	2008-03-06 18:15:06 UTC (rev 21204)
+++ trunk/buildroot/package/libglib2/glibconfig-sysdefs.h	2008-03-06 18:15:25 UTC (rev 21205)
@@ -1,6 +0,0 @@
-#define GLIB_SYSDEF_POLLIN =1
-#define GLIB_SYSDEF_POLLOUT =4
-#define GLIB_SYSDEF_POLLPRI =2
-#define GLIB_SYSDEF_POLLERR =8
-#define GLIB_SYSDEF_POLLHUP =16
-#define GLIB_SYSDEF_POLLNVAL =32

Deleted: trunk/buildroot/package/libglib2/glibinclude.patch
===================================================================
--- trunk/buildroot/package/libglib2/glibinclude.patch	2008-03-06 18:15:06 UTC (rev 21204)
+++ trunk/buildroot/package/libglib2/glibinclude.patch	2008-03-06 18:15:25 UTC (rev 21205)
@@ -1,13 +0,0 @@
---- glib-2.12.3/glib/Makefile.am.orig	2006-05-09 18:44:49.000000000 -0600
-+++ glib-2.12.3/glib/Makefile.am	2007-01-09 21:25:57.000000000 -0700
-@@ -201,8 +201,8 @@
- 	gprintf.h
- 
- install-data-local: install-ms-lib install-def-file
--	@if test -f $(glibincludedir)/glist.h ; then					\
--	  echo "*** Old headers found in $(glibincludedir). You should remove the" ;	\
-+	@if test -f $(DESTDIR)$(glibincludedir)/glist.h ; then					\
-+	  echo "*** Old headers found in $(DESTDIR)$(glibincludedir). You should remove the" ;	\
- 	  echo "*** contents of this directory and type 'make install' again." ;	\
- 	  false ;									\
-         fi

Deleted: trunk/buildroot/package/libglib2/gtk-doc.patch
===================================================================
--- trunk/buildroot/package/libglib2/gtk-doc.patch	2008-03-06 18:15:06 UTC (rev 21204)
+++ trunk/buildroot/package/libglib2/gtk-doc.patch	2008-03-06 18:15:25 UTC (rev 21205)
@@ -1,59 +0,0 @@
---- glib/acinclude.m4	2004-05-08 11:14:46.000000000 +0100
-+++ glib/acinclude.m4	2004-05-08 11:14:55.000000000 +0100
-@@ -446,3 +446,56 @@
- ])
- 
- 
-+dnl -*- mode: autoconf -*-
-+
-+# serial 1
-+
-+dnl Usage:
-+dnl   GTK_DOC_CHECK([minimum-gtk-doc-version])
-+AC_DEFUN([GTK_DOC_CHECK],
-+[
-+  AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
-+  AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
-+  dnl for overriding the documentation installation directory
-+  AC_ARG_WITH(html-dir,
-+    AC_HELP_STRING([--with-html-dir=PATH], [path to installed docs]),,
-+    [with_html_dir='${datadir}/gtk-doc/html'])
-+  HTML_DIR="$with_html_dir"
-+  AC_SUBST(HTML_DIR)
-+
-+  dnl enable/disable documentation building
-+  AC_ARG_ENABLE(gtk-doc,
-+    AC_HELP_STRING([--enable-gtk-doc],
-+                   [use gtk-doc to build documentation [default=no]]),,
-+    enable_gtk_doc=no)
-+
-+  have_gtk_doc=no
-+  if test -z "$PKG_CONFIG"; then
-+    AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
-+  fi
-+  if test "$PKG_CONFIG" != "no" && $PKG_CONFIG --exists gtk-doc; then
-+    have_gtk_doc=yes
-+  fi
-+
-+  dnl do we want to do a version check?
-+ifelse([$1],[],,
-+  [gtk_doc_min_version=$1
-+  if test "$have_gtk_doc" = yes; then
-+    AC_MSG_CHECKING([gtk-doc version >= $gtk_doc_min_version])
-+    if $PKG_CONFIG --atleast-version $gtk_doc_min_version gtk-doc; then
-+      AC_MSG_RESULT(yes)
-+    else
-+      AC_MSG_RESULT(no)
-+      have_gtk_doc=no
-+    fi
-+  fi
-+])
-+  if test x$enable_gtk_doc = xyes; then
-+    if test "$have_gtk_doc" != yes; then
-+      enable_gtk_doc=no
-+    fi
-+  fi
-+
-+  AM_CONDITIONAL(ENABLE_GTK_DOC, test x$enable_gtk_doc = xyes)
-+  AM_CONDITIONAL(GTK_DOC_USE_LIBTOOL, test -n "$LIBTOOL")
-+])

Deleted: trunk/buildroot/package/libglib2/libdir-la.patch
===================================================================
--- trunk/buildroot/package/libglib2/libdir-la.patch	2008-03-06 18:15:06 UTC (rev 21204)
+++ trunk/buildroot/package/libglib2/libdir-la.patch	2008-03-06 18:15:25 UTC (rev 21205)
@@ -1,77 +0,0 @@
---- glib/ltmain.sh.orig	2006-07-13 01:12:13.000000000 -0600
-+++ glib/ltmain.sh	2007-01-13 13:59:13.000000000 -0700
-@@ -283,8 +283,9 @@
- 	# line option must be used.
- 	if test -z "$tagname"; then
- 	  $echo "$modename: unable to infer tagged configuration"
--	  $echo "$modename: specify a tag with \`--tag'" 1>&2
--	  exit $EXIT_FAILURE
-+	  $echo "$modename: defaulting to \`CC'"
-+	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
-+#	  exit $EXIT_FAILURE
- #        else
- #          $echo "$modename: using $tagname tagged configuration"
- 	fi
-@@ -2434,8 +2435,14 @@
- 	    absdir="$abs_ladir"
- 	    libdir="$abs_ladir"
- 	  else
--	    dir="$libdir"
--	    absdir="$libdir"
-+            # Adding 'libdir' from the .la file to our library search paths
-+            # breaks crosscompilation horribly.  We cheat here and don't add
-+            # it, instead adding the path where we found the .la.  -CL
-+	    dir="$abs_ladir"
-+	    absdir="$abs_ladir"
-+	    libdir="$abs_ladir"
-+	    #dir="$libdir"
-+	    #absdir="$libdir"
- 	  fi
- 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
- 	else
-@@ -2918,6 +2925,16 @@
- 		esac
- 		if grep "^installed=no" $deplib > /dev/null; then
- 		  path="$absdir/$objdir"
-+#		This interferes with crosscompilation. -CL
-+#		else
-+#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
-+#		  if test -z "$libdir"; then
-+#		    $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
-+#		    exit 1
-+#		  fi
-+#		  if test "$absdir" != "$libdir"; then
-+#		    $echo "$modename: warning: \`$deplib' seems to be moved" 1>&2
-+#		  fi
- 		else
- 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
- 		  if test -z "$libdir"; then
-@@ -5641,6 +5658,10 @@
- 	    # Replace all uninstalled libtool libraries with the installed ones
- 	    newdependency_libs=
- 	    for deplib in $dependency_libs; do
-+              # Replacing uninstalled with installed can easily break crosscompilation,
-+              # since the installed path is generally the wrong architecture.  -CL
-+              newdependency_libs="$newdependency_libs $deplib"
-+              continue
- 	      case $deplib in
- 	      *.la)
- 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
-@@ -5962,10 +5983,13 @@
- 	  # At present, this check doesn't affect windows .dll's that
- 	  # are installed into $libdir/../bin (currently, that works fine)
- 	  # but it's something to keep an eye on.
--	  if test "$inst_prefix_dir" = "$destdir"; then
--	    $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
--	    exit $EXIT_FAILURE
--	  fi
-+	  #
-+	  # This breaks install into our staging area.  -PB
-+	  # 
-+	  # if test "$inst_prefix_dir" = "$destdir"; then
-+	  #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
-+	  #   exit $EXIT_FAILURE
-+	  # fi
- 
- 	  if test -n "$inst_prefix_dir"; then
- 	    # Stick the inst_prefix_dir data into the link command.

Added: trunk/buildroot/package/libglib2/libglib2-2.15.4-libdir-la.patch
===================================================================
--- trunk/buildroot/package/libglib2/libglib2-2.15.4-libdir-la.patch	                        (rev 0)
+++ trunk/buildroot/package/libglib2/libglib2-2.15.4-libdir-la.patch	2008-03-06 18:15:25 UTC (rev 21205)
@@ -0,0 +1,77 @@
+--- glib/ltmain.sh.orig	2006-07-13 01:12:13.000000000 -0600
++++ glib/ltmain.sh	2007-01-13 13:59:13.000000000 -0700
+@@ -283,8 +283,9 @@
+ 	# line option must be used.
+ 	if test -z "$tagname"; then
+ 	  $echo "$modename: unable to infer tagged configuration"
+-	  $echo "$modename: specify a tag with \`--tag'" 1>&2
+-	  exit $EXIT_FAILURE
++	  $echo "$modename: defaulting to \`CC'"
++	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
++#	  exit $EXIT_FAILURE
+ #        else
+ #          $echo "$modename: using $tagname tagged configuration"
+ 	fi
+@@ -2434,8 +2435,14 @@
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
+@@ -2918,6 +2925,16 @@
+ 		esac
+ 		if grep "^installed=no" $deplib > /dev/null; then
+ 		  path="$absdir/$objdir"
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
+ 		else
+ 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
+ 		  if test -z "$libdir"; then
+@@ -5641,6 +5658,10 @@
+ 	    # Replace all uninstalled libtool libraries with the installed ones
+ 	    newdependency_libs=
+ 	    for deplib in $dependency_libs; do
++              # Replacing uninstalled with installed can easily break crosscompilation,
++              # since the installed path is generally the wrong architecture.  -CL
++              newdependency_libs="$newdependency_libs $deplib"
++              continue
+ 	      case $deplib in
+ 	      *.la)
+ 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
+@@ -5962,10 +5983,13 @@
+ 	  # At present, this check doesn't affect windows .dll's that
+ 	  # are installed into $libdir/../bin (currently, that works fine)
+ 	  # but it's something to keep an eye on.
+-	  if test "$inst_prefix_dir" = "$destdir"; then
+-	    $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
+-	    exit $EXIT_FAILURE
+-	  fi
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

Added: trunk/buildroot/package/libglib2/libglib2-2.15.4-mkenums-nowarn.patch
===================================================================
--- trunk/buildroot/package/libglib2/libglib2-2.15.4-mkenums-nowarn.patch	                        (rev 0)
+++ trunk/buildroot/package/libglib2/libglib2-2.15.4-mkenums-nowarn.patch	2008-03-06 18:15:25 UTC (rev 21205)
@@ -0,0 +1,8 @@
+--- glib-2.6.5/gobject/glib-mkenums.in.orig	2006-06-15 21:28:23.436946024 -0600
++++ glib-2.6.5/gobject/glib-mkenums.in	2006-06-15 21:28:35.417124760 -0600
+@@ -1,4 +1,4 @@
+-#!@PERL_PATH@ -w
++#!@PERL_PATH@
+ 
+ # glib-mkenums.pl 
+ # Information about the current enumeration

Added: trunk/buildroot/package/libglib2/libglib2-2.15.4-pkgconfig-cc.patch
===================================================================
--- trunk/buildroot/package/libglib2/libglib2-2.15.4-pkgconfig-cc.patch	                        (rev 0)
+++ trunk/buildroot/package/libglib2/libglib2-2.15.4-pkgconfig-cc.patch	2008-03-06 18:15:25 UTC (rev 21205)
@@ -0,0 +1,15 @@
+--- a/glib-2.0.pc.in	2007-01-16 18:24:39.000000000 -0500
++++ b/glib-2.0.pc.in	2008-02-09 09:25:28.000000000 -0500
+@@ -3,9 +3,9 @@ exec_prefix=@exec_prefix@
+ libdir=@libdir@
+ includedir=@includedir@
+ 
+-glib_genmarshal=glib-genmarshal
+-gobject_query=gobject-query
+-glib_mkenums=glib-mkenums
++glib_genmarshal=/usr/bin/glib-genmarshal
++gobject_query=/usr/bin/gobject-query
++glib_mkenums=/usr/bin/glib-mkenums
+ 
+ Name: GLib
+ Description: C Utility Library

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2008-03-06 18:15:06 UTC (rev 21204)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2008-03-06 18:15:25 UTC (rev 21205)
@@ -3,153 +3,56 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION:=2.12.9
-LIBGLIB2_SOURCE:=glib-$(LIBGLIB2_VERSION).tar.bz2
-LIBGLIB2_SITE:=http://ftp.gtk.org/pub/glib/2.12
-LIBGLIB2_CAT:=$(BZCAT)
-LIBGLIB2_DIR:=$(BUILD_DIR)/glib-$(LIBGLIB2_VERSION)
-LIBGLIB2_BINARY:=libglib-2.0.a
+LIBGLIB2_VERSION = 2.15.4
+LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
+LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/2.15
+LIBGLIB2_AUTORECONF = NO
+LIBGLIB2_INSTALL_STAGING = YES
+LIBGLIB2_INSTALL_TARGET = YES
+LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install 
 
-$(DL_DIR)/$(LIBGLIB2_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(LIBGLIB2_SITE)/$(LIBGLIB2_SOURCE)
+LIBGLIB2_CONF_ENV =	$(TARGET_CONFIGURE_OPTS) $(TARGET_CONFIGURE_ARGS) \
+		ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
+		glib_cv_uscore=no ac_cv_func_strtod=yes \
+		ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
+		ac_cv_func_closedir_void=no ac_cv_func_getloadavg=no \
+		ac_cv_lib_util_getloadavg=no ac_cv_lib_getloadavg_getloadavg=no \
+		ac_cv_func_getgroups=yes ac_cv_func_getgroups_works=yes \
+		ac_cv_func_chown_works=yes ac_cv_have_decl_euidaccess=no \
+		ac_cv_func_euidaccess=no ac_cv_have_decl_strnlen=yes \
+		ac_cv_func_strnlen_working=yes ac_cv_func_lstat_dereferences_slashed_symlink=yes \
+		ac_cv_func_lstat_empty_string_bug=no ac_cv_func_stat_empty_string_bug=no \
+		vb_cv_func_rename_trailing_slash_bug=no ac_cv_have_decl_nanosleep=yes \
+		jm_cv_func_nanosleep_works=yes gl_cv_func_working_utimes=yes \
+		ac_cv_func_utime_null=yes ac_cv_have_decl_strerror_r=yes \
+		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
+		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
+		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
+		utils_cv_func_mkdir_trailing_slash_bug=no ac_cv_func_memcmp_working=yes \
+		ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes \
+		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes \
+		ac_cv_func_realloc_0_nonnull=yes jm_cv_func_gettimeofday_clobber=no \
+		gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no \
+		utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no \
+		gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes \
+		gl_cv_func_getcwd_path_max=yes ac_cv_func_fnmatch_gnu=yes \
+		am_getline_needs_run_time_check=no am_cv_func_working_getline=yes \
+		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
+		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
+		ac_use_included_regex=no gl_cv_c_restrict=no \
+		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
+		ac_cv_prog_CXX=no ac_cv_func_posix_getgrgid_r=no 
 
-libglib2-source: $(DL_DIR)/$(LIBGLIB2_SOURCE)
+LIBGLIB2_CONF_OPT =	--target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) --prefix=/usr \
+		--exec-prefix=/usr --bindir=/usr/bin \
+		--sbindir=/usr/sbin --libdir=/usr/lib \
+		--libexecdir=/usr/lib --sysconfdir=/etc \
+		--datadir=/usr/share --localstatedir=/var \
+		--includedir=/usr/include --mandir=/usr/man \
+		--infodir=/usr/info --enable-shared \
+		--enable-static $(DISABLE_NLS) 
 
-$(LIBGLIB2_DIR)/.unpacked: $(DL_DIR)/$(LIBGLIB2_SOURCE)
-	$(LIBGLIB2_CAT) $(DL_DIR)/$(LIBGLIB2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBGLIB2_DIR) package/libglib2/ \*.patch*
-	$(INSTALL) -m 0644 package/libglib2/glibconfig-sysdefs.h $(LIBGLIB2_DIR)/
-	$(CONFIG_UPDATE) $(LIBGLIB2_DIR)
-	touch $(LIBGLIB2_DIR)/.unpacked
+LIBGLIB2_DEPENDENCIES = uclibc gettext libintl pkgconfig 
 
-$(LIBGLIB2_DIR)/.configured: $(LIBGLIB2_DIR)/.unpacked
-	(cd $(LIBGLIB2_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_func_posix_getpwuid_r=yes \
-		glib_cv_stack_grows=no \
-		glib_cv_uscore=no \
-		ac_cv_func_strtod=yes \
-		ac_fsusage_space=yes \
-		fu_cv_sys_stat_statfs2_bsize=yes \
-		ac_cv_func_closedir_void=no \
-		ac_cv_func_getloadavg=no \
-		ac_cv_lib_util_getloadavg=no \
-		ac_cv_lib_getloadavg_getloadavg=no \
-		ac_cv_func_getgroups=yes \
-		ac_cv_func_getgroups_works=yes \
-		ac_cv_func_chown_works=yes \
-		ac_cv_have_decl_euidaccess=no \
-		ac_cv_func_euidaccess=no \
-		ac_cv_have_decl_strnlen=yes \
-		ac_cv_func_strnlen_working=yes \
-		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-		ac_cv_func_lstat_empty_string_bug=no \
-		ac_cv_func_stat_empty_string_bug=no \
-		vb_cv_func_rename_trailing_slash_bug=no \
-		ac_cv_have_decl_nanosleep=yes \
-		jm_cv_func_nanosleep_works=yes \
-		gl_cv_func_working_utimes=yes \
-		ac_cv_func_utime_null=yes \
-		ac_cv_have_decl_strerror_r=yes \
-		ac_cv_func_strerror_r_char_p=no \
-		jm_cv_func_svid_putenv=yes \
-		ac_cv_func_getcwd_null=yes \
-		ac_cv_func_getdelim=yes \
-		ac_cv_func_mkstemp=yes \
-		utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no \
-		ac_cv_func_memcmp_working=yes \
-		ac_cv_have_decl_malloc=yes \
-		gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes \
-		jm_cv_func_gettimeofday_clobber=no \
-		gl_cv_func_working_readdir=yes \
-		jm_ac_cv_func_link_follows_symlink=no \
-		utils_cv_localtime_cache=no \
-		ac_cv_struct_st_mtim_nsec=no \
-		gl_cv_func_tzset_clobber=no \
-		gl_cv_func_getcwd_null=yes \
-		gl_cv_func_getcwd_path_max=yes \
-		ac_cv_func_fnmatch_gnu=yes \
-		am_getline_needs_run_time_check=no \
-		am_cv_func_working_getline=yes \
-		gl_cv_func_mkdir_trailing_slash_bug=no \
-		gl_cv_func_mkstemp_limitations=no \
-		ac_cv_func_working_mktime=yes \
-		jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no \
-		gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
-		ac_cv_prog_F77=no \
-		ac_cv_prog_CXX=no \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--enable-shared \
-		--enable-static \
-		$(DISABLE_NLS) \
-	)
-	touch $(LIBGLIB2_DIR)/.configured
-
-$(LIBGLIB2_DIR)/glib/.libs/$(LIBGLIB2_BINARY): $(LIBGLIB2_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LIBGLIB2_DIR)
-	touch -c $(LIBGLIB2_DIR)/glib/.libs/$(LIBGLIB2_BINARY)
-
-$(STAGING_DIR)/lib/$(LIBGLIB2_BINARY): $(LIBGLIB2_DIR)/glib/.libs/$(LIBGLIB2_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBGLIB2_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libglib-2.0.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libgmodule-2.0.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libgobject-2.0.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libgthread-2.0.la
-
-$(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6: $(STAGING_DIR)/lib/$(LIBGLIB2_BINARY)
-	cp -a $(STAGING_DIR)/lib/libglib-2.0.so $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libglib-2.0.so.0* $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libgmodule-2.0.so $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libgmodule-2.0.so.0* $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libgobject-2.0.so $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libgobject-2.0.so.0* $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libgthread-2.0.so $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libgthread-2.0.so.0* $(TARGET_DIR)/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libglib-2.0.so.0.*
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libgmodule-2.0.so.0.*
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libgobject-2.0.so.0.*
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libgthread-2.0.so.0.*
-	touch -c $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6
-
-libglib2: uclibc gettext libintl pkgconfig $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6
-
-libglib2-clean:
-	rm -f $(TARGET_DIR)/usr/lib/libglib-2.0*
-	rm -f $(TARGET_DIR)/usr/lib/libgmodule-2.0*
-	rm -f $(TARGET_DIR)/usr/lib/libgobject-2.0*
-	rm -f $(TARGET_DIR)/usr/lib/libgthread-2.0*
-	-$(MAKE) -C $(LIBGLIB2_DIR) clean
-
-libglib2-dirclean:
-	rm -rf $(LIBGLIB2_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_LIBGLIB2)),y)
-TARGETS+=libglib2
-endif
+$(eval $(call AUTOTARGETS,package,libglib2))
