From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 21:37:56 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: disable build of nvidia
	hardware acceleration support
Message-ID: <20170722193351.D17ED81F81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b6fa452f6ee20f54e47fdc3106620ff258f13b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ffmpeg always enables support for nvenc/cuda even if their support
libraries are not present:

External libraries providing hardware acceleration:
cuda cuvid nvenc
[...]
Enabled hwaccels:
h264_cuvid mjpeg_cuvid mpeg2_cuvid vc1_cuvid vp9_cuvid
hevc_cuvid mpeg1_cuvid mpeg4_cuvid vp8_cuvid

This leads to a crash in freeswitch git master when transcoding video
streams on a system without nvidia hardware:

2017-07-22 15:06:27.306760 [INFO] avcodec.c:1077 initializing encoder 352x288
2017-07-22 15:06:27.306760 [NOTICE] avcodec.c:828 NVENC HW CODEC ENABLED

This patch disables the support of nvidia hardware acceleration support
for now until the needed packages are added to buildroot. For details
about this please refer to https://developer.nvidia.com/ffmpeg

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index d41670d..6dfc62e 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -42,6 +42,9 @@ FFMPEG_CONF_OPTS = \
 	--disable-mipsdspr2 \
 	--disable-msa \
 	--enable-hwaccels \
+	--disable-cuda \
+	--disable-cuvid \
+	--disable-nvenc \
 	--disable-avisynth \
 	--disable-frei0r \
 	--disable-libopencore-amrnb \
