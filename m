Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63161F436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A2B581C0A;
	Fri, 17 Apr 2026 15:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b059KqJvxEP0; Fri, 17 Apr 2026 15:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C235781D21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439540;
	bh=/X76/swGI0xm7wA8KO13f9u4BCVWrfIxZiiJxcjEJ6Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Au/Mdv6n7Ai+Mx/LOn3mCC67ck9XfjEFTfer9vIDwPvpOp1o2pkXXZTTgmH1RQUzq
	 OmzVmdSFjtzVyCS7OJwbtYrrKucSmMaCvgANPNA8pp/byb/9avUJDcP+RkJ+L6nfOx
	 SPtF7AjkP/cmTfoTpfsgRR3rYsdH3+FXO5EZl3+ItI83rpwDN37GS9KI2zNoc2EqRD
	 DfAoltGUJpk8ywrOkb7jI2HQWpbVuLN0ab9HiI8n1+kjHLXdDdRuQV+QX1MZWIuNyG
	 9OLKOJwVnIjVGB/0wqC4P0aAF7XsmINsbo/0SxS6atj9HM7aHk5Ipt8+Ftk1LQiNHe
	 alZBHgXmeCv3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C235781D21;
	Fri, 17 Apr 2026 15:25:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A78B2259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 994E681BA9
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2VHa-MdEbjoM for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9527181BC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9527181BC5
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9527181BC5
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:33 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so11298155e9.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439532; x=1777044332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J0vIFOkO5n//271JpXkeag2CvGTxYQ1qzErlXlFGhz4=;
 b=mkn+Mz13KGEhA/hveq1T2rTCiA81HMAXa3oA6Kgw5wWWHv6rTcshd2vXzVv4pVQPOE
 pZzOGts0OqQuT44haMOSJQ8/Z2Ovdqulg5qaRToUcYmy7r0ZaCr/3Hscm7i4x8wCmK9x
 yyctPkdB9wspYSmDRRkQ0wxAdqjNjiIMlzkfgvJk4KP8hqK9b9D0B5alPtx/B8OvmdQQ
 n3UBbYze3ivIIH5Z0o+Iv5P6Qt9mloeIOBOh6/n8Iw20qwDRVThA0cptj710Ptf/HvQK
 MlI7MVsG8/soXXKlvHTfeeyzxQa8bjZjTC6Ay0B/Y0EruAlCMf66VVvqLjljT4cbAI2J
 U3/Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8C7INe1o1S0OF0NMnjV2zMPrImUxDbVyk7QrQxv0UJj95RfWvz1E9VxuVo7HVuttoCj0o2QMn5tEk=@buildroot.org
X-Gm-Message-State: AOJu0YzRIqcwq3VwE71RuBm9nWaLDnmOpVfqO7WiVh6LIOJEOTqlr7QT
 5GDshMIv9vJ+9pYmEI6hrDL/aab1aGCUmkRfFD0aTpTeX9zeIfTlGVILZXrjwnr3kUsdFHwt8fR
 rjrHk
X-Gm-Gg: AeBDietE+2S3Hsci1JgZe/u0l1CBJ0HFJ0aHRlbMWLQPAwGIxWphk/HPSsleIBe7OQq
 nSVJplZFzCjYfjgLSANJMw/j2FYeJioU6eL2pp+zIMsNgt6Bpm1TO2Qc16DjWb59wA+lPKn3www
 S23UwQgZqBvs89eLIba/sG1pdJ03ACGbaNOrv+V5qisxdeIRTL9Y0c7WAL9G0XVyJk9cQh/9oyC
 1Z0WhjtuC3CKdAj/+wBSMlQ4jxCbU7pMeSnv85VIL8obSIRGZLeysJ4lG/FJ8R/7pr1v3rTp27f
 zujiktoVfWvNOg0O2r4qaiswDrIs+chzyCM7XCfMX9EVAbj0skJgXQp2zSTAQuSREoO9xNW9FHg
 MscWVzDaxdwJpXGts40aGZCUAgmxUl0XS6/AjKzMVo61OG4RjkfGMmnbCBlugtotW0hkw/FzSFn
 r8SStySgdlF28tLMGv42Hb2jXnc3BGchFHi/RggQ==
X-Received: by 2002:a05:600c:c171:b0:485:40c6:f507 with SMTP id
 5b1f17b1804b1-488fb793228mr50759165e9.30.1776439531667; 
 Fri, 17 Apr 2026 08:25:31 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7bf7besm21982885e9.34.2026.04.17.08.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:25:31 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:25:30 +0200
Message-ID: <20260417152530.314305-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409131639.278687-1-bernd@kuhls.net>
References: <20260409131639.278687-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439532; x=1777044332; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0vIFOkO5n//271JpXkeag2CvGTxYQ1qzErlXlFGhz4=;
 b=FfX+EeE4SY0wEkpTn28W1tYfLZyWWWZI6PBm8GUkZxDnFB3fc8Zi9znTZofoS7A5WG
 G0/1GYY+XuMJijOd7HKtybBk/n1eTDHSFtweNEJtCvIE/h54tbTO05DVBWIIp5ryda3C
 yLYP/JuatDvCYVJejWkkSkmHVs2Aqcqi9qqXXkKJ6JNzOOyve9ojZyPAffEOPa+F+JuF
 7xSR1W2UNcVVgrRBR9Ou9j8lVmSzG45WRY3XRBbNCOHbHqieDWCCBwERddG73HQX666a
 UN/iJpUDn/8cUIGI+TizB6NMkmlFK37ttWNHJBNeTPt9DAAINYH6FLSr027YLxv/Gkcb
 YD4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FfX+EeE4
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: security bump to
 version 1.6.57
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
> https://github.com/pnggroup/libpng/blob/v1.6.57/ANNOUNCE
> 
> Fixes CVE-2026-34757:
> https://github.com/pnggroup/libpng/security/advisories/GHSA-6fr7-g8h7-v645
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libpng/libpng.hash | 6 +++---
>  package/libpng/libpng.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
> index ae28eee087..977f8fcca4 100644
> --- a/package/libpng/libpng.hash
> +++ b/package/libpng/libpng.hash
> @@ -1,5 +1,5 @@
> -# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.56/
> -sha1  71eb3636e60b6ea66f2f670cdf1f7160b7a1fa8b  libpng-1.6.56.tar.xz
> +# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.57/
> +sha1  866fb81e3355088bb885bb4ded39093ef80eb686  libpng-1.6.57.tar.xz
>  # Locally computed:
> -sha256  f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18  libpng-1.6.56.tar.xz
> +sha256  d10c20d7171569804cae8dfc13ba6dcd0662c41ed39d43d4d429314aafb10a80  libpng-1.6.57.tar.xz
>  sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
> index 7c5bc35a77..0081406300 100644
> --- a/package/libpng/libpng.mk
> +++ b/package/libpng/libpng.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPNG_VERSION = 1.6.56
> +LIBPNG_VERSION = 1.6.57
>  LIBPNG_SERIES = 16
>  LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
>  LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
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
