From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:30:57 +0100
Subject: [Buildroot] [git commit] package/imagemagick: add optional support
	for webp
Message-ID: <20160221203102.CC5E680438@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d12f12846cc1018b17f5cb995facc3282bd5793
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When webp was compiled before, imagemagick will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/stream | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libMagickCore-6.Q16.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libMagickWand-6.Q16.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libjpeg.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [libwebp.so.5]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
