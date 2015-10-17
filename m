From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Oct 2015 14:31:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Add optional dependencies
Message-ID: <1445085118-8020-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable libcdio and libilbc since they are incompatible with ffmpeg.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index febca90..42ccd2e 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -50,9 +50,11 @@ FFMPEG_CONF_OPTS = \
 	--disable-libopencore-amrnb \
 	--disable-libopencore-amrwb \
 	--disable-libopencv \
+	--disable-libcdio \
 	--disable-libdc1394 \
 	--disable-libfaac \
 	--disable-libgsm \
+	--disable-libilbc \
 	--disable-libnut \
 	--disable-libopenjpeg \
 	--disable-libschroedinger \
@@ -191,6 +193,13 @@ else
 FFMPEG_CONF_OPTS += --disable-bzlib
 endif
 
+ifeq ($(BR2_PACKAGE_FDK_AAC)$(BR2_PACKAGE_FFMPEG_NONFREE),yy)
+FFMPEG_CONF_OPTS += --enable-libfdk-aac
+FFMPEG_DEPENDENCIES += fdk-aac
+else
+FFMPEG_CONF_OPTS += --disable-libfdk-aac
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG_GNUTLS),y)
 FFMPEG_CONF_OPTS += --enable-gnutls
 FFMPEG_DEPENDENCIES += gnutls
@@ -205,6 +214,20 @@ else
 FFMPEG_CONF_OPTS += --disable-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDCADEC),y)
+FFMPEG_CONF_OPTS += --enable-libdcadec
+FFMPEG_DEPENDENCIES += libdcadec
+else
+FFMPEG_CONF_OPTS += --disable-libdcadec
+endif
+
+ifeq ($(BR2_PACKAGE_LIBOPENH264),y)
+FFMPEG_CONF_OPTS += --enable-libopenh264
+FFMPEG_DEPENDENCIES += libopenh264
+else
+FFMPEG_CONF_OPTS += --disable-libopenh264
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
 FFMPEG_DEPENDENCIES += libvorbis
 FFMPEG_CONF_OPTS += \
-- 
2.6.1
