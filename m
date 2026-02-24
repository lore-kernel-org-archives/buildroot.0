Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F33F4BB70
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 18:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 290DC60BD8;
	Tue, 24 Feb 2026 18:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gz6boVPb7HzP; Tue, 24 Feb 2026 18:20:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3FF160DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771957248;
	bh=1sEdS1CnlPN23062sqyE0XvPCYQLNXeu+suke1p7lxM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U/KPZmmS9qkbnGhN4xct9ADLshrk+GuQOg6ZOsf2/GtTyOPz7k3LDqn7CeUeECLM1
	 bx0Lnr4jFO87lR4uh0TKfvaWwU+tc4wNoOgKNmhafmNLfWeQIoX/1A5BeoB7PBVcAB
	 Y5zhtRNMAqOr5x3V+f3ROAAXiJskftDClvlhGe5cb7EN4n4dMjNdwpA0lpym2f95Oz
	 ePyMwx3xIbG5CaT8d7lo/KDeBACwAoptPl8RtCZRYMm8Zn+ftQ/SwiyuzvonXzlu9r
	 re846Ad7pZStsQfJhm8uTqvGEvUAgQEfkDiPsiyhEUdQRNHzC0H2IT1q7moyH/vt/v
	 3BdAA5XDK+Hng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3FF160DF4;
	Tue, 24 Feb 2026 18:20:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A519249
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 18:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F4FE4088E
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 18:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cOfuCEpaGxQ for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 18:20:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EEFFC408BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEFFC408BE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEFFC408BE
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 18:20:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F46BA4C2C5F;
 Tue, 24 Feb 2026 19:20:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46784)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vux16-0000000080N-4BaB;
 Tue, 24 Feb 2026 18:20:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>
Date: Tue, 24 Feb 2026 19:20:16 +0100
Message-ID: <20260224182016.2631828-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224182016.2631828-1-bernd@kuhls.net>
References: <20260224182016.2631828-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771957217;
 bh=HVajle9yPMmv0PVC6RwxN9g8rhuxLnBHbOvrNZ4KccI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SnW1k0v0Qty+23wZ8vEZY637ZTwBBe5RrQMRdHZTySm7r6KIl4By2NXQskNEOE8UB
 ZfNGDx9cjoxg7tt/wN5q1NSKppT5sMtVTwluKfCUFt6b+m7Q8TGEdAXprwwtQe0uFQ
 SlB/TeSXtSmX/2Vlfe8CZJM14eRXtbacaLOt6nAJm3ltHU6llqvNHZ23UvRFHQbMmc
 6YvcFff5+qCLMaoxkI0S3wAGQyAZ34CVt63l6aGFotSmxV/nx7RjOmXVGSEBAz5w21
 Vw24lW+3CKr+roCoIrNZGev6RKaMx+cwCTX2lBPKWLz2PtSHanJrYJYqFK8SLrdkNp
 aARNGCqfqjcQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SnW1k0v0
Subject: [Buildroot] [PATCH 3/3] package/vlc: rebase patch set
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added Upstream: tags when possible.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                              |  3 ---
 ...uilding-of-statically-linked-vlc-binary.patch | 13 +++++++------
 ...build-use-pkg-config-to-get-tremor-libs.patch | 14 ++++++++------
 ...rror-using-uClibc-by-adding-sys-types.h.patch | 12 ++++++------
 ..._filter-opencv_example.cpp-fix-build-wi.patch | 13 ++++++++-----
 .../vlc/0010-opengl-missing-library-check.patch  | 16 ++++++++--------
 6 files changed, 37 insertions(+), 34 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index cf3702acf6..2444d40ac9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -971,11 +971,8 @@ package/vdr/0001-getloadavg.patch lib_patch.Upstream
 package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch lib_patch.Upstream
 package/vlc/0002-automake-add-subdir-objects-option.patch lib_patch.Upstream
 package/vlc/0003-build-use-pkg-config-to-get-tremor-libs.patch lib_patch.Upstream
-package/vlc/0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch lib_patch.Upstream
 package/vlc/0005-Don-t-assume-strerror_l-is-available.patch lib_patch.Upstream
 package/vlc/0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch lib_patch.Upstream
-package/vlc/0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch lib_patch.Upstream
-package/vlc/0010-opengl-missing-library-check.patch lib_patch.Upstream
 package/vpnc/0001-Makefile-allow-to-override-the-PREFIX-variable.patch lib_patch.Upstream
 package/vpnc/0002-Makefile-allow-to-override-the-version.patch lib_patch.Upstream
 package/vpnc/0003-Makefile-allow-passing-custom-CFLAGS-CPPFLAGS.patch lib_patch.Upstream
diff --git a/package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch b/package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch
index 784ffa35f6..e07c5c6097 100644
--- a/package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch
+++ b/package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch
@@ -1,19 +1,20 @@
-From 7c2b3343a30ee53a1cded2ca5e712d8cd7d50f5f Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Tue, 1 May 2018 22:27:21 +0200
 Subject: [PATCH] Disable building of statically linked vlc binary
 
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for 3.0.23]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.am     | 2 +-
  bin/Makefile.am | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 3ac82623ad..637504a3f5 100644
+index 5846e6d701..c72ceddaf2 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -108,7 +108,7 @@ libvlc: libvlccore
+@@ -106,7 +106,7 @@ libvlc: libvlccore
  	cd lib && $(MAKE) $(AM_MAKEFLAGS) libvlc.la
  
  core: libvlc vlc$(EXEEXT)
@@ -23,7 +24,7 @@ index 3ac82623ad..637504a3f5 100644
  doc:
  	cd doc && $(MAKE) $(AM_MAKEFLAGS) doc
 diff --git a/bin/Makefile.am b/bin/Makefile.am
-index 2877e8b0ea..bef4160e8b 100644
+index 4de299d394..2ba28ad806 100644
 --- a/bin/Makefile.am
 +++ b/bin/Makefile.am
 @@ -6,7 +6,7 @@ bin_PROGRAMS = vlc-osx
@@ -36,5 +37,5 @@ index 2877e8b0ea..bef4160e8b 100644
  endif
  EXTRA_DIST = vlc_win32_rc.rc.in
 -- 
-2.14.4
+2.47.3
 
diff --git a/package/vlc/0003-build-use-pkg-config-to-get-tremor-libs.patch b/package/vlc/0003-build-use-pkg-config-to-get-tremor-libs.patch
index 652718b013..2f9275713c 100644
--- a/package/vlc/0003-build-use-pkg-config-to-get-tremor-libs.patch
+++ b/package/vlc/0003-build-use-pkg-config-to-get-tremor-libs.patch
@@ -1,4 +1,4 @@
-From fb257e1e204c30436b3509ea3fa9f7c5fe131dc1 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Tue, 16 Oct 2018 14:25:20 +0200
 Subject: [PATCH] build: use pkg-config to get tremor libs
@@ -7,16 +7,18 @@ Use PKG_ENABLE_MODULES_VLC to enable tremor based on availability of
 ogg and vorbisidec
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Bernd: rebased for 3.0.23]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac              | 9 +--------
  modules/codec/Makefile.am | 2 +-
  2 files changed, 2 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0d3222e00f..b506d735f2 100644
+index 49fc9dbb27..9d5d532133 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2710,14 +2710,7 @@ PKG_ENABLE_MODULES_VLC([VORBIS], [], [ogg vorbis >= 1.1 vorbisenc >= 1.1], [Vorb
+@@ -2862,14 +2862,7 @@ PKG_ENABLE_MODULES_VLC([VORBIS], [], [ogg vorbis >= 1.1 vorbisenc >= 1.1], [Vorb
  dnl
  dnl  Tremor plugin
  dnl
@@ -33,10 +35,10 @@ index 0d3222e00f..b506d735f2 100644
  dnl
  dnl  Speex plugins
 diff --git a/modules/codec/Makefile.am b/modules/codec/Makefile.am
-index 075ee2a0e9..637b1d45a6 100644
+index dd04391c1b..bdbd94880e 100644
 --- a/modules/codec/Makefile.am
 +++ b/modules/codec/Makefile.am
-@@ -318,7 +318,7 @@ codec_LTLIBRARIES += $(LTLIBdaala)
+@@ -324,7 +324,7 @@ codec_LTLIBRARIES += $(LTLIBdaala)
  libtremor_plugin_la_SOURCES = codec/vorbis.c
  libtremor_plugin_la_CPPFLAGS = $(AM_CPPFLAGS) -DMODULE_NAME_IS_tremor
  libtremor_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(codecdir)'
@@ -46,5 +48,5 @@ index 075ee2a0e9..637b1d45a6 100644
  codec_LTLIBRARIES += $(LTLIBtremor)
  
 -- 
-2.17.1
+2.47.3
 
diff --git a/package/vlc/0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch b/package/vlc/0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
index a1d7189689..5c384cb717 100644
--- a/package/vlc/0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
+++ b/package/vlc/0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
@@ -1,4 +1,4 @@
-From bbb15b9cbf9353423619f2c40abdf95d861e66ba Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sat, 2 Apr 2016 16:49:54 +0200
 Subject: [PATCH] Fix build error using uClibc by adding sys/types.h
@@ -19,15 +19,15 @@ https://trac.videolan.org/vlc/ticket/16768
 
 This patch was suggested by courmisch in the trac ticket.
 
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Patch sent upstream:
- https://mailman.videolan.org/pipermail/vlc-devel/2016-April/106952.html]
+Upstream: https://mailman.videolan.org/pipermail/vlc-devel/2016-April/106952.html
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  include/vlc/libvlc_media.h | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/include/vlc/libvlc_media.h b/include/vlc/libvlc_media.h
-index 383f366b69..1cbf00c3e3 100644
+index 01950493e9..9b84aa4835 100644
 --- a/include/vlc/libvlc_media.h
 +++ b/include/vlc/libvlc_media.h
 @@ -26,6 +26,8 @@
@@ -40,5 +40,5 @@ index 383f366b69..1cbf00c3e3 100644
  extern "C" {
  # endif
 -- 
-2.14.4
+2.47.3
 
diff --git a/package/vlc/0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch b/package/vlc/0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
index 952f9fdf51..7cf65d66ee 100644
--- a/package/vlc/0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
+++ b/package/vlc/0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
@@ -1,4 +1,4 @@
-From 57b1e723b73da4c8d42c20d4e28040ec4c0edd85 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 28 Feb 2020 14:29:47 +0100
 Subject: [PATCH] modules/video_filter/opencv_example.cpp: fix build with
@@ -18,17 +18,20 @@ Indeed, CV_RGB is defined as cv::Scalar instead of cvScalar since
 version 3.4.2 and
 https://github.com/opencv/opencv/commit/7f9253ea0a9fe2635926379420002dbf0c3fce0f
 
+Upstream: https://patches.videolan.org/patch/26655
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://patches.videolan.org/patch/26655]
+[Bernd: rebased for 3.0.23]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  modules/video_filter/opencv_example.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/modules/video_filter/opencv_example.cpp b/modules/video_filter/opencv_example.cpp
-index 1334cd4c36..1a8d574f7a 100644
+index a7a0bd7821..23483f0974 100644
 --- a/modules/video_filter/opencv_example.cpp
 +++ b/modules/video_filter/opencv_example.cpp
-@@ -202,7 +202,7 @@ static picture_t *Filter( filter_t *p_filter, picture_t *p_pic )
+@@ -197,7 +197,7 @@ static picture_t *Filter( filter_t *p_filter, picture_t *p_pic )
              pt2.x = (r->x+r->width)*scale;
              pt1.y = r->y*scale;
              pt2.y = (r->y+r->height)*scale;
@@ -38,5 +41,5 @@ index 1334cd4c36..1a8d574f7a 100644
              *(CvRect*)(&(p_sys->event_info.p_region[i])) = *r;
              p_sys->event_info.p_region[i].i_id = p_sys->i_id++;
 -- 
-2.25.0
+2.47.3
 
diff --git a/package/vlc/0010-opengl-missing-library-check.patch b/package/vlc/0010-opengl-missing-library-check.patch
index 3a28fe34e3..fc3a139842 100644
--- a/package/vlc/0010-opengl-missing-library-check.patch
+++ b/package/vlc/0010-opengl-missing-library-check.patch
@@ -1,4 +1,4 @@
-From 4ab41404cb85684125d73977cadebf83bbc246f5 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
 Date: Sat, 22 Jan 2022 11:34:38 +0200
 Subject: [PATCH] opengl: missing library check
@@ -12,19 +12,19 @@ is platform-dependent. It is common for the header to be present while
 the library is absent with "multilib" installations (i.e. Linux
 installation with multiple architectures).
 
-Downloaded from upstream commit:
-https://code.videolan.org/videolan/vlc/-/commit/4ab41404cb85684125d73977cadebf83bbc246f5
+Upstream: https://code.videolan.org/videolan/vlc/-/commit/4ab41404cb85684125d73977cadebf83bbc246f5
 
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for 3.0.23]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac | 9 ++++++---
  1 file changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2f50808d597..0d57fadbf8b 100644
+index 67316b589b..7196a69017 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3169,7 +3169,6 @@ have_gl="no"
+@@ -3138,7 +3138,6 @@ have_gl="no"
  PKG_CHECK_MODULES([GL], [gl], [
    have_gl="yes"
  ], [
@@ -32,7 +32,7 @@ index 2f50808d597..0d57fadbf8b 100644
    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
  #ifdef _WIN32
  # include <GL/glew.h>
-@@ -3179,13 +3178,17 @@ PKG_CHECK_MODULES([GL], [gl], [
+@@ -3148,13 +3147,17 @@ PKG_CHECK_MODULES([GL], [gl], [
      [int t0 = GL_TEXTURE0;]])
    ], [
      GL_CFLAGS=""
@@ -53,5 +53,5 @@ index 2f50808d597..0d57fadbf8b 100644
  ])
  AM_CONDITIONAL([HAVE_GL], [test "${have_gl}" = "yes"])
 -- 
-GitLab
+2.47.3
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
