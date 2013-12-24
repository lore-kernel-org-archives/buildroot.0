From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 24 Dec 2013 20:37:46 +0200
Subject: [Buildroot] [PATCH] ffmpeg: fix build for xtensa
Message-ID: <dbffcc9384caa8009093e59944182ddfaafbdb5c.1387910266.git.baruch@tkos.co.il>
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
 package/ffmpeg/ffmpeg.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 6685110..11703e3 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -21,6 +21,10 @@ FFMPEG_CONF_OPT = \
 	--disable-avfilter	\
 	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-doc)
 
+ifeq ($(BR2_xtensa),y)
+FFMPEG_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mtext-section-literals"
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
 FFMPEG_CONF_OPT += --enable-gpl
 else
-- 
1.8.5.1
