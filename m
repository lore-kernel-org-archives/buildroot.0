From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Feb 2010 11:23:43 +0100
Subject: [Buildroot] [git commit master] gtk-doc: add gtk-doc.m4 to satisfy
	aclocal
Message-ID: <20100217102508.848B67770C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=61f677cb060732316b41f072210986e97ae9379f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When packages using gtk-doc are autoreconfigured, aclocal complains
because it cannot find the macros defined in gtk-doc.m4. We could
compile the gtk-doc package for the host, but it depends on
gnome-doc-utils, which depends on libxml2, libxslt, and other packages
as well.

Since we don't care about the documentation, all is needed is in fact
the gtk-doc.m4, so that the configure script can be generated, and we
can use the --disable-gtk-doc to not generate the documentation.

To solve this, we include a gtk-doc.m4 file in package/automake/, and
it gets installed in $(STAGING_DIR)/usr/share/aclocal/ during the
installation of the host automake (used for autoreconfiguration of
packages).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/automake/automake.mk |    6 ++++
 package/automake/gtk-doc.m4  |   61 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 package/automake/gtk-doc.m4

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 65db386..eb3b375 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -15,6 +15,12 @@ AUTOMAKE_DEPENDENCIES = autoconf microperl
 
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
+define GTK_DOC_M4_INSTALL
+ $(INSTALL) -m 0644 package/automake/gtk-doc.m4 $(STAGING_DIR)/usr/share/aclocal/
+endef
+
+HOST_AUTOMAKE_POST_INSTALL_HOOKS += GTK_DOC_M4_INSTALL
+
 $(eval $(call AUTOTARGETS,package,automake))
 $(eval $(call AUTOTARGETS,package,automake,host))
 
diff --git a/package/automake/gtk-doc.m4 b/package/automake/gtk-doc.m4
new file mode 100644
index 0000000..2cfa1e7
--- /dev/null
+++ b/package/automake/gtk-doc.m4
@@ -0,0 +1,61 @@
+dnl -*- mode: autoconf -*-
+
+# serial 1
+
+dnl Usage:
+dnl   GTK_DOC_CHECK([minimum-gtk-doc-version])
+AC_DEFUN([GTK_DOC_CHECK],
+[
+  AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
+  AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
+
+  dnl check for tools we added during development
+  AC_PATH_PROG([GTKDOC_CHECK],[gtkdoc-check])
+  AC_PATH_PROGS([GTKDOC_REBASE],[gtkdoc-rebase],[true])
+  AC_PATH_PROG([GTKDOC_MKPDF],[gtkdoc-mkpdf])
+
+  dnl for overriding the documentation installation directory
+  AC_ARG_WITH([html-dir],
+    AS_HELP_STRING([--with-html-dir=PATH], [path to installed docs]),,
+    [with_html_dir='${datadir}/gtk-doc/html'])
+  HTML_DIR="$with_html_dir"
+  AC_SUBST([HTML_DIR])
+
+  dnl enable/disable documentation building
+  AC_ARG_ENABLE([gtk-doc],
+    AS_HELP_STRING([--enable-gtk-doc],
+                   [use gtk-doc to build documentation [[default=no]]]),,
+    [enable_gtk_doc=no])
+
+  if test x$enable_gtk_doc = xyes; then
+    ifelse([$1],[],
+      [PKG_CHECK_EXISTS([gtk-doc],,
+                        AC_MSG_ERROR([gtk-doc not installed and --enable-gtk-doc requested]))],
+      [PKG_CHECK_EXISTS([gtk-doc >= $1],,
+                        AC_MSG_ERROR([You need to have gtk-doc >= $1 installed to build $PACKAGE_NAME]))])
+  fi
+
+  AC_MSG_CHECKING([whether to build gtk-doc documentation])
+  AC_MSG_RESULT($enable_gtk_doc)
+
+  dnl enable/disable output formats
+  AC_ARG_ENABLE([gtk-doc-html],
+    AS_HELP_STRING([--enable-gtk-doc-html],
+                   [build documentation in html format [[default=yes]]]),,
+    [enable_gtk_doc_html=yes])
+    AC_ARG_ENABLE([gtk-doc-pdf],
+      AS_HELP_STRING([--enable-gtk-doc-pdf],
+                     [build documentation in pdf format [[default=no]]]),,
+      [enable_gtk_doc_pdf=no])
+
+  if test -z "$GTKDOC_MKPDF"; then
+    enable_gtk_doc_pdf=no
+  fi
+
+
+  AM_CONDITIONAL([ENABLE_GTK_DOC], [test x$enable_gtk_doc = xyes])
+  AM_CONDITIONAL([GTK_DOC_BUILD_HTML], [test x$enable_gtk_doc_html = xyes])
+  AM_CONDITIONAL([GTK_DOC_BUILD_PDF], [test x$enable_gtk_doc_pdf = xyes])
+  AM_CONDITIONAL([GTK_DOC_USE_LIBTOOL], [test -n "$LIBTOOL"])
+  AM_CONDITIONAL([GTK_DOC_USE_REBASE], [test -n "$GTKDOC_REBASE"])
+])
-- 
1.6.3.3
