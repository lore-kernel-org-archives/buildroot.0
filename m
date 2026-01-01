Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62750EED630
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 19:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38FAD809A1;
	Thu,  1 Jan 2026 19:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPaXKqXyBhp1; Thu,  1 Jan 2026 19:06:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C20AF80A5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767294367;
	bh=IrqNEmeTe1xCU6N5+DKNSprZenfK0Fl1Y4WXstc2wLA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PaFS2S/Aqchhif765mBQG19tSOT9lKaBbIIbNk+RktILfj7yl9eUUTgHD6ExRlD4W
	 x1EskGZpzKphtoYfMA4hI6W7S8+7Yk/iAP1drrGWdinBbFEjjhtUlZvD4SsSRSxDq5
	 +G8fZtgGnZ67FETmtA2S5SdlJy5J9kmiX+fDS2ouXnEw+AXtHfybAbHERlOoSZCMHa
	 oLc4QkbBZ4tgNCfvZhVcMXqwwbb6yNuyYPH78Gmup/eNKs1QztiHFDQIrjmY2vU0Wl
	 OtEx3d1Ws5TgEHF8GG6+r0kORmkmw1vXHAdY1U3Vx48/GUVcK9yxAfCQo7YlRc1i24
	 offn92j9FLY9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C20AF80A5F;
	Thu,  1 Jan 2026 19:06:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F8E819D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D86E980AF1
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oN_MnwXthGYq for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 19:06:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2CAA1809A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CAA1809A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CAA1809A1
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:06:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5EF72A4C2EF6;
 Thu,  1 Jan 2026 20:05:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33848)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbNyx-000000003yY-2IbD;
 Thu, 01 Jan 2026 19:05:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  1 Jan 2026 20:05:10 +0100
Message-ID: <20260101190511.1604441-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101190511.1604441-1-bernd@kuhls.net>
References: <20260101190511.1604441-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767294312;
 bh=PT9OnqTJlrrgz6mSAtzIMAn93pH6UKi8GfNCWh28zV8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=htvbQB2DBdO6HAzF0Pw83Cz/cM0y3oKda1T5lXQGCaso7kusLLfzztOQrp5iXrxmK
 oRCQZx+RrX0mmCz+Y+RGDJZ8wqno3gbbvUMB9Ljm/RCasQs1AL46EQ8SIREi5w03rG
 OaDsRAnBHMsqMeWwF/wCeUQbBESeMuyVY6k5VIV9kTOnH2cqC9o6zUDrf9djzahkB/
 3Se//X5cKQkmivlwD+S2RLnl4FQ5/LCuP2/WPh6I/y7nltWuUQnY0Ruk7jG2EBH528
 reoB1Zs5YJ+113V3mtquCs6GKC3E/7FhUILldQM+i/RAfDZWUKqjv9O9DOk4CiME0R
 ZoJZd3hKr6W9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=htvbQB2D
Subject: [Buildroot] [PATCH 4/5] package/vlc: fix build with ffmpeg 8.0
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

Added four backported patches to fix build with ffmpeg 8.0.

Added -Wno-incompatible-pointer-types to CFLAGS to fix build error with
FreeRDP, ported from FreeBSD:
https://cgit.freebsd.org/ports/commit/?id=437d793b6649e6d3b15bbc868187150b8aa3cfd7
https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=278706

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...remove-AV_INPUT_BUFFER_MIN_SIZE-usag.patch |  54 +++++
 ...eo-use-frame-flags-instead-of-fields.patch |  38 ++++
 ...ROFILE_xxx-instead-of-FF_PROFILE_xxx.patch | 202 ++++++++++++++++++
 ...AV_LEVEL_xxx-instead-of-FF_LEVEL_xxx.patch |  62 ++++++
 package/vlc/vlc.mk                            |   6 +-
 5 files changed, 361 insertions(+), 1 deletion(-)
 create mode 100644 package/vlc/0011-avcodec-encoder-remove-AV_INPUT_BUFFER_MIN_SIZE-usag.patch
 create mode 100644 package/vlc/0012-avcodec-video-use-frame-flags-instead-of-fields.patch
 create mode 100644 package/vlc/0013-avcodec-use-AV_PROFILE_xxx-instead-of-FF_PROFILE_xxx.patch
 create mode 100644 package/vlc/0014-avcodec-use-AV_LEVEL_xxx-instead-of-FF_LEVEL_xxx.patch

diff --git a/package/vlc/0011-avcodec-encoder-remove-AV_INPUT_BUFFER_MIN_SIZE-usag.patch b/package/vlc/0011-avcodec-encoder-remove-AV_INPUT_BUFFER_MIN_SIZE-usag.patch
new file mode 100644
index 0000000000..0b2d6bc6e6
--- /dev/null
+++ b/package/vlc/0011-avcodec-encoder-remove-AV_INPUT_BUFFER_MIN_SIZE-usag.patch
@@ -0,0 +1,54 @@
+From 8ff22a5621cf32b160b05541d1876bea7fc14ccb Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <robux4@ycbcr.xyz>
+Date: Mon, 8 Sep 2025 13:55:28 +0200
+Subject: [PATCH] avcodec: encoder: remove AV_INPUT_BUFFER_MIN_SIZE usage
+
+It's not supported in FFMpeg 8.0 since 60.40.100.
+
+It used to be used with preallocated packet buffers with
+the old encode API, but said API is no more and therefore
+there is no reason for this to be public any more.
+So deprecate it and use an internal replacement
+for the encoders using it as an upper bound for the
+size of their headers.
+
+(cherry picked from commit dae7faa0757ee094681c5e7100baca74c007c67c)
+
+Upstream: https://code.videolan.org/videolan/vlc/-/merge_requests/8168
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/codec/avcodec/avcommon_compat.h | 3 ---
+ modules/codec/avcodec/encoder.c         | 2 +-
+ 2 files changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/modules/codec/avcodec/avcommon_compat.h b/modules/codec/avcodec/avcommon_compat.h
+index 8ab6910f32..14aa62c9be 100644
+--- a/modules/codec/avcodec/avcommon_compat.h
++++ b/modules/codec/avcodec/avcommon_compat.h
+@@ -75,9 +75,6 @@
+ #ifndef AV_CODEC_CAP_SMALL_LAST_FRAME
+ # define AV_CODEC_CAP_SMALL_LAST_FRAME CODEC_CAP_SMALL_LAST_FRAME
+ #endif
+-#ifndef AV_INPUT_BUFFER_MIN_SIZE
+-# define AV_INPUT_BUFFER_MIN_SIZE FF_MIN_BUFFER_SIZE
+-#endif
+ #ifndef  FF_MAX_B_FRAMES
+ # define  FF_MAX_B_FRAMES 16 // FIXME: remove this
+ #endif
+diff --git a/modules/codec/avcodec/encoder.c b/modules/codec/avcodec/encoder.c
+index be53cec219..deb61eb519 100644
+--- a/modules/codec/avcodec/encoder.c
++++ b/modules/codec/avcodec/encoder.c
+@@ -1052,7 +1052,7 @@ errmsg:
+         p_sys->i_sample_bytes = (p_enc->fmt_in.audio.i_bitspersample / 8);
+         p_sys->i_frame_size = p_context->frame_size > 1 ?
+                                     p_context->frame_size :
+-                                    AV_INPUT_BUFFER_MIN_SIZE;
++                                    16384; // AV_INPUT_BUFFER_MIN_SIZE
+         p_sys->i_buffer_out = av_samples_get_buffer_size(NULL,
+                 p_enc->fmt_out.audio.i_channels, p_sys->i_frame_size,
+                 p_sys->p_context->sample_fmt, DEFAULT_ALIGN);
+-- 
+2.47.3
+
diff --git a/package/vlc/0012-avcodec-video-use-frame-flags-instead-of-fields.patch b/package/vlc/0012-avcodec-video-use-frame-flags-instead-of-fields.patch
new file mode 100644
index 0000000000..640b80d6c5
--- /dev/null
+++ b/package/vlc/0012-avcodec-video-use-frame-flags-instead-of-fields.patch
@@ -0,0 +1,38 @@
+From 36ded6256cb6a81574536c648520dd9c023e52b1 Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <robux4@ycbcr.xyz>
+Date: Tue, 14 Jan 2025 11:28:21 +0100
+Subject: [PATCH] avcodec/video: use frame flags instead of fields
+
+The structure fields are deprecated.
+It was introduced in lavu 58.7.100.
+
+(cherry picked from commit c79659bc9cfa2ff14754920a706f89d07d6425e6)
+
+Upstream: https://code.videolan.org/videolan/vlc/-/merge_requests/8168
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/codec/avcodec/video.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/modules/codec/avcodec/video.c b/modules/codec/avcodec/video.c
+index 8524f575bd..dfd359cfcd 100644
+--- a/modules/codec/avcodec/video.c
++++ b/modules/codec/avcodec/video.c
+@@ -1431,8 +1431,13 @@ static picture_t *DecodeBlock( decoder_t *p_dec, block_t **pp_block, bool *error
+         /* Hack to force display of still pictures */
+         p_pic->b_force = p_sys->b_first_frame;
+         p_pic->i_nb_fields = 2 + frame->repeat_pict;
++#if LIBAVUTIL_VERSION_CHECK( 58, 7, 100 )
++        p_pic->b_progressive = !(frame->flags & AV_FRAME_FLAG_INTERLACED);
++        p_pic->b_top_field_first = !!(frame->flags & AV_FRAME_FLAG_TOP_FIELD_FIRST);
++#else
+         p_pic->b_progressive = !frame->interlaced_frame;
+         p_pic->b_top_field_first = frame->top_field_first;
++#endif
+ 
+         if (DecodeSidedata(p_dec, frame, p_pic))
+             i_pts = VLC_TICK_INVALID;
+-- 
+2.47.3
+
diff --git a/package/vlc/0013-avcodec-use-AV_PROFILE_xxx-instead-of-FF_PROFILE_xxx.patch b/package/vlc/0013-avcodec-use-AV_PROFILE_xxx-instead-of-FF_PROFILE_xxx.patch
new file mode 100644
index 0000000000..88ed25d8d5
--- /dev/null
+++ b/package/vlc/0013-avcodec-use-AV_PROFILE_xxx-instead-of-FF_PROFILE_xxx.patch
@@ -0,0 +1,202 @@
+From daf3f3cd52879c2ca380b9a87cb385e97bfed4bf Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <robux4@ycbcr.xyz>
+Date: Mon, 8 Sep 2025 13:51:43 +0200
+Subject: [PATCH] avcodec: use AV_PROFILE_xxx instead of FF_PROFILE_xxx
+
+This was added in libavcodec 60.26.100 [^1]. We require 58.54.100.
+
+[^1]:  https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/8238bc0b5e3dba271217b1223a901b3f9713dc6e
+
+(cherry picked from commit ff292b650ea0b10c67c9e4ff16327486afe0d8ad) (edited)
+- the vaapi had less profiles
+- the direct_va doesn't have HEVC EXT
+- FF_PROFILE_UNKNOWN was used in more places
+
+Upstream: https://code.videolan.org/videolan/vlc/-/merge_requests/8168
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/codec/avcodec/audio.c           |  2 +-
+ modules/codec/avcodec/avcommon_compat.h |  6 ++++
+ modules/codec/avcodec/directx_va.c      | 40 ++++++++++++-------------
+ modules/codec/avcodec/encoder.c         | 20 ++++++-------
+ modules/codec/avcodec/vaapi.c           |  8 ++---
+ modules/codec/avcodec/video.c           |  2 +-
+ 6 files changed, 42 insertions(+), 36 deletions(-)
+
+diff --git a/modules/codec/avcodec/audio.c b/modules/codec/avcodec/audio.c
+index b6186d6ec5..46f9a2a899 100644
+--- a/modules/codec/avcodec/audio.c
++++ b/modules/codec/avcodec/audio.c
+@@ -271,7 +271,7 @@ int InitAudioDec( vlc_object_t *obj )
+     p_dec->pf_flush  = Flush;
+ 
+     /* XXX: Writing input format makes little sense. */
+-    if( avctx->profile != FF_PROFILE_UNKNOWN )
++    if( avctx->profile != AVPROFILE(UNKNOWN) )
+         p_dec->fmt_in.i_profile = avctx->profile;
+     if( avctx->level != FF_LEVEL_UNKNOWN )
+         p_dec->fmt_in.i_level = avctx->level;
+diff --git a/modules/codec/avcodec/avcommon_compat.h b/modules/codec/avcodec/avcommon_compat.h
+index 14aa62c9be..01e622347e 100644
+--- a/modules/codec/avcodec/avcommon_compat.h
++++ b/modules/codec/avcodec/avcommon_compat.h
+@@ -144,4 +144,10 @@
+ 
+ #endif
+ 
++#if LIBAVCODEC_VERSION_CHECK(60,26,100)
++# define AVPROFILE(prof) (AV_PROFILE_##prof)
++#else
++# define AVPROFILE(prof) (FF_PROFILE_##prof)
++#endif
++
+ #endif
+diff --git a/modules/codec/avcodec/directx_va.c b/modules/codec/avcodec/directx_va.c
+index 36a5d61a55..f6e252fb56 100644
+--- a/modules/codec/avcodec/directx_va.c
++++ b/modules/codec/avcodec/directx_va.c
+@@ -48,25 +48,25 @@ struct picture_sys_t {
+ #include "../../packetizer/h264_nal.h"
+ #include "../../packetizer/hevc_nal.h"
+ 
+-static const int PROF_MPEG2_MAIN[]   = { FF_PROFILE_MPEG2_SIMPLE,
+-                                         FF_PROFILE_MPEG2_MAIN,
+-                                         FF_PROFILE_UNKNOWN };
+-static const int PROF_H264_HIGH[]    = { FF_PROFILE_H264_BASELINE,
+-                                         FF_PROFILE_H264_CONSTRAINED_BASELINE,
+-                                         FF_PROFILE_H264_MAIN,
+-                                         FF_PROFILE_H264_HIGH,
+-                                         FF_PROFILE_UNKNOWN };
+-static const int PROF_HEVC_MAIN[]    = { FF_PROFILE_HEVC_MAIN,
+-                                         FF_PROFILE_UNKNOWN };
+-static const int PROF_HEVC_MAIN10[]  = { FF_PROFILE_HEVC_MAIN,
+-                                         FF_PROFILE_HEVC_MAIN_10,
+-                                         FF_PROFILE_UNKNOWN };
+-
+-static const int PROF_VP9_MAIN[]    = { FF_PROFILE_VP9_0, FF_PROFILE_UNKNOWN };
+-static const int PROF_VP9_10[]      = { FF_PROFILE_VP9_2, FF_PROFILE_UNKNOWN };
+-
+-static const int PROF_AV1_MAIN[]    = { FF_PROFILE_AV1_MAIN, FF_PROFILE_UNKNOWN };
+-static const int PROF_AV1_HIGH[]    = { FF_PROFILE_AV1_HIGH, FF_PROFILE_AV1_MAIN, FF_PROFILE_UNKNOWN };
++static const int PROF_MPEG2_MAIN[]   = { AVPROFILE(MPEG2_SIMPLE),
++                                         AVPROFILE(MPEG2_MAIN),
++                                         AVPROFILE(UNKNOWN) };
++static const int PROF_H264_HIGH[]    = { AVPROFILE(H264_BASELINE),
++                                         AVPROFILE(H264_CONSTRAINED_BASELINE),
++                                         AVPROFILE(H264_MAIN),
++                                         AVPROFILE(H264_HIGH),
++                                         AVPROFILE(UNKNOWN) };
++static const int PROF_HEVC_MAIN[]    = { AVPROFILE(HEVC_MAIN),
++                                         AVPROFILE(UNKNOWN) };
++static const int PROF_HEVC_MAIN10[]  = { AVPROFILE(HEVC_MAIN),
++                                         AVPROFILE(HEVC_MAIN_10),
++                                         AVPROFILE(UNKNOWN) };
++
++static const int PROF_VP9_MAIN[]    = { AVPROFILE(VP9_0), AVPROFILE(UNKNOWN) };
++static const int PROF_VP9_10[]      = { AVPROFILE(VP9_2), AVPROFILE(UNKNOWN) };
++
++static const int PROF_AV1_MAIN[]    = { AVPROFILE(AV1_MAIN), AVPROFILE(UNKNOWN) };
++static const int PROF_AV1_HIGH[]    = { AVPROFILE(AV1_HIGH), AVPROFILE(AV1_MAIN), AVPROFILE(UNKNOWN) };
+ 
+ #include <winapifamily.h>
+ #if defined(WINAPI_FAMILY)
+@@ -436,7 +436,7 @@ static bool profile_supported(const directx_va_mode_t *mode, const es_format_t *
+     bool is_supported = false;
+     if (profile <= 0)
+         is_supported = true;
+-    else for (const int *p_profile = &mode->p_profiles[0]; *p_profile != FF_PROFILE_UNKNOWN; ++p_profile)
++    else for (const int *p_profile = &mode->p_profiles[0]; *p_profile != AVPROFILE(UNKNOWN); ++p_profile)
+     {
+         if (*p_profile == profile)
+         {
+diff --git a/modules/codec/avcodec/encoder.c b/modules/codec/avcodec/encoder.c
+index deb61eb519..1f3dd8fbf5 100644
+--- a/modules/codec/avcodec/encoder.c
++++ b/modules/codec/avcodec/encoder.c
+@@ -484,30 +484,30 @@ int InitVideoEnc( vlc_object_t *p_this )
+     psz_val = var_GetString( p_enc, ENC_CFG_PREFIX "aac-profile" );
+     /* libavcodec uses faac encoder atm, and it has issues with
+      * other than low-complexity profile, so default to that */
+-    p_sys->i_aac_profile = FF_PROFILE_AAC_LOW;
++    p_sys->i_aac_profile = AVPROFILE(AAC_LOW);
+     if( psz_val && *psz_val )
+     {
+         if( !strncmp( psz_val, "main", 4 ) )
+-            p_sys->i_aac_profile = FF_PROFILE_AAC_MAIN;
++            p_sys->i_aac_profile = AVPROFILE(AAC_MAIN);
+         else if( !strncmp( psz_val, "low", 3 ) )
+-            p_sys->i_aac_profile = FF_PROFILE_AAC_LOW;
++            p_sys->i_aac_profile = AVPROFILE(AAC_LOW);
+         else if( !strncmp( psz_val, "ssr", 3 ) )
+-            p_sys->i_aac_profile = FF_PROFILE_AAC_SSR;
++            p_sys->i_aac_profile = AVPROFILE(AAC_SSR);
+         else if( !strncmp( psz_val, "ltp", 3 ) )
+-            p_sys->i_aac_profile = FF_PROFILE_AAC_LTP;
++            p_sys->i_aac_profile = AVPROFILE(AAC_LTP);
+ /* These require libavcodec with libfdk-aac */
+         else if( !strncmp( psz_val, "hev2", 4 ) )
+-            p_sys->i_aac_profile = FF_PROFILE_AAC_HE_V2;
++            p_sys->i_aac_profile = AVPROFILE(AAC_HE_V2);
+         else if( !strncmp( psz_val, "hev1", 4 ) )
+-            p_sys->i_aac_profile = FF_PROFILE_AAC_HE;
++            p_sys->i_aac_profile = AVPROFILE(AAC_HE);
+         else if( !strncmp( psz_val, "ld", 2 ) )
+-            p_sys->i_aac_profile = FF_PROFILE_AAC_LD;
++            p_sys->i_aac_profile = AVPROFILE(AAC_LD);
+         else if( !strncmp( psz_val, "eld", 3 ) )
+-            p_sys->i_aac_profile = FF_PROFILE_AAC_ELD;
++            p_sys->i_aac_profile = AVPROFILE(AAC_ELD);
+         else
+         {
+             msg_Warn( p_enc, "unknown AAC profile requested, setting it to low" );
+-            p_sys->i_aac_profile = FF_PROFILE_AAC_LOW;
++            p_sys->i_aac_profile = AVPROFILE(AAC_LOW);
+         }
+     }
+     free( psz_val );
+diff --git a/modules/codec/avcodec/vaapi.c b/modules/codec/avcodec/vaapi.c
+index e203baaf9e..5380099ea4 100644
+--- a/modules/codec/avcodec/vaapi.c
++++ b/modules/codec/avcodec/vaapi.c
+@@ -100,9 +100,9 @@ static int GetVaProfile(AVCodecContext *ctx, const es_format_t *fmt,
+         count = 18;
+         break;
+     case AV_CODEC_ID_HEVC:
+-        if (ctx->profile == FF_PROFILE_HEVC_MAIN)
++        if (ctx->profile == AVPROFILE(HEVC_MAIN))
+             i_profile = VAProfileHEVCMain;
+-        else if (ctx->profile == FF_PROFILE_HEVC_MAIN_10)
++        else if (ctx->profile == AVPROFILE(HEVC_MAIN_10))
+         {
+             i_profile = VAProfileHEVCMain10;
+             i_vlc_chroma = VLC_CODEC_VAAPI_420_10BPP;
+@@ -116,10 +116,10 @@ static int GetVaProfile(AVCodecContext *ctx, const es_format_t *fmt,
+         count = 5;
+         break;
+     case AV_CODEC_ID_VP9:
+-        if (ctx->profile == FF_PROFILE_VP9_0)
++        if (ctx->profile == AVPROFILE(VP9_0))
+             i_profile = VAProfileVP9Profile0;
+ #if VA_CHECK_VERSION( 0, 39, 0 )
+-        else if (ctx->profile == FF_PROFILE_VP9_2)
++        else if (ctx->profile == AVPROFILE(VP9_2))
+         {
+             i_profile = VAProfileVP9Profile2;
+             i_vlc_chroma = VLC_CODEC_VAAPI_420_10BPP;
+diff --git a/modules/codec/avcodec/video.c b/modules/codec/avcodec/video.c
+index dfd359cfcd..2448e073dc 100644
+--- a/modules/codec/avcodec/video.c
++++ b/modules/codec/avcodec/video.c
+@@ -624,7 +624,7 @@ static int InitVideoDecCommon( decoder_t *p_dec )
+     p_dec->pf_flush  = Flush;
+ 
+     /* XXX: Writing input format makes little sense. */
+-    if( p_context->profile != FF_PROFILE_UNKNOWN )
++    if( p_context->profile != AVPROFILE(UNKNOWN) )
+         p_dec->fmt_in.i_profile = p_context->profile;
+     if( p_context->level != FF_LEVEL_UNKNOWN )
+         p_dec->fmt_in.i_level = p_context->level;
+-- 
+2.47.3
+
diff --git a/package/vlc/0014-avcodec-use-AV_LEVEL_xxx-instead-of-FF_LEVEL_xxx.patch b/package/vlc/0014-avcodec-use-AV_LEVEL_xxx-instead-of-FF_LEVEL_xxx.patch
new file mode 100644
index 0000000000..8836f4cdcb
--- /dev/null
+++ b/package/vlc/0014-avcodec-use-AV_LEVEL_xxx-instead-of-FF_LEVEL_xxx.patch
@@ -0,0 +1,62 @@
+From c7a4420f25df6a9cea52e1a85eecb6bc866af928 Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <robux4@ycbcr.xyz>
+Date: Tue, 9 Dec 2025 11:42:02 +0100
+Subject: [PATCH] avcodec: use AV_LEVEL_xxx instead of FF_LEVEL_xxx
+
+This was added in libavcodec 60.26.100 [^1].
+
+[^1]:  https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/8238bc0b5e3dba271217b1223a901b3f9713dc6e
+
+Upstream: https://code.videolan.org/videolan/vlc/-/merge_requests/8168
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/codec/avcodec/audio.c           | 2 +-
+ modules/codec/avcodec/avcommon_compat.h | 6 ++++++
+ modules/codec/avcodec/video.c           | 2 +-
+ 3 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/modules/codec/avcodec/audio.c b/modules/codec/avcodec/audio.c
+index 46f9a2a899..d3748ccd01 100644
+--- a/modules/codec/avcodec/audio.c
++++ b/modules/codec/avcodec/audio.c
+@@ -273,7 +273,7 @@ int InitAudioDec( vlc_object_t *obj )
+     /* XXX: Writing input format makes little sense. */
+     if( avctx->profile != AVPROFILE(UNKNOWN) )
+         p_dec->fmt_in.i_profile = avctx->profile;
+-    if( avctx->level != FF_LEVEL_UNKNOWN )
++    if( avctx->level != AVLEVEL(UNKNOWN) )
+         p_dec->fmt_in.i_level = avctx->level;
+ 
+     return VLC_SUCCESS;
+diff --git a/modules/codec/avcodec/avcommon_compat.h b/modules/codec/avcodec/avcommon_compat.h
+index 01e622347e..b3fb167cc2 100644
+--- a/modules/codec/avcodec/avcommon_compat.h
++++ b/modules/codec/avcodec/avcommon_compat.h
+@@ -150,4 +150,10 @@
+ # define AVPROFILE(prof) (FF_PROFILE_##prof)
+ #endif
+ 
++#if LIBAVCODEC_VERSION_CHECK(60,26,100)
++# define AVLEVEL(prof) (AV_LEVEL_##prof)
++#else
++# define AVLEVEL(prof) (FF_LEVEL_##prof)
++#endif
++
+ #endif
+diff --git a/modules/codec/avcodec/video.c b/modules/codec/avcodec/video.c
+index 2448e073dc..3412a7f79a 100644
+--- a/modules/codec/avcodec/video.c
++++ b/modules/codec/avcodec/video.c
+@@ -626,7 +626,7 @@ static int InitVideoDecCommon( decoder_t *p_dec )
+     /* XXX: Writing input format makes little sense. */
+     if( p_context->profile != AVPROFILE(UNKNOWN) )
+         p_dec->fmt_in.i_profile = p_context->profile;
+-    if( p_context->level != FF_LEVEL_UNKNOWN )
++    if( p_context->level != AVLEVEL(UNKNOWN) )
+         p_dec->fmt_in.i_level = p_context->level;
+     return VLC_SUCCESS;
+ }
+-- 
+2.47.3
+
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 9091a7e7fa..bc65c53cc9 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -17,10 +17,13 @@ VLC_AUTORECONF = YES
 # Install vlc libraries in staging.
 VLC_INSTALL_STAGING = YES
 
+VLC_CFLAGS = $(TARGET_CFLAGS)
+VLC_CONF_ENV = CFLAGS="$(VLC_CFLAGS)"
+
 # gcc bug internal compiler error: in merge_overlapping_regs, at
 # regrename.c:304. This bug is fixed since gcc 6.
 ifeq ($(BR2_microblaze)$(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
-VLC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+VLC_CFLAGS += -O0
 VLC_CONF_OPTS += --disable-optimizations
 endif
 
@@ -148,6 +151,7 @@ VLC_CONF_OPTS += --disable-faad
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
+VLC_CFLAGS += -Wno-incompatible-pointer-types
 VLC_CONF_OPTS += --enable-avcodec
 VLC_DEPENDENCIES += ffmpeg
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
