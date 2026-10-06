Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F2DCA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2242F80F10;
	Tue,  6 Oct 2026 16:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gVUhe8HBwbs; Tue,  6 Oct 2026 16:40:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 10AA380F0A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304826;
	b=lwwgyvjKx5KtiMclKI11oDpbn1xz7WCf0zrU5Yphtemjnx5nstvjHFMHDOGWc1WA9u2e
	 V1ju+GYAMnC6VB4ZiqU1Z6IzufuBV4QF9vN6s0gDJT9qgFaioZ7sNnITn6312yPNp4Ex3
	 N7OVG2+ievd1gc76mBAH9CZ7WrYLUoEaLI4lSE6NsYCCvWSNSpEdGvhti89iPJnVj/x6I
	 8Xl0I/cu7axxelRFwvR734+6yN1gvB1cDfic+Nh3lmdBZhLpCW15Pc9TNlWvnoEX1M+aI
	 GFLSAGyKBX4Gr8ebBRqvya0z/2xHQPY2m/BRfALWe58v10qUT574odrjrMWDIw3EzBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304826;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+rvMJ22QjmAFixC1/1rqYlVBiqtKPOwo6QjOr6kq54w=;
	b=E4Rd/f4k2Cfe60e04UMAETyml5MiuiPg4Eaj8O5Li52yBLjGTdwZBRmhTPUHxh8xMLRu
	 R+2fBErcB0n+c62NgITlPowu8zK4w73LRIgt0PHSFLH9IKmax6f4sOvVkzsiYmGAw+3u1
	 8rUl2+NNLqzn5dEO/KCVqT91mkNNz7ZnYLwgKXm9wf3SaMJ8rrvlSurNDxdNS2YCJ17j7
	 EbIKLzR7m8VmrVykn1w3tT68XypNwkpM92d2w56Nw66BO+aWo6LpR1cRsul8ZYaoBeOZh
	 10+Yq+sGF7q73Pqkq/QOA5Q7lumexPgT/a9wIW/h8NzoU2tXRJvjZ4/NlRrLoM+Nklw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304826;
	bh=+rvMJ22QjmAFixC1/1rqYlVBiqtKPOwo6QjOr6kq54w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XfyR95sQ5oE24J9/rXhafYxDX+T9v1FoRqZG6R59vNhTucF+Biro7U37epRshTdY0
	 SR9TTxAErm8FKmFMNCXdkyQde7AHb8rzXErLrI81s0/5Dp6+A7dyPS4rP/J7SoMWQK
	 ieMir2aEaLV2oBNFmI9qfwAbBrBQgMTt6u3uWngmH4CWCsZmTW6e1PZOzN1GMBsesQ
	 mJs4C8ByLLUSLAtfigDnp+8kG2Xh7M99oja5oNo/9zQid2Q/QA6voIt5MeEEgbGbvq
	 Dz/RHw6pYSPLD0olNLZcKDu2Msh+Ji512ZKGldpZYCfYV5H4GjgtockU90kjWqmEZr
	 Pn83/1ItPzMNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10AA380F0A;
	Tue,  6 Oct 2026 16:40:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE26934E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B49D4402CE
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jiumc_O-_Lse for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:37:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 76831402C8
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304673;
 b=s+XTSUq2xa8WQJkYkK6gso9Z3nF4Xys1KLlTWVrUHS3DGzC9JDFUEEwZyHtueALIMxQU
 4DN+CJAIfiMSWkkjeH+sk+h2t2LcCOqf2f6hq8K+gTTRmtORNfZiLoyCsuSDeMYuBbUnq
 wDHBQ/XZb9iHh8HescR2gRgcT87T2o8Wt/bPzBt17pSN0NQ7tvSlbCFhWjW3on5emadnz
 HB9Jy8FZW9sTLFLOb0pSiwIwAufWKi0NUjS8OhRlc2kJ9N3pn22z8bFCLAUpZ/e2Ha6zC
 0ldXjk666Gya9RBvv/861c5Pvf1aiUtdD1lFJjqDUfIkcoArov6IjkRcVLwbDq1Y+kA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304673;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=CpWSc9slPuqzo6QsCu05jW6DFk7IYmmxO5/4U9cGpjg=;
 b=YkhA6MFLPHO77fP/+5O8qGlW0zrsjj2+Gbvt/+zBcbXJpOWJ6YQ3413YF3a0Hfo+lVSJ
 TJBDo+loGJ6yzCuIB9SK6ovfzR1wRYXBIoSGb1A2q2vRad+Nejtob15meMbDMhzlpbHws
 hJNlXiglurXrc+hojuVnR+D3Sm9WdUOVChKnx1l3Ewof5DqFdt7HkcW59ULE3v/X1Cq/K
 BgTw+4ppBsCFWxwAQn45grMKS+UmXULUDW4S10cQAwHAmzlo3YNW5YzOF++H9nUeyqoBz
 Y/ZRmQjocProB7xHbLZ7eavM4sRgZF+6Z+F6DTK0CATtsqFKPiJ8lAa/a0+PfHyOl/w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HjwmyXdG; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=HjwmyXdG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76831402C8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303713;
 bh=CpWSc9slPuqzo6QsCu05jW6DFk7IYmmxO5/4U9cGpjg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=HjwmyXdGUelZt0VdXwWoJMqtkJsjcKOpAPI+bKnkuwmEsSyYjCjozEbEriVYRIZ0p
 dUj9/I+60PBN9FhZvUdKbfdFUt/GxStHatSUsqPDDCI317ynkYppWt4URgzlvbHrkz
 B2Zlb6i64W5zlxlXd/W/8D+MdPYndvq1W8S64O8u/v+ZU/l9qlUPmJQAzac4RRD806
 i9H3RPBj311kra3rOKd+1hefhvK1ky5yrfLeI76Z1YFxxKFPduLEeZjArTqFxXuG3k
 58fpa0GuM+ajmrJ5bida3Gs2DghSv1BdQLEHB8O/lSDi8Af3aaGd6/yV6UlMTQGfD6
 WwXPRa+efklnQ==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 pO/NoJAV0lRUwWd56y627Q5mnhCDEq63esGdjh9I42xGGSnYmU5V+ErdJotp6ndheegbFHUjQlN
 cGmpq3PYXTPlYFS14o/1e16aertRQLpN929otwU7Yj13TQ1k37Wfo0Q7XUIfSpftsovf+kvZ5AE
 G2reXeESipfhVfm3H5U+AtE65bVgNUrqgx4x1uZuJzcIwBAdxItiTxj0lT0Y4S9oWT77I3vmq1x
 MPda8FjhuOZcieZ45WRXdrku0Xqny/yL7HTGb3BjR4AodccaEWnI36KeT3wTjn2C7eqSC7hAjqD
 EeFgo7R2TkI3XL2p/82GSmbYHLeSPQePUQWK4nx7Wxn3Mr38AbWPTb2ORiv1k2ggiDDMhnXMGgz
 cs38c84c+XO9Av5y6mf0oEPfW17UcaYdDZlhjblLPqnCG7uMFFYBJH1K0DvzYqxjGzSWgtqevf9
 WGXwp8pP0a1dMfd37UNYlXFUY4A91+C5ddA65p1qundqmq0X8B3cj1VYR2iZiElWaev6eQbzXt+
 fVKOH779LPlyhm70ToMl7oNkwrdSSXPzxKws70Qi2f+rXIcXVkZ6LZX2/rR1ranYaBrApmykSuG
 lrHQM48=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE99FA4C5582
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uo-000000000ir-0NfT
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:38 +0200
Message-ID: <20261006162106.3439373-58-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 57/84] package/freeswitch: fix build with
 ffmpeg 8.x
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...elated-to-signalwire-freeswitch-2202.patch | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 package/freeswitch/0006-Fixes-related-to-signalwire-freeswitch-2202.patch

diff --git a/package/freeswitch/0006-Fixes-related-to-signalwire-freeswitch-2202.patch b/package/freeswitch/0006-Fixes-related-to-signalwire-freeswitch-2202.patch
new file mode 100644
index 0000000000..225e1fa215
--- /dev/null
+++ b/package/freeswitch/0006-Fixes-related-to-signalwire-freeswitch-2202.patch
@@ -0,0 +1,103 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Korynkai <matt@qmxtech.com>
+Date: Mon, 30 Dec 2024 22:23:33 +0000
+Subject: [PATCH] Fixes related to signalwire/freeswitch#2202
+
+ AVOutputFormat::priv_data_size is marked private and no longer exists in the
+ public API as of FFMPEG 6.0, but found hidden in AVOutputFormat as part of
+ FFOutputFormat. AVCodecContext::ticks_per_frame was deprecated as of FFMPEG
+ 6.1. libavcodec notes 'do not use avcodec_close()' as of FFMPEG 3.1, use
+ avcodec_free_context() instead. AVFrame::key_frame was deprecated as of
+ FFMPEG 6.1, use AVFrame::flags instead. AVInputFormat::read_seek and
+ AVInputFormat::read_seek2 no longer exists as of FFMPEG 7.0. This seems to
+ only be used for logging purposes, so guard this functionality accordingly.
+
+Upstream: https://github.com/signalwire/freeswitch/pull/3214
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/mod/applications/mod_av/avformat.c | 12 ++++++++++--
+ src/mod/applications/mod_av/mod_av.h   |  1 +
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/src/mod/applications/mod_av/avformat.c b/src/mod/applications/mod_av/avformat.c
+index d617a52dfe..edba9c27c7 100644
+--- a/src/mod/applications/mod_av/avformat.c
++++ b/src/mod/applications/mod_av/avformat.c
+@@ -637,12 +637,14 @@ static switch_status_t add_stream(av_file_context_t *context, MediaStream *mst,
+ 		c->rc_initial_buffer_occupancy = buffer_bytes * 8;
+ 
+ 		if (codec_id == AV_CODEC_ID_H264) {
++#if (LIBAVCODEC_VERSION_MAJOR < LIBAVFORMAT_8_V)
+ #if ((LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_6_V && LIBAVFORMAT_VERSION_MINOR >= LIBAVFORMAT_61_V) || LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
+ GCC_DIAG_OFF(deprecated-declarations)
+ #endif
+ 			c->ticks_per_frame = 2;
+ #if ((LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_6_V && LIBAVFORMAT_VERSION_MINOR >= LIBAVFORMAT_61_V) || LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
+ GCC_DIAG_ON(deprecated-declarations)
++#endif
+ #endif
+ 
+ 			c->flags|=AV_CODEC_FLAG_LOOP_FILTER;   // flags=+loop
+@@ -1431,7 +1433,7 @@ static switch_status_t open_input_file(av_file_context_t *context, switch_file_h
+ 		switch_goto_status(SWITCH_STATUS_FALSE, err);
+ 	}
+ 
+-#if (LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
++#if (LIBAVFORMAT_VERSION_MAJOR >= LIBAVFORMAT_7_V)
+ 	handle->seekable = !(context->fc->iformat->flags & AVFMT_NOTIMESTAMPS);
+ #else
+ 	handle->seekable = context->fc->iformat->read_seek2 ? 1 : (context->fc->iformat->read_seek ? 1 : 0);
+@@ -3123,14 +3125,18 @@ static switch_status_t av_file_read_video(switch_file_handle_t *handle, switch_f
+ 	void *pop;
+ 	MediaStream *mst = &context->video_st;
+ 	AVStream *st = mst->st;
++#if (LIBAVCODEC_VERSION_MAJOR < LIBAVFORMAT_8_V)
+ 	int ticks = 0;
++#endif
+ 	int64_t max_delta = 1 * AV_TIME_BASE; // 1 second
+ 	switch_status_t status = SWITCH_STATUS_SUCCESS;
+ 	double fl_to = 0.02;
+ 	int do_fl = 0;
+ 	int smaller_ts = context->read_fps;
++#if (LIBAVCODEC_VERSION_MAJOR < LIBAVFORMAT_8_V)
+ 	AVCodecContext *c = NULL;
+ 	AVCodecParserContext *cp = NULL;
++#endif
+ 
+ 	if (!context->has_video) return SWITCH_STATUS_FALSE;
+ 
+@@ -3238,6 +3244,7 @@ static switch_status_t av_file_read_video(switch_file_handle_t *handle, switch_f
+ 	}
+ #endif
+ 
++#if (LIBAVCODEC_VERSION_MAJOR < LIBAVFORMAT_8_V)
+ 	if ((c = av_get_codec_context(mst)) && c->time_base.num) {
+ 		cp = av_stream_get_parser(st);
+ #if ((LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_6_V && LIBAVFORMAT_VERSION_MINOR >= LIBAVFORMAT_61_V) || LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
+@@ -3252,8 +3259,9 @@ GCC_DIAG_OFF(deprecated-declarations)
+ 			context->video_start_time, ticks, c ? c->ticks_per_frame : -1, st->time_base.num, st->time_base.den, c ? c->time_base.num : -1, c ? c->time_base.den : -1,
+ 			st->start_time, st->duration == AV_NOPTS_VALUE ? context->fc->duration / AV_TIME_BASE * 1000 : st->duration, st->nb_frames, av_q2d(st->time_base));
+ 	}
+-#if ((LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_6_V && LIBAVFORMAT_VERSION_MINOR >= LIBAVFORMAT_61_V) || LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
++#if ((LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_6_V && LIBAVFORMAT_VERSION_MINOR >= LIBAVFORMAT_61_V) || LIBAVFORMAT_VERSION_MAJOR >= LIBAVFORMAT_7_V)
+ GCC_DIAG_ON(deprecated-declarations)
++#endif
+ #endif
+ 
+  again:
+diff --git a/src/mod/applications/mod_av/mod_av.h b/src/mod/applications/mod_av/mod_av.h
+index 8152a77a81..565537a247 100644
+--- a/src/mod/applications/mod_av/mod_av.h
++++ b/src/mod/applications/mod_av/mod_av.h
+@@ -47,6 +47,7 @@
+ #define LIBAVFORMAT_V 59 /* FFmpeg version >= 5.1 */
+ #define LIBAVFORMAT_6_V 60 /* FFmpeg version >= 6.0 */
+ #define LIBAVFORMAT_7_V 61 /* FFmpeg version >= 7.0 */
++#define LIBAVFORMAT_8_V 62 /* FFmpeg version >= 8.0 */
+ #define LIBAVFORMAT_61_V 16 /* FFmpeg version >= 6.1 */
+ #define LIBAVUTIL_V 57 /* FFmpeg version >= 5.1 */
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
