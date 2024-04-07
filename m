Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C4ACD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19E3181FE7;
	Sun,  7 Apr 2024 11:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKSj8Dyp-d54; Sun,  7 Apr 2024 11:45:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDA738200C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDA738200C;
	Sun,  7 Apr 2024 11:45:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC6E71BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A981660733
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35e4OatLeec8 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:45:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D668460705
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D668460705
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D668460705
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:45:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54677A4C2DA3;
 Sun,  7 Apr 2024 13:44:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53892)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtQx4-000000005Wv-3rFg;
 Sun, 07 Apr 2024 11:44:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:44:29 +0200
Message-Id: <20240407114445.683504-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712490287;
 bh=LGAYFvL81oZVMkEehEUWhAkASLAWrr2L7UFbyDeUQL0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N+uENJEfnw4PcJ6EgMF5s62aXGhxiIMxxosaaB7h5QuvfMoLJCTp7SqJch4RKADwK
 9sA/8AJoOM3CJ9/VskBjLDrdDr6zNCiHQJjOnfTxRV92+ldZA08sx/D2VdIFjldz7B
 WWb2GzEJkt9gDw7xksgqfUxeLK8k1YTP225Ng6g1nYoE3Mn+SbUII2GnVeB8SZ0QHq
 Xq7qj8+NhR1Sl8ePtb9msX3rwcUnWajf500/g38jehB5svEBaYuOp/UcoAoVf4S3DU
 r7P88gX8qVYpnwyDE+gTQqM7meX9anVcrPpvos+Xv/GDtbFWLBFyFJFUmb+XY+AaqX
 LptxSKV/EAx8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=N+uENJEf
Subject: [Buildroot] [PATCH v2 04/20] package/ffmpeg: bump version to 6.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Changelog:
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=b357f428abce2110904944c4cc066b8e297bb895;hb=3153c441e1d980ff9931ed26a0e01b4e366ac521
"- ffmpeg now requires threading to be built"

Propagate threads to reserve dependencies.
Rebased patches.
Removed patch 0005 which is included in this release.

Removed support for libavresample which was removed upstream.
No legacy handling necessary for opencv3/4 because libavresample was
an optional dependency.

Added upstream patch 0005 to fix build error with arm.

Drop configure options which were removed upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-x86-yuv2rgb-Fix-build-without-SSSE3.patch |  4 +-
 .../0003-libavutil-Fix-mips-build.patch       |  6 +-
 ...igure-add-extralibs-to-extralibs_xxx.patch |  6 +-
 ...xes-assembling-with-binutils-as-2.41.patch | 84 -------------------
 ...0005-avcodec-mmaldec-Fix-build-error.patch | 32 +++++++
 package/ffmpeg/Config.in                      |  9 +-
 package/ffmpeg/ffmpeg.hash                    |  2 +-
 package/ffmpeg/ffmpeg.mk                      | 12 +--
 package/gstreamer1/gst1-libav/Config.in       |  4 +
 package/opencv3/Config.in                     |  1 -
 package/opencv4/Config.in                     |  1 -
 package/qt5/qt5webengine/Config.in            |  2 +-
 12 files changed, 51 insertions(+), 112 deletions(-)
 delete mode 100644 package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch
 create mode 100644 package/ffmpeg/0005-avcodec-mmaldec-Fix-build-error.patch

diff --git a/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch b/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
index 9c1baaa651..aa56e5a9b4 100644
--- a/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
+++ b/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
@@ -22,7 +22,7 @@ diff --git a/libswscale/x86/yuv2rgb.c b/libswscale/x86/yuv2rgb.c
 index c12e88cbb5..4791e5b93a 100644
 --- a/libswscale/x86/yuv2rgb.c
 +++ b/libswscale/x86/yuv2rgb.c
-@@ -71,6 +71,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
+@@ -70,6 +70,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
  #if HAVE_X86ASM
      int cpu_flags = av_get_cpu_flags();
  
@@ -30,7 +30,7 @@ index c12e88cbb5..4791e5b93a 100644
      if (EXTERNAL_SSSE3(cpu_flags)) {
          switch (c->dstFormat) {
          case AV_PIX_FMT_RGB32:
-@@ -99,6 +100,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
+@@ -98,6 +99,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
              return yuv420_rgb15_ssse3;
          }
      }
diff --git a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
index 8dd689f5d0..ee2d1db8bd 100644
--- a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
+++ b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
@@ -20,7 +20,7 @@ diff --git a/configure b/configure
 index 6bfd98b384..773a7d516c 100755
 --- a/configure
 +++ b/configure
-@@ -2135,6 +2135,7 @@ HEADERS_LIST="
+@@ -2191,6 +2191,7 @@ HEADERS_LIST="
      opencv2_core_core_c_h
      OpenGL_gl3_h
      poll_h
@@ -28,9 +28,9 @@ index 6bfd98b384..773a7d516c 100755
      sys_param_h
      sys_resource_h
      sys_select_h
-@@ -6182,6 +6183,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
+@@ -6361,6 +6361,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
+ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepareToEncodeFrames -framework VideoToolbox
  check_headers windows.h
- check_headers X11/extensions/XvMClib.h
  check_headers asm/types.h
 +check_headers sys/auxv.h
  
diff --git a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
index 3247ab08fe..050b34fd89 100644
--- a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
+++ b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
@@ -9,6 +9,8 @@ applications such as motion to retrieve ffmpeg dependencies such as
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status: not upstreamable]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[rebased for 6.0]
 ---
  configure | 18 +++++++++---------
  1 file changed, 9 insertions(+), 9 deletions(-)
@@ -17,7 +19,7 @@ diff --git a/configure b/configure
 index 0bb3a7cf2b..3bda99e415 100755
 --- a/configure
 +++ b/configure
-@@ -7715,15 +7715,15 @@ rpath=$(enabled rpath && echo "-Wl,-rpath,\${libdir}")
+@@ -7986,14 +7986,14 @@
  source_path=${source_path}
  LIBPREF=${LIBPREF}
  LIBSUF=${LIBSUF}
@@ -26,7 +28,6 @@ index 0bb3a7cf2b..3bda99e415 100755
 -extralibs_avformat="$avformat_extralibs"
 -extralibs_avdevice="$avdevice_extralibs"
 -extralibs_avfilter="$avfilter_extralibs"
--extralibs_avresample="$avresample_extralibs"
 -extralibs_postproc="$postproc_extralibs"
 -extralibs_swscale="$swscale_extralibs"
 -extralibs_swresample="$swresample_extralibs"
@@ -35,7 +36,6 @@ index 0bb3a7cf2b..3bda99e415 100755
 +extralibs_avformat="$avformat_extralibs $extralibs"
 +extralibs_avdevice="$avdevice_extralibs $extralibs"
 +extralibs_avfilter="$avfilter_extralibs $extralibs"
-+extralibs_avresample="$avresample_extralibs $extralibs"
 +extralibs_postproc="$postproc_extralibs $extralibs"
 +extralibs_swscale="$swscale_extralibs $extralibs"
 +extralibs_swresample="$swresample_extralibs $extralibs"
diff --git a/package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch b/package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch
deleted file mode 100644
index 6c81971cbe..0000000000
--- a/package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From effadce6c756247ea8bae32dc13bb3e6f464f0eb Mon Sep 17 00:00:00 2001
-From: =?utf8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
-Date: Sun, 16 Jul 2023 18:18:02 +0300
-Subject: [PATCH] avcodec/x86/mathops: clip constants used with shift
- instructions within inline assembly
-
-Fixes assembling with binutils as >= 2.41
-
-Upstream: http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=effadce6c756247ea8bae32dc13bb3e6f464f0eb
-
-Bug reports for this change in binutils:
-https://fftrac-bg.ffmpeg.org/ticket/10405
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108941
-https://sourceware.org/bugzilla/show_bug.cgi?id=30578
-
-Signed-off-by: James Almer <jamrial@gmail.com>
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- libavcodec/x86/mathops.h | 26 +++++++++++++++++++++++---
- 1 file changed, 23 insertions(+), 3 deletions(-)
-
-diff --git a/libavcodec/x86/mathops.h b/libavcodec/x86/mathops.h
-index 6298f5ed19..ca7e2dffc1 100644
---- a/libavcodec/x86/mathops.h
-+++ b/libavcodec/x86/mathops.h
-@@ -35,12 +35,20 @@
- static av_always_inline av_const int MULL(int a, int b, unsigned shift)
- {
-     int rt, dummy;
-+    if (__builtin_constant_p(shift))
-     __asm__ (
-         "imull %3               \n\t"
-         "shrdl %4, %%edx, %%eax \n\t"
-         :"=a"(rt), "=d"(dummy)
--        :"a"(a), "rm"(b), "ci"((uint8_t)shift)
-+        :"a"(a), "rm"(b), "i"(shift & 0x1F)
-     );
-+    else
-+        __asm__ (
-+            "imull %3               \n\t"
-+            "shrdl %4, %%edx, %%eax \n\t"
-+            :"=a"(rt), "=d"(dummy)
-+            :"a"(a), "rm"(b), "c"((uint8_t)shift)
-+        );
-     return rt;
- }
- 
-@@ -113,19 +121,31 @@ __asm__ volatile(\
- // avoid +32 for shift optimization (gcc should do that ...)
- #define NEG_SSR32 NEG_SSR32
- static inline  int32_t NEG_SSR32( int32_t a, int8_t s){
-+    if (__builtin_constant_p(s))
-     __asm__ ("sarl %1, %0\n\t"
-          : "+r" (a)
--         : "ic" ((uint8_t)(-s))
-+         : "i" (-s & 0x1F)
-     );
-+    else
-+        __asm__ ("sarl %1, %0\n\t"
-+               : "+r" (a)
-+               : "c" ((uint8_t)(-s))
-+        );
-     return a;
- }
- 
- #define NEG_USR32 NEG_USR32
- static inline uint32_t NEG_USR32(uint32_t a, int8_t s){
-+    if (__builtin_constant_p(s))
-     __asm__ ("shrl %1, %0\n\t"
-          : "+r" (a)
--         : "ic" ((uint8_t)(-s))
-+         : "i" (-s & 0x1F)
-     );
-+    else
-+        __asm__ ("shrl %1, %0\n\t"
-+               : "+r" (a)
-+               : "c" ((uint8_t)(-s))
-+        );
-     return a;
- }
- 
--- 
-2.30.2
-
diff --git a/package/ffmpeg/0005-avcodec-mmaldec-Fix-build-error.patch b/package/ffmpeg/0005-avcodec-mmaldec-Fix-build-error.patch
new file mode 100644
index 0000000000..b3b901264f
--- /dev/null
+++ b/package/ffmpeg/0005-avcodec-mmaldec-Fix-build-error.patch
@@ -0,0 +1,32 @@
+From e8a49b1424d405441fb23c2850274a84e95bd892 Mon Sep 17 00:00:00 2001
+From: Zhao Zhili <zhilizhao@tencent.com>
+Date: Tue, 21 Nov 2023 04:05:08 +0800
+Subject: [PATCH] avcodec/mmaldec: Fix build error
+
+Fix #10670.
+
+Signed-off-by: Zhao Zhili <zhilizhao@tencent.com>
+
+Upstream: http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=e8a49b1424d405441fb23c2850274a84e95bd892
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libavcodec/mmaldec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/mmaldec.c b/libavcodec/mmaldec.c
+index 4bb3eb22ef..2dc7bbee04 100644
+--- a/libavcodec/mmaldec.c
++++ b/libavcodec/mmaldec.c
+@@ -843,7 +843,7 @@ static const AVClass ffmmal_dec_class = {
+         .flush          = ffmmal_flush, \
+         .p.priv_class   = &ffmmal_dec_class, \
+         .p.capabilities = AV_CODEC_CAP_DELAY | AV_CODEC_CAP_HARDWARE, \
+-        .caps_internal  = FF_CODEC_CAP_NOT_INIT_THREADSAFE \
++        .caps_internal  = FF_CODEC_CAP_NOT_INIT_THREADSAFE, \
+         .p.pix_fmts     = (const enum AVPixelFormat[]) { AV_PIX_FMT_MMAL, \
+                                                          AV_PIX_FMT_YUV420P, \
+                                                          AV_PIX_FMT_NONE}, \
+-- 
+2.30.2
+
diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 52029c2ade..599e1ddfc7 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  FFmpeg is a complete, cross-platform solution to record,
 	  convert and stream audio and video.
@@ -74,11 +75,6 @@ config BR2_PACKAGE_FFMPEG_XCBGRAB
 	help
 	  X11 screen grabbing using libxcb.
 
-config BR2_PACKAGE_FFMPEG_AVRESAMPLE
-	bool "Build libavresample"
-	help
-	  Avresample is a audio conversion library for compatibility.
-
 config BR2_PACKAGE_FFMPEG_POSTPROC
 	bool "Build libpostproc"
 	depends on BR2_PACKAGE_FFMPEG_GPL
@@ -186,3 +182,6 @@ config BR2_PACKAGE_FFMPEG_EXTRACONF
 	  ./configure commandline.
 
 endif
+
+comment "ffmpeg needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index b18218cb48..f70ff5da83 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e80b380d595c809060f66f96a5d849511ef4a76a26b76eacf5778b94c3570309  ffmpeg-4.4.4.tar.xz
+sha256  8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968  ffmpeg-6.1.1.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index ce285bcc60..acd5a7d8b2 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 4.4.4
+FFMPEG_VERSION = 6.1.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = https://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -32,10 +32,6 @@ FFMPEG_CONF_OPTS = \
 	--disable-gray \
 	--enable-swscale-alpha \
 	--disable-small \
-	--enable-dct \
-	--enable-fft \
-	--enable-mdct \
-	--enable-rdft \
 	--disable-crystalhd \
 	--disable-dxva2 \
 	--enable-runtime-cpudetect \
@@ -93,12 +89,6 @@ else
 FFMPEG_CONF_OPTS += --disable-libv4l2
 endif
 
-ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE),y)
-FFMPEG_CONF_OPTS += --enable-avresample
-else
-FFMPEG_CONF_OPTS += --disable-avresample
-endif
-
 ifeq ($(BR2_PACKAGE_FFMPEG_FFPROBE),y)
 FFMPEG_CONF_OPTS += --enable-ffprobe
 else
diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
index e58a3532f0..51bac04d5e 100644
--- a/package/gstreamer1/gst1-libav/Config.in
+++ b/package/gstreamer1/gst1-libav/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GST1_LIBAV
 	bool "gst1-libav"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # ffmpeg
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
@@ -14,3 +15,6 @@ config BR2_PACKAGE_GST1_LIBAV
 	  selected in the ffmpeg package.
 
 	  https://gstreamer.freedesktop.org/
+
+comment "gst1-libav needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index be0680084b..2ce548f095 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -246,7 +246,6 @@ config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	help
 	  Use ffmpeg from the target system.
diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index f1a2d02d50..f6976d8fb5 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -275,7 +275,6 @@ config BR2_PACKAGE_OPENCV4_WITH_FFMPEG
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	help
 	  Use ffmpeg from the target system.
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 99a2980a25..67c843e5f6 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -29,7 +29,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5base-icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # re2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # ffmpeg, libglib2, libvpx, qt5base-dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
 	depends on BR2_PACKAGE_HAS_LIBEGL # qt5base-eglfs
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
