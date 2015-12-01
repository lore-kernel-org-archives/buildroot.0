From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 17:52:28 +0100
Subject: [Buildroot] [git commit] gnutls: bump to version 3.4.7
Message-ID: <20151201232125.9F23B82210@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01e3d2eff15eb2535c4c15eb4f62467a50fe6a5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 3.4 series has been promoted to stable.
Handle autodeps more concisely (idn, p11-kit, zlib).
libtasn1 is now mandatory, since otherwise gnutls uses the bundled
version it makes no sense to try that because of target duplication.
Disable tpm support since we've got no trousers package.
Disable libdane support since we've got no dane package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnutls/Config.in   |  1 +
 package/gnutls/gnutls.hash |  2 +-
 package/gnutls/gnutls.mk   | 41 ++++++++++++++++++++++++++++++-----------
 3 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index ecb6756..dde23ce 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
+	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_NETTLE
 	select BR2_PACKAGE_PCRE
 	depends on BR2_USE_WCHAR
diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index b33c838..f062041 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	888d8779b48f21959b33d4d9ad0b546e5ec3dea20abf0d9bb03869d56b1f44cf	gnutls-3.3.19.tar.xz
+sha256	c1be9e4b30295d7b5f96fa332c6a908e6fa2254377b67811301fca92eb882e5a	gnutls-3.4.7.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 1ac3e4e..3b9fc7f 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,24 +4,22 @@
 #
 ################################################################################
 
-GNUTLS_VERSION_MAJOR = 3.3
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).19
+GNUTLS_VERSION_MAJOR = 3.4
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).7
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
 GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER
-GNUTLS_DEPENDENCIES = host-pkgconf nettle pcre \
-	$(if $(BR2_PACKAGE_P11_KIT),p11-kit) \
-	$(if $(BR2_PACKAGE_LIBIDN),libidn) \
-	$(if $(BR2_PACKAGE_LIBTASN1),libtasn1) \
-	$(if $(BR2_PACKAGE_ZLIB),zlib)
+GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle pcre
 GNUTLS_CONF_OPTS = \
-	--with-libnettle-prefix=$(STAGING_DIR)/usr \
-	--with-librt-prefix=$(STAGING_DIR) \
-	--disable-rpath \
 	--disable-doc \
 	--disable-guile \
-	--enable-local-libopts
+	--disable-libdane \
+	--disable-rpath \
+	--enable-local-libopts \
+	--with-libnettle-prefix=$(STAGING_DIR)/usr \
+	--with-librt-prefix=$(STAGING_DIR) \
+	--without-tpm
 GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	ac_cv_header_wchar_h=$(if $(BR2_USE_WCHAR),yes,no) \
 	gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no) \
@@ -54,6 +52,27 @@ GNUTLS_CONF_OPTS += --enable-cryptodev
 GNUTLS_DEPENDENCIES += cryptodev-linux
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN),y)
+GNUTLS_CONF_OPTS += --with-idn
+GNUTLS_DEPENDENCIES += libidn
+else
+GNUTLS_CONF_OPTS += --without-idn
+endif
+
+ifeq ($(BR2_PACKAGE_P11_KIT),y)
+GNUTLS_CONF_OPTS += --with-p11-kit
+GNUTLS_DEPENDENCIES += p11-kit
+else
+GNUTLS_CONF_OPTS += --without-p11-kit
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GNUTLS_CONF_OPTS += --with-zlib
+GNUTLS_DEPENDENCIES += zlib
+else
+GNUTLS_CONF_OPTS += --without-zlib
+endif
+
 # Some examples in doc/examples use wchar
 define GNUTLS_DISABLE_DOCS
 	$(SED) 's/ doc / /' $(@D)/Makefile.in
