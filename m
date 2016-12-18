From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 18 Dec 2016 20:20:35 +0100
Subject: [Buildroot] [PATCH 1/3] package/sdl2: enable opengl support
Message-ID: <1482088837-3388-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenGl support mean GLX so it require X11 support.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/sdl2/Config.in | 8 ++++++++
 package/sdl2/sdl2.mk   | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index b73611d..97b7ce5 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -27,6 +27,14 @@ config BR2_PACKAGE_SDL2_X11
 comment "X11 video driver needs X.org"
 	depends on !BR2_PACKAGE_XORG7
 
+config BR2_PACKAGE_SDL2_OPENGL
+	bool "OpenGL (GLX)"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_XORG7
+
+comment "OpenGL support needs X11 and an OpenGL provider"
+	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
+
 endif
 
 comment "sdl2 needs a toolchain w/ dynamic library"
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 814cc19..8b47d5d 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -18,7 +18,6 @@ SDL2_CONF_OPTS += \
 	--disable-esd \
 	--disable-dbus \
 	--disable-pulseaudio \
-	--disable-video-opengl \
 	--disable-video-opengles \
 	--disable-video-wayland
 
@@ -99,6 +98,13 @@ else
 SDL2_CONF_OPTS += --disable-video-x11 --without-x
 endif
 
+ifeq ($(BR2_PACKAGE_SDL2_OPENGL),y)
+SDL2_CONF_OPTS += --enable-video-opengl
+SDL2_DEPENDENCIES += libgl
+else
+SDL2_CONF_OPTS += --disable-video-opengl
+endif
+
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 SDL2_DEPENDENCIES += tslib
 SDL2_CONF_OPTS += --enable-input-tslib
-- 
2.5.5
