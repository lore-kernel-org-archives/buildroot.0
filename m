From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:57:12 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: add optional dependency to
 libxcb
Message-ID: <20200411084346.8778D8E4EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10954dfe68fc323d9e612275096028ad9fb0e25e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ffmpeg 3.3 added optional support for libxcb:
https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/HEAD:/Changelog#l282

This patch ensures a reproducible build of libavdevice.so:

$ readelf -a output/target/usr/lib/libavdevice.so | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libavfilter.so.7]
 0x0000000000000001 (NEEDED)             Shared library: [libavformat.so.58]
 0x0000000000000001 (NEEDED)             Shared library: [libavcodec.so.58]
 0x0000000000000001 (NEEDED)             Shared library: [libavutil.so.56]
 0x0000000000000001 (NEEDED)             Shared library: [libxcb.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libxcb-shm.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libxcb-shape.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libxcb-xfixes.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.0]

compared to

$ readelf -a output/target/usr/lib/libavdevice.so | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libavfilter.so.7]
 0x0000000000000001 (NEEDED)             Shared library: [libavformat.so.58]
 0x0000000000000001 (NEEDED)             Shared library: [libavcodec.so.58]
 0x0000000000000001 (NEEDED)             Shared library: [libavutil.so.56]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ffmpeg/Config.in |  7 +++++++
 package/ffmpeg/ffmpeg.mk | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 33baff262e..2efef7dd86 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -67,6 +67,13 @@ config BR2_PACKAGE_FFMPEG_FFPROBE
 	  FFprobe is a utility to determine the audio and video
 	  characteristics of a container file.
 
+config BR2_PACKAGE_FFMPEG_XCBGRAB
+	bool "Build X11 screen grabbing"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB
+	help
+	  X11 screen grabbing using libxcb.
+
 config BR2_PACKAGE_FFMPEG_AVRESAMPLE
 	bool "Build libavresample"
 	help
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index b7148bbba2..96455cb978 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -96,6 +96,17 @@ else
 FFMPEG_CONF_OPTS += --disable-ffprobe
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG_XCBGRAB),y)
+FFMPEG_CONF_OPTS += \
+	--enable-libxcb \
+	--enable-libxcb-shape \
+	--enable-libxcb-shm \
+	--enable-libxcb-xfixes
+FFMPEG_DEPENDENCIES += libxcb
+else
+FFMPEG_CONF_OPTS += --disable-libxcb
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG_POSTPROC),y)
 FFMPEG_CONF_OPTS += --enable-postproc
 else
