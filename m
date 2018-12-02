From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:26 -0000
Subject: [Buildroot] [git commit] libcurl: Don't need
 --without-(ssl/gnutls/nss/mbedtls) twice
Message-ID: <20181202071554.B9E6A8107F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97060f445eed65d30326db8554be7ed3151ffa33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the --without-* options from the yes side of the TLS libraries
selection checks.

Since the --without-* option is now specified when the corresponding TLS
library is not being used, it's no longer necessary when enabling a TLS
library to explicity list all the other TLS libs that curl should not
use.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index b6b8e0abc8..5aa6d542ad 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -50,14 +50,14 @@ LIBCURL_CONF_OPTS += -without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
-LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr --without-ssl
+LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
 LIBCURL_DEPENDENCIES += gnutls
 else
 LIBCURL_CONF_OPTS += --without-gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_LIBNSS),y)
-LIBCURL_CONF_OPTS += --with-nss=$(STAGING_DIR)/usr --without-ssl --without-gnutls
+LIBCURL_CONF_OPTS += --with-nss=$(STAGING_DIR)/usr
 LIBCURL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) nspr nss --cflags`"
 LIBCURL_DEPENDENCIES += libnss
 else
@@ -65,8 +65,7 @@ LIBCURL_CONF_OPTS += --without-nss
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_MBEDTLS),y)
-LIBCURL_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr \
-	--without-ssl --without-gnutls --without-nss
+LIBCURL_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr
 LIBCURL_DEPENDENCIES += mbedtls
 else
 LIBCURL_CONF_OPTS += --without-mbedtls
