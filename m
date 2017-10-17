From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Oct 2017 15:12:55 +0300
Subject: [Buildroot] [PATCH] libtomcrypt: fix build without wchar
Message-ID: <217c4b97cdb72c68b7d6d669b1c3cbb9b47bf4ad.1508242375.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC defines wchar_t even when wchar support is disabled in uClibc. The
LTC_NO_WCHAR macro triggers a local definition of wchar_t that conflicts
with the GCC defined one. Remove LTC_NO_WCHAR to avoid that.

Fixes:
http://autobuild.buildroot.net/results/895/895452ac973cab0e0bc22636d39cbec7fbf598d3/
http://autobuild.buildroot.net/results/c82/c82d0173878e58f7192d3cec271b45763e6ea269/
http://autobuild.buildroot.net/results/83f/83f433bcb608b341fca2180afa57fc81495bc3b4/

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libtomcrypt/libtomcrypt.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index 02610f16d669..020ce796fede 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -13,8 +13,7 @@ LIBTOMCRYPT_INSTALL_STAGING = YES
 LIBTOMCRYPT_INSTALL_TARGET = NO # only static library
 LIBTOMCRYPT_DEPENDENCIES = libtommath
 
-LIBTOMCRYPT_CFLAGS = -I./src/headers $(TARGET_CFLAGS) -DLTC_SOURCE -DLTM_DESC \
-	$(if $(BR2_USE_WCHAR),,-DLTC_NO_WCHAR)
+LIBTOMCRYPT_CFLAGS = -I./src/headers $(TARGET_CFLAGS) -DLTC_SOURCE -DLTM_DESC
 
 define LIBTOMCRYPT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(LIBTOMCRYPT_CFLAGS)"
-- 
2.14.2
