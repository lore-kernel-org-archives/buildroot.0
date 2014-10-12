From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 11:02:25 +0200
Subject: [Buildroot] [git commit] automake: update gtk-doc.m4 to serial 2
Message-ID: <20141012090833.55F25B22F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=166243f9981f080606573beccc344cd7e4bfbcd5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update gtk-doc.m4 infra to serial (version) 2.
Some packages start to need/ship with the new version and can't be
properly autoreconf'ed, like kmod 18+.
The file was picked up from kmod-18 itself actually.

[Peter: don't pull in host-pkgconf as it was already needed by v1]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/automake/gtk-doc.m4 |   47 +++++++++++++++++++++++++++++++++---------
 1 files changed, 37 insertions(+), 10 deletions(-)

diff --git a/package/automake/gtk-doc.m4 b/package/automake/gtk-doc.m4
index 2cfa1e7..3675543 100644
--- a/package/automake/gtk-doc.m4
+++ b/package/automake/gtk-doc.m4
@@ -1,16 +1,33 @@
 dnl -*- mode: autoconf -*-
 
-# serial 1
+# serial 2
 
 dnl Usage:
 dnl   GTK_DOC_CHECK([minimum-gtk-doc-version])
 AC_DEFUN([GTK_DOC_CHECK],
 [
+  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
   AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
   AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
 
+  ifelse([$1],[],[gtk_doc_requires="gtk-doc"],[gtk_doc_requires="gtk-doc >= $1"])
+  AC_MSG_CHECKING([for gtk-doc])
+  PKG_CHECK_EXISTS([$gtk_doc_requires],[have_gtk_doc=yes],[have_gtk_doc=no])
+  AC_MSG_RESULT($have_gtk_doc)
+
+  if test "$have_gtk_doc" = "no"; then
+      AC_MSG_WARN([
+  You will not be able to create source packages with 'make dist'
+  because $gtk_doc_requires is not found.])
+  fi
+
   dnl check for tools we added during development
-  AC_PATH_PROG([GTKDOC_CHECK],[gtkdoc-check])
+  dnl Use AC_CHECK_PROG to avoid the check target using an absolute path that
+  dnl may not be writable by the user. Currently, automake requires that the
+  dnl test name must end in '.test'.
+  dnl https://bugzilla.gnome.org/show_bug.cgi?id=701638
+  AC_CHECK_PROG([GTKDOC_CHECK],[gtkdoc-check],[gtkdoc-check.test])
+  AC_PATH_PROG([GTKDOC_CHECK_PATH],[gtkdoc-check])
   AC_PATH_PROGS([GTKDOC_REBASE],[gtkdoc-rebase],[true])
   AC_PATH_PROG([GTKDOC_MKPDF],[gtkdoc-mkpdf])
 
@@ -27,17 +44,22 @@ AC_DEFUN([GTK_DOC_CHECK],
                    [use gtk-doc to build documentation [[default=no]]]),,
     [enable_gtk_doc=no])
 
-  if test x$enable_gtk_doc = xyes; then
-    ifelse([$1],[],
-      [PKG_CHECK_EXISTS([gtk-doc],,
-                        AC_MSG_ERROR([gtk-doc not installed and --enable-gtk-doc requested]))],
-      [PKG_CHECK_EXISTS([gtk-doc >= $1],,
-                        AC_MSG_ERROR([You need to have gtk-doc >= $1 installed to build $PACKAGE_NAME]))])
-  fi
-
   AC_MSG_CHECKING([whether to build gtk-doc documentation])
   AC_MSG_RESULT($enable_gtk_doc)
 
+  if test "x$enable_gtk_doc" = "xyes" && test "$have_gtk_doc" = "no"; then
+    AC_MSG_ERROR([
+  You must have $gtk_doc_requires installed to build documentation for
+  $PACKAGE_NAME. Please install gtk-doc or disable building the
+  documentation by adding '--disable-gtk-doc' to '[$]0'.])
+  fi
+
+  dnl don't check for glib if we build glib
+  if test "x$PACKAGE_NAME" != "xglib"; then
+    dnl don't fail if someone does not have glib
+    PKG_CHECK_MODULES(GTKDOC_DEPS, glib-2.0 >= 2.10.0 gobject-2.0  >= 2.10.0,,[:])
+  fi
+
   dnl enable/disable output formats
   AC_ARG_ENABLE([gtk-doc-html],
     AS_HELP_STRING([--enable-gtk-doc-html],
@@ -52,7 +74,12 @@ AC_DEFUN([GTK_DOC_CHECK],
     enable_gtk_doc_pdf=no
   fi
 
+  if test -z "$AM_DEFAULT_VERBOSITY"; then
+    AM_DEFAULT_VERBOSITY=1
+  fi
+  AC_SUBST([AM_DEFAULT_VERBOSITY])
 
+  AM_CONDITIONAL([HAVE_GTK_DOC], [test x$have_gtk_doc = xyes])
   AM_CONDITIONAL([ENABLE_GTK_DOC], [test x$enable_gtk_doc = xyes])
   AM_CONDITIONAL([GTK_DOC_BUILD_HTML], [test x$enable_gtk_doc_html = xyes])
   AM_CONDITIONAL([GTK_DOC_BUILD_PDF], [test x$enable_gtk_doc_pdf = xyes])
