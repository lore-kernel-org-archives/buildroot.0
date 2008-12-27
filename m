From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 27 Dec 2008 14:36:23 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pango
Message-ID: <20081227143623.A5BDD76BD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-27 14:36:22 +0000 (Sat, 27 Dec 2008)
New Revision: 24567

Log:
pango: bump version

Added:
   trunk/buildroot/package/pango/pango-gtk-doc.patch
   trunk/buildroot/package/pango/pango-no-libthai.patch
   trunk/buildroot/package/pango/pango-no-tests.patch

Removed:
   trunk/buildroot/package/pango/pango-1.19.3-gtk-doc.patch
   trunk/buildroot/package/pango/pango-1.19.3-no-cairo-atsui.patch
   trunk/buildroot/package/pango/pango-1.19.3-no-libthai.patch
   trunk/buildroot/package/pango/pango-1.19.3-no-tests.patch

Modified:
   trunk/buildroot/package/pango/pango.mk


Changeset:
Deleted: trunk/buildroot/package/pango/pango-1.19.3-gtk-doc.patch
===================================================================
--- trunk/buildroot/package/pango/pango-1.19.3-gtk-doc.patch	2008-12-27 11:01:33 UTC (rev 24566)
+++ trunk/buildroot/package/pango/pango-1.19.3-gtk-doc.patch	2008-12-27 14:36:22 UTC (rev 24567)
@@ -1,59 +0,0 @@
---- pango/acinclude.m4.old	2004-05-08 11:31:48.000000000 +0100
-+++ pango/acinclude.m4	2004-05-08 11:31:58.000000000 +0100
-@@ -55,3 +55,56 @@
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

Deleted: trunk/buildroot/package/pango/pango-1.19.3-no-cairo-atsui.patch
===================================================================
--- trunk/buildroot/package/pango/pango-1.19.3-no-cairo-atsui.patch	2008-12-27 11:01:33 UTC (rev 24566)
+++ trunk/buildroot/package/pango/pango-1.19.3-no-cairo-atsui.patch	2008-12-27 14:36:22 UTC (rev 24567)
@@ -1,42 +0,0 @@
---- a/configure.in	2008-01-21 21:12:10.000000000 -0500
-+++ b/configure.in	2008-02-09 13:32:20.000000000 -0500
-@@ -318,11 +318,6 @@ if test "$pango_os_win32" = "yes"; then
- fi
- 
- #
--# Checks for ATSUI
--#
--AC_CHECK_HEADER(Carbon/Carbon.h, [have_atsui=true], [have_atsui=true])
--
--#
- # Checks for Cairo
- #
- have_cairo=false
-
---- a/configure.in	2008-02-09 13:37:25.000000000 -0500
-+++ b/configure.in	2008-02-09 13:39:42.000000000 -0500
-@@ -374,12 +374,6 @@ if $have_cairo ; then
-     have_cairo=true
-   fi
- 
--  PKG_CHECK_EXISTS(cairo-atsui >= $cairo_required, have_cairo_atsui=true, :)
--  if $have_cairo_atsui && $have_atsui ; then
--    AC_DEFINE(HAVE_CAIRO_ATSUI, 1, [Whether Cairo uses ATSUI for fonts])
--    have_cairo=true
--  fi
--
-   if $have_cairo ; then
-     AC_DEFINE(HAVE_CAIRO, 1, [Have usable Cairo library and font backend])
-   fi
-
---- a/configure	2008-02-09 13:25:54.000000000 -0500
-+++ b/configure	2008-02-09 13:27:56.000000000 -0500
-@@ -22516,7 +22516,7 @@ fi
-   if $have_cairo_atsui && $have_atsui ; then
- 
- cat >>confdefs.h <<\_ACEOF
--#define HAVE_CAIRO_ATSUI 1
-+/* #undef HAVE_CAIRO_ATSUI */
- _ACEOF
- 
-     have_cairo=true

Deleted: trunk/buildroot/package/pango/pango-1.19.3-no-libthai.patch
===================================================================
--- trunk/buildroot/package/pango/pango-1.19.3-no-libthai.patch	2008-12-27 11:01:33 UTC (rev 24566)
+++ trunk/buildroot/package/pango/pango-1.19.3-no-libthai.patch	2008-12-27 14:36:22 UTC (rev 24567)
@@ -1,10 +0,0 @@
---- a/modules/Makefile.am	2007-07-05 17:30:28.000000000 -0400
-+++ b/modules/Makefile.am	2008-02-09 19:37:13.000000000 -0500
-@@ -8,7 +8,6 @@ SUBDIRS = 		\
- 	indic           \
- 	khmer		\
- 	syriac		\
--	thai		\
- 	tibetan
- 
- EXTRA_DIST =		\

Deleted: trunk/buildroot/package/pango/pango-1.19.3-no-tests.patch
===================================================================
--- trunk/buildroot/package/pango/pango-1.19.3-no-tests.patch	2008-12-27 11:01:33 UTC (rev 24566)
+++ trunk/buildroot/package/pango/pango-1.19.3-no-tests.patch	2008-12-27 14:36:22 UTC (rev 24567)
@@ -1,22 +0,0 @@
---- a/Makefile.in	2008-01-21 22:28:49.000000000 -0500
-+++ b/Makefile.in	2008-02-09 13:02:41.000000000 -0500
-@@ -260,7 +260,7 @@ sysconfdir = @sysconfdir@
- target_alias = @target_alias@
- top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
--SUBDIRS = pango modules pango-view examples docs tools tests
-+SUBDIRS = pango modules pango-view examples docs tools 
- EXTRA_DIST = \
- 	autogen.sh		\
- 	pango.pc.in		\
-
---- a/Makefile.am	2008-01-17 16:37:49.000000000 -0500
-+++ b/Makefile.am	2008-02-09 13:35:13.000000000 -0500
-@@ -1,6 +1,6 @@
- ## Process this file with automake to create Makefile.in.
- 
--SUBDIRS= pango modules pango-view examples docs tools tests
-+SUBDIRS= pango modules pango-view examples docs tools 
- 
- EXTRA_DIST = 			\
- 	autogen.sh		\

Copied: trunk/buildroot/package/pango/pango-gtk-doc.patch (from rev 24561, trunk/buildroot/package/pango/pango-1.19.3-gtk-doc.patch)
===================================================================
--- trunk/buildroot/package/pango/pango-gtk-doc.patch	                        (rev 0)
+++ trunk/buildroot/package/pango/pango-gtk-doc.patch	2008-12-27 14:36:22 UTC (rev 24567)
@@ -0,0 +1,59 @@
+--- pango/acinclude.m4.old	2004-05-08 11:31:48.000000000 +0100
++++ pango/acinclude.m4	2004-05-08 11:31:58.000000000 +0100
+@@ -55,3 +55,56 @@
+ ])
+ 
+ 
++dnl -*- mode: autoconf -*-
++
++# serial 1
++
++dnl Usage:
++dnl   GTK_DOC_CHECK([minimum-gtk-doc-version])
++AC_DEFUN([GTK_DOC_CHECK],
++[
++  AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
++  AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
++  dnl for overriding the documentation installation directory
++  AC_ARG_WITH(html-dir,
++    AC_HELP_STRING([--with-html-dir=PATH], [path to installed docs]),,
++    [with_html_dir='${datadir}/gtk-doc/html'])
++  HTML_DIR="$with_html_dir"
++  AC_SUBST(HTML_DIR)
++
++  dnl enable/disable documentation building
++  AC_ARG_ENABLE(gtk-doc,
++    AC_HELP_STRING([--enable-gtk-doc],
++                   [use gtk-doc to build documentation [default=no]]),,
++    enable_gtk_doc=no)
++
++  have_gtk_doc=no
++  if test -z "$PKG_CONFIG"; then
++    AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
++  fi
++  if test "$PKG_CONFIG" != "no" && $PKG_CONFIG --exists gtk-doc; then
++    have_gtk_doc=yes
++  fi
++
++  dnl do we want to do a version check?
++ifelse([$1],[],,
++  [gtk_doc_min_version=$1
++  if test "$have_gtk_doc" = yes; then
++    AC_MSG_CHECKING([gtk-doc version >= $gtk_doc_min_version])
++    if $PKG_CONFIG --atleast-version $gtk_doc_min_version gtk-doc; then
++      AC_MSG_RESULT(yes)
++    else
++      AC_MSG_RESULT(no)
++      have_gtk_doc=no
++    fi
++  fi
++])
++  if test x$enable_gtk_doc = xyes; then
++    if test "$have_gtk_doc" != yes; then
++      enable_gtk_doc=no
++    fi
++  fi
++
++  AM_CONDITIONAL(ENABLE_GTK_DOC, test x$enable_gtk_doc = xyes)
++  AM_CONDITIONAL(GTK_DOC_USE_LIBTOOL, test -n "$LIBTOOL")
++])

Copied: trunk/buildroot/package/pango/pango-no-libthai.patch (from rev 24561, trunk/buildroot/package/pango/pango-1.19.3-no-libthai.patch)
===================================================================
--- trunk/buildroot/package/pango/pango-no-libthai.patch	                        (rev 0)
+++ trunk/buildroot/package/pango/pango-no-libthai.patch	2008-12-27 14:36:22 UTC (rev 24567)
@@ -0,0 +1,10 @@
+--- a/modules/Makefile.am	2007-07-05 17:30:28.000000000 -0400
++++ b/modules/Makefile.am	2008-02-09 19:37:13.000000000 -0500
+@@ -8,7 +8,6 @@ SUBDIRS = 		\
+ 	indic           \
+ 	khmer		\
+ 	syriac		\
+-	thai		\
+ 	tibetan
+ 
+ EXTRA_DIST =		\

Copied: trunk/buildroot/package/pango/pango-no-tests.patch (from rev 24561, trunk/buildroot/package/pango/pango-1.19.3-no-tests.patch)
===================================================================
--- trunk/buildroot/package/pango/pango-no-tests.patch	                        (rev 0)
+++ trunk/buildroot/package/pango/pango-no-tests.patch	2008-12-27 14:36:22 UTC (rev 24567)
@@ -0,0 +1,22 @@
+--- a/Makefile.in	2008-01-21 22:28:49.000000000 -0500
++++ b/Makefile.in	2008-02-09 13:02:41.000000000 -0500
+@@ -260,7 +260,7 @@ sysconfdir = @sysconfdir@
+ target_alias = @target_alias@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+-SUBDIRS = pango modules pango-view examples docs tools tests
++SUBDIRS = pango modules pango-view examples docs tools 
+ EXTRA_DIST = \
+ 	autogen.sh		\
+ 	pango.pc.in		\
+
+--- a/Makefile.am	2008-01-17 16:37:49.000000000 -0500
++++ b/Makefile.am	2008-02-09 13:35:13.000000000 -0500
+@@ -1,6 +1,6 @@
+ ## Process this file with automake to create Makefile.in.
+ 
+-SUBDIRS= pango modules pango-view examples docs tools tests
++SUBDIRS= pango modules pango-view examples docs tools 
+ 
+ EXTRA_DIST = 			\
+ 	autogen.sh		\

Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2008-12-27 11:01:33 UTC (rev 24566)
+++ trunk/buildroot/package/pango/pango.mk	2008-12-27 14:36:22 UTC (rev 24567)
@@ -3,7 +3,7 @@
 # pango
 #
 #############################################################
-PANGO_VERSION = 1.19.3
+PANGO_VERSION = 1.20.5
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.bz2
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/1.19
 PANGO_AUTORECONF = YES
