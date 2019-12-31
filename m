From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 17:24:34 +0100
Subject: [Buildroot] [git commit] libcurl: add wolfssl as an option for TLS
Message-ID: <20191231161709.99C7C8E98E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d08c76e45d231b0c614d35ae1d1d1eca9eefde3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libcurl recipe allows selecting between various TLS backends. Users can
already select between several options but WolfSSL was missing. WolfSSL
is an efficient TLS library, it supports TLS 1.3 and is used in many
embedded systems.

Add WolfSSL to libcurl "SSL/TLS library to use" choice list when WolfSSL
package is enabled. When selected in the list, use libcurl
--with-wolfssl configure option. Explicitly set --without-wolfssl
when it is not selected.

Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcurl/Config.in  | 5 +++++
 package/libcurl/libcurl.mk | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 0511786dc6..3a9ee0f121 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -51,6 +51,7 @@ config BR2_PACKAGE_LIBCURL_TLS_SUPPORT
 	default y if BR2_PACKAGE_GNUTLS
 	default y if BR2_PACKAGE_LIBNSS
 	default y if BR2_PACKAGE_MBEDTLS
+	default y if BR2_PACKAGE_WOLFSSL
 
 choice
 	prompt "SSL/TLS library to use"
@@ -72,6 +73,10 @@ config BR2_PACKAGE_LIBCURL_MBEDTLS
 	bool "mbed TLS"
 	depends on BR2_PACKAGE_MBEDTLS
 
+config BR2_PACKAGE_LIBCURL_WOLFSSL
+	bool "WolfSSL"
+	depends on BR2_PACKAGE_WOLFSSL
+
 endchoice
 
 comment "A TLS library is needed for SSL/TLS support"
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 373befae13..d46b874b37 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -74,6 +74,13 @@ else
 LIBCURL_CONF_OPTS += --without-mbedtls
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL_WOLFSSL),y)
+LIBCURL_CONF_OPTS += --with-wolfssl=$(STAGING_DIR)/usr
+LIBCURL_DEPENDENCIES += wolfssl
+else
+LIBCURL_CONF_OPTS += --without-wolfssl
+endif
+
 ifeq ($(BR2_PACKAGE_C_ARES),y)
 LIBCURL_DEPENDENCIES += c-ares
 LIBCURL_CONF_OPTS += --enable-ares
