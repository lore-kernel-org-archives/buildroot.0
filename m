Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6281C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C38A40584;
	Thu,  7 Aug 2025 18:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMZL6Ic7J14P; Thu,  7 Aug 2025 18:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9FDB405D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9FDB405D3;
	Thu,  7 Aug 2025 18:25:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8A5710A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF78B40087
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xCiGVrxYsoF for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C070640057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C070640057
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C070640057
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b785a69454so810781f8f.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591090; x=1755195890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whzLERW0Xqyxf92auLgpCz4KKb/K3dkRCNV2dEnW/A8=;
 b=NFYlcJEHp81+Xe+vRlLIFR3F1CPG8mF78UC6hWK8P63H4LLTzNoigOPXPRn+FBUX2I
 tJhv0VkZxBxLU7ndLi/HveziwwirFiiSgmQQOgywGtjy+9GutZlUezgqiILLzduvs90x
 kJHEMJf21y2PVfKODeQxYklJ/6BR91qyWpIGKc58XKGj5LFav2yiKpZ/2+koYV8rodDU
 hZCr/XUzbExvceBOR29ocTMN19VvqX1SeZiwtzZSLTcsShtzdp0IgTi9bkShmRjHab1D
 hVBGaI1+u53hIy8J0qSuI0SRVrZo4kWF9yWU2jThny+9acmgBz7ppZRebsOs0K1uBNnh
 iyag==
X-Gm-Message-State: AOJu0Ywz0d8dC90/sV+2FdWl19LCpquURVwcGIDMCM2KZ7MJzdwwA96r
 jC+dEJecHMYyVDpC4m9z4C/w21WEiU8nPMNV/iyAa2rda1NnzTROOraz2Si5mGwxijp1OzCpTXP
 xJhrZ
X-Gm-Gg: ASbGncsF8tazHaP74PFfHGxMxpZIlsEUi78zfZFu8WHyh3NCR28M6uZAO9iAVZyxOhM
 dEn54diOSVSA/qnCfF0bYQISBHV8tyOhN5qlpU40sjuy0lFexAzTFcPK22JJkz0TjPNIXe85HF+
 tRQfbSrmx6LxM8VSPB/jS9vNkZfzWyMmzSRvWFXw7YfThdxZGCm+VsBHl7jkk6n6v/UE5fFuL+G
 BPKe1bLXzjVoImG5V0bku0SG5QN2MLaOg2JOQb6+/VGUCq7sV39OL00jqYHe0A6DH4xh+2pFsBk
 DBMMGFRsslc2ZS50qX9j9aBiIGOp0B9IrN94CacnPWPnV7CeG2HNx0+dsLRgaY9oOTG/VTuBW93
 s3nWBnY6B9TGDUQ==
X-Google-Smtp-Source: AGHT+IHaq6r7qqj9HB3o1bGY0Umks2diiauCEUW2J/rhdbI9vmtoCSUDXrCDvOzkK3FJirqXqiTTpg==
X-Received: by 2002:a05:6000:2f85:b0:3b7:895c:1562 with SMTP id
 ffacd0b85a97d-3b90092e002mr240597f8f.11.1754591089848; 
 Thu, 07 Aug 2025 11:24:49 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e3d37439sm65999565e9.2.2025.08.07.11.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:49 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:49 +0200
Message-ID: <20250807182449.726478-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801153819.2086037-1-thomas.perale@mind.be>
References: <20250801153819.2086037-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591090; x=1755195890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whzLERW0Xqyxf92auLgpCz4KKb/K3dkRCNV2dEnW/A8=;
 b=fJKB9XkNPL1u3yGgjnIm3CnW/mstP5fgCSN6mB0SH3ZurbxF+7v2Armp1e3zNJFwzN
 t+ufpq9TxTo1lDp7ghQqFVCQE6PhGK7DjtKeviY0MquZj0xKK2FlA3Ww2kOD8nrZDuHK
 sKKEXD8jx2Cb3tcjAuNs0XRTN8J8XEaj+YKDLLZ7wRWOLY9SzQaMRz0m6CAhPFXlvXNw
 Yp6daxHZEcCH/YfaQuVsUyki10rSsnpl934ump52cGPudSBex6XsRGuJhvQ/0Q5t90zH
 BPGGME7+hmPjhJ0psjlPDe3bV4buNqTbJDLJv/ZXaPd44usbeuCBeXD7dAyKOaYzUQY9
 ulwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fJKB9XkN
Subject: Re: [Buildroot] [PATCH] package/php: bump to v8.3.24
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
> This is a bug fix release.
> 
> For more information, see:
> 
>  - https://www.php.net/ChangeLog-8.php#PHP_8_3
>  - https://news-web.php.net/php.announce/466
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> Tested with `support/testing/run-tests -d dl -o output_folder -k tests.package.test_php_pam`
> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 29162bd008..dbb130f30b 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256  08be64700f703bca6ff1284bf1fdaffa37ae1b9734b6559f8350248e8960a6db  php-8.3.23.tar.xz
> +sha256  388ee5fd111097e97bae439bff46aec4ea27f816d3f0c2cb5490a41410d44251  php-8.3.24.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index b431d839fb..5460f440cb 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.3.23
> +PHP_VERSION = 8.3.24
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
