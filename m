From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:29:20 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: Add optional dependencies
Message-ID: <20151017142929.08BB981D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=632df1de3095943bb57b52b6582341c6482571f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable libcdio and libilbc since they are incompatible with ffmpeg.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f361970..f28eed8 100644
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
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # openssl isn't license compatible with GPL
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)
@@ -203,6 +212,20 @@ else
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
