From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 18 Dec 2016 20:20:36 +0100
Subject: [Buildroot] [PATCH 2/3] package/sdl2: enable OpenGL ES support
In-Reply-To: <1482088837-3388-1-git-send-email-romain.naour@gmail.com>
References: <1482088837-3388-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1482088837-3388-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/sdl2/Config.in | 7 +++++++
 package/sdl2/sdl2.mk   | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index 97b7ce5..604be74 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -35,6 +35,13 @@ config BR2_PACKAGE_SDL2_OPENGL
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
index 8b47d5d..873315e 100644
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
2.5.5
