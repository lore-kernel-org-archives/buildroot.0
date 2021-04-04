From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Apr 2021 16:30:44 +0200
Subject: [Buildroot] [PATCH 3/7] package/libvips: add {image,
 graphics}magick optional dependencies
In-Reply-To: <20210404143048.2308010-1-fontaine.fabrice@gmail.com>
References: <20210404143048.2308010-1-fontaine.fabrice@gmail.com>
Message-ID: <20210404143048.2308010-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvips/libvips.mk | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index f35a109502..7e8b705dd2 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -23,7 +23,6 @@ LIBVIPS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(LIBVIPS_CXXFLAGS)" \
 LIBVIPS_CONF_OPTS = \
 	--without-dmalloc \
 	--without-gsf \
-	--without-magick \
 	--without-orc \
 	--without-lcms \
 	--without-OpenEXR \
@@ -52,6 +51,20 @@ else
 LIBVIPS_CONF_OPTS += --disable-introspection
 endif
 
+ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
+LIBVIPS_CONF_OPTS += \
+	--with-magick \
+	--with-magickpackage=MagickCore
+LIBVIPS_DEPENDENCIES += imagemagick
+else ifeq ($(BR2_PACKAGE_GRAPHICSMAGICK),y)
+LIBVIPS_CONF_OPTS += \
+	--with-magick \
+	--with-magickpackage=GraphicsMagick
+LIBVIPS_DEPENDENCIES += graphicsmagick
+else
+LIBVIPS_CONF_OPTS += --without-magick
+endif
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LIBVIPS_CONF_OPTS += --with-jpeg
 LIBVIPS_DEPENDENCIES += jpeg
-- 
2.30.2
