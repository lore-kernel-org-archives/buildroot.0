From: Paul Cercueil <paul@crapouillou.net>
Date: Sun, 22 Nov 2020 16:00:07 +0000
Subject: [Buildroot] [PATCH 1/2] wlroots: package does not require locale
 support
Message-ID: <20201122160008.44129-1-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop dependency on BR2_ENABLE_LOCALE, which was marked as a dependency
of libinput which is selected by wlroots. However, libinput does not
depend at all on BR2_ENABLE_LOCALE.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/wlroots/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index eb4c4725ac..2f72fd4945 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -3,16 +3,14 @@ comment "wlroots needs udev, mesa3d w/ EGL and GLES support"
 		!BR2_PACKAGE_MESA3D_OPENGL_ES || \
 		!BR2_PACKAGE_HAS_UDEV
 
-comment "wlroots needs a toolchain w/ threads, locale, dynamic library"
+comment "wlroots needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_ENABLE_LOCALE || \
 		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_WLROOTS
 	bool "wlroots"
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
-	depends on BR2_ENABLE_LOCALE # libinput
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	# Technically wlroots should work with any OpenGL implementation
 	# which provides EGL, GLES2, and libgbm; but in practice only
-- 
2.29.2
