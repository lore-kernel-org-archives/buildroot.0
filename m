From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:24:53 +0100
Subject: [Buildroot] [git commit] libcurl: enable mbedtls support
Message-ID: <20160308202524.694268042D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0af16e3a9231e1df2b661b7bf0949e79ed28cb18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we've got an mbedtls package in the tree we can enable the
optional support for it in libcurl.

We also remove the comment about polarssl support needing version
1.3.x. Indeed, polarssl was renamed to mbedtls when bought by ARM,
which was circa the 1.3.x polarssl release. Due to this referring to
polarssl 1.3.x doesn't make a lot of sense, and we'll probably never
package polarssl 1.3.x in Buildroot now that mbedtls replaces it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
[Thomas: slightly improve commit log as suggested by Luca, using
explanations from Gustavo.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcurl/libcurl.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 33a5410..783c9b1 100644
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
