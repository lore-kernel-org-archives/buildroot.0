From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 26 Aug 2018 19:23:12 +0200
Subject: [Buildroot] [PATCH/next,1/2] jpeg-turbo: fix static build
Message-ID: <20180826172313.19644-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set ENABLE_STATIC and ENABLE_SHARED depending on
BR2_PACKAGE_STATIC_LIBS, BR2_SHARED_SHARED_STATIC_LIBS and
BR2_SHARED_SHARED_LIBS

Fixes:
 - http://autobuild.buildroot.net/results/7e1500405a0f102dd6a48ef9337ffe4d7de73df3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jpeg-turbo/jpeg-turbo.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 0fe2fcda72..1807cc294e 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -15,6 +15,14 @@ JPEG_TURBO_DEPENDENCIES = host-pkgconf
 
 JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON
 
+ifeq ($(BR2_STATIC_LIBS),y)
+JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=OFF -DENABLE_SHARED=ON
+endif
+
 ifeq ($(BR2_PACKAGE_JPEG_SIMD_SUPPORT),y)
 JPEG_TURBO_CONF_OPTS += -DWITH_SIMD=ON
 # x86 simd support needs nasm
-- 
2.14.1
