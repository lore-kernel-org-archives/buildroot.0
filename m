Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9ADCD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BC6F41F9B;
	Fri,  5 Jun 2026 12:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1Y2J10CJFBm; Fri,  5 Jun 2026 12:50:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36F6541F99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663837;
	bh=xF9n2byJ/n+fJFCIstO86RyYLnm9x0d+k7Nt9qHWTOg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fvkfjt1kiZsuQs8XGZYRR0whumyq/BCuTsOGls42zhldRi5rOoI9jnLtJ8I3jFgyf
	 QpI7xzhfPPZWPDeZeptt+yoV3FhoH8o6p3lPtplt89i8uYWYdJmRVrE+Gx2BFOWELM
	 Oukt+eCZwiK4dnq/HGSMZ7b35XEk8FkvbBApIqYuZJy/M9ZX9Hx4tsLtLYlAmI2KQo
	 /5nOOCskQqXhe0GJAcKYFUyBLXULhccD6AA4B8yD/JU/S7KVyOG28G20yIa550+/IA
	 2DtqEXS2kzWyjjx8vlk09QZIMOhaHEJNEdk4BIgM4DdVjE68fIwQa6LwlJDTkeXUUN
	 8P6RVIvNUNjiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36F6541F99;
	Fri,  5 Jun 2026 12:50:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27D8BF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1905E4037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAs86aY9V1OL for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 023CC4037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 023CC4037E
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 023CC4037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:29 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so22630655e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663828; x=1781268628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O/9QJNCYZbBrEnxxbDXiEtYKaiYmnnBUfT5XimM9ysw=;
 b=PQHFFQpCvgnwC7zKa+zw1fxRV/KuFM/YjCmTkBLDaFsUwjp3NnQgEOE+atbRKuRPl3
 eNTPSmfp415gGNvYvnbBKPo9LpCX6RfVeDZViL47TEB7HX7Ogd19+ZhDqdm9zhw0om0N
 f6jNPpSgnWuZ1WEq48m9546F/jY2/HsbRB/EQqlv15AF8zOnxRReEwSLVVhqa3G+44Ug
 /zEDq1XOhIZvaFGlPdfPEmTiJ69u9BTp1AqBbj48GQ11X50wNIXFcyXP5RiyGP+u1FAZ
 dMS3LZvM5Cj1T7gg/BIezLpq2b5bBJN367ttiCz3FoAd1NjCuJtL/UVUOIOkUoSQG+YN
 9rEw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/xRKo/UFXShQZCT66110OmohbpPu83NxCrEC9DqBfgMc7P2RUd2zun2tep4lFi2hx6YEC4OLVTAHQ=@buildroot.org
X-Gm-Message-State: AOJu0YyHJXBAx7MxN5eikYGsZHNzq6TwKiL6LGtjCR7sEagN5S4ReC5R
 qJ32pePvnMnVanbPCx7ScM0GTXN32NNaoDjs7PQKEi1ITvMpaI3flw4moMp7hg2iSB8=
X-Gm-Gg: Acq92OGr7P8ZZEN/mLUciuq4mPMhRhKzWuKpgg7vHvbfEc7njRwKaH2xzrhNoWGF1am
 T/5fpFAy+ispZqQW7YSMiM429UGMAF+RF/p7bTx4BdO4kSqokxNalWWTxleN81FZRQPxoEXgf3F
 PMlCbJh11uhm8oi8OMiZ8iUyPXNyDEC1K6sjSLysncp15rcH+HfP7qizNGEMoB5rSma9c/nKHBh
 e7CHGki9NCH9AYx5SHPxFxhLEqb3dQIcsxh8AO38lAq8dU2rinLghvXkgiMmVNQce3I5lX3Jzp+
 s1mEfbwjZEw1qcAZ5pMRFoRlbue+TugTPIFg4CIIdPd74NedmF5ZxoCgl/HtTGHree1mTqXyxCO
 dEwvPJ/R24KoF3pSlt+ALVnzcQIRauorTYZfKzrsGTpVuGFLEmcZx1hp3T6PGf9Y/R+rxm7VEsA
 31WeI0N1zUdYPwN+BgdF1a4vRm0A==
X-Received: by 2002:a05:600c:34cf:b0:490:b8e2:6380 with SMTP id
 5b1f17b1804b1-490c25b1243mr57771445e9.12.1780663828023; 
 Fri, 05 Jun 2026 05:50:28 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2f5612sm24396516f8f.15.2026.06.05.05.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:27 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:27 +0200
Message-ID: <20260605125027.273533-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260418215536.55054-1-bernd@kuhls.net>
References: <20260418215536.55054-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663828; x=1781268628; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/9QJNCYZbBrEnxxbDXiEtYKaiYmnnBUfT5XimM9ysw=;
 b=H+xI1ZZdR5LcGf2oJRCtzT5W+maoJISUTvJSsBh2kIov2Oy/aBXjpcK19DgNRIspwx
 Otf6PkWQRXXOeg6S8tjcByGxSn9oq2/bDipg0bArNGnboDj6E0oFGwInPwTu7IrStlxT
 jozsn5lBi6j3uHdvrzbny+a6fS8EmlBmYxT1cY7K2HfmC5+zam/6pd+3+cNaBwKJ0nC9
 2S1Vaqn6pQf7HJ1sBEhmPedWhtN95qBUfaZK2p75kjznzXV9tL2e6TNlS1/HLLYQlqqo
 Eq//SHy5JsUbIl4fAXvZ98WkkKYYXmqjeDBXbHe3GrUYhmwzGrNEcKnH+pDebK0btygb
 OINA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H+xI1ZZd
Subject: Re: [Buildroot] [PATCH 1/3] package/jemalloc: fix build on
 m68k/uClibc
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
> include/jemalloc/internal/jemalloc_internal_inlines_a.h:16:32: error:
>  implicit declaration of function 'sched_getcpu'; did you mean
>  'SYS_getcpu'? [-Wimplicit-function-declaration]
>    16 |         return (malloc_cpuid_t)sched_getcpu();
> 
> Added -D_GNU_SOURCE to CFLAGS because
> 
>   extern int sched_getcpu
> 
> is wrapped with __USE_GNU:
> https://github.com/wbx-github/uclibc-ng/blob/v1.0.57/libc/sysdeps/linux/common/bits/sched.h#L80C1-L80C17
> 
> Fixes:
> https://autobuild.buildroot.net/results/57c/57c68aad9abcce7621fbff52081da041485e8830/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/jemalloc/jemalloc.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
> index bd8a2d7654..0c46f65029 100644
> --- a/package/jemalloc/jemalloc.mk
> +++ b/package/jemalloc/jemalloc.mk
> @@ -12,11 +12,15 @@ JEMALLOC_LICENSE_FILES = COPYING
>  JEMALLOC_INSTALL_STAGING = YES
>  JEMALLOC_CONFIG_SCRIPTS = jemalloc-config
>  
> +JEMALLOC_CFLAGS = $(TARGET_CFLAGS) -D_GNU_SOURCE
> +
>  # gcc bug internal compiler error: in merge_overlapping_regs, at
>  # regrename.c:304. This bug is fixed since gcc 6.
>  ifeq ($(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
> -JEMALLOC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
> +JEMALLOC_CFLAGS += -O0
>  endif
>  
> +JEMALLOC_CONF_ENV += CFLAGS="$(JEMALLOC_CFLAGS)"
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
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
