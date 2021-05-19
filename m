From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 20 May 2021 00:26:37 +0300
Subject: [Buildroot] [PATCH 2/2] package/libsoup: bump to version 2.66.5
In-Reply-To: <20210519212637.1282972-1-aperez@igalia.com>
References: <20210519212637.1282972-1-aperez@igalia.com>
Message-ID: <20210519212637.1282972-3-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change libsoup to version 2.66.5, which introduces many fixes. This
needs adding the libpsl dependency, and switching over to Meson as the
autotools based build system is no more. The existing patch is not
needed anymore.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 .../0001-Revert-tld-parser-use-Python-3.patch | 27 -------------------
 package/libsoup/Config.in                     |  1 +
 package/libsoup/libsoup.hash                  |  4 +--
 package/libsoup/libsoup.mk                    | 20 +++++++-------
 4 files changed, 13 insertions(+), 39 deletions(-)
 delete mode 100644 package/libsoup/0001-Revert-tld-parser-use-Python-3.patch

diff --git a/package/libsoup/0001-Revert-tld-parser-use-Python-3.patch b/package/libsoup/0001-Revert-tld-parser-use-Python-3.patch
deleted file mode 100644
index c27ee986c6..0000000000
--- a/package/libsoup/0001-Revert-tld-parser-use-Python-3.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 015926c80fa3e9704f05cbc1ad17f0a877f8de09 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 1 Sep 2018 15:39:04 +0200
-Subject: [PATCH] Revert "tld-parser: use Python 3"
-
-This reverts commit 4b924e573da307436169d5ef7e04c0ab85b36ef9. The
-script runs just fine with Python 2.x, there is no reason to enforce
-using Python 3.x.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- libsoup/tld-parser.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libsoup/tld-parser.py b/libsoup/tld-parser.py
-index a743471a..5d9d2ba5 100755
---- a/libsoup/tld-parser.py
-+++ b/libsoup/tld-parser.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python3
-+#!/usr/bin/env python
- 
- # Generate tld rules
- # Copyright (C) 2012 Red Hat, Inc.
--- 
-2.14.4
-
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index f6f8fde968..47adfb33f2 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBSOUP
 	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBPSL
 	select BR2_PACKAGE_SQLITE
 	help
 	  libsoup is an HTTP client/server library. It uses GObject
diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index 666bbc278b..3b9009884d 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,4 +1,4 @@
-# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.62/libsoup-2.62.3.sha256sum
-sha256	d312ade547495c2093ff8bda61f9b9727a98cfdae339f3263277dd39c0451172  libsoup-2.62.3.tar.xz
+# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.66/libsoup-2.66.5.sha256sum
+sha256  ee43be1485bd95b686236b1e0043ec6edb761a538616c9c63004d7d1979bb139  libsoup-2.66.5.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 44808225ea..1617940c8f 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSOUP_VERSION_MAJOR = 2.62
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).3
+LIBSOUP_VERSION_MAJOR = 2.66
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).5
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPL-2.0+
@@ -13,27 +13,27 @@ LIBSOUP_LICENSE_FILES = COPYING
 LIBSOUP_CPE_ID_VENDOR = gnome
 LIBSOUP_INSTALL_STAGING = YES
 LIBSOUP_CONF_ENV = ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
-LIBSOUP_CONF_OPTS = --disable-glibtest --enable-vala=no --with-gssapi=no
+LIBSOUP_CONF_OPTS = -Dtests=false -Dvapi=false -Dgssapi=false
 LIBSOUP_DEPENDENCIES = host-pkgconf host-libglib2 \
-	libglib2 libxml2 sqlite host-intltool
+	libglib2 libpsl libxml2 sqlite host-intltool
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBSOUP_CONF_OPTS += --with-introspection
+LIBSOUP_CONF_OPTS += -Dintrospection=true
 LIBSOUP_DEPENDENCIES += gobject-introspection
 else
-LIBSOUP_CONF_OPTS += --without-introspection
+LIBSOUP_CONF_OPTS += -Dintrospection=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
-LIBSOUP_CONF_OPTS += --with-gnome
+LIBSOUP_CONF_OPTS += -Dgnome=true
 else
-LIBSOUP_CONF_OPTS += --without-gnome
+LIBSOUP_CONF_OPTS += -Dgnome=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
 LIBSOUP_DEPENDENCIES += glib-networking
 else
-LIBSOUP_CONF_OPTS += --disable-tls-check
+LIBSOUP_CONF_OPTS += -Dtls_check=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.31.1
