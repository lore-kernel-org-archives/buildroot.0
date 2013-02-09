From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 9 Feb 2013 12:13:59 +0100
Subject: [Buildroot] [git commit] imagemagick: fix CONFIG_SCRIPTS handling
	when C++ isn't available
Message-ID: <20130209111430.AF6B79AA59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47b3a845cfa171a4f76c6c213e027acf4607c1c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/0b35567af8a41a14c9c33f3be5299978c5847e03

Magick++-config only gets installed when C++ support is detected.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/imagemagick/imagemagick.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 722ab40..def7a5d 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -17,7 +17,11 @@ IMAGEMAGICK_LICENSE_FILES = LICENSE
 IMAGEMAGICK_INSTALL_STAGING = YES
 IMAGEMAGICK_AUTORECONF = YES
 IMAGEMAGICK_CONFIG_SCRIPTS = \
-	$(addsuffix -config,Magick MagickCore MagickWand Wand Magick++)
+	$(addsuffix -config,Magick MagickCore MagickWand Wand)
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+IMAGEMAGICK_CONFIG_SCRIPTS += Magick++-config
+endif
 
 ifeq ($(BR2_LARGEFILE),y)
 IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=64
