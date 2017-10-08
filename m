From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 15:34:23 +0200
Subject: [Buildroot] [git commit] sdl2: add KMS/DRM video driver support
Message-ID: <20171008133929.D673481060@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0891510dc600d8d58f2cc69fc8f648387f4a548b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl2/Config.in | 7 +++++++
 package/sdl2/sdl2.mk   | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index a2971ed..f29b3c7 100644
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
index e64628d..facb41e 100644
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
