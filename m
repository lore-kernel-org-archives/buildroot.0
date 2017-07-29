From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:52:19 +0200
Subject: [Buildroot] [git commit] libssh2: fix build with libgcrypt and
	mbedtls enabled
Message-ID: <20170729134813.44362819CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=908960d98ff0c88b93a916b857daf84e39182581
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The --without-libgcrypt configure parameter is not enough to disable the
libgcrypt back-end. This breaks the build when mbedtls (default backend) is
enabled, and libgcrypt builds before libssh2. Seed ac_cv_libgcrypt to really
disable libgcrypt when it is not the selected crypto back-end.

Fixes:
http://autobuild.buildroot.net/results/b4e/b4e39890e003e9e590a5bf17c9300c653020d88c/
http://autobuild.buildroot.net/results/45a/45a9b3559ceea4e1399794f9612f717f7c57a4a3/
http://autobuild.buildroot.net/results/ae4/ae4afec62ca297df1cd02350601f1d62fc3cd1b7/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libssh2/libssh2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 338f5b4..4127934 100644
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
