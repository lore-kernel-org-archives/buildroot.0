Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFF0C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 20:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B543844DD;
	Wed,  5 Jun 2024 20:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wfloCCZSkFZ; Wed,  5 Jun 2024 20:34:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F9068448A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F9068448A;
	Wed,  5 Jun 2024 20:34:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BCEF1BF5A9
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 355DC40363
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEGiRwwtcJZB for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 20:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37423402E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37423402E9
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37423402E9
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 20:34:17 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4215b0bffe1so1227445e9.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 13:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717619656; x=1718224456;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wT3YMnN/egMY2UZj/+kohBQCF/Q6qeRr424h553eoeg=;
 b=HxNkN2L1R1M9424Uw7rGfwuotnRQ15lAQTSwUgzqyB261RgLdmGG9D7z6UjkyN8oWM
 UuhYoVNUiOPnw6QATrSutPCvLffFQq65KSqU7Qg0OcMDKcCcvZ/oFctRuUuXK4X2B5da
 KOzKW5F9vvn0CN41hqLzC8AX5019tEbRDFByWYW7Bz/CJIzRGP0lBmVWx8b9fVjK5MIi
 AhTSg2N5CaWndE2oyij34vsrmEps+W/lBtGaEmxnEioXI7LDyxtuT02IYENzMsUeudIj
 dDnc2LWs7ugS9iDwAcdq7ME6LfmOqXTck4XDGKyC2EHHn4ofqoQGrtudLe7DlT6pL269
 ZHig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWynkrkZp8rT5v9qOyN0dY/dK94jpgNZ/JfTZxDrq42rn4D71k+tOiY66K3wE0LXzRnrfKKSxyEg0nGcVIRhbHM2eQGoAN2ow==
X-Gm-Message-State: AOJu0Yzegjr9Ig4TVCzTfNwzKD1hb/m0B0dXK3JyjkbwV1hAhsUft2uF
 6lSb2YvIMdiwORcU0JQTV9ciVf/jGp/GPWSgmvbMzY7uoRB02SUA8VZbAIhaZ2AIImuYG8V7lSf
 q
X-Google-Smtp-Source: AGHT+IFdTrbLetmZZXsEytE2FJ2tzFPDe8o3sepJ9H/C2kVQ0xA015Qcm/9VanpPDFGNsO369U/7Lg==
X-Received: by 2002:a05:600c:354c:b0:41b:d6ca:eefa with SMTP id
 5b1f17b1804b1-4215ad02aecmr5918055e9.16.1717619655835; 
 Wed, 05 Jun 2024 13:34:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158137402sm32319995e9.38.2024.06.05.13.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 13:34:15 -0700 (PDT)
Message-ID: <074064a0-3ca4-4dcc-b034-e42d5fa7011b@mind.be>
Date: Wed, 5 Jun 2024 22:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
References: <20240604090915.10444-1-paul@crapouillou.net>
Content-Language: en-GB
In-Reply-To: <20240604090915.10444-1-paul@crapouillou.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717619656; x=1718224456; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wT3YMnN/egMY2UZj/+kohBQCF/Q6qeRr424h553eoeg=;
 b=bXUwid5LJC0ar+wIBfZ9Oe8/3vZC0skIh+c6748XYANg1RGkOMW9eWU9+XvbXSVeIh
 +F+gyV/wogIIzWbCkL0f6EowvSZwFfq1S4ip3zCkmAyQVr1aowwVjFhXqAGJFE8z5dno
 1vdvl+Z4aHaN4TRF4HxArwNW5lmNupoq9fdOOgoedevfCrwV5b0HeDrt9iMWijo0x3QY
 hSaoV+s6jftZpgbQ+3eocGZkreDPxm2Lct2Gm1dkVzJBL10+P8ZUljGEvFF67yOfySrX
 OScRsIGPWdYnvaOmfMpXvGaKRkRidBP8Lw9rVbAjC294tS6lbNMobFcO5hnjhOeUtJo4
 AsZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bXUwid5L
Subject: Re: [Buildroot] [PATCH] package/lightning: fix build on mips64 with
 n32 ABI
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/06/2024 11:09, Paul Cercueil wrote:
> Grab commit 778d326740f9893c398f959b419629935b613099 from upstream to
> fix the build on mips64 and mips64el when the n32 ABI is used.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/27123bf0ddc84599bceb02ac987327817d498659/
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>   ...ips-Fix-build-on-MIPS64-with-n32-ABI.patch | 132 ++++++++++++++++++
>   1 file changed, 132 insertions(+)
>   create mode 100644 package/lightning/0001-mips-Fix-build-on-MIPS64-with-n32-ABI.patch
> 
> diff --git a/package/lightning/0001-mips-Fix-build-on-MIPS64-with-n32-ABI.patch b/package/lightning/0001-mips-Fix-build-on-MIPS64-with-n32-ABI.patch
> new file mode 100644
> index 0000000000..00e5eee8fb
> --- /dev/null
> +++ b/package/lightning/0001-mips-Fix-build-on-MIPS64-with-n32-ABI.patch
> @@ -0,0 +1,132 @@
> +From 66a9a994c03d65fc37d701a60b26506bede49ae1 Mon Sep 17 00:00:00 2001
> +From: Paul Cercueil <paul@crapouillou.net>
> +Date: Sun, 2 Jun 2024 22:35:24 +0200
> +Subject: [PATCH] mips: Fix build on MIPS64 with n32 ABI
> +
> +The build on MIPS64 with n32 ABI was broken for a few reasons.
> +
> +- The _movi_d_w() functions had a different prototype in jit_mips-fpu.c
> +  than in lightning.c;
> +- The movi_d_w() was still provided by lightning.c even though
> +  jit_mips-fpu.c provides its own version;
> +- The "ww" opcodes were allowed, which was probably not meant to happen.
> +
> +Fixes a build issue reported by Buildroot:
> +http://autobuild.buildroot.net/results/27123bf0ddc84599bceb02ac987327817d498659/
> +
> +Signed-off-by: Paul Cercueil <paul@crapouillou.net>

  Missing Upstream: tag, as reported by check-package.

  Applied to master with that fixed, thanks.

  Regards,
  Arnout
> +---
> + lib/jit_mips-fpu.c |  4 ++--
> + lib/jit_mips.c     |  3 +--
> + lib/lightning.c    | 43 +++++++++++++++++++++----------------------
> + 3 files changed, 24 insertions(+), 26 deletions(-)
> +
> +diff --git a/lib/jit_mips-fpu.c b/lib/jit_mips-fpu.c
> +index 61db30e..8ad97e9 100644
> +--- a/lib/jit_mips-fpu.c
> ++++ b/lib/jit_mips-fpu.c
> +@@ -349,7 +349,7 @@ static void _movi_f(jit_state_t*,jit_int32_t,jit_float32_t*);
> + #    define movi64(r0, i0)		_movi64(_jit, r0, i0)
> + static void _movi64(jit_state_t*,jit_int32_t,jit_int64_t);
> + #    define movi_d_w(r0, i0)		_movi_d_w(_jit, r0, i0)
> +-static void _movi_d_w(jit_state_t*,jit_int32_t,jit_int64_t);
> ++static void _movi_d_w(jit_state_t*,jit_int32_t,jit_float64_t);
> + #  elif __WORDSIZE == 64
> + #    define movi64(r0, i0)		movi(r0, i0)
> + #  endif
> +@@ -1152,7 +1152,7 @@ _movi64(jit_state_t *_jit, jit_int32_t r0, jit_int64_t i0)
> + }
> +
> + static void
> +-_movi_d_w(jit_state_t *_jit, jit_int32_t r0, jit_int64_t i0)
> ++_movi_d_w(jit_state_t *_jit, jit_int32_t r0, jit_float64_t i0)
> + {
> +     union {
> + 	jit_int64_t	l;
> +diff --git a/lib/jit_mips.c b/lib/jit_mips.c
> +index 4fb6c34..6eb41a0 100644
> +--- a/lib/jit_mips.c
> ++++ b/lib/jit_mips.c
> +@@ -2184,8 +2184,7 @@ _emit_code(jit_state_t *_jit)
> + 	    case jit_code_movi_w_d:
> + 		movi_w_d(rn(node->u.w), node->v.w);
> + 		break;
> +-#endif
> +-#if __WORDSIZE == 32
> ++#else
> + 	    case jit_code_movr_ww_d:
> + 		movr_ww_d(rn(node->u.w), rn(node->v.w), rn(node->w.w));
> + 		break;
> +diff --git a/lib/lightning.c b/lib/lightning.c
> +index b40d35b..2c10928 100644
> +--- a/lib/lightning.c
> ++++ b/lib/lightning.c
> +@@ -4331,12 +4331,12 @@ static void _htoni_ul(jit_state_t*, jit_int32_t, jit_word_t);
> + #endif
> + #  define movi_f_w(r0, i0)		_movi_f_w(_jit, r0, i0)
> + static void _movi_f_w(jit_state_t*, jit_int32_t, jit_float32_t);
> +-#if __WORDSIZE == 32 && !(defined(__mips__) && NEW_ABI)
> +-#  define movi_d_ww(r0, r1, i0)		_movi_d_ww(_jit, r0, r1, i0)
> +-static void _movi_d_ww(jit_state_t*, jit_int32_t, jit_int32_t, jit_float64_t);
> +-#else
> ++#if __WORDSIZE == 64
> + #  define movi_d_w(r0, i0)		_movi_d_w(_jit, r0, i0)
> + static void _movi_d_w(jit_state_t*, jit_int32_t, jit_float64_t);
> ++#elif !(defined(__mips__) && NEW_ABI)
> ++#  define movi_d_ww(r0, r1, i0)		_movi_d_ww(_jit, r0, r1, i0)
> ++static void _movi_d_ww(jit_state_t*, jit_int32_t, jit_int32_t, jit_float64_t);
> + #endif
> + #define cloi(r0, i0)			_cloi(_jit, r0, i0)
> + static void _cloi(jit_state_t*, jit_int32_t, jit_word_t);
> +@@ -4803,7 +4803,23 @@ _movi_f_w(jit_state_t *_jit, jit_int32_t r0, jit_float32_t i0)
> +     movi(r0, data.i);
> + }
> +
> +-#if __WORDSIZE == 32 && !(defined(__mips__) && NEW_ABI)
> ++#if __WORDSIZE == 64
> ++static void
> ++_movi_d_w(jit_state_t *_jit, jit_int32_t r0, jit_float64_t i0)
> ++{
> ++    union {
> ++	jit_int64_t	l;
> ++	jit_float64_t	d;
> ++    } data;
> ++    data.d = i0;
> ++#  if defined(__ia64__)
> ++    /* Should be used only in this case (with out0 == 120) */
> ++    if (r0 >= 120)
> ++	r0 = _jitc->rout + (r0 - 120);
> ++#  endif
> ++    movi(r0, data.l);
> ++}
> ++#elif !(defined(__mips__) && NEW_ABI)
> + static void
> + _movi_d_ww(jit_state_t *_jit, jit_int32_t r0, jit_int32_t r1, jit_float64_t i0)
> + {
> +@@ -4821,23 +4837,6 @@ _movi_d_ww(jit_state_t *_jit, jit_int32_t r0, jit_int32_t r1, jit_float64_t i0)
> +     movi(r0, data.i[1]);
> + #  endif
> + }
> +-
> +-#else
> +-static void
> +-_movi_d_w(jit_state_t *_jit, jit_int32_t r0, jit_float64_t i0)
> +-{
> +-    union {
> +-	jit_int64_t	l;
> +-	jit_float64_t	d;
> +-    } data;
> +-    data.d = i0;
> +-#  if defined(__ia64__)
> +-    /* Should be used only in this case (with out0 == 120) */
> +-    if (r0 >= 120)
> +-	r0 = _jitc->rout + (r0 - 120);
> +-#  endif
> +-    movi(r0, data.l);
> +-}
> + #endif
> +
> +  void
> +--
> +2.43.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
