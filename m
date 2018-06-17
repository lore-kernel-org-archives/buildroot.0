From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:05:40 +0200
Subject: [Buildroot] [git commit] gnutls: use included unistring unless
 libunistring is selected
Message-ID: <20180617121254.9B79D84250@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19448f40a0e9cfd6b3ff7f22c38a4b893cf36690
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the included copy of libunistring unless BR2_PACKAGE_LIBUNISTRING
is already selected.

The resulting gnutls library with libunistring included is about 1.2 MB
smaller than the sum of libgnutls and libunistring.

Signed-off-by: Sven Neumann <neumann@teufel.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnutls/Config.in |  1 -
 package/gnutls/gnutls.mk | 10 ++++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 176951a385..ef995d21d2 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_GNUTLS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBTASN1
-	select BR2_PACKAGE_LIBUNISTRING
 	select BR2_PACKAGE_NETTLE
 	select BR2_PACKAGE_PCRE
 	help
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 3d1a627781..fec07dfe03 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -10,7 +10,7 @@ GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
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
@@ -82,6 +81,13 @@ else
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
