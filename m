From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 21:05:09 +0100
Subject: [Buildroot] [git commit] package/sdl2: enable opengl support
Message-ID: <20170301170424.4053A7FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=739b66e8d9c5c1e228486c8b4ed2be2fb1e8559d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenGl support mean GLX so it require X11 support.
Select automatically BR2_PACKAGE_SDL2_X11 to enable minimal X11
libraries support (libx11 and libxext).

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl2/Config.in | 11 +++++++++++
 package/sdl2/sdl2.mk   |  8 +++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index 8fc14ee..6345133 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -29,6 +29,17 @@ comment "X11 video driver needs X.org"
 	depends on !BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 
+config BR2_PACKAGE_SDL2_OPENGL
+	bool "OpenGL (GLX)"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # X11 video driver
+	select BR2_PACKAGE_SDL2_X11
+
+comment "OpenGL support needs X11 and an OpenGL provider"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
+
 endif
 
 comment "sdl2 needs a toolchain w/ dynamic library"
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 2ec12e6..3f210f8 100644
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
