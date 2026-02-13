Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61860EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E0078483F;
	Fri, 13 Feb 2026 19:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IM9GBhr0dBp; Fri, 13 Feb 2026 19:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4064584868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011543;
	bh=8alt5UZnEES5kNG/JXlsQtkj0BIJHq4yKc24BqoIbq4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r4ai7yB3C0wQhiK3y1cqoY1YHlEZN73i8i4HvQJwoOPzr1waewRc+YqxhhK5jS5TB
	 viefZBLAXuSVjXrr7+kG/J7fc60yO8i5J6DjNBWxIMgoxH4fHDGX6oRtGCU23BjQ3e
	 7r+JeKzeh2Kd5qLsTs3gopK0uKLRkU5uue2Zmh9enTUcnN6/o5tDXcQ7r2ngBKtqJT
	 VF3WbfazcdiQYl5JyNpJ9LffB/X8aI3s/oHGPcPOgLerc8eptiU13UoRB531gXEVuu
	 t3hNd/GRffCaFCATAEjlhQfU6Oia0eFuzSGim8d1lIKc7HqMpxbuOuaLYRwmpqvu3b
	 +BJE/grXg8HKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4064584868;
	Fri, 13 Feb 2026 19:39:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 454CD69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C3D441FB5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOb6xoedscWR for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00E0A41F8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00E0A41F8F
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00E0A41F8F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:54 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4362507f396so1237393f8f.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011473; x=1771616273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oUMCG3jtl+2OdUEPjafSue85aGVxMd3hjs3e0OVx6yg=;
 b=gn4++aSiXoKZnyV3BCaOVPIYMM9sVJEE8AbOmApew+Fgzr0VB/XQ0saGmeY5tf03Y6
 6oPB+Y7M3hTm7BFQ4LiFeF/pyJ3riiM1BSfypB9mAlo3rqvuvqJia38B+tqDyqOxBt2A
 sygjgUOVBcC1yB/Vgi+67WhDfxeG7gTlYJi7FTpJb7/UoC1aslysFLz8+OsjgdTDNbdm
 kswqPG7/hxsq5yy4fFIbd7Bm4zQWEm/CjOzG1ok6SBrqH2HgXrguWmco2OHoqtyYq2AA
 qbS2RUKBgz2W/FE5mca8NYeaKJ2qsB9ffU1B44QgaCQOPakJe+ikglp470rt9tK6NVqJ
 v3Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU24JXT1J8mxDgivojhDgpzV+CqE7SDg9C9y30cgJbLjPuHRmbYK/Sk4rWMaBi4XhL94H1Y5qWdlAg=@buildroot.org
X-Gm-Message-State: AOJu0YxSrL6jDDKcWqvXEC5Be1f869dNfxUulmmsFu5BRxTbQJ5WGlER
 b8TnzTegDBcT55QbRaJynNzDiP1m0rd0z60x3ui/XMpOyA/EEf9nZGSPEtB1S3hss9s=
X-Gm-Gg: AZuq6aLtnLcxknHy/77edvWZAUmw7/0fi3viRfIaMZzjyQWlu7yrpTWBaFWbjvA1AAB
 9/T237RB5++dPpdPqXQ2bkSMq3VnhhoFZ8FH/bHkHY9vY7ZfFrWdCw0L44TVoBblIcNZYMfmZA+
 oN4n1+Ckib6NZD91E2ulQTEVDMo3tr1yhP71j6sT7t+SXiurgM8rf6PFGN4uuDgfohBY4dsuhZ3
 83/Hf9DUDVBCG60ugPuyKXVIpezvDyfWn8tqs65bcIbIayLaQMT7GVu/UG1QxRoVTS/ppBpZdhn
 x7rvowez++jkTCMgh3Lqbht9hkXwu3mnodtmGCUxDjl0VYllikJtfV0i1FZkqBX6U+uzUJAAzgy
 q9dOA2RMv/893NefWMsNuRIlXKGn07zXq3c7EKfDVqW3yxSwsXnQ14UnvE675a+M2Y8+IrE6TgL
 hA0BtY96Qsmc9LzXxol9yEAIwSOw==
X-Received: by 2002:a05:6000:430c:b0:437:677b:4a24 with SMTP id
 ffacd0b85a97d-437978cdde0mr6354364f8f.15.1771011472874; 
 Fri, 13 Feb 2026 11:37:52 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5ac7csm7027768f8f.7.2026.02.13.11.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:52 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:51 +0100
Message-ID: <20260213193751.40893-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122185254.1054937-1-bernd@kuhls.net>
References: <20260122185254.1054937-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011473; x=1771616273; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oUMCG3jtl+2OdUEPjafSue85aGVxMd3hjs3e0OVx6yg=;
 b=bfroe1aq5+ESlq2q+OJLVyvJAGGr/RW1iPY81ef72P31tjkHOpPsZcv5yedpBE3BFP
 +w6Rm7OLIb66G9Cb4lj5Kc3SuAg8tSjQkjkbxnGDoVt05fttOfekIP6rKyiARhQxQbel
 xpnBZFKHL2pKcjKK0SsbWNJjogTKcgb29B30aaGqsvMq3dOx/O3dd7CTl1NjfAfyoHtC
 7+f5/5WYVSXSJG9+mwP3GVL+P21YQPSKYfbgQoh5Q+wckH2FGtJ7uvSb1gDbX6RexvtH
 S4mWnRcXsDOTi51Q1qkRKzKIx0O+FUmJ8S9/xE6Q8vlkr0YxdzVHxrjDDPfy3nBsel+W
 3eQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bfroe1aq
Subject: Re: [Buildroot] [PATCH 1/1] package/uftp: needs libopenssl,
 not libressl
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
> Buildroot commit bumped libressl from version 3.8.4 to 3.9.2.
> 
> Libressl 3.9.0 contains a breaking change:
> https://github.com/libressl/portable/releases/tag/v3.9.0
> "EVP_add_{cipher,digest}() were removed."
> 
> Upstream was notified by Yegor but did not add any fixes:
> https://sourceforge.net/p/uftp-multicast/discussion/general/thread/c02c950dff/
> so we force the usage of libopenssl to fix a build error:
> 
> encrypt_openssl.c: In function 'crypto_init':
> encrypt_openssl.c:77:5: error: implicit declaration of function
>  'EVP_add_cipher'; did you mean 'EVP_Cipher'?
>  [-Wimplicit-function-declaration]
>    77 |     EVP_add_cipher(EVP_aes_128_ccm());
> 
> first caught by the autobuilders on 2024-08-09:
> https://autobuild.buildroot.net/results/7da/7dadc662e0a6642e40831a93b788e959498d8923/
> 
> Fixes:
> https://autobuild.buildroot.net/results/a74/a74526181dfc90aff7f56457c430c1aa1d006e54/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/uftp/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/uftp/Config.in b/package/uftp/Config.in
> index b88fb03ae2..a9296e595c 100644
> --- a/package/uftp/Config.in
> +++ b/package/uftp/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_UFTP
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if BR2_PACKAGE_OPENSSL
>  	help
>  	  Encrypted UDP based FTP with multicast.
>  
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
