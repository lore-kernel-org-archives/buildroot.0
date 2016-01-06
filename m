From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Jan 2016 15:53:37 -0300
Subject: [Buildroot] [PATCH] libcurl: enable mbedtls support
Message-ID: <1452106417-12097-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we've got an mbedtls package in the tree we can enable the
optional support for it in libcurl.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 10514c6..8798d71 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -40,10 +40,12 @@ else ifeq ($(BR2_PACKAGE_LIBNSS),y)
 LIBCURL_CONF_OPTS += --with-nss=$(STAGING_DIR)/usr
 LIBCURL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) nspr nss --cflags`"
 LIBCURL_DEPENDENCIES += libnss
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBCURL_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr
+LIBCURL_DEPENDENCIES += mbedtls
 else
-# polarssl support needs 1.3.x
 LIBCURL_CONF_OPTS += --without-ssl --without-gnutls \
-	--without-polarssl --without-nss
+	--without-polarssl --without-nss --without-mbedtls
 endif
 
 ifeq ($(BR2_PACKAGE_C_ARES),y)
-- 
2.4.10
