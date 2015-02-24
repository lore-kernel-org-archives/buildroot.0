From: justin.swartz at nym.hush.com <justin.swartz@nym.hush.com>
Date: Tue, 24 Feb 2015 20:16:01 +0200
Subject: [Buildroot] [PATCH 1/1] libgtk2: skip tutorial and faq build
Message-ID: <20150224181601.A8FBBE0447@smtp.hushmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/65165

Credit to Yann E. MORIN for discovering and describing a fix for the
HAVE_DOCBOOK bug in "configure.ac", as well as the "--disable-gtk-doc-pdf"
and "--disable-gtk-doc-html" additions to LIBGTK2_CONF_OPTS.

Signed-off-by: Justin Swartz <justin.swartz@nym.hush.com>
---
 package/libgtk2/0002-configure-have_docbook.patch | 11 +++++++++++
 package/libgtk2/libgtk2.mk                        |  5 +++--
 2 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 package/libgtk2/0002-configure-have_docbook.patch

diff --git a/package/libgtk2/0002-configure-have_docbook.patch b/package/libgtk2/0002-configure-have_docbook.patch
new file mode 100644
index 0000000..f5a9a9d
--- /dev/null
+++ b/package/libgtk2/0002-configure-have_docbook.patch
@@ -0,0 +1,11 @@
+--- libgtk2-2.24.18/configure.ac.orig	2015-02-24 00:28:18.128745222 +0200
++++ libgtk2-2.24.18/configure.ac	2015-02-24 00:29:10.739087501 +0200
+@@ -1612,7 +1612,7 @@
+ GTK_DOC_CHECK([1.11])
+ 
+ AC_CHECK_PROG(DB2HTML, db2html, true, false)
+-AM_CONDITIONAL(HAVE_DOCBOOK, $DB2HTML)
++AM_CONDITIONAL([HAVE_DOCBOOK], [test ! "$DB2HTML" = "no"])
+ 
+ AC_ARG_ENABLE(man,
+               [AC_HELP_STRING([--enable-man],
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index dfc1f5b..032e84b 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -69,9 +69,10 @@ LIBGTK2_CONF_ENV = \
 	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
 	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
 	ac_cv_prog_F77=no \
-	ac_cv_path_CUPS_CONFIG=no
+	ac_cv_path_CUPS_CONFIG=no \
+	ac_cv_prog_DB2HTML=no
 
-LIBGTK2_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
+LIBGTK2_CONF_OPTS = --disable-gtk-doc-pdf --disable-gtk-doc-html --disable-glibtest --enable-explicit-deps=no
 
 LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango atk gdk-pixbuf
 
-- 
1.7.12.1
