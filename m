From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:45:22 +0100
Subject: [Buildroot] [git commit] package/imagemagick: add optional support
	for lcms2
Message-ID: <20160221135332.AE91C7FDC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fa25a8fb7ee6b612ba8240d02e05a5ef3a9c6e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When lcms2 was compiled before, imagemagick will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/identify | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libMagickCore-6.Q16.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libMagickWand-6.Q16.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [liblcms2.so.2]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index eee567e..8fc9532 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -60,6 +60,13 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+IMAGEMAGICK_CONF_OPTS += --with-lcms
+IMAGEMAGICK_DEPENDENCIES += lcms2
+else
+IMAGEMAGICK_CONF_OPTS += --without-lcms
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 IMAGEMAGICK_CONF_OPTS += --with-png
 IMAGEMAGICK_DEPENDENCIES += libpng
