From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 17:37:01 +0200
Subject: [Buildroot] [git commit] package/imagemagick: add optional SVG
 support to host variant
Message-ID: <20190623155616.8C84E81D9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a7a584b246e522e52868432efa3734767cc2ace
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SVG can be regarded as the "source code" for assets, like logos or other
graphical elements.

However, SVG needs to be rendered, which requires an XML parser and an
SVG "parser/rendered". As such, it has various runtime impacts, like
bad performance or security. As such, SVG are often pre-rendered to the
required sizes/depths/resolutions into other format, such as PNG, at
build time.

While rsvg-convert (from host-librsvg) would allow the rendering, it
does not allow more complex tasks taht ImageMagick allows for:
compositing more than one image, 2D transforamtions (rotation, skew...).

Yet, SVG support in ImageMagick relies on librsvg, which adds quite a
few dependencies, and thus has a noticeable impact on the build time.

Add an option to allow concerned users to enable/disable SVG support
in ImageMagick.

Enabling SVG support relies on librsvg, which in turns relies on a few
additional packages that ImageMagick can also optionally use. So,
automatically enable the corresponding support as well.

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imagemagick/Config.in.host | 13 +++++++++++++
 package/imagemagick/imagemagick.mk | 28 +++++++++++++++++++++++-----
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
index 56d45df537..bbe23baa6f 100644
--- a/package/imagemagick/Config.in.host
+++ b/package/imagemagick/Config.in.host
@@ -11,3 +11,16 @@ config BR2_PACKAGE_HOST_IMAGEMAGICK
 	  B??zier curves.
 
 	  http://www.imagemagick.org/
+
+if BR2_PACKAGE_HOST_IMAGEMAGICK
+
+config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
+	bool "SVG support"
+	help
+	  Say 'y' here is you need ImageMagick tools (like convert)
+	  to support SVG.
+
+	  This is not enabled by default, as it brings quite a few
+	  extra dependencies, and thus extra build time.
+
+endif
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 5ea79bed49..be350e88ed 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -168,15 +168,10 @@ HOST_IMAGEMAGICK_CONF_OPTS = \
 	--without-x \
 	--without-bzlib \
 	--without-fftw \
-	--without-fontconfig \
-	--without-freetype \
 	--without-lcms \
 	--without-lzma \
-	--without-pango \
-	--without-rsvg \
 	--without-tiff \
 	--without-webp \
-	--without-xml \
 	--with-jpeg \
 	--with-png \
 	--with-zlib
@@ -187,5 +182,28 @@ HOST_IMAGEMAGICK_DEPENDENCIES = \
 	host-pkgconf \
 	host-zlib
 
+ifeq ($(BR2_PACKAGE_HOST_IMAGEMAGICK_SVG),y)
+HOST_IMAGEMAGICK_DEPENDENCIES += \
+	host-fontconfig \
+	host-freetype \
+	host-librsvg \
+	host-libxml2 \
+	host-pango
+HOST_IMAGEMAGICK_CONF_ENV += ac_cv_path_xml2_config=$(HOST_DIR)/bin/xml2-config
+HOST_IMAGEMAGICK_CONF_OPTS += \
+	--with-fontconfig \
+	--with-freetype \
+	--with-pango \
+	--with-rsvg \
+	--with-xml
+else
+HOST_IMAGEMAGICK_CONF_OPTS += \
+	--without-fontconfig \
+	--without-freetype \
+	--without-pango \
+	--without-rsvg \
+	--without-xml
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
