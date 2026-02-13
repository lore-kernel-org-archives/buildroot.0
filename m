Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85ACEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B54D847F2;
	Fri, 13 Feb 2026 19:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WkFwfBVDcpRW; Fri, 13 Feb 2026 19:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 911D4847E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011511;
	bh=8lLr1J7ntKAdSrmV3e5q8pDO6YH/JyCnyUB+xY+VXU0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X/hjhjo0tFcoBzJUoGBbE/xrshckMdMaLqCUqT6gP/uVhLIIh36weTfJTaaQNAaO6
	 F9hmoH32nPWc3CDCiWxN3RjyP6NdBXsqocWZBTjZJltblxCq09ALF8uAaF25UNVL3n
	 PWHCRjkP8LlDM5W8GxQKZb26+Y02n6SLSHpgdNfSWBKcuo3Ad8g0rmNn6hGsbG9Ot5
	 5Ktsnzf8kvE66jeXCeYYia9tz4AZrwO75IhCNnqZ1Fe2XdCak3rULIAT3kTitfNkJS
	 eTnDxfxmxmDKfKTNAbAPvF9GekSTFBUu/PCkoQyYwq3ZpmvHpfDXinQ3cVAZUp61xL
	 kgzyqvWokne/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 911D4847E5;
	Fri, 13 Feb 2026 19:38:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65A3069
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ACE284714
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxSDmSboZrd6 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D859F84596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D859F84596
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D859F84596
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-480706554beso12377725e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011455; x=1771616255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t7NoHCD++2Xf2ZplUHydr97kFij+kwUw3rJ1gA2Y21s=;
 b=OWT/E7GZLkRRHKaLK7RYNHyMIFFzriv7cBSwRS1rbau+dscls5MqutqpW28QkCDsJZ
 0gRty3uWO4AxqPT6ymXaKHWeF8LREhKRm4TDOlccYNp/blRch3/o4dXTrr2XUYCMhJwh
 jw7oqMpo2eI4JqIn9Ma5fIJuzNBYbGt3ajPu2nWq3vfHLz3Ww2B3t3RjDj6CsScbShQ7
 uH2EvA383oFx+4pps2xdjW5X98H2IbPMQZ4U3Ng1G/9v2gtIGOi7fb7GX+/8acCPBmPQ
 wKUPUM25VpI45QgO1BVvCqcHd9PBgU3q7q19oOkurFDHBEhCXm/wplPu4SKNeiIdcdqy
 tOfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz0V6IczPJdlsJtasNNEHEGlnKnsY5krUVXRu5y521OKzOjX41/+ux6W7pAthd+bu0zqpzPMxDZ1k=@buildroot.org
X-Gm-Message-State: AOJu0YwzB7EOPCcb2sQ+G/r618Ju1j16nQ1H7uSNemOY4fwJTNJAYJ9g
 ViovgUYI9hShjFZdFabM1UnkZP+XbD7OhJaLdi14VcYVbMPrzvUknwg8kvUP0QzifSfeN9HAJwV
 Ffy2b
X-Gm-Gg: AZuq6aIHVOsDpVg0A9ljhZ2cApGCC91JeR4uE+X2iSPpTs7sz5Hd4xVyhvQccWacqeD
 7FF2f+/0SpQqmnzN9D6Gzv4vPDqEslZX8ddOFdLdUKcaU5kjNyh2zNQgpOUoV10LYfMDuT3U8KK
 /LUkKQ8Hb/1c2HDt2zT3Jk6+YqpXQe10VAZYPv0zFiu13sTRzRTpxh9UJwG0AGVjf2jPCwvPQnj
 9+c2RUp8yhXewKwILfolunwhrCh2HaJ0qd44qeNF2pEjLXQEwBVkSd3JTCx7KxeVBR7o7CCC077
 qfZCfetTNaYAbklq/YA82jQIND+Ln75mR1WMRDiE7SIrHSCM4NINDE1LYG4NJ0Clr/m7PaJKmfV
 7dPwxVvTk8geLZ+58t2F/pzwwhVFzqrxKmY+RL1c5yEhMdowrm+5PM6bfcifKu3Ly090R7OkYmy
 4+CgMmJsbKwEIEyR0=
X-Received: by 2002:a05:600c:83c6:b0:477:639d:bca2 with SMTP id
 5b1f17b1804b1-48379b93357mr5574925e9.4.1771011454576; 
 Fri, 13 Feb 2026 11:37:34 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a4b63dsm23262505e9.32.2026.02.13.11.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:34 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:33 +0100
Message-ID: <20260213193733.39960-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103094508.1212757-1-bernd@kuhls.net>
References: <20260103094508.1212757-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011455; x=1771616255; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t7NoHCD++2Xf2ZplUHydr97kFij+kwUw3rJ1gA2Y21s=;
 b=deW9QB6ip5pnEgQ7VvaOjsVKRtML9F90Cw3Gh0wccqIP2nwfWbZHf6BqdBEox2XMoW
 uTWD8UOgGOczV/3B+1O0zOvJPYmJ4CuwM9gnpKidJ9bfbYiTH130q4yD6Z0qPzgwPeJ6
 +51+QJNO8koPafljyRlsyiCgdibFcOuzD9Kv5ohp7JOHpgARx7rQ/mr4YQ232+ix4A41
 gIDE9ug8DdpIjh6prnVnF3fAcyCBa0B1MZg91LRbKoAU2twktQQxNsLO5Ve4SgOCZno2
 fvrX4D74UZow2bcKBQAkGh1p6V1mc3WxXFYMF4qpU2X6ddeBwWx2Q+wG4F4+ZPjj8IhC
 IGfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=deW9QB6i
Subject: Re: [Buildroot] [PATCH 1/3] package/spandsp: fix build with gcc-14.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Added upstream patch to fix build error.
> The build error does not occur with gcc-13.x.
> 
> The first build error of this kind was recorded 2024-08-23:
> https://autobuild.buildroot.net/results/492/4927e93e40ec8bcda107f4bc3d8aa83024deb674/
> 
> Fixes:
> https://autobuild.buildroot.net/results/48a/48af80bdda62ca70d73bc01e0939f548c3736c0d/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...es-to-address-V.17-fixed-point-issue.patch | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 package/spandsp/0002-Changes-to-address-V.17-fixed-point-issue.patch
> 
> diff --git a/package/spandsp/0002-Changes-to-address-V.17-fixed-point-issue.patch b/package/spandsp/0002-Changes-to-address-V.17-fixed-point-issue.patch
> new file mode 100644
> index 0000000000..39aaa5a5d4
> --- /dev/null
> +++ b/package/spandsp/0002-Changes-to-address-V.17-fixed-point-issue.patch
> @@ -0,0 +1,116 @@
> +From 239bf2f6a80bbfb6ef92418ceb5402d1fb256a2b Mon Sep 17 00:00:00 2001
> +From: Steve Underwood <steveu@coppice.org>
> +Date: Fri, 18 Aug 2023 01:24:21 +0100
> +Subject: [PATCH] Changes to address V.17 fixed point issue.
> +
> +Upstream: https://github.com/freeswitch/spandsp/commit/239bf2f6a80bbfb6ef92418ceb5402d1fb256a2b
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/spandsp/private/v17rx.h |  2 +-
> + src/v17rx.c                 | 30 +++++++++++++++++++-----------
> + 2 files changed, 20 insertions(+), 12 deletions(-)
> +
> +diff --git a/src/spandsp/private/v17rx.h b/src/spandsp/private/v17rx.h
> +index 8ea7a9fe..8613b5a5 100644
> +--- a/src/spandsp/private/v17rx.h
> ++++ b/src/spandsp/private/v17rx.h
> +@@ -97,7 +97,7 @@ struct v17_rx_state_s
> + 
> +     /*! \brief A measure of how much mismatch there is between the real constellation,
> +         and the decoded symbol positions. */
> +-    int32_t training_error;
> ++    int64_t training_error;
> + 
> +     /*! \brief The proportional part of the carrier tracking filter. */
> +     int32_t carrier_track_p;
> +diff --git a/src/v17rx.c b/src/v17rx.c
> +index a823dad2..295d26a9 100644
> +--- a/src/v17rx.c
> ++++ b/src/v17rx.c
> +@@ -64,6 +64,10 @@
> + #include "spandsp/dds.h"
> + #include "spandsp/complex_filters.h"
> + 
> ++#if defined(SPANDSP_USE_FIXED_POINT)
> ++#define SPANDSP_USE_FIXED_POINTx
> ++#endif
> ++
> + #include "spandsp/v29rx.h"
> + #include "spandsp/v17tx.h"
> + #include "spandsp/v17rx.h"
> +@@ -389,7 +393,7 @@ static __inline__ void put_bit(v17_rx_state_t *s, int bit)
> + /*- End of function --------------------------------------------------------*/
> + 
> + #if defined(SPANDSP_USE_FIXED_POINTx)
> +-static __inline__ uint32_t dist_sq(const complexi16_t *x, const complexi16_t *y)
> ++static __inline__ uint32_t dist_sq(const complexi32_t *x, const complexi32_t *y)
> + {
> +     return (int32_t) (x->re - y->re)*(x->re - y->re) + (int32_t) (x->im - y->im)*(x->im - y->im);
> + }
> +@@ -954,11 +958,12 @@ static void process_half_baud(v17_rx_state_t *s, const complexf_t *sample)
> +         else if (s->training_count >= V17_TRAINING_SEG_2_LEN)
> +         {
> + #if defined(SPANDSP_USE_FIXED_POINTx)
> +-            span_log(&s->logging, SPAN_LOG_FLOW, "Long training error %d\n", s->training_error);
> ++            span_log(&s->logging, SPAN_LOG_FLOW, "Long training error %ld\n", s->training_error);
> ++            if (s->training_error < (int64_t) FP_SCALE(20.0f)*FP_SCALE(1.414f)*constellation_spacing[s->space_map])
> + #else
> +             span_log(&s->logging, SPAN_LOG_FLOW, "Long training error %f\n", s->training_error);
> +-#endif
> +             if (s->training_error < FP_SCALE(20.0f)*FP_SCALE(1.414f)*constellation_spacing[s->space_map])
> ++#endif
> +             {
> +                 s->training_error = FP_SCALE(0.0f);
> +                 s->training_count = 0;
> +@@ -1055,19 +1060,20 @@ static void process_half_baud(v17_rx_state_t *s, const complexf_t *sample)
> +         /*endif*/
> +         if (++s->training_count >= V17_TRAINING_SHORT_SEG_2_LEN)
> +         {
> ++            /* TODO: This was increased by a factor of 10 after studying real world failures.
> ++                     However, it is not clear why this is an improvement, If something gives
> ++                     a huge training error, surely it shouldn't decode too well? */
> + #if defined(SPANDSP_USE_FIXED_POINTx)
> +             span_log(&s->logging, SPAN_LOG_FLOW, "Short training error %d\n", s->training_error);
> +             s->carrier_track_i = 100;
> +             s->carrier_track_p = 500000;
> ++            if (s->training_error < (int64_t) (V17_TRAINING_SHORT_SEG_2_LEN - 8)*FP_SCALE(4.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
> + #else
> +             span_log(&s->logging, SPAN_LOG_FLOW, "Short training error %f\n", s->training_error);
> +             s->carrier_track_i = 100.0f;
> +             s->carrier_track_p = 500000.0f;
> +-#endif
> +-            /* TODO: This was increased by a factor of 10 after studying real world failures.
> +-                     However, it is not clear why this is an improvement, If something gives
> +-                     a huge training error, surely it shouldn't decode too well? */
> +             if (s->training_error < (V17_TRAINING_SHORT_SEG_2_LEN - 8)*FP_SCALE(4.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
> ++#endif
> +             {
> +                 s->training_count = 0;
> +                 if (s->bits_per_symbol == 2)
> +@@ -1136,11 +1142,13 @@ static void process_half_baud(v17_rx_state_t *s, const complexf_t *sample)
> + #endif
> +         if (++s->training_count >= V17_TRAINING_SEG_4_LEN)
> +         {
> +-            if (s->training_error < V17_TRAINING_SEG_4_LEN*FP_SCALE(1.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
> +-            {
> + #if defined(SPANDSP_USE_FIXED_POINTx)
> +-                span_log(&s->logging, SPAN_LOG_FLOW, "Training succeeded at %dbps (constellation mismatch %d)\n", s->bit_rate, s->training_error);
> ++            if (s->training_error < (int64_t) V17_TRAINING_SEG_4_LEN*FP_SCALE(1.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
> ++            {
> ++                span_log(&s->logging, SPAN_LOG_FLOW, "Training succeeded at %dbps (constellation mismatch %ld)\n", s->bit_rate, s->training_error);
> + #else
> ++            if (s->training_error < V17_TRAINING_SEG_4_LEN*FP_SCALE(1.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
> ++            {
> +                 span_log(&s->logging, SPAN_LOG_FLOW, "Training succeeded at %dbps (constellation mismatch %f)\n", s->bit_rate, s->training_error);
> + #endif
> +                 /* We are up and running */
> +@@ -1157,7 +1165,7 @@ static void process_half_baud(v17_rx_state_t *s, const complexf_t *sample)
> +             {
> +                 /* Training has failed. Park this modem. */
> + #if defined(SPANDSP_USE_FIXED_POINTx)
> +-                span_log(&s->logging, SPAN_LOG_FLOW, "Training failed (constellation mismatch %d)\n", s->training_error);
> ++                span_log(&s->logging, SPAN_LOG_FLOW, "Training failed (constellation mismatch %ld)\n", s->training_error);
> + #else
> +                 span_log(&s->logging, SPAN_LOG_FLOW, "Training failed (constellation mismatch %f)\n", s->training_error);
> + #endif
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
