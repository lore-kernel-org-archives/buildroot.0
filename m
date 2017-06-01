From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 Jun 2017 22:39:29 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: add optional support for
	alsa-lib
Message-ID: <20170601203930.1069-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ffmpeg has optional support for alsa as input and/or output device:
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=configure;h=23823e3b7012d847b614bd43316fb614676bedb2;hb=refs/heads/release/3.3#l2987

Problem was found while fixing
http://autobuild.buildroot.net/results/7ba/7ba485532fcab74928246a8f95dba7e5eea9d4a5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index d69923b84..86bf5458c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -157,12 +157,18 @@ endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_INDEVS),y)
 FFMPEG_CONF_OPTS += --enable-indevs
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+FFMPEG_DEPENDENCIES += alsa-lib
+endif
 else
 FFMPEG_CONF_OPTS += --disable-indevs
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_OUTDEVS),y)
 FFMPEG_CONF_OPTS += --enable-outdevs
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+FFMPEG_DEPENDENCIES += alsa-lib
+endif
 else
 FFMPEG_CONF_OPTS += --disable-outdevs
 endif
-- 
2.11.0
