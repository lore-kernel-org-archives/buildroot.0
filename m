From: Julien Grossholtz <julien.grossholtz@openest.io>
Date: Tue,  5 Nov 2019 11:06:59 +0100
Subject: [Buildroot] [PATCH 1/1] libcurl: add wolfssl as an option for TLS
Message-ID: <20191105100659.1166232-1-julien.grossholtz@openest.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libcurl recipe allows selecting between various TLS backends. Users can
already select between several options but WolfSSL was missing. WolfSSL
is an efficient TLS library, it supports TLS 1.3 and is used in many
embedded systems.

Add WolfSSL to libcurl "SSL/TLS library to use" choice list when WolfSSL
package is enabled. When selected in the list, use libcurl
--with-wolfssl configure option. Explicitly set --without-wolfssl
when it is not selected.

Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
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
index bab7c8e1be..264db3913e 100644
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
-- 
2.23.0
