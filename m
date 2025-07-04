Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F22C83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AA7F83DC9;
	Fri,  4 Jul 2025 06:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdJ9vzVo5mHx; Fri,  4 Jul 2025 06:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C25FE83D4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C25FE83D4B;
	Fri,  4 Jul 2025 06:47:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 359C37AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27DB440FA3
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jj2nlx4uvlyA for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:46:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4069040F8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4069040F8C
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4069040F8C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:59 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso401451f8f.1
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611617; x=1752216417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MUgxZiyc+ynr9vztsq2QH/od8Grc63d/Fd28D60N8oA=;
 b=aDmQzgtobx900lmJRYOEWLGGGlYbdCzFClIqMnqWl+ElcXICtGTEjFNrwx8Gyjx22m
 nAgUBIQ59E6uWM3fQcIGeyGkaL13xIQ8kSh+tQ5yGJXQulZKyugRfL5aaYr2ZrLxVJkp
 ONmP8zC/FpHU5u0DEtP+A9hmtV6+kIpHMbJ0mi86EJz7Ghjm5OL1R50Y8JgZaabFDfJM
 owtpe/Y1YwH70ceqjGSAWVz2JFy1YTnu/dEfUF8H/zZkrMWoSAi/D3EXh8tmB9bMWIxw
 SR89l4zbfrsHYXxMy+D0g8b1/k8G4bxTstXE9lOCmkdJ0byxOG6T/8ewQVaavs9ZRmnI
 ZP9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7CtUKS7eIZAvijZXz4FdbglsshnUAl6Fy1hTbR21mvYGzDqo0tIxiS4Bviy/0uicZfsuw0tqv5j4=@buildroot.org
X-Gm-Message-State: AOJu0YyiEP05Y3GQ1sknXAQPDhaH8f0hmLLQSr4HoVTLX0w195ZUUZ5J
 ac7grShU70SgjLP2sTee1e5+EHtLJB7AsE9VGqKhi1i8V6rFBdHfw3ew1ZsvJIpJbpWrXl23Q1M
 yMnIi
X-Gm-Gg: ASbGnctCZqSCUQetorE9l1/WdDLDFSCtoOIlOZwkyyj8Qa7aFxmSLDat1A6hw7rvzVu
 uGT7fFFpHaVXmSkHiFxC+D5pY2kuYarvU91rcDyQugM6+iHwjrmaBXrnahOF2SazEAW31OcMXYB
 uJ8CSl853IMddX+0KH2olsyqGHN4ipdV3odD1b81PKewEsEUxZQHbEWv3tCJsQzT1ipA7UQiC34
 tc+P3tBdT0m+TpCe29WEo2LQ2QDz/zTxEwwP+hivYAUAvd+l4FbTeZZsSiRLulDSIwcDwmQ3wKm
 HtVDBp5MhJRsPOTJkQjFocsoc6HyphmQEVaP/pEzTb+VgD7bYrXL0l1Ts4ztZJ6TxzyytBPC4EN
 7PbUBKFO4Lw==
X-Google-Smtp-Source: AGHT+IHcME2S6L2sWfMN7FPPO9d/b8rB4O607+jj4zeq2etDQ6vkxPqBkqTk8gnrr4MzwaBCGUVJiA==
X-Received: by 2002:adf:a382:0:b0:3a4:dc42:a0ac with SMTP id
 ffacd0b85a97d-3b4966273ffmr617868f8f.49.1751611617207; 
 Thu, 03 Jul 2025 23:46:57 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a997b1ecsm46772715e9.11.2025.07.03.23.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:46:56 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:46:55 +0200
Message-ID: <20250704064655.4064299-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625125220.104466-1-peter@korsgaard.com>
References: <20250625125220.104466-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611617; x=1752216417; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MUgxZiyc+ynr9vztsq2QH/od8Grc63d/Fd28D60N8oA=;
 b=a+JEpbucm3zgLpHuPLe+xmit/WOFoOrWXsglsOIRK5ndzB2uiu6aappfScQZZcThcv
 Bn/1I923/3ZwgB6YHpA/CMSIHB3xbVmz3R0zciumGG/7jZYsgv6ND+iCKPoJT60jUPAQ
 gv9FSyrJvRNL5rRgmW2Ej4lhbaeRwelJlhleeD4NElKd/FXd2XDjbyLK/fEI1tqNBXjV
 O3Xu7I2F67mjNTiDGrYydmi2bSVbiCF+FR5+zNn95MLwoGbtwjt93z6SLxLwxZnLX1Jo
 8n+DKzhSsWuFUY3RkdMEOd906Cl7EMYUV7XlIthThlh7usXVL6vO4LJ6VWi4evE3IxVE
 QIVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a+JEpbuc
Subject: Re: [Buildroot] [PATCH] package/libcurl: unbreak threads + c-ares
 conditional
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
> Commit 0fce7a9623 ("package/libcurl: fix build w/ threads + c-ares") added a
> conditional for threads + c-ares, but ended up with a end-parenthesis too
> many - so the condition is never true.  Fix that.
> 
> Reported-by: Tibault Damman <tibault.damman@basalte.be>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x. Thanks

> ---
>  package/libcurl/libcurl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 5a3a668f06..e390c9d1bf 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -38,7 +38,7 @@ LIBCURL_IGNORE_CVES += CVE-2024-32928
>  
>  # threaded resolver cannot be used with c-ares
>  # https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES)),yx)
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES),yx)
>  LIBCURL_CONF_OPTS += --enable-threaded-resolver
>  else
>  LIBCURL_CONF_OPTS += --disable-threaded-resolver
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
