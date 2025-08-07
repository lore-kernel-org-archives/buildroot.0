Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDB0C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70BBD80E02;
	Thu,  7 Aug 2025 18:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBPb6-xMYTwL; Thu,  7 Aug 2025 18:24:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0885380D76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0885380D76;
	Thu,  7 Aug 2025 18:24:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F8A510A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 462EF40582
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHlICrhzWlel for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 685B240573
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 685B240573
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 685B240573
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:20 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so11121905e9.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591058; x=1755195858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CON9hA1VK8G0NPmUCGkBQfpBVXXzbZ3Fb6PwnYFj3r4=;
 b=lqmVrko3RdEBqmv/xOHCziMCws90jphEeTK1rL3LmqIKEfJv5cH3/cIRijCxO67pvb
 MYcdWF8/BoiqCcAsnTZsf9ZzDgD0rrq+21FFx7qMKjRRh45aFmdCOhL4PReg3o6fln8z
 UEXnS/WV4+EIwccHN04e629YDo/N/CpDWCxjEr2JMk5K8DIfr2zoYlu97v66si1wu62p
 kMWiBhKcIm9OLw3l8cxoqGM2isF48tbeuUOJuEMRiFEjM2bbb5P69QS0YSel69y38gIs
 yqBpwk7PuM9ExMVp3EtUEEtmfEEqqLt9TDPwxG5o9ZJ7ys6SQOXDqZSle0d2/SyhQI3D
 3CzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGakCWj7rmq6D78WK4yo8cpkjQ/X2tnjcSWo/pVxizXv9uMuUSmXHpgkr22CKS5KTLeRM9wPOj2DU=@buildroot.org
X-Gm-Message-State: AOJu0YzrOCAfhZgHd116w2MmoX9lXtSQX54x6T7BmEHi5OBNJ3QRVjD+
 zdzTe8n7pdFHLUADh3CVcX+8TXEbcGLECHoNDYYnycuDOYktgZzVNtndbvfhERr33so=
X-Gm-Gg: ASbGncu3AhMw8DSYfZklWBf4dsiuWA+hIi8cvysZq1BzghCgrXHUoR+avcS/0AO8z2d
 eSRT1QKGsO9x7GVvEaMDY+qo1PsNO/+S2k00kDdmr2ppQdosCR5VlXn2x9PlN7jp5GTYf/sOz6M
 l13pnUdWwzA30QZrFYggrt9OaMootSCnx9LdrEDB+0OpMjU616Y6i7kcoNMV4FjMgxlOiP5n6qj
 KZGgrVcqRuwgNo9XeKdSekDXXw9vIxSOwKiBCb2ILCrlXYbCh1VgZAbALUXlIZ7hD+lpNeIfLxa
 NaQxQZC+LJifBe19REbahqbEBCRSuoXjyR/UdVivOMv1oplYeEnczfQr8VvhBqq2q4FDLNiVGsn
 EBMHfpCXPPAGk7g==
X-Google-Smtp-Source: AGHT+IF3RPlczI/wRubZ2RYcx7V5QDzwDjCKWFosLMhSRFMM/CDlfiVqDlMmbOXmS16j70IpmdqlDw==
X-Received: by 2002:a05:600c:1c16:b0:456:11cc:360d with SMTP id
 5b1f17b1804b1-459f4eae88bmr207315e9.9.1754591058412; 
 Thu, 07 Aug 2025 11:24:18 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458b501f22dsm151433135e9.0.2025.08.07.11.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:18 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:17 +0200
Message-ID: <20250807182417.724921-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721210132.CD85D869C4@busybox.osuosl.org>
References: <20250721210132.CD85D869C4@busybox.osuosl.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591058; x=1755195858; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CON9hA1VK8G0NPmUCGkBQfpBVXXzbZ3Fb6PwnYFj3r4=;
 b=ElhmCClUKX6xkkE11eCluJOITzbRlEJKa9GqTbZrfE/HfVaaBbwKijtvGH5mmCsGfn
 SfsGcNHRgBI7hnE3iOJBME2adTHTcHQ5w2yyPbanA0Wq2GmeegnrWW+rksBAIAjBLoUc
 5q8zqrS9IzdSNVuXh845KgbwUWZIQPVPc9tY441Vm0u4/cYdcn/GiASTakMq6QCje5oV
 bp+9zZkt7c9u9fbDll7fuYq5YQsCkBTXutKoqNWgtUnA3agVdPEBbCx4sOHK32INWsaN
 VlypvCEOHpmPB1AJXeW2aPNrLHmrx20pHuIwe6qZ8usjiJjPzDGBnHEkiQ4/KR3TnyPi
 AMlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ElhmCClU
Subject: Re: [Buildroot] [git commit] package/rtl8821au: fix build failure
 with Linux 6.15
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
> commit: https://git.buildroot.net/buildroot/commit/?id=2dd7a4a374a0e585777422f2900d893a6cfcbc42
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Benetti Engineering just took over Larry Finger(lwfinger)'s repository [0]
> rtl8821au since Larry unfortunately passed away[1](RIP) and there are
> pending PRs that will never be checked as stated here. So basically move
> github user to benetti-engineering-sas and update version with latest that
> fixes build failure with Linux version 6.15. And of course let's update
> package's URL due to the moving.
> 
> [0]: https://github.com/lwfinger/rtl8812au/issues/32
> [1]: https://lwn.net/Articles/979419/
> 
> Fixes:
> still not occured.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/rtl8821au/Config.in      | 2 +-
>  package/rtl8821au/rtl8821au.hash | 2 +-
>  package/rtl8821au/rtl8821au.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rtl8821au/Config.in b/package/rtl8821au/Config.in
> index 3d7bbf643d..66e7334148 100644
> --- a/package/rtl8821au/Config.in
> +++ b/package/rtl8821au/Config.in
> @@ -9,4 +9,4 @@ config BR2_PACKAGE_RTL8821AU
>  	help
>  	  rtl8821au wifi driver
>  
> -	  https://github.com/abperiasamy/rtl8812AU_8821AU_linux
> +	  https://github.com/benetti-engineering-sas/rtl8821au
> diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
> index 56e5609ebd..e79e32ff3d 100644
> --- a/package/rtl8821au/rtl8821au.hash
> +++ b/package/rtl8821au/rtl8821au.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  fde8ca9735a6c9c4c907fb6f565185a59b04bcfa78feb2309941cc09d49c4ac7  rtl8821au-8ea0ed9da764448c7310a27744ab5814289f35a8.tar.gz
> +sha256  fd02814e2ab5435cf4213aaf876d28dedccc0bec8c91ed768336727276c5eae6  rtl8821au-d0a49ba401a8661ef0cdc4cf8850bc7c927a062c.tar.gz
>  sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
> diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
> index 9a92696437..9ecbbbb0b2 100644
> --- a/package/rtl8821au/rtl8821au.mk
> +++ b/package/rtl8821au/rtl8821au.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -RTL8821AU_VERSION = 8ea0ed9da764448c7310a27744ab5814289f35a8
> -RTL8821AU_SITE = $(call github,lwfinger,rtl8812au,$(RTL8821AU_VERSION))
> +RTL8821AU_VERSION = d0a49ba401a8661ef0cdc4cf8850bc7c927a062c
> +RTL8821AU_SITE = $(call github,benetti-engineering-sas,rtl8821au,$(RTL8821AU_VERSION))
>  RTL8821AU_LICENSE = GPL-2.0
>  RTL8821AU_LICENSE_FILES = LICENSE
>  
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
