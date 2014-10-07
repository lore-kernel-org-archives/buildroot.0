From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 22:26:57 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: Bump version to 2.4.2
Message-ID: <20141007203313.60AF9B0F26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d7a1d62d88ff7d64f2b63ec34360d1981773cb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

removed ffmpeg-0002-arm4-arm5.patch, applied upstream

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg-0002-arm4-arm5.patch |   85 ----------------------------
 package/ffmpeg/ffmpeg.mk                   |    2 +-
 2 files changed, 1 insertions(+), 86 deletions(-)

diff --git a/package/ffmpeg/ffmpeg-0002-arm4-arm5.patch b/package/ffmpeg/ffmpeg-0002-arm4-arm5.patch
deleted file mode 100644
index 5a0147f..0000000
--- a/package/ffmpeg/ffmpeg-0002-arm4-arm5.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-Fix compile error on arm4/arm5 platform
-
-Patch merged upstream:
-http://git.videolan.org/?p=ffmpeg.git;a=commit;h=6b733be755529f2472472d9ed1b2eef3b6398828
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-From fe0f39e7263cd95783ad4669f8c3672a8eab4c83 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Tue, 23 Sep 2014 20:06:26 +0200
-Subject: [PATCH 1/1] Fix compile error on arm4/arm5 platform
-
-Since these commits
-http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=adf8227cf4e7b4fccb2ad88e1e09b6dc00dd00ed
-http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=db7f1c7c5a1d37e7f4da64a79a97bea1c4b6e9f8
-
-compilation on arm4/arm5 fails:
-
-libavcodec/libavcodec.so: undefined reference to
-`ff_startcode_find_candidate_armv6'
-
-Because libavcodec/arm/Makefile contains
-ARMV6-OBJS-$(CONFIG_STARTCODE)         += arm/startcode_armv6.o
-function ff_startcode_find_candidate_armv6 is not included for older ARM
-archs. The bug was found during automatic buildroot builds:
-
-http://autobuild.buildroot.net/results/ec7/ec71e4f16ee9106747dff5f15999cbd17903e76f//build-end.log
-Quote from configure summary:
-ARCH                      arm (armv4t)
-big-endian                no
-runtime cpu detection     yes
-ARMv5TE enabled           no
-ARMv6 enabled             no
-ARMv6T2 enabled           no
-
-http://autobuild.buildroot.net/results/be7/be72eb182eaccf0064a32c9dfc2ac1c0d6555506/build-end.log
-ARCH                      arm (armv5te)
-big-endian                no
-runtime cpu detection     yes
-ARMv5TE enabled           yes
-ARMv6 enabled             no
-ARMv6T2 enabled           no
-
-This patch provides the necessary #if clauses as discussed with Michael:
-https://ffmpeg.org/pipermail/ffmpeg-devel/2014-September/163329.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libavcodec/arm/h264dsp_init_arm.c |    2 ++
- libavcodec/arm/vc1dsp_init_arm.c  |    2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/libavcodec/arm/h264dsp_init_arm.c b/libavcodec/arm/h264dsp_init_arm.c
-index f7aee1f..88dfd75 100644
---- a/libavcodec/arm/h264dsp_init_arm.c
-+++ b/libavcodec/arm/h264dsp_init_arm.c
-@@ -107,8 +107,10 @@ av_cold void ff_h264dsp_init_arm(H264DSPContext *c, const int bit_depth,
- {
-     int cpu_flags = av_get_cpu_flags();
- 
-+#if HAVE_ARMV6
-     if (have_setend(cpu_flags))
-         c->startcode_find_candidate = ff_startcode_find_candidate_armv6;
-+#endif
-     if (have_neon(cpu_flags))
-         h264dsp_init_neon(c, bit_depth, chroma_format_idc);
- }
-diff --git a/libavcodec/arm/vc1dsp_init_arm.c b/libavcodec/arm/vc1dsp_init_arm.c
-index 9dae22c..5f2c759 100644
---- a/libavcodec/arm/vc1dsp_init_arm.c
-+++ b/libavcodec/arm/vc1dsp_init_arm.c
-@@ -28,8 +28,10 @@ av_cold void ff_vc1dsp_init_arm(VC1DSPContext *dsp)
- {
-     int cpu_flags = av_get_cpu_flags();
- 
-+#if HAVE_ARMV6
-     if (have_setend(cpu_flags))
-         dsp->startcode_find_candidate = ff_startcode_find_candidate_armv6;
-+#endif
-     if (have_neon(cpu_flags))
-         ff_vc1dsp_init_neon(dsp);
- }
--- 
-1.7.10.4
-
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 41b06a7..1af47a6 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.4.1
+FFMPEG_VERSION = 2.4.2
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
