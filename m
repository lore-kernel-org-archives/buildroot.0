From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Feb 2017 14:35:59 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/sdl2: enable OpenGL ES support
In-Reply-To: <20170225133600.15637-1-romain.naour@gmail.com>
References: <20170225133600.15637-1-romain.naour@gmail.com>
Message-ID: <20170225133600.15637-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: no change
---
 package/sdl2/Config.in | 7 +++++++
 package/sdl2/sdl2.mk   | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index 25704f3..66a77a1 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -37,6 +37,13 @@ config BR2_PACKAGE_SDL2_OPENGL
 comment "OpenGL support needs X11 and an OpenGL provider"
 	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
 
+config BR2_PACKAGE_SDL2_OPENGLES
+	bool "OpenGL ES"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+
+comment "OpenGL ES support needs an OpenGL ES provider"
+	depends on !BR2_PACKAGE_HAS_LIBGLES
+
 endif
 
 comment "sdl2 needs a toolchain w/ dynamic library"
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 3f210f8..d2ee50d 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -18,7 +18,6 @@ SDL2_CONF_OPTS += \
 	--disable-esd \
 	--disable-dbus \
 	--disable-pulseaudio \
-	--disable-video-opengles \
 	--disable-video-wayland
 
 # We must enable static build to get compilation successful.
@@ -105,6 +104,13 @@ else
 SDL2_CONF_OPTS += --disable-video-opengl
 endif
 
+ifeq ($(BR2_PACKAGE_SDL2_OPENGLES),y)
+SDL2_CONF_OPTS += --enable-video-opengles
+SDL2_DEPENDENCIES += libgles
+else
+SDL2_CONF_OPTS += --disable-video-opengles
+endif
+
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 SDL2_DEPENDENCIES += tslib
 SDL2_CONF_OPTS += --enable-input-tslib
-- 
2.9.3
