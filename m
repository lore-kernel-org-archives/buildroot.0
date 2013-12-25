From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 25 Dec 2013 11:24:18 +0200
Subject: [Buildroot] [PATCH v2] ffmpeg: fix build for xtensa
Message-ID: <3eaba734f6632e37ccac0e80e8326761c29075ee.1387963458.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ffmpeg package generates libraries that are too large for the xtensa
default placement of literals in a dedicated section. Use
-mtext-section-literal to place literals in the text section.

Fixes
http://autobuild.buildroot.net/results/606/60670d35f16c3b8fe19debf7f8e40a046a579520/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
    Use FFMPEG_CFLAGS as intermediate variable (Thomas Petazzoni)
---
 package/ffmpeg/ffmpeg.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 6685110..f1fc920 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -21,6 +21,14 @@ FFMPEG_CONF_OPT = \
 	--disable-avfilter	\
 	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-doc)
 
+FFMPEG_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_xtensa),y)
+FFMPEG_CFLAGS += -mtext-section-literals
+endif
+
+FFMPEG_CONF_ENV = CFLAGS="$(FFMPEG_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
 FFMPEG_CONF_OPT += --enable-gpl
 else
-- 
1.8.5.1
