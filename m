From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 18:57:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: add optional support
	for webp
Message-ID: <1456077450-26675-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When webp was compiled before, imagemagick will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/stream | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libMagickCore-6.Q16.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libMagickWand-6.Q16.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libjpeg.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [libwebp.so.5]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/imagemagick/imagemagick.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 8fc9532..639b0e8 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -105,6 +105,13 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-fftw
 endif
 
+ifeq ($(BR2_PACKAGE_WEBP),y)
+IMAGEMAGICK_CONF_OPTS += --with-webp
+IMAGEMAGICK_DEPENDENCIES += webp
+else
+IMAGEMAGICK_CONF_OPTS += --without-webp
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 IMAGEMAGICK_CONF_OPTS += --with-zlib
 IMAGEMAGICK_DEPENDENCIES += zlib
-- 
2.7.0
