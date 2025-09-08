Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F27CAC588
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48C844275B;
	Mon,  8 Sep 2025 10:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8t9jUtAOIuk; Mon,  8 Sep 2025 10:56:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33BEE42749
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33BEE42749;
	Mon,  8 Sep 2025 10:56:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02D50186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD609423C3
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YF0y79YvvBOo for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:55:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D515C423BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D515C423BF
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D515C423BF
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3da9ad0c1f4so2923933f8f.3
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 03:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757328954; x=1757933754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b4Tn+zygb0xBODws+mM7e3Nzgbi/uI7Q9SDaYEk7v+Q=;
 b=urCHkXBzfnV2dYcC11q/mbgdG6H+x5bi6FuI7ooGHqFNrIqvNcUGY0Sy7OceOpV+TX
 E5ywZx4QCWSxLHguqI6LtnUKkKeIyxAiOYbTsomjt3bhmkK+am6DFMBUnyHaSDT92nvd
 liGmsAQigR/zFptYnVx8+V14NTzTu9CkQaNynkwjxXcNfLvW1LjjQVhtN+QbPOCN+s2T
 3CqWe43nmW8+aaLVoC/0U8aWiMSv1vrb+2AGh8Wo2/zWaIdPuTHDPLVpyLkBNNRlBpzh
 raniKe1p39Mulx6R52aWCc1/TceB2Fw32DkK9ctDZCEfc8MR7xSVS9bWoAVxlF6gQvYm
 ujzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKDpmzvkWy67KY8zEX1habJNBEVV+FY0PqQeVgemWT5RN6Y4g6EuMar2eHAKl/4p4iGghUj5+U7Qo=@buildroot.org
X-Gm-Message-State: AOJu0YzZMwurHou6YwTSwoRMh9IuHuZy8F4mCit8B3938d7Egwj1Y/RS
 oWlpwCbwFb8Etb+0gosvmpdAuDrGnPf3Wn5sKwPruEJI5yzbK2mVPH/4jSp6l30A49o=
X-Gm-Gg: ASbGncsITz2sjgbMBV9BKRArnygNzmvMwFsw6fg7S+iAtzXZZWWs6q16A1vzsF6sxwW
 HhHfAYnAEKprXlBpJ2zUQtEwcZUVVflqNj2WFqZkKriTNEu0Amt3uJeGfV/IuwcXVRxjQGnMhiU
 pu0MF38hWvrqbtGxxI2R7oY8IdWkfMy7ZiFKC1tFMLODITIPgh3UaEBmXMZTDvWW5tcoTUDD1yQ
 myDuILPgtse61ThfUTvHeY7RkRIQmXuVOorbi0zDP9DPdkl2I+zR1TCfhKyhBI2S8VT03uahCxF
 gvmcVpW2zlZUkIc1l6o28PV3xxhvwKe1bICF/qnAHq2NRl3KbV/dFYqp3EphuBfASqFKslGCDkU
 aBExYYxr9TWUoVQcEwDzTq8S4EcuH0V5rabFrlW0hhoUsmM09v+pg9IIQvJim59qprjQmFL0+5o
 +uzQ3A0DhoBjzEQzXPAL6a9BIo
X-Google-Smtp-Source: AGHT+IFHvwE2KZyHZ3wMZu1W+/PjJIKZHT0qRm/nt1yOi9pPlvo6EeSJqPDbqEIaCLM0ysqHu836Sg==
X-Received: by 2002:a05:6000:2385:b0:3e2:a287:2d07 with SMTP id
 ffacd0b85a97d-3e64cf45316mr5365773f8f.58.1757328953812; 
 Mon, 08 Sep 2025 03:55:53 -0700 (PDT)
Received: from sah2lpt241.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7483597ccsm4195444f8f.31.2025.09.08.03.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:55:53 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  8 Sep 2025 12:55:52 +0200
Message-Id: <20250908105552.681881-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250819212631.3570549-1-thomas.petazzoni@bootlin.com>
References: <20250819212631.3570549-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757328954; x=1757933754; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4Tn+zygb0xBODws+mM7e3Nzgbi/uI7Q9SDaYEk7v+Q=;
 b=d2xIv1WZ2xECTV2zyxwJF+3Bd9cXjpd8UaFib/rKUOCSs6RhwcMrOXJwJKp5+AP4Ew
 e/pTE/ZYrEE4gL7yLbDKtbxGkT8MdpsvkUzQH5gjyixCaiPoWbloUbfX67x6MQEFe6NA
 4Wce0iWWo+dhqSlQ9qnyhxzDDSv7R/q49sWT+9BZKQwK+t83/yFlpRJZ3oM1M8A1PeRm
 1AcGmCgWVF0CA9bXytGfzxmaRDUa1LaK5OHGSWLHbS1YZXXcsYBFSUJgdvbpPcVq2vTq
 +z2+AGP6TvZizVbUJ2HiCi9z7/Bt5hbiLA0uAIVrmm0G05xhrsMyjHIQXhlql0cmHddv
 C52A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=d2xIv1WZ
Subject: Re: [Buildroot] [PATCH] linux: enable
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL on a few more architectures
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
> This commit is an extension of
> 5dae966a30c5485e45b94f750a739d36810cba4c ("linux: select
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when needed"), which solves
> autobuilder issues by making sure that
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL is automatically enabled on some
> architecture if the default architecture defconfig is used and the
> latest kernel is built (which is what happens in the autobuilders).
> 
> This new commit adds BR2_or1k and BR2_riscv to the list to fix
> autobuilder issues.
> 
> Fixes:
> 
>   https://autobuild.buildroot.org/results/1a739eee39bdef8986279a9e21f8637fbe263353/ (or1k)
>   https://autobuild.buildroot.org/results/acb62b7a486f3f8e99c6cc2b52b0c259bfa18a0e/ (riscv)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  linux/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 7f90c566b0..27321eee50 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -176,7 +176,8 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
>  	# version. This is mainly needed to fix autobuilder testing.
>  	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
>  	       BR2_LINUX_KERNEL_LATEST_VERSION && \
> -	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || BR2_arceb || BR2_sparc || BR2_x86_64)
> +	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || BR2_arceb || \
> +	        BR2_or1k || BR2_riscv || BR2_sparc || BR2_x86_64)
>  	help
>  	  This option will use the default configuration for the
>  	  selected architecture. I.e, it is equivalent to running
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
