From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 11 Feb 2020 21:37:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/jpeg-turbo: fix build without SIMD
Message-ID: <20200211203755.266720-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add -fPIC as requested by upstream in
https://github.com/libjpeg-turbo/libjpeg-turbo/pull/366

Fixes:
 - http://autobuild.buildroot.org/results/5b7ce0a8f8d1f485bd7104ac2b40257bb17b284b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jpeg-turbo/jpeg-turbo.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 2767ce6de4..1d24406e0f 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -13,7 +13,9 @@ JPEG_TURBO_INSTALL_STAGING = YES
 JPEG_TURBO_PROVIDES = jpeg
 JPEG_TURBO_DEPENDENCIES = host-pkgconf
 
-JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON
+JPEG_TURBO_CONF_OPTS = \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -fPIC" \
+	-DWITH_JPEG8=ON
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
-- 
2.24.1
