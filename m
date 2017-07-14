From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 14 Jul 2017 14:15:26 -0400
Subject: [Buildroot] [PATCH 04/15] libcurl: support libressl.
In-Reply-To: <20170714181537.17479-1-aduskett@gmail.com>
References: <20170714181537.17479-1-aduskett@gmail.com>
Message-ID: <20170714181537.17479-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libcurl/libcurl.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 684844919..907121717 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -40,6 +40,16 @@ LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
 LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib
 LIBCURL_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr \
 	--with-ca-path=/etc/ssl/certs
+else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+LIBCURL_DEPENDENCIES += libressl
+LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
+# configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
+# native stuff during the rest of configure when target == host.
+# Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
+# are found first.
+LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib
+LIBCURL_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr \
+	--with-ca-path=/etc/ssl/certs
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
 LIBCURL_DEPENDENCIES += gnutls
-- 
2.13.0
