From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 14:50:14 +0200
Subject: [Buildroot] [git commit] ffmpeg: Add support for hardware
	accelaration on RPi
Message-ID: <20170924124820.6008B8004A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e66936e4f3c9569b7f90dec0f871d777baf597cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
[Arnout: wrap the long line]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ffmpeg/ffmpeg.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a27819b..801615c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -254,6 +254,14 @@ else
 FFMPEG_CONF_OPTS += --disable-vdpau
 endif
 
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE)$(BR2_PACKAGE_RPI_USERLAND),yy)
+FFMPEG_CONF_OPTS += --enable-mmal --enable-omx --enable-omx-rpi \
+	--extra-cflags=-I$(STAGING_DIR)/usr/include/IL
+FFMPEG_DEPENDENCIES += rpi-firmware rpi-userland
+else
+FFMPEG_CONF_OPTS += --disable-mmal --disable-omx --disable-omx-rpi
+endif
+
 # To avoid a circular dependency only use opencv if opencv itself does
 # not depend on ffmpeg.
 ifeq ($(BR2_PACKAGE_OPENCV_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV_WITH_FFMPEG),yx)
