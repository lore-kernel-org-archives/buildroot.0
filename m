From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Tue, 12 Jul 2016 08:53:04 -0600
Subject: [Buildroot] [PATCH 2/3] sdl2_image: new package
In-Reply-To: <1468335185-19378-1-git-send-email-peter.macleod.thompson@gmail.com>
References: <1468335185-19378-1-git-send-email-peter.macleod.thompson@gmail.com>
Message-ID: <1468335185-19378-2-git-send-email-peter.macleod.thompson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sdl2_image created from sdl2_image with minor changes for sdl2

Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
---
 package/Config.in                  |  1 +
 package/sdl2_image/Config.in       | 61 ++++++++++++++++++++++++++++++++++++++
 package/sdl2_image/sdl2_image.hash |  2 ++
 package/sdl2_image/sdl2_image.mk   | 51 +++++++++++++++++++++++++++++++
 4 files changed, 115 insertions(+)
 create mode 100644 package/sdl2_image/Config.in
 create mode 100644 package/sdl2_image/sdl2_image.hash
 create mode 100644 package/sdl2_image/sdl2_image.mk

diff --git a/package/Config.in b/package/Config.in
index 5a75234..b79c237 100644
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
index 0000000..38bd266
--- /dev/null
+++ b/package/sdl2_image/Config.in
@@ -0,0 +1,61 @@
+config BR2_PACKAGE_SDL2_IMAGE
+	bool "SDL2_image"
+	depends on BR2_PACKAGE_SDL2
+	help
+	  SDL2_image is an image file loading library. It loads images
+	  as SDL surfaces, and supports the following formats:
+	  BMP, GIF, JPEG, LBM, PCX, PNG, PNM, TGA, TIFF, XCF, XPM, XV.
+
+	  http://www.libsdl.org/projects/SDL_image/
+
+if BR2_PACKAGE_SDL2_IMAGE
+
+menu "SDL2_image file format support"
+
+config BR2_PACKAGE_SDL2_IMAGE_BMP
+	bool "enable BMP file format support"
+	default y
+
+config BR2_PACKAGE_SDL2_IMAGE_GIF
+	bool "enable GIF file format support"
+
+config BR2_PACKAGE_SDL_2IMAGE_JPEG
+	bool "enable JPEG file format support"
+	select BR2_PACKAGE_JPEG
+
+config BR2_PACKAGE_SDL2_IMAGE_LBM
+	bool "enable LBM file format support"
+
+config BR2_PACKAGE_SDL2_IMAGE_PCX
+	bool "enable PCX file format support"
+
+config BR2_PACKAGE_SDL2_IMAGE_PNG
+	bool "enable PNG file format support"
+	select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_SDL2_IMAGE_PNM
+	bool "enable PNM file format support"
+
+config BR2_PACKAGE_SDL2_IMAGE_TARGA
+	bool "enable TARGA format support"
+
+config BR2_PACKAGE_SDL2_IMAGE_TIFF
+	bool "enable TIFF file format support"
+	select BR2_PACKAGE_TIFF
+
+config BR2_PACKAGE_SDL2_IMAGE_WEBP
+	bool "enable WEBP file format support"
+	select BR2_PACKAGE_WEBP
+
+config BR2_PACKAGE_SDL2_IMAGE_XCF
+	bool "enable XCF file format support"
+
+config BR2_PACKAGE_SDL2_IMAGE_XPM
+	bool "enable XPM format support"
+
+config BR2_PACKAGE_SDL2_IMAGE_XV
+	bool "enable XV file format support"
+
+endmenu
+
+endif
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
index 0000000..892c828
--- /dev/null
+++ b/package/sdl2_image/sdl2_image.mk
@@ -0,0 +1,51 @@
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
+SDL2_IMAGE_LICENSE_FILES = COPYING
+
+SDL2_IMAGE_CONF_OPTS = \
+	--with-sdl2-prefix=$(STAGING_DIR)/usr \
+	--with-sdl2-exec-prefix=$(STAGING_DIR)/usr \
+	--disable-sdl2test \
+	--disable-static \
+	--enable-bmp=$(if $(BR2_PACKAGE_SDL2_IMAGE_BMP),yes,no) \
+	--enable-gif=$(if $(BR2_PACKAGE_SDL2_IMAGE_GIF),yes,no) \
+	--enable-jpg=$(if $(BR2_PACKAGE_SDL2_IMAGE_JPEG),yes,no) \
+	--enable-lbm=$(if $(BR2_PACKAGE_SDL2_IMAGE_LBM),yes,no) \
+	--enable-pcx=$(if $(BR2_PACKAGE_SDL2_IMAGE_PCX),yes,no) \
+	--enable-png=$(if $(BR2_PACKAGE_SDL2_IMAGE_PNG),yes,no) \
+	--enable-pnm=$(if $(BR2_PACKAGE_SDL2_IMAGE_PNM),yes,no) \
+	--enable-tga=$(if $(BR2_PACKAGE_SDL2_IMAGE_TARGA),yes,no) \
+	--enable-tif=$(if $(BR2_PACKAGE_SDL2_IMAGE_TIFF),yes,no) \
+	--enable-webp=$(if $(BR2_PACKAGE_SDL2_IMAGE_WEBP),yes,no) \
+	--enable-xcf=$(if $(BR2_PACKAGE_SDL2_IMAGE_XCF),yes,no) \
+	--enable-xpm=$(if $(BR2_PACKAGE_SDL2_IMAGE_XPM),yes,no) \
+	--enable-xv=$(if $(BR2_PACKAGE_SDL2_IMAGE_XV),yes,no) \
+
+SDL2_IMAGE_DEPENDENCIES = sdl2 \
+	$(if $(BR2_PACKAGE_SDL2_IMAGE_JPEG),jpeg) \
+	$(if $(BR2_PACKAGE_SDL2_IMAGE_PNG),libpng) \
+	$(if $(BR2_PACKAGE_SDL2_IMAGE_TIFF),tiff) \
+	$(if $(BR2_PACKAGE_SDL2_IMAGE_WEBP),webp)
+
+HOST_SDL2_IMAGE_CONF_OPTS = \
+	--with-sdl2-prefix=$(HOST_DIR)/usr \
+	--with-sdl2-exec-prefix=$(HOST_DIR)/usr \
+	--disable-sdl2test \
+	--disable-static \
+	--disable-jpg-shared \
+	--disable-png-shared \
+	--disable-tif-shared \
+
+HOST_SDL2_IMAGE_DEPENDENCIES = host-libjpeg host-libpng host-sdl2
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.1
