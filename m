Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0541EC7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0F6961284;
	Thu, 26 Jun 2025 19:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NB8GLvC8F7h0; Thu, 26 Jun 2025 19:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA5656127F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA5656127F;
	Thu, 26 Jun 2025 19:53:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7E1F10A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5085419B4
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mODuQqrKveBr for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:53:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0DE4640437
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DE4640437
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DE4640437
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:00 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4538a2fc7ffso8615035e9.0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967579; x=1751572379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSoZ4dRpUXOFGKLbb+taVIV4nDKV+nODjj3OUjUygBk=;
 b=cgzQklU3GzH5lfWWc3tBVV3KThiuqq4yFw9ChKWcDg9gLD5Jh+6kpJ1xmWgm3JAduK
 WUMyB3p4knIGdgCLFuer488VyX3+HPacDrcFGER/772NfkPayzpmgjTmvXgKPJWnrrIk
 8RjAbfWeav+mQcDm/mm7mwEgG8orLoiDBUusahuCus3r9kZgfhG1wURS3bI2O2Wqcxtk
 C/ED7pPHMIbnyClB332A37ZjaiyOpEMKjKF7QmqBQ8kWfcELyHTNWGRXyejwzqbrKn8G
 o5zwg0M5voUpgdxK0E5ALYL1PIl2OLbhw7jX7watz+rCL2soAK4KwZTl3OD3S91KnEql
 Cbpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcWHNh4RWWxK5260E8FRu9AwEhnbDo8X3RK4WGPqlJ2YTuy7Ojj0b4hbEfBkVSUuJA2s0rDUiesHs=@buildroot.org
X-Gm-Message-State: AOJu0YzuT+Nb4EAfqCIGS5+c6pPPeRVX+dQOkkeRV2Q0SfPwH3+yYkUM
 Vr4YasCjcRlr2Am7KWQ9HO1q9mL3w5+DvdORXEWsRpDRBGNLiSYVjOSfUQRMA/Yprg8=
X-Gm-Gg: ASbGnctYZxvXBVfHyZy5FP6X+cI07AWaL6tC/isFUWpyltVzEBZ/0Oqj8MCHAd28jTD
 wXNvFeNRVXo8mQLuCVGfetgitfh2tGTrit2OySMuBQi/LsTp0kS1+yDk2M0wS7m+6v1Hwzfcfsk
 fdLzM9tKPqUg7QAsTM3N11PtgEOwcqhH9hPg2zMR42CG0be+bPqpypYwNnVmerPUotYu/htg9h+
 tSvP3V2EBF7RkPrUq2WKnFnqaW9+MnjxmANwpy6hOr1VMkbQyhr/HTBS7b01LJL2UOH4M5TEcms
 yj/Dosn6CE4Pjv6r7b2ef0QXiNAtdC3c1qpPNC6ivjwOVw4xra0vrH7OWM6D8DbkcvkcxnkO5DI
 8241Q8cmW5x2DxP3fsXMKPQevP6XLeMnE
X-Google-Smtp-Source: AGHT+IElOCJlIDZ0I6smwN56CQddS5C/GAoXCvlsoW7fRqDH9aN9qHAhZG4BXS0bNLBIMeaKOXS32w==
X-Received: by 2002:a05:6000:2893:b0:3a4:d9d3:b7cc with SMTP id
 ffacd0b85a97d-3a6f316232bmr4279746f8f.28.1750967579051; 
 Thu, 26 Jun 2025 12:52:59 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e7518sm749739f8f.2.2025.06.26.12.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:52:58 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:52:50 +0200
Message-ID: <20250626195250.14891-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612165938.3474011-1-bernd@kuhls.net>
References: <20250612165938.3474011-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967579; x=1751572379; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oSoZ4dRpUXOFGKLbb+taVIV4nDKV+nODjj3OUjUygBk=;
 b=RdhfGetjZIbc1nvsbBOQegSM26YQmQ5wPsJPYis8jlSR3alQmpndB7KGldmI0F7rsX
 I9gfK50Aqj69C5wfI3H6jS5Ecn3Px0MnQoHW2rO0/28k3NL+0ZoFdAWgEjpMgWis8B9g
 DKhXquvY8EI5N9tkyFFX0kwX9dqMeCaFRQYgOk1ad1AmF4Fj6DnRQqynEwXH5HpwMA3+
 MIowFmGrR7ubM82z5PrZcSJ3pq2EBVc8mXRZC1PMl7JgY21DGmkiKoE6qa14ALAjWSyg
 yJSgUCj7qHTzNyV/3v2REjzolfQRjBvxU/wx3ktZ1rDCp8Y9G67NPVur7N7HRaTnsDcQ
 w+bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RdhfGetj
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.22
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
> Changelog: https://www.php.net/ChangeLog-8.php#8.3.22
> 
> Release notes:
> https://news-web.php.net/php.announce/460
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.05.x. Thanks

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 8e3be2dbe1..4260c1e5f4 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256  4dfb329f209a552c3716394fc123bb62e80a468b55ce27fc8cb0fd5f30b9dcd6  php-8.3.21.tar.xz
> +sha256  66c86889059bd27ccf460590ca48fcaf3261349cc9bdba2023ac6a265beabf36  php-8.3.22.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index ad42e57d72..01166bae64 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.3.21
> +PHP_VERSION = 8.3.22
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
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
