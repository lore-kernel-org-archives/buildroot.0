From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 26 Sep 2017 16:47:23 +0200
Subject: [Buildroot] [PATCH 3/3] sdl2: Add KMS/DRM(experimental) video
	driver support
In-Reply-To: <20170926144723.17619-1-olivier.schonken@gmail.com>
References: <20170926144723.17619-1-olivier.schonken@gmail.com>
Message-ID: <20170926144723.17619-3-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/sdl2/Config.in | 7 +++++++
 package/sdl2/sdl2.mk   | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index a2971edc89..f29b3c7c38 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -29,6 +29,13 @@ comment "X11 video driver needs X.org"
 	depends on !BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 
+config BR2_PACKAGE_SDL2_KMSDRM
+	bool "KMS/DRM video driver"
+	depends on BR2_PACKAGE_LIBDRM
+
+comment "KMS/DRM video driver needs libdrm"
+	depends on !BR2_PACKAGE_LIBDRM
+
 config BR2_PACKAGE_SDL2_OPENGL
 	bool "OpenGL (GLX)"
 	depends on BR2_PACKAGE_HAS_LIBGL
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index e64628d0cd..facb41e527 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -125,4 +125,11 @@ else
 SDL2_CONF_OPTS += --disable-alsa
 endif
 
+ifeq ($(BR2_PACKAGE_SDL2_KMSDRM),y)
+SDL2_DEPENDENCIES += libdrm
+SDL2_CONF_OPTS += --enable-video-kmsdrm
+else
+SDL2_CONF_OPTS += --disable-video-kmsdrm
+endif
+
 $(eval $(autotools-package))
-- 
2.11.0
