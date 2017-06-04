From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  4 Jun 2017 23:59:32 +0200
Subject: [Buildroot] [PATCH] package/sdl2: disable OpenGL ES 1.1 with
	sunxi-mali as libgles provider
Message-ID: <20170604215932.3102-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenGL ES 1.1 and OpenGL ES 2.0 can't be enabled at the same time
with sunxi-mali as libgles provider due to conflicting types for
'GLintptr' in GLES2/gl2.h and GLES/gl.h

Fixes:
http://autobuild.buildroot.net/results/258/25898b45cefde9661d8ac87dd84bc883bb5283d1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/sdl2/sdl2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index a0a4489..2917475 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -111,6 +111,13 @@ else
 SDL2_CONF_OPTS += --disable-video-opengles
 endif
 
+# OpenGL ES 1.1 and OpenGL ES 2.0 can't be enabled at the same time
+# with sunxi-mali as libgles provider due to conflicting types for
+# 'GLintptr' in GLES2/gl2.h and GLES/gl.h
+ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
+SDL2_CONF_OPTS += --disable-video-opengles1
+endif
+
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 SDL2_DEPENDENCIES += tslib
 SDL2_CONF_OPTS += --enable-input-tslib
-- 
2.9.4
