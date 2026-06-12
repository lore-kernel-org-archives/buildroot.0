Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E62CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 693CD60F7A;
	Fri, 12 Jun 2026 11:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yC3DvoXQtTlJ; Fri, 12 Jun 2026 11:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD8BF6107C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264236;
	bh=eeqdi8vWEfMJoRmzlpc2bGqaxvc5gG4arbhPgwYXP2s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P4GtwmQb8L9j+HCWfhknSM+xqpbehsW00xaIoyzbDKhr1tncE23hIO/Y9/WQY6S6c
	 5CichYJ0rNOaRlPBmW4sTm8k2n8Z2dDcz+waqWMx+GMxq85AMZc0/y7ei/MElBLSSK
	 9GBYIzeo6A7k8sNq7beoFTcFd5V2bGSwk9aHT3TNC0H/Hwrc4S6NEHtuxQ0h2nBc5U
	 5iSwC1xx7+0t9vB3JM1iy2htpthJxlYMa4aZpAxfnDjjJEVvAYkwt69OQKqDMEa6nh
	 DGGbgYGXJHC/QMCOF6kMHhhGFPrKmOc+rkzSG578dJ/3J8LWKg0GnXzkzga/mwnfse
	 qR6tb//bQMerQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD8BF6107C;
	Fri, 12 Jun 2026 11:37:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8DCA12F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF99383300
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xhvQoZZewJn for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C69E7832FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C69E7832FF
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C69E7832FF
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:11 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45fd461e4a5so743103f8f.0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264230; x=1781869030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xK/6HLpWxchvzSOsAEmoEqjiwiq2tLpZFZ+pZ/pwIdI=;
 b=XmWgDjYK3Cj1hCo3qYvthTjjASRay5FA18RKDkbLOKf5BXrc4NN3EhjBO5qZy/aT77
 ECc3q4DtW7c93fsL8vErWKFiAGB8wf/o3aX1uTEQlPKDhSx0AkHLNzc2amZgq4MWKfwD
 LAzILiq/sgFH3A8fi7Sw+gOY9/vgBmDrnjSjOPW34g+673LS6R/qxvj0Qj1KJp9K/b6H
 xDAL7Tq/lrKnLCZcNGSJa0sfilatLVBCySiv+YiKFWJf/3V0PRdOp17PT5cYKw2idgy+
 D1lfiSoAUw9QTrl4nuVntESsf8KQSx+fXvK9bCtoX2f7hBz2T2dKXt0eGDzbDJ0/L3oB
 3zNA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8pxpdQ/5ZFEy0+Ycc+GAkTen2MsHhK0GJvqAyukmy0PXpFnSAO/rv8b79CUQGwXiwGFg3Bw37AZvQ=@buildroot.org
X-Gm-Message-State: AOJu0YzUIMYZbaIJvzBRoRRBoZhSMPFFw5GVgOnRgTDFYVqe4D8fATIJ
 EsD3f5FpqU/GHUGjCRhCJX+wc417cvj3H5PfbXyb2hgqnO473UvEZzUCpGMK7dzqzRQ=
X-Gm-Gg: Acq92OFPR/dAJ6bC0FM5PHOPQoXCYpoO+0ok1GSTymc0tIg5iow/8K+rmb6CGLtHv6b
 rLHtwS6HBLE30oZ6C3KOYBOzddpTWJePKyDqDC87w9l1EEAy42cJP/yN0735ycFlf+KaKk6QO30
 LipXKhBK9BKHAqSYo1quz2/QzmzuIug1o/yTKXjjr+V2WnAIm4XK859+bJTYRrvogWq6NMRjMXq
 UYWonTNsJ8DtWeGRfelr8u306wcjelcWJ/z8sQFwiD1b1/bgakFYGutVVASpGdWjopHbVdFrFpL
 lRpOlYGDPiaLKkAdgFme/9YTqstcawxUWEWV4xt7gfl8XopCGzz7rBNknj1cWClocMN8PjklhfD
 jkblWCRbatoGTQYPAMmkHNHBaJn903SvHg/CGRMdlEcG3RMYmNVBzfqV5G3/wxnn3sdkqLEAeXf
 565SNaz+Zkmxfpm4E=
X-Received: by 2002:a05:6000:4387:b0:43b:498f:dceb with SMTP id
 ffacd0b85a97d-4606db965f0mr4164212f8f.9.1781264229608; 
 Fri, 12 Jun 2026 04:37:09 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26393asm4967188f8f.5.2026.06.12.04.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:08 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:08 +0200
Message-ID: <20260612113708.251407-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603073245.2918813-1-peter@korsgaard.com>
References: <20260603073245.2918813-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264230; x=1781869030; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xK/6HLpWxchvzSOsAEmoEqjiwiq2tLpZFZ+pZ/pwIdI=;
 b=Ue4OQgcBy8or3nkGME+hC/z0A3xEi4b9VESzbq7geAydxws/BtSnDWNnl7sYKCCCOU
 T9HWwEypRTi/O96mITdf8Ka/V6p8akOVT5Ws/KIehGINJ61qae0HU8tm6Vu2XJWt49Oi
 TG7/l53WpAWxzv8h2S9Qst/UjxKBIawOmgrxaBXaNIIx/2ddvE5hQgO2ZhWgSGlX9FVB
 3jlN9wtnY6uz2d0ZvvgAmqFOai2gvSPUIWI7Aa1U6Ss0692FJKwEz4OTqtczlv25tdg3
 w/b82DV+NkWZKIXKdk/EFBItuu/9OyWByjh1/EM38UwDuhFjqe2RsAf+z5BO05Hdhjnj
 anRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ue4OQgcB
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-engine: security bump to
 version 28.3.3
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
> Fixes the following security issue:
> 
> - CVE-2025-54388: Firewalld reload makes published container ports
>   accessible from remote hosts
> 
>   https://github.com/moby/moby/security/advisories/GHSA-x4rx-4gw3-53p4
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2026.02.x. Thanks

> ---
>  package/docker-engine/docker-engine.hash | 2 +-
>  package/docker-engine/docker-engine.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
> index 5d7bc51a6a..7f305b6880 100644
> --- a/package/docker-engine/docker-engine.hash
> +++ b/package/docker-engine/docker-engine.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  e4828e32e474cef1b78f40278211648300071399c7498252dfe0b96e789b8a31  docker-engine-28.3.2-go2.tar.gz
> +sha256  3727c8963ab4bcff12291e99e4d4a6b9a29ace5236fd245717bbff648f15f8cd  docker-engine-28.3.3-go2.tar.gz
>  sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index 5fe225fbbc..2df260e1e5 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DOCKER_ENGINE_VERSION = 28.3.2
> +DOCKER_ENGINE_VERSION = 28.3.3
>  DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
>  
>  DOCKER_ENGINE_LICENSE = Apache-2.0
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
