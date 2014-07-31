From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 31 Jul 2014 15:10:32 -0300
Subject: [Buildroot] [PATCH] libarchive: bump to version 3.1.2
Message-ID: <1406830232-27101-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to proper upstream source.
And account for many auto dependencies that were missing.
Also fixes link issues:
http://autobuild.buildroot.net/results/774/7747a043123e958952a16e0c0db823296c4e0594/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libarchive/libarchive.mk | 59 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 7 deletions(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 44d9cd2..8c6951d 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,17 +4,38 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.0.4
-LIBARCHIVE_SITE = http://github.com/downloads/libarchive/libarchive
+LIBARCHIVE_VERSION = 3.1.2
+LIBARCHIVE_SITE = http://www.libarchive.org/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
+LIBARCHIVE_LICENSE = BSD-2c, BSD-3c
+LIBARCHIVE_LICENSE_FILES = COPYING
+LIBARCHIVE_CONF_OPT = --without-lzma \
+	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDTAR),--enable-bsdtar,--disable-bsdtar) \
+	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDCPIO),--enable-bsdcpio,--disable-bsdcpio)
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-LIBARCHIVE_DEPENDENCIES = zlib
+ifeq ($(BR2_PACKAGE_ACL),y)
+LIBARCHIVE_DEPENDENCIES += acl
+else
+LIBARCHIVE_CONF_OPT += --disable-acl
 endif
 
-LIBARCHIVE_CONF_OPT = \
-	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDTAR),--enable-bsdtar,--disable-bsdtar) \
-	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDCPIO),--enable-bsdcpio,--disable-bsdcpio)
+ifeq ($(BR2_PACKAGE_ATTR),y)
+LIBARCHIVE_DEPENDENCIES += attr
+else
+LIBARCHIVE_CONF_OPT += --disable-xattr
+endif
+
+ifeq ($(BR2_PACKAGE_EXPAT),y)
+LIBARCHIVE_DEPENDENCIES += expat
+else
+LIBARCHIVE_CONF_OPT += --without-expat
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+LIBARCHIVE_DEPENDENCIES += libiconv
+else
+LIBARCHIVE_CONF_OPT += --without-libiconv-prefix
+endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 LIBARCHIVE_DEPENDENCIES += libxml2
@@ -23,4 +44,28 @@ else
 LIBARCHIVE_CONF_OPT += --without-xml2
 endif
 
+ifeq ($(BR2_PACKAGE_LZO),y)
+LIBARCHIVE_DEPENDENCIES += lzo
+else
+LIBARCHIVE_CONF_OPT += --without-lzo2
+endif
+
+ifeq ($(BR2_PACKAGE_NETTLE),y)
+LIBARCHIVE_DEPENDENCIES += nettle
+else
+LIBARCHIVE_CONF_OPT += --without-nettle
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBARCHIVE_DEPENDENCIES += openssl
+else
+LIBARCHIVE_CONF_OPT += --without-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBARCHIVE_DEPENDENCIES += zlib
+else
+LIBARCHIVE_CONF_OPT += --without-zlib
+endif
+
 $(eval $(autotools-package))
-- 
1.8.5.5
