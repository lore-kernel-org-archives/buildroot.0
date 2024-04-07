Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B35CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 09:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFDA082113;
	Sun,  7 Apr 2024 09:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqxop9uQk-xu; Sun,  7 Apr 2024 09:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81AD382118
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81AD382118;
	Sun,  7 Apr 2024 09:25:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 505DE1BF296
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C73A6085E
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsusYFS-cNlX for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 09:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D7226085D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D7226085D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D7226085D
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 09:25:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7F20013F879;
 Sun,  7 Apr 2024 11:25:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 11:25:06 +0200
Date: Sun, 7 Apr 2024 11:25:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZhJmcptsEo41MP6G@landeda>
References: <20240406073216.1054073-1-bernd@kuhls.net>
 <20240406073216.1054073-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240406073216.1054073-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712481912;
 bh=rNlvycxhS9PXum4qTjkvPVVVhm5wWrg8ij3Zservdxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TmxHgtO/VLPPV9MfvGgxIuQEPJbJEc4M8K8u93bGYXvU9DD/rnlJwDisw1hHggCf+
 vEeDH95bDw5+cfzTC2X5IZecjyPs4TYr2PnQAYQUoihV/OqVCuPDDOGLtwsIPK5HMK
 tzjyhes5uW7dIpwzFHRaUiL47HP9p6k8Ta1ywkSwvrsXGK5oBFS/7sRbFWG/oe28+i
 GBh8iShZMTmk9llnqWryfN8MjVu/Ya2Bba7BSjeE33yRVkzkrjYG+w6fuS/qg5YMDl
 XE5Aj1eCMUKC1aWZsES8MprVQKBmHrbGYvv0bjxLGwmeROK/uBq2GkwtzJRxO4/x2y
 63rnTYlqRuNbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TmxHgtO/
Subject: Re: [Buildroot] [PATCH 02/18] package/ffmpeg: bump version to 6.1.1
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
Cc: Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2024-04-06 09:32 +0200, Bernd Kuhls spake thusly:
> Quoting Changelog:
> http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=b357f428abce2110904944c4cc066b8e297bb895;hb=3153c441e1d980ff9931ed26a0e01b4e366ac521
> "- ffmpeg now requires threading to be built"

This dependency on threads is not new with 6.1.1, but was already new
with 6.0. However, we only have 4.4.4 in Buildroot, so this is indeed
does not need to be separate from the bump to 6.1.1.

> Propagate threads to reserve dependencies.
> Rebased patches.
> Removed patch 0005 which is included in this release.
> Removed support for libavresample which was removed upstream.

We have a few other packages that do select libavresample;

    $ ./utils/docker-run make check-package
    package/aubio/aubio.mk:62: BR2_PACKAGE_FFMPEG_AVRESAMPLE referenced but not defined
    package/omxplayer/Config.in:15: BR2_PACKAGE_FFMPEG_AVRESAMPLE referenced but not defined
    package/opencv3/Config.in:249: BR2_PACKAGE_FFMPEG_AVRESAMPLE referenced but not defined
    package/opencv4/Config.in:278: BR2_PACKAGE_FFMPEG_AVRESAMPLE referenced but not defined

So what happens for those?

For aubio, it was only an optional dependency, so that loses an optional
feature. While not ideal, this is not breaking the package, but we have
no way to tell the user when they update that aubio no longer uses
ffmpeg. Unless there is an aubio version bump that supports newer
ffmpeg?

For opencv3 and opencv4, this is also optional, and there are Kconfig
options we'd move to legacy, that will tell the user opencv3/4 no longer
uses ffmpeg. And then we can simplify the ffmpeg.mk itself about its own
dependency on opencv3.

Which leaves us with omxplayer, for which libavresample is a mandatory
dependency. Is there an upstream changin in omxplayer that makes
libavresample optional? If not, then we'd have to drop omxplayer before
we bump ffmpeg...

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...-x86-yuv2rgb-Fix-build-without-SSSE3.patch |  4 +-
>  .../0003-libavutil-Fix-mips-build.patch       |  6 +-
>  ...igure-add-extralibs-to-extralibs_xxx.patch |  6 +-
>  ...xes-assembling-with-binutils-as-2.41.patch | 84 -------------------
>  package/ffmpeg/Config.in                      |  9 +-
>  package/ffmpeg/ffmpeg.hash                    |  2 +-
>  package/ffmpeg/ffmpeg.mk                      | 12 +--
>  package/gstreamer1/gst1-libav/Config.in       |  4 +
>  package/omxplayer/Config.in                   |  2 +-
>  package/qt5/qt5webengine/Config.in            |  2 +-
>  10 files changed, 20 insertions(+), 111 deletions(-)
>  delete mode 100644 package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch
> 
> diff --git a/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch b/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
> index 9c1baaa651..aa56e5a9b4 100644
> --- a/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
> +++ b/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
> @@ -22,7 +22,7 @@ diff --git a/libswscale/x86/yuv2rgb.c b/libswscale/x86/yuv2rgb.c
>  index c12e88cbb5..4791e5b93a 100644
>  --- a/libswscale/x86/yuv2rgb.c
>  +++ b/libswscale/x86/yuv2rgb.c
> -@@ -71,6 +71,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
> +@@ -70,6 +70,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
>   #if HAVE_X86ASM
>       int cpu_flags = av_get_cpu_flags();
>   
> @@ -30,7 +30,7 @@ index c12e88cbb5..4791e5b93a 100644
>       if (EXTERNAL_SSSE3(cpu_flags)) {
>           switch (c->dstFormat) {
>           case AV_PIX_FMT_RGB32:
> -@@ -99,6 +100,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
> +@@ -98,6 +99,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
>               return yuv420_rgb15_ssse3;
>           }
>       }
> diff --git a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
> index 8dd689f5d0..ee2d1db8bd 100644
> --- a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
> +++ b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
> @@ -20,7 +20,7 @@ diff --git a/configure b/configure
>  index 6bfd98b384..773a7d516c 100755
>  --- a/configure
>  +++ b/configure
> -@@ -2135,6 +2135,7 @@ HEADERS_LIST="
> +@@ -2191,6 +2191,7 @@ HEADERS_LIST="
>       opencv2_core_core_c_h
>       OpenGL_gl3_h
>       poll_h
> @@ -28,9 +28,9 @@ index 6bfd98b384..773a7d516c 100755
>       sys_param_h
>       sys_resource_h
>       sys_select_h
> -@@ -6182,6 +6183,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
> +@@ -6361,6 +6361,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
> + check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepareToEncodeFrames -framework VideoToolbox
>   check_headers windows.h
> - check_headers X11/extensions/XvMClib.h
>   check_headers asm/types.h
>  +check_headers sys/auxv.h
>   
> diff --git a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
> index 3247ab08fe..050b34fd89 100644
> --- a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
> +++ b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
> @@ -9,6 +9,8 @@ applications such as motion to retrieve ffmpeg dependencies such as
>  
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  [Upstream status: not upstreamable]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +[rebased for 6.0]
>  ---
>   configure | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> @@ -17,7 +19,7 @@ diff --git a/configure b/configure
>  index 0bb3a7cf2b..3bda99e415 100755
>  --- a/configure
>  +++ b/configure
> -@@ -7715,15 +7715,15 @@ rpath=$(enabled rpath && echo "-Wl,-rpath,\${libdir}")
> +@@ -7986,14 +7986,14 @@
>   source_path=${source_path}
>   LIBPREF=${LIBPREF}
>   LIBSUF=${LIBSUF}
> @@ -26,7 +28,6 @@ index 0bb3a7cf2b..3bda99e415 100755
>  -extralibs_avformat="$avformat_extralibs"
>  -extralibs_avdevice="$avdevice_extralibs"
>  -extralibs_avfilter="$avfilter_extralibs"
> --extralibs_avresample="$avresample_extralibs"
>  -extralibs_postproc="$postproc_extralibs"
>  -extralibs_swscale="$swscale_extralibs"
>  -extralibs_swresample="$swresample_extralibs"
> @@ -35,7 +36,6 @@ index 0bb3a7cf2b..3bda99e415 100755
>  +extralibs_avformat="$avformat_extralibs $extralibs"
>  +extralibs_avdevice="$avdevice_extralibs $extralibs"
>  +extralibs_avfilter="$avfilter_extralibs $extralibs"
> -+extralibs_avresample="$avresample_extralibs $extralibs"
>  +extralibs_postproc="$postproc_extralibs $extralibs"
>  +extralibs_swscale="$swscale_extralibs $extralibs"
>  +extralibs_swresample="$swresample_extralibs $extralibs"
> diff --git a/package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch b/package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch
> deleted file mode 100644
> index 6c81971cbe..0000000000
> --- a/package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -From effadce6c756247ea8bae32dc13bb3e6f464f0eb Mon Sep 17 00:00:00 2001
> -From: =?utf8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
> -Date: Sun, 16 Jul 2023 18:18:02 +0300
> -Subject: [PATCH] avcodec/x86/mathops: clip constants used with shift
> - instructions within inline assembly
> -
> -Fixes assembling with binutils as >= 2.41
> -
> -Upstream: http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=effadce6c756247ea8bae32dc13bb3e6f464f0eb
> -
> -Bug reports for this change in binutils:
> -https://fftrac-bg.ffmpeg.org/ticket/10405
> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108941
> -https://sourceware.org/bugzilla/show_bug.cgi?id=30578
> -
> -Signed-off-by: James Almer <jamrial@gmail.com>
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - libavcodec/x86/mathops.h | 26 +++++++++++++++++++++++---
> - 1 file changed, 23 insertions(+), 3 deletions(-)
> -
> -diff --git a/libavcodec/x86/mathops.h b/libavcodec/x86/mathops.h
> -index 6298f5ed19..ca7e2dffc1 100644
> ---- a/libavcodec/x86/mathops.h
> -+++ b/libavcodec/x86/mathops.h
> -@@ -35,12 +35,20 @@
> - static av_always_inline av_const int MULL(int a, int b, unsigned shift)
> - {
> -     int rt, dummy;
> -+    if (__builtin_constant_p(shift))
> -     __asm__ (
> -         "imull %3               \n\t"
> -         "shrdl %4, %%edx, %%eax \n\t"
> -         :"=a"(rt), "=d"(dummy)
> --        :"a"(a), "rm"(b), "ci"((uint8_t)shift)
> -+        :"a"(a), "rm"(b), "i"(shift & 0x1F)
> -     );
> -+    else
> -+        __asm__ (
> -+            "imull %3               \n\t"
> -+            "shrdl %4, %%edx, %%eax \n\t"
> -+            :"=a"(rt), "=d"(dummy)
> -+            :"a"(a), "rm"(b), "c"((uint8_t)shift)
> -+        );
> -     return rt;
> - }
> - 
> -@@ -113,19 +121,31 @@ __asm__ volatile(\
> - // avoid +32 for shift optimization (gcc should do that ...)
> - #define NEG_SSR32 NEG_SSR32
> - static inline  int32_t NEG_SSR32( int32_t a, int8_t s){
> -+    if (__builtin_constant_p(s))
> -     __asm__ ("sarl %1, %0\n\t"
> -          : "+r" (a)
> --         : "ic" ((uint8_t)(-s))
> -+         : "i" (-s & 0x1F)
> -     );
> -+    else
> -+        __asm__ ("sarl %1, %0\n\t"
> -+               : "+r" (a)
> -+               : "c" ((uint8_t)(-s))
> -+        );
> -     return a;
> - }
> - 
> - #define NEG_USR32 NEG_USR32
> - static inline uint32_t NEG_USR32(uint32_t a, int8_t s){
> -+    if (__builtin_constant_p(s))
> -     __asm__ ("shrl %1, %0\n\t"
> -          : "+r" (a)
> --         : "ic" ((uint8_t)(-s))
> -+         : "i" (-s & 0x1F)
> -     );
> -+    else
> -+        __asm__ ("shrl %1, %0\n\t"
> -+               : "+r" (a)
> -+               : "c" ((uint8_t)(-s))
> -+        );
> -     return a;
> - }
> - 
> --- 
> -2.30.2
> -
> diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
> index 52029c2ade..599e1ddfc7 100644
> --- a/package/ffmpeg/Config.in
> +++ b/package/ffmpeg/Config.in
> @@ -18,6 +18,7 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
>  menuconfig BR2_PACKAGE_FFMPEG
>  	bool "ffmpeg"
>  	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  FFmpeg is a complete, cross-platform solution to record,
>  	  convert and stream audio and video.
> @@ -74,11 +75,6 @@ config BR2_PACKAGE_FFMPEG_XCBGRAB
>  	help
>  	  X11 screen grabbing using libxcb.
>  
> -config BR2_PACKAGE_FFMPEG_AVRESAMPLE
> -	bool "Build libavresample"
> -	help
> -	  Avresample is a audio conversion library for compatibility.
> -
>  config BR2_PACKAGE_FFMPEG_POSTPROC
>  	bool "Build libpostproc"
>  	depends on BR2_PACKAGE_FFMPEG_GPL
> @@ -186,3 +182,6 @@ config BR2_PACKAGE_FFMPEG_EXTRACONF
>  	  ./configure commandline.
>  
>  endif
> +
> +comment "ffmpeg needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
> index b18218cb48..f70ff5da83 100644
> --- a/package/ffmpeg/ffmpeg.hash
> +++ b/package/ffmpeg/ffmpeg.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  e80b380d595c809060f66f96a5d849511ef4a76a26b76eacf5778b94c3570309  ffmpeg-4.4.4.tar.xz
> +sha256  8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968  ffmpeg-6.1.1.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
>  sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
>  sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index ce285bcc60..acd5a7d8b2 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FFMPEG_VERSION = 4.4.4
> +FFMPEG_VERSION = 6.1.1
>  FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
>  FFMPEG_SITE = https://ffmpeg.org/releases
>  FFMPEG_INSTALL_STAGING = YES
> @@ -32,10 +32,6 @@ FFMPEG_CONF_OPTS = \
>  	--disable-gray \
>  	--enable-swscale-alpha \
>  	--disable-small \
> -	--enable-dct \
> -	--enable-fft \
> -	--enable-mdct \
> -	--enable-rdft \
>  	--disable-crystalhd \
>  	--disable-dxva2 \
>  	--enable-runtime-cpudetect \
> @@ -93,12 +89,6 @@ else
>  FFMPEG_CONF_OPTS += --disable-libv4l2
>  endif
>  
> -ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE),y)
> -FFMPEG_CONF_OPTS += --enable-avresample
> -else
> -FFMPEG_CONF_OPTS += --disable-avresample
> -endif
> -
>  ifeq ($(BR2_PACKAGE_FFMPEG_FFPROBE),y)
>  FFMPEG_CONF_OPTS += --enable-ffprobe
>  else
> diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
> index e58a3532f0..51bac04d5e 100644
> --- a/package/gstreamer1/gst1-libav/Config.in
> +++ b/package/gstreamer1/gst1-libav/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_GST1_LIBAV
>  	bool "gst1-libav"
>  	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # ffmpeg
>  	select BR2_PACKAGE_FFMPEG
>  	select BR2_PACKAGE_FFMPEG_SWSCALE
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE
> @@ -14,3 +15,6 @@ config BR2_PACKAGE_GST1_LIBAV
>  	  selected in the ffmpeg package.
>  
>  	  https://gstreamer.freedesktop.org/
> +
> +comment "gst1-libav needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/omxplayer/Config.in b/package/omxplayer/Config.in
> index d2e4b5ace0..7facd28e4a 100644
> --- a/package/omxplayer/Config.in
> +++ b/package/omxplayer/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_OMXPLAYER
>  	depends on BR2_USE_MMU # dbus
>  	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # ffmpeg
>  	depends on BR2_INSTALL_LIBSTDCPP # boost
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, boost, libusb
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, boost, ffmpeg, libusb
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
>  	depends on BR2_USE_WCHAR # boost
>  	depends on BR2_PACKAGE_RPI_USERLAND
> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index 99a2980a25..67c843e5f6 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -29,7 +29,7 @@ config BR2_PACKAGE_QT5WEBENGINE
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
>  	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5base-icu
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # re2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # ffmpeg, libglib2, libvpx, qt5base-dbus
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
>  	depends on BR2_PACKAGE_HAS_LIBEGL # qt5base-eglfs
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
