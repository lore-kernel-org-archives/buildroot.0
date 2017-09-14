From: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Thu, 14 Sep 2017 16:01:56 +0100
Subject: [Buildroot] [PATCH 1/3] ffmpeg: Add HWAccel support to Raspberry Pi
Message-ID: <20170914150156.31075-1-mahyar.koshkouei@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a27819be3c..19089ddb07 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -254,6 +254,13 @@ else
 FFMPEG_CONF_OPTS += --disable-vdpau
 endif
 
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE)$(BR2_PACKAGE_RPI_USERLAND),yy)
+FFMPEG_CONF_OPTS += --enable-mmal --enable-omx --enable-omx-rpi --extra-cflags=-I$(STAGING_DIR)/usr/include/IL
+FFMPEG_DEPENDENCIES += rpi-firmware rpi-userland
+else
+FFMPEG_CONF_OPTS += --disable-mmal --disable-omx --disable-omx-rpi
+endif
+
 # To avoid a circular dependency only use opencv if opencv itself does
 # not depend on ffmpeg.
 ifeq ($(BR2_PACKAGE_OPENCV_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV_WITH_FFMPEG),yx)
-- 
2.14.1
