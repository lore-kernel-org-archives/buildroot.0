From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 19 Feb 2019 14:15:30 +0100
Subject: [Buildroot] [PATCH 3/3] package/imagemagick: add optional SVG
 support to host variant
In-Reply-To: <20190219131530.16364-1-yann.morin@orange.com>
References: <20190219131530.16364-1-yann.morin@orange.com>
Message-ID: <10113_1550582141_5C6C017D_10113_121_1_7e3ed6b6-813f-4db4-a9e2-21152669dd30@OPEXCLILMA1.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin@orange.com>

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
feq dependencies, and thus has a noticeable impact on the build time.

Add an option to allow concerned users to enable/disable SVG suppot in
ImageMagick.

Enabling SVG support relies on librsvg, which in turns relies on a few
additional packages that ImageMagick can also optionally use. So,
autoamtically enable the corresponding support as well.

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
---
 package/imagemagick/Config.in.host | 13 +++++++++++++
 package/imagemagick/imagemagick.mk | 28 +++++++++++++++++++++++-----
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
index b6d2a379f8..bcb7e0d703 100644
--- a/package/imagemagick/Config.in.host
+++ b/package/imagemagick/Config.in.host
@@ -11,3 +11,16 @@ config BR2_PACKAGE_HOST_IMAGEMAGICK
 	  B?zier curves.
 
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
index 7678980582..0fbf479523 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -160,15 +160,10 @@ HOST_IMAGEMAGICK_CONF_OPTS = \
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
@@ -179,5 +174,28 @@ HOST_IMAGEMAGICK_DEPENDENCIES = \
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
-- 
2.17.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
