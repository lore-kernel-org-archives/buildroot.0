From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 20:28:14 +0100
Subject: [Buildroot] [git commit] package/tn5250: remove package
Message-ID: <20190205193816.6193B83BE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0478beaaad6312cc345fabcbc90ce68b391e3fb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest (0.17.4) tn5250 release is from 2008, doesn't build with openssl
1.1.x and was dropped from Debian in 2011 because nobody cared to maintain
it:

https://packages.qa.debian.org/t/tn5250.html

Given all of that, it is unlikely to be used much, so remove it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |  6 ++++
 package/Config.in                                  |  1 -
 package/tn5250/0001-ssldir.patch                   | 17 ------------
 ...lding-against-OpenSSL-without-SSLv2_SSLv3.patch | 32 ----------------------
 package/tn5250/Config.in                           |  8 ------
 package/tn5250/tn5250.hash                         |  2 --
 package/tn5250/tn5250.mk                           | 29 --------------------
 7 files changed, 6 insertions(+), 89 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ef460752f3..59d8bf25fc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_TN5250
+	bool "tn5250 package removed"
+	select BR2_LEGACY
+	help
+	  The tn5250 package was removed.
+
 config BR2_PACKAGE_BOOST_SIGNALS
 	bool "Boost signals removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index bca61f14ed..6273ea8197 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2021,7 +2021,6 @@ endif
 	source "package/thttpd/Config.in"
 	source "package/tinc/Config.in"
 	source "package/tinyhttpd/Config.in"
-	source "package/tn5250/Config.in"
 	source "package/tor/Config.in"
 	source "package/traceroute/Config.in"
 	source "package/transmission/Config.in"
diff --git a/package/tn5250/0001-ssldir.patch b/package/tn5250/0001-ssldir.patch
deleted file mode 100644
index 6fc78deef2..0000000000
--- a/package/tn5250/0001-ssldir.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Value is assigned to $with_ssl_dir but used from $with_ssl which is wrong.
-Fix configure since it's a one-liner and avoid an autoreconf.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura tn5250-0.17.4.orig/configure tn5250-0.17.4/configure
---- tn5250-0.17.4.orig/configure	2014-09-10 08:33:15.689519554 -0300
-+++ tn5250-0.17.4/configure	2014-09-10 08:33:47.428613117 -0300
-@@ -23258,7 +23258,7 @@
- if test "${with_ssl_dir+set}" = set; then
-   withval=$with_ssl_dir;
-     if test "$with_ssl_dir" != "no"; then
--         checksslinclude "$with_ssl"
-+         checksslinclude "$with_ssl_dir"
-     else
-         for topdir in /usr/local /usr /usr/pkg /usr/lib /var/ssl /opt; do
-             for subdir in $topdir $topdir/openssl $topdir/ssl; do
diff --git a/package/tn5250/0002-Allow-building-against-OpenSSL-without-SSLv2_SSLv3.patch b/package/tn5250/0002-Allow-building-against-OpenSSL-without-SSLv2_SSLv3.patch
deleted file mode 100644
index 67f0fa63a1..0000000000
--- a/package/tn5250/0002-Allow-building-against-OpenSSL-without-SSLv2_SSLv3.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-$OpenBSD: patch-lib5250_sslstream_c,v 1.1 2015/10/07 16:09:04 jca Exp $
-
-Allow building against OpenSSL without SSLv2/SSLv3 support.
-
-Download from:
-http://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/net/tn5250/patches/patch-lib5250_sslstream_c
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---- a/lib5250/sslstream.c.orig	Fri Nov 21 09:12:21 2008
-+++ b/lib5250/sslstream.c	Tue Oct  6 21:32:29 2015
-@@ -368,13 +368,19 @@ int tn5250_ssl_stream_init (Tn5250Stream *This)
-         methstr[4] = '\0';
-    }
- 
-+#ifndef OPENSSL_NO_SSL2
-    if (!strcmp(methstr, "ssl2")) {
-         meth = SSLv2_client_method();         
-         TN5250_LOG(("SSL Method = SSLv2_client_method()\n"));
--   } else if (!strcmp(methstr, "ssl3")) {
-+   } else
-+#endif
-+#ifndef OPENSSL_NO_SSL3
-+   if (!strcmp(methstr, "ssl3")) {
-         meth = SSLv3_client_method();         
-         TN5250_LOG(("SSL Method = SSLv3_client_method()\n"));
--   } else {
-+   } else
-+#endif
-+   {
-         meth = SSLv23_client_method();         
-         TN5250_LOG(("SSL Method = SSLv23_client_method()\n"));
-    }
diff --git a/package/tn5250/Config.in b/package/tn5250/Config.in
deleted file mode 100644
index 01be40bb73..0000000000
--- a/package/tn5250/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_TN5250
-	bool "tn5250"
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_NCURSES
-	help
-	  Telnet client that emulates 5250 terminals and printers.
-
-	  http://tn5250.sourceforge.net/
diff --git a/package/tn5250/tn5250.hash b/package/tn5250/tn5250.hash
deleted file mode 100644
index ae65beab50..0000000000
--- a/package/tn5250/tn5250.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256  354237d400dc46af887cb3ffa4ed1f2c371f5b8bee8be046a683a4ac9db4f9c5  tn5250-0.17.4.tar.gz
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
deleted file mode 100644
index 4c457a5d97..0000000000
--- a/package/tn5250/tn5250.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# tn5250
-#
-################################################################################
-
-TN5250_VERSION = 0.17.4
-TN5250_SITE = http://downloads.sourceforge.net/project/tn5250/tn5250/$(TN5250_VERSION)
-TN5250_MAKE_OPTS = CPPFLAGS=""
-TN5250_DEPENDENCIES = ncurses
-TN5250_LICENSE = LGPL-2.1+
-TN5250_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-TN5250_CONF_OPTS += --with-ssl-dir=$(STAGING_DIR)/usr
-TN5250_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
-TN5250_DEPENDENCIES += openssl host-pkgconf
-else
-TN5250_CONF_OPTS += --without-ssl
-endif
-
-define TN5250_INSTALL_FIXES
-	rm -f $(TARGET_DIR)/usr/bin/5250keys
-	rm -f $(TARGET_DIR)/usr/bin/xt5250
-endef
-
-TN5250_POST_INSTALL_TARGET_HOOKS += TN5250_INSTALL_FIXES
-
-$(eval $(autotools-package))
