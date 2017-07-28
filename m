From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 28 Jul 2017 07:28:13 +0300
Subject: [Buildroot] [PATCH] libssh2: fix build with libgcrypt and mbedtls
	enabled
Message-ID: <aee7e0b01fec4b43854973bba5a967f438d6dcb4.1501216093.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The --without-libgcrypt configure parameter is not enough to disable the
libgcrypt back-end. This breaks the build when mbedtls (default backend) is
enabled, and libgcrypt builds before libssh2. Seed ac_cv_libgcrypt to really
disable libgcrypt when it is not the selected crypto back-end.

Fixes:
http://autobuild.buildroot.net/results/b4e/b4e39890e003e9e590a5bf17c9300c653020d88c/
http://autobuild.buildroot.net/results/45a/45a9b3559ceea4e1399794f9612f717f7c57a4a3/
http://autobuild.buildroot.net/results/ae4/ae4afec62ca297df1cd02350601f1d62fc3cd1b7/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libssh2/libssh2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 338f5b458f11..41279342750b 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -17,6 +17,7 @@ ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr \
 	--without-openssl --without-libgcrypt
+LIBSSH2_CONF_ENV += ac_cv_libgcrypt=no
 else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBSSH2_DEPENDENCIES += libgcrypt
 LIBSSH2_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr \
-- 
2.13.2
