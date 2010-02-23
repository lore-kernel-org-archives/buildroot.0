From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:27:28 +0100
Subject: [Buildroot] [git commit master] imagemagick: use internal libtool
Message-ID: <20100223202932.1215B776A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b7ea597dd2f3553f2bc44e441011e68f999c7768
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some reason, our imagemagick.mk file calls libtool, but assumes
that libtool is available on the host, which may not be
true. Therefore, we use ImageMagick's internal libtool, which has been
used for compiling/linking all the rest of ImageMagic anyway.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index e858430..00895f5 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -83,8 +83,8 @@ $(IMAGEMAGICK_LIB): $(STAGING_DIR)/usr/lib/libMagickCore.a
 	touch -c $@
 
 $(IMAGEMAGICK_DIR)/.libinstall: $(IMAGEMAGICK_LIB)
-	libtool --finish $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR)/modules-Q16/coders
-	libtool --finish $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR)/modules-Q16/filters
+	$(IMAGEMAGICK_DIR)/libtool --finish $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR)/modules-Q16/coders
+	$(IMAGEMAGICK_DIR)/libtool --finish $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR)/modules-Q16/filters
 	touch $@
 
 $(TARGET_DIR)/usr/bin/animate: $(IMAGEMAGICK_LIB)
-- 
1.6.3.3
