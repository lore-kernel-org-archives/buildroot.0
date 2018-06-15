From: Sven Neumann <neumann@teufel.de>
Date: Fri, 15 Jun 2018 10:48:38 +0200
Subject: [Buildroot] [PATCH] gnutls: use included unistring unless
 libunistring is selected
Message-ID: <20180615084838.7642-1-neumann@teufel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the included copy of libunistring unless BR2_PACKAGE_LIBUNISTRING
is already selected.

The resulting gnutls library with libunistring included is about 1.2 MB
smaller than the sum of libgnutls and libunistring.

Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/gnutls/Config.in |  1 -
 package/gnutls/gnutls.mk | 10 ++++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index cfb7cb3f3b..998e213c7d 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
 	select BR2_PACKAGE_LIBTASN1
-	select BR2_PACKAGE_LIBUNISTRING
 	select BR2_PACKAGE_NETTLE
 	select BR2_PACKAGE_PCRE
 	depends on BR2_USE_WCHAR
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index be1cf00e06..7d8071c824 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -10,7 +10,7 @@ GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPLv2.1+ (core library), GPLv3+ (gnutls-openssl library)
 GNUTLS_LICENSE_FILES = doc/COPYING doc/COPYING.LESSER
-GNUTLS_DEPENDENCIES = host-pkgconf libunistring libtasn1 nettle pcre
+GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle pcre
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
 	--disable-guile \
@@ -19,7 +19,6 @@ GNUTLS_CONF_OPTS = \
 	--enable-local-libopts \
 	--enable-openssl-compatibility \
 	--with-libnettle-prefix=$(STAGING_DIR)/usr \
-	--with-libunistring-prefix=$(STAGING_DIR)/usr \
 	--with-librt-prefix=$(STAGING_DIR) \
 	--without-tpm \
 	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools)
@@ -75,6 +74,13 @@ else
 GNUTLS_CONF_OPTS += --without-p11-kit
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
+GNUTLS_CONF_OPTS += --with-libunistring-prefix=$(STAGING_DIR)/usr
+GNUTLS_DEPENDENCIES += libunistring
+else
+GNUTLS_CONF_OPTS += --with-included-unistring
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GNUTLS_CONF_OPTS += --with-zlib
 GNUTLS_DEPENDENCIES += zlib
-- 
2.14.4
