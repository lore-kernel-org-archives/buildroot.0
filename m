From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2010 22:59:32 +0100
Subject: [Buildroot] [git commit master] pango: remove gtk-doc patch
Message-ID: <20100224220115.3FBD677798@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=71697ac6ccdd121251821a27c403728315116336
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gtk-doc.m4 file is now installed globally (see the automake
package), so there's no point in including a pango-specific patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango-gtk-doc.patch |   59 -------------------------------------
 1 files changed, 0 insertions(+), 59 deletions(-)
 delete mode 100644 package/pango/pango-gtk-doc.patch

diff --git a/package/pango/pango-gtk-doc.patch b/package/pango/pango-gtk-doc.patch
deleted file mode 100644
index bee5fe6..0000000
--- a/package/pango/pango-gtk-doc.patch
+++ /dev/null
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
-- 
1.6.3.3
