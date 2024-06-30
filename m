Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0991DC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C71518108E;
	Sun, 30 Jun 2024 14:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jVtkwaoN5Jp; Sun, 30 Jun 2024 14:39:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C566581090
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C566581090;
	Sun, 30 Jun 2024 14:39:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86CB91BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8181381091
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Cb008j_Uh4Y for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:39:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 767FA8108E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 767FA8108E
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 767FA8108E
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:39:36 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ec5fad1984so29524871fa.0
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719758374; x=1720363174;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OztTZHzg4loNlntmcLHh/chktE54orpLOO2Kllm1X8Y=;
 b=BQuNVhgri5dntI/DaEsRNiNWcG8sdzLT6XPCK2cK/JKqgYVBF/BsknbFqg64gfgfrU
 FOoMtra3ZcpbrL5KEmYiHo4/wmA3TRORfFlF3sQFV5gE9SMTmWHF9qgWm6LQwkdgj2/L
 PRcxbPIZ2zy4MaVgIixIp8DY+bq6hFXZ6XGjiSeXAeJc5XCv3t94/HIB9O1qkBj8LeVw
 W/nH01L3StlO918NKZfJIZnF+u9Pt30Vew/DQha/gHMRv0OfFE7mua5tz6JOiOSajhtG
 bzirmEfvxKDWuAADSHrwPYE943bGDfSJEZa5fQ67mEBsNmpotSijIDBu8C1A7kNOqmIg
 KBkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvhGH2oIFAXVi5/91zALF97yFwwitm23dpwVgRjqYs6hzJUkKlbMPlyHVJ3ZaIz1YnJh9d0cRt3mXtFQatd1XbARZxa2JYjg==
X-Gm-Message-State: AOJu0YwmU7oCHQZbts1tPY3PMfY6D9ReAHY+DVcwjGHuL99KiIoDI0NI
 yzZ6AeXnM8g3QZLxy7fsWMe7Vm+QVwis2g3xAHX1xaE/7qYk7zupztVAf8M0HZg=
X-Google-Smtp-Source: AGHT+IFPCDVIN8FgrivEnAhE+Z4fsIhcA5MEwJFE43L59Ft4mAXmVF/qoV6ByAKtyQCEgWYY7ggeSw==
X-Received: by 2002:a05:6512:33cb:b0:52c:e05f:94a1 with SMTP id
 2adb3069b0e04-52e8274eea5mr2310978e87.68.1719758373690; 
 Sun, 30 Jun 2024 07:39:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af389b3sm115436485e9.1.2024.06.30.07.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:39:33 -0700 (PDT)
Message-ID: <9ab26704-8989-47fe-9d46-ab541f7d1e00@mind.be>
Date: Sun, 30 Jun 2024 16:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
References: <20240628160933.50208-1-christian@aperture.us>
Content-Language: en-GB
In-Reply-To: <20240628160933.50208-1-christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719758374; x=1720363174; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OztTZHzg4loNlntmcLHh/chktE54orpLOO2Kllm1X8Y=;
 b=Ntyehjlhgh9wR5cw2AwAVIo0ib4M1NI2i94q1PDMqFRyGngMMIQrienDANdtmSj3Br
 KICnRdgspirjvK721yjHDkAZO+UY6eOf8N3U/ksu7Fl51iasP2vpKCYbn4tuKA1DIQns
 SiE7cjME6RPFW1JJaOmgLvGuz+ZQf9amgycly9ubmHCHBZMxHTcIixHGGT5YLV/TbYAM
 pgFOBem06fvUzoHTgTAR5gqyvXvMUcxsQdOGdOgj9O/1SR7Vi+sToU+j5xu1ldGGnjR2
 4dignDKCTEZONmUaM2NpefSIhNGsppuguxsXlKUlLPqQHk0sfVQIiYSkinEtQhAm8/wE
 CcvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ntyehjlh
Subject: Re: [Buildroot] [PATCH v1 1/2] package/docker-engine: bump version
 to v27.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/06/2024 18:09, Christian Stewart via buildroot wrote:
> https://github.com/moby/moby/releases/tag/v27.0.2
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/docker-engine/docker-engine.hash | 2 +-
>   package/docker-engine/docker-engine.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
> index e13527944e..86de5ca785 100644
> --- a/package/docker-engine/docker-engine.hash
> +++ b/package/docker-engine/docker-engine.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  f1cf6a2e69607daa0e2ae9b5be752dc269ab30dee16f5f2180f7ff7f29270606  docker-engine-26.0.2-go2.tar.gz
> +sha256  2705abdd7a8a47ec88c0d2f0f31eede01ba4aa5ae8b5ab0e2c4ee25e7c314521  docker-engine-27.0.2-go2.tar.gz
>   sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index f8dc87050f..1de112e4de 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DOCKER_ENGINE_VERSION = 26.0.2
> +DOCKER_ENGINE_VERSION = 27.0.2
>   DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
>   
>   DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
