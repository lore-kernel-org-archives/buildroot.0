From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 May 2014 11:04:40 +0200
Subject: [Buildroot] [PATCH 1/1] libmicrohttpd: Fix cross compilation broken
	since 0.9.35
Message-ID: <1399194280-24779-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/cb2/cb2cec1295a40667a3c21060864dd0e65a312c3e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../libmicrohttpd/libmicrohttpd-0001-cross.patch   |   28 ++++++++++++++++++++
 package/libmicrohttpd/libmicrohttpd.mk             |    1 +
 2 files changed, 29 insertions(+)
 create mode 100644 package/libmicrohttpd/libmicrohttpd-0001-cross.patch

diff --git a/package/libmicrohttpd/libmicrohttpd-0001-cross.patch b/package/libmicrohttpd/libmicrohttpd-0001-cross.patch
new file mode 100644
index 0000000..5980b9c
--- /dev/null
+++ b/package/libmicrohttpd/libmicrohttpd-0001-cross.patch
@@ -0,0 +1,28 @@
+Fix cross-compilation
+
+Patch sent upstream: http://article.gmane.org/gmane.comp.gnu.libmicrohttpd/1193
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libmicrohttpd-0.9.35.org/configure.ac libmicrohttpd-0.9.35/configure.ac
+--- libmicrohttpd-0.9.35.org/configure.ac	2014-05-02 20:38:40.000000000 +0200
++++ libmicrohttpd-0.9.35/configure.ac	2014-05-04 09:17:00.000000000 +0200
+@@ -639,8 +639,7 @@
+         SAVE_CPPFLAGS="$CPPFLAGS"
+         LDFLAGS="-L$with_gnutls/lib $LDFLAGS"
+         CPPFLAGS="-I$with_gnutls/include $CPPFLAGS"
+-        AC_CHECK_FILE([$with_gnutls/include/gnutls/gnutls.h],
+-          [AC_CHECK_HEADERS([gnutls/gnutls.h],
++          AC_CHECK_HEADERS([gnutls/gnutls.h],
+             [AC_CHECK_LIB([gnutls], [gnutls_priority_set],
+               [
+                 GNUTLS_CPPFLAGS="-I$with_gnutls/include"
+@@ -648,7 +647,7 @@
+                 GNUTLS_LIBS="-lgnutls"
+                 AC_CHECK_LIB([gnutls], [gnutls_load_file], [AC_CHECK_LIB([gnutls], [gnutls_privkey_import_x509_raw], [have_gnutls_sni=yes])])
+                 have_gnutls=yes
+-              ])])])
++              ])])
+         AS_IF([test "x$have_gnutls" != "xyes"], [AC_MSG_ERROR([can't find usable libgnutls at specified prefix $with_gnutls])])
+         LDFLAGS="$SAVE_LDFLAGS"
+         CPPFLAGS="$SAVE_CPPFLAGS"
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index a4cc5db..edf4f9a 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -8,6 +8,7 @@ LIBMICROHTTPD_VERSION = 0.9.35
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
+LIBMICROHTTPD_AUTORECONF = YES
 LIBMICROHTTPD_CONF_OPT = --disable-curl --disable-spdy
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
-- 
1.7.10.4
