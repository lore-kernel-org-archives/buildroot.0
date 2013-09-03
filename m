From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Sep 2013 07:37:56 -0300
Subject: [Buildroot] [PATCH] libcurl: extend package support
Message-ID: <1378204676-21152-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for gnutls, nss and polarssl backends.
Add support for libidn and zlib.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl.mk | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index d5012b6..71f19f1 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -7,6 +7,9 @@
 LIBCURL_VERSION = 7.32.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
+LIBCURL_DEPENDENCIES = host-pkgconf \
+	$(if $(BR2_PACKAGE_ZLIB),zlib) \
+	$(if $(BR2_PACKAGE_LIBIDN),libidn)
 LIBCURL_LICENSE = ICS
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
@@ -15,8 +18,8 @@ LIBCURL_INSTALL_STAGING = YES
 # on non-MMU platforms. Moreover, this authentication method is
 # probably almost never used. See
 # http://curl.haxx.se/docs/manpage.html#--ntlm.
-LIBCURL_CONF_OPT = --disable-verbose --disable-manual \
-	--enable-hidden-symbols --disable-ntlm-wb
+LIBCURL_CONF_OPT = --disable-verbose --disable-manual --disable-ntlm-wb \
+	--enable-hidden-symbols --with-random=/dev/urandom
 LIBCURL_CONFIG_SCRIPTS = curl-config
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
@@ -27,11 +30,21 @@ LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
 # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
 # are found first.
 LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/lib:/usr/lib
-LIBCURL_CONF_OPT += --with-ssl \
-	--with-random=/dev/urandom \
+LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr \
 	--with-ca-path=/etc/ssl/certs
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBCURL_CONF_OPT += --with-gnutls=$(STAGING_DIR)/usr
+LIBCURL_DEPENDENCIES += gnutls
+else ifeq ($(BR2_PACKAGE_POLARSSL),y)
+LIBCURL_CONF_OPT += --with-polarssl=$(STAGING_DIR)/usr
+LIBCURL_DEPENDENCIES += polarssl
+else ifeq ($(BR2_PACKAGE_LIBNSS),y)
+LIBCURL_CONF_OPT += --with-nss=$(STAGING_DIR)/usr
+LIBCURL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) nspr nss --cflags`"
+LIBCURL_DEPENDENCIES += libnss
 else
-LIBCURL_CONF_OPT += --without-ssl
+LIBCURL_CONF_OPT += --without-ssl --without-gnutls \
+	--without-polarssl --without-nss
 endif
 
 define LIBCURL_FIX_DOT_PC
-- 
1.8.1.5
