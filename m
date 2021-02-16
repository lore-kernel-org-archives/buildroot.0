From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 16 Feb 2021 09:07:54 +0100
Subject: [Buildroot] [PATCH 1/3] package/mongoose: fix activation of
 openssl/mbedtls
Message-ID: <20210216080756.1635858-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MG_ENABLE_SSL and MG_SSL_IF have been dropped since version 7.0 and
https://github.com/cesanta/mongoose/commit/f2fba1d2004c5ddf2fc0a7ca8dc75b5f78feed85

So use the new MG_ENABLE_OPENSSL and MG_ENABLE_MBEDTLS variables

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongoose/mongoose.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index ae20965be4..996cbff757 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -16,14 +16,10 @@ MONGOOSE_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
-MONGOOSE_CFLAGS += \
-	-DMG_ENABLE_SSL \
-	-DMG_SSL_IF=MG_SSL_IF_OPENSSL
+MONGOOSE_CFLAGS += -DMG_ENABLE_OPENSSL=1
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 MONGOOSE_DEPENDENCIES += mbedtls
-MONGOOSE_CFLAGS += \
-	-DMG_ENABLE_SSL \
-	-DMG_SSL_IF=MG_SSL_IF_MBEDTLS
+MONGOOSE_CFLAGS += -DMG_ENABLE_MBEDTLS=1
 endif
 
 define MONGOOSE_BUILD_CMDS
-- 
2.30.0
