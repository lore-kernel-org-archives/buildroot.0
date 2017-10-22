From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 14:36:20 +0200
Subject: [Buildroot] [git commit] libtomcrypt: fix build without wchar
Message-ID: <20171022122911.1ABCD8114F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f256545044762877129027bec1518669dcd7b7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC defines wchar_t even when wchar support is disabled in uClibc. The
LTC_NO_WCHAR macro triggers a local definition of wchar_t that conflicts
with the GCC defined one. Remove LTC_NO_WCHAR to avoid that.

See also https://github.com/libtom/libtomcrypt/issues/313 for more
discussion about this.

Fixes:
http://autobuild.buildroot.net/results/4ff/4ffb593185f7520d2d9a9cc988aa9c510f253930/

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtomcrypt/libtomcrypt.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index 02610f1..020ce79 100644
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
