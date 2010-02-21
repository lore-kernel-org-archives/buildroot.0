From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:47:04 +0100
Subject: [Buildroot] [PATCH 26/38] imagemagick: use internal libtool
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0a8a8bcf04c28a89ce20421acf6501d88437cbab.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
