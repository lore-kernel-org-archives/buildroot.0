Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6CBF436B9
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70D8F81253;
	Fri, 17 Apr 2026 15:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehAz7ET976br; Fri, 17 Apr 2026 15:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DA2680B32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439481;
	bh=WvfKMXq3uqzeTZMaGt4l/e8shG0f2jrY4WHY6S2PFCE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mhuVNVmwzGgGCTlG2kf6Jv1vKju/9xCKVfYy/gxflRgFYkXDLBU5+B9iJPK8lfE97
	 euGwcQZXFi7UsUGPdIl5+S+SIeLWnwGkMjSTMZYn0s7fkInXcUrmN9a3Xn2RAfDx+F
	 aDHyedS1hNcVYfHjdLoEU8MPA3oZollsGUbr6a/mAjX7eSVBMkL/SABEOhsb4Pjqir
	 cPNq0DTsNxGcwfvCVWQzcIQ9gmOYo1rIxYdU0XsDaZAhDOYFKFix4E+Rrnd3lT/h5R
	 TXhSJSXg5KTQEI7+5CTghypRRdU3G+Rd77CBB8ZEuOywv5n2qxbPsP5gcmgWqpOraX
	 D1SwHNKoWayyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DA2680B32;
	Fri, 17 Apr 2026 15:24:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14C8A396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06F4F81518
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXPHohEO21Qf for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:24:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E030080FF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E030080FF3
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E030080FF3
 for <buildroot@busybox.net>; Fri, 17 Apr 2026 15:24:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4887fd35e60so5353175e9.2
 for <buildroot@busybox.net>; Fri, 17 Apr 2026 08:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439476; x=1777044276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FJCkOvpcVixkQqKEfKJdGDYqphvsg4aLT+4lB2caDoc=;
 b=icvMjnvkhZEYUF5lnVMisoLybLyfTPNm0sTRklXpWA3FVUpiM34MXTWM0rUl89ZVud
 v7wye49Llbq11AzRjGLJV+8TCa8nqckzQ7mPwXxRdF6j1cfU1M4dsvv5/sGl8vEVCqqV
 G67JWYRSXEa5o8i5mRBTmK8eyA5cF7RexURwvA9vuyN7UKejIo5uh3MK95V8IWZO1GlL
 pgLKMpEqkWGwdcMxZBz9fTwx30eqJ2fbKVcGXwDhU7ulDqRWtTJqwTivzRv1JFVqpcxH
 tXn37EpNGcUbywqeFqu2ITJ7zA1nbDRS4XOsodjgnkcQoUvo242RN5p7qL+XO8D3AOg8
 6UUg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8SL9jsJy9lZBtWKzGupaLqRWthUusf+K/IoOHUQO8MZKvTeve7GksYbsyMBzOWR7xsetNBO5pHOOA=@busybox.net
X-Gm-Message-State: AOJu0YzDfBdbJ2YGTmmKVuYFUM/dNOgQqXozvXHWdAKHFVTy8TGsE+zw
 022RqiW2MELnPQ/ITqP+vlnD+wGCW8bwRwYuNpMa8LHWabNI8ePcW+gPGbrNhzQ8ro5LRr5WazZ
 lSds3
X-Gm-Gg: AeBDietJ4MZpgPA7O/qz5kCdkUlVfVExQ8MAoPJemIOkWsn2Pj8nUp7q3QqTymXrowl
 enKhVP7qKtF2MmtBT5LEsMs3M0SeaUnNlPNFH+6DdSiJHQ2PMZVsaUJaINShjMl7Vz8YrhAmeCV
 xeMm/i146hD9Z5U5a+GQ6QPLunuLvGs2Z9GMYY/hsLZ0tPUxal07F2dqC8KVpaxv8Gu82o+XX5i
 bvb/+Nk/gByDBF+Z2Fvc1Rvf/C3l7H5B6sxOnUb49NKvPYL+nFz2w/vBbVt5VoWQGByX9UHBozp
 gjz/qSxX09dmoyLNAXTa2LGmqGF8xGugRPj5XgsiV9rwFuV1bxoFO/fTrqe1pJkwmt+Y0yEBKLe
 ckQxkrCT0FwAZxnzlsoc8AbgGUsN49J0t/dH7469S7OeE1dCPaNdyZLKQRbtbhO3hCnWkYCfLVL
 QRLhxT+L7o/Bd6Oh4Oj3oSUG/UF04=
X-Received: by 2002:a05:600c:1da1:b0:488:79a3:f04c with SMTP id
 5b1f17b1804b1-488fb7863femr51061415e9.27.1776439475846; 
 Fri, 17 Apr 2026 08:24:35 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc143a0fsm54860315e9.14.2026.04.17.08.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:35 -0700 (PDT)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Fri, 17 Apr 2026 17:24:35 +0200
Message-ID: <20260417152435.312734-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250516113040.1926881-1-francois.perrad@gadz.org>
References: <20250516113040.1926881-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439476; x=1777044276; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJCkOvpcVixkQqKEfKJdGDYqphvsg4aLT+4lB2caDoc=;
 b=f4ZvWs2qK0jLO5PEEMmqDz4XrChYfbIF+sNWqfsmN6vZyA6LR0596eon0OHkXtayTq
 XK7CxM9HiOOEtVWj1tLAXHHzQuA3zFhnLqANzrmHX3713fnc+MUM31QuJ1YwLx6N6NGN
 X64vdL+8RX24uTI/CRrSVfn5PFjXAsXqKjeMBNtvELx568Qm1hD5JAYvy2EqU5QMGFpU
 OGhsQCuFcbPuBOjaI7++WHq0z1e2UkqN050yVGL2hTeNss4eTEogKC94FIp0m7/GgZPs
 U5oEj9szIQ5iWtZYzVhIj6B3EWrNtjDCQo5cyLmZh3WSLrokoVAXKQD4NsHJwb+79+7Z
 i7GQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f4ZvWs2q
Subject: Re: [Buildroot] [PATCH] package/quickjs: bump to version 2025-04-26
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
> diff LICENSE: removed trailing space
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x. Thanks

> ---
>  package/quickjs/quickjs.hash | 4 ++--
>  package/quickjs/quickjs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
> index 30613b982..798c857a1 100644
> --- a/package/quickjs/quickjs.hash
> +++ b/package/quickjs/quickjs.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  3c4bf8f895bfa54beb486c8d1218112771ecfc5ac3be1036851ef41568212e03  quickjs-2024-01-13.tar.xz
> -sha256  f41baf09eef895d468d18c23055d74f711e4b8b2641cef279b5d71285c07bfe8  LICENSE
> +sha256  2f20074c25166ef6f781f381c50d57b502cb85d470d639abccebbef7954c83bf  quickjs-2025-04-26.tar.xz
> +sha256  598fd7fc928e4350abce36e337ba5a1346923c5c692f5be92c3d8e29ddd7c18d  LICENSE
> diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
> index 2bd9da139..e2170b297 100644
> --- a/package/quickjs/quickjs.mk
> +++ b/package/quickjs/quickjs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -QUICKJS_VERSION = 2024-01-13
> +QUICKJS_VERSION = 2025-04-26
>  QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
>  QUICKJS_SITE = https://bellard.org/quickjs
>  QUICKJS_LICENSE = MIT
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
