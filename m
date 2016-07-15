From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 16:14:51 +0200
Subject: [Buildroot] [git commit] sdl2_image: new package
Message-ID: <20160715141553.B321C82257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2ffe91eab49ba357c39f2bb1b5cb5450f5a84e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>

[Thomas:
 - remove all sub-options to select the various image formats. Between
   no formats enabled and all formats enabled, the size difference of
   the library is ~30 KB, so it really isn't worth having all those
   sub-options:
   -rwxr-xr-x 1 thomas thomas  22444 juil. 15 15:51 libSDL2_image-2.0.so.0.0.1
   -rwxr-xr-x 1 thomas thomas  59216 juil. 15 15:52 libSDL2_image-2.0.so.0.0.1
   consequently, we simply enable unconditionally all image formats
   that don't have any dependency, and use "automatic" dependencies
   for the 4 formats that require an external library
 - remove the host package variant, as it isn't used anywhere.
 - remove --with-sdl2-prefix and --with-sdl2-exec-prefix, and instead
   add a dependency on host-pkgconf so that pkg-config is used
 - remove --disable-static, this is handled by the autotools-package
   infrastructure already
 - point <pkg>_LICENSE_FILES to an existing file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/sdl2_image/Config.in       |  9 ++++++
 package/sdl2_image/sdl2_image.hash |  2 ++
 package/sdl2_image/sdl2_image.mk   | 58 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 70 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0ec9ba4..5be2053 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -264,6 +264,7 @@ comment "Graphic libraries"
 	source "package/sdl_ttf/Config.in"
 	source "package/sdl2/Config.in"
 	source "package/sdl2_gfx/Config.in"
+	source "package/sdl2_image/Config.in"
 
 comment "Other GUIs"
 	source "package/qt/Config.in"
diff --git a/package/sdl2_image/Config.in b/package/sdl2_image/Config.in
new file mode 100644
index 0000000..3064f94
--- /dev/null
+++ b/package/sdl2_image/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SDL2_IMAGE
+	bool "SDL2_image"
+	depends on BR2_PACKAGE_SDL2
+	help
+	  SDL2_image is an image file loading library. It loads images
+	  as SDL surfaces, and supports the following formats: BMP,
+	  GIF, JPEG, LBM, PCX, PNG, PNM, TGA, TIFF, XCF, XPM, XV.
+
+	  http://www.libsdl.org/projects/SDL_image/
diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
new file mode 100644
index 0000000..26d0a88
--- /dev/null
+++ b/package/sdl2_image/sdl2_image.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3a3eafbceea5125c04be585373bfd8b3a18f259bd7eae3efc4e6d8e60e0d7f64  SDL2_image-2.0.1.tar.gz
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
new file mode 100644
index 0000000..cf3b738
--- /dev/null
+++ b/package/sdl2_image/sdl2_image.mk
@@ -0,0 +1,58 @@
+################################################################################
+#
+# sdl2_image
+#
+################################################################################
+
+SDL2_IMAGE_VERSION = 2.0.1
+SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
+SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
+SDL2_IMAGE_INSTALL_STAGING = YES
+SDL2_IMAGE_LICENSE = zlib
+SDL2_IMAGE_LICENSE_FILES = COPYING.txt
+
+# Unconditionally enable support for image formats that don't require
+# any dependency.
+SDL2_IMAGE_CONF_OPTS = \
+	--disable-sdltest \
+	--enable-bmp \
+	--enable-gif \
+	--enable-lbm \
+	--enable-pcx \
+	--enable-pnm \
+	--enable-tga \
+	--enable-xcf \
+	--enable-xpm \
+	--enable-xv
+
+SDL2_IMAGE_DEPENDENCIES = sdl2 host-pkgconf
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+SDL2_IMAGE_CONF_OPTS += --enable-jpg
+SDL2_IMAGE_DEPENDENCIES += jpeg
+else
+SDL2_IMAGE_CONF_OPTS += --disable-jpg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+SDL2_IMAGE_CONF_OPTS += --enable-png
+SDL2_IMAGE_DEPENDENCIES += libpng
+else
+SDL2_IMAGE_CONF_OPTS += --disable-png
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+SDL2_IMAGE_CONF_OPTS += --enable-tif
+SDL2_IMAGE_DEPENDENCIES += tiff
+else
+SDL2_IMAGE_CONF_OPTS += --disable-tif
+endif
+
+ifeq ($(BR2_PACKAGE_WEBP),y)
+SDL2_IMAGE_CONF_OPTS += --enable-webp
+SDL2_IMAGE_DEPENDENCIES += webp
+else
+SDL2_IMAGE_CONF_OPTS += --disable-webp
+endif
+
+$(eval $(autotools-package))
