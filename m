Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BE3C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 07:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADB9081431;
	Mon,  1 Jul 2024 07:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixlsIOsiqS2A; Mon,  1 Jul 2024 07:11:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1B668143A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1B668143A;
	Mon,  1 Jul 2024 07:11:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2CB911BF340
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 258E840791
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uh38FNwUbOZB for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 07:11:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D56D4061D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D56D4061D
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D56D4061D
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 07:11:09 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52cdf4bc083so3796259e87.2
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 00:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719817867; x=1720422667;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7vDc0hdz32fa0AbGislKDRGGzskufJiC+4aj9HlCBsk=;
 b=bHpPmM29nP10Mfbv6jliUZgpd0EpwvrWZSrsObXxkV626jnwNksza/nvE6gAYjkUzE
 BHrzrB5nQBdypoQKjacfyp/knOQ1WntY9OeWp2yxbjhW2+PLKXfaNEQrcKW8+LVP0gWP
 KMb3JTtxVuqd18nHUx9Znm650ZrUfv38lFlSH+6sM+wmk3YM3E3owpe6oIvvPixcN7JR
 dz10amcsepXnL7mftaZ5X6UiLJX6QRKU2vRETnML4+2PVZErlgjTdaqT16ztDDbeFU5Y
 BcB4NbSJX18iylyWQKuQTHLvGxAR0QknIUYrL+UYhxKKz/CObadli3FPfogi8oYWODvr
 A3yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe0R0wVXfdtLYihOCmfDih5GjSfueS5qnd7Ec6mETC7KC2ueEnqgqbKwRU3ISyrxNSR49vXzOnNhM8D059c+fkg5IyqrSmAg==
X-Gm-Message-State: AOJu0YyGwgSnsRzvFnbnLgWNUpuSpaMPC/YyTLZ76cIqxK1g2L6tfsBh
 xxNyytmhuUHu0spAafjSplvUsYEqWgKZ8GYulB762N2/0szWq91MTig/OWq/ZG7Qh8QBqsTzJVE
 +
X-Google-Smtp-Source: AGHT+IEpHhAo/Si+vFMG9u7q9qDgEA9Khjluoq+hAPdCHRtw2pJZ/cfYBjgYm4ONxvoAzqTR7AwniA==
X-Received: by 2002:a05:6512:3988:b0:52c:df5f:7b4e with SMTP id
 2adb3069b0e04-52e82686102mr3582613e87.38.1719817866370; 
 Mon, 01 Jul 2024 00:11:06 -0700 (PDT)
Received: from [10.1.0.155] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5b66csm137550815e9.18.2024.07.01.00.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 00:11:05 -0700 (PDT)
Message-ID: <1c54c03f-ace8-413e-89ac-d4328a66c351@mind.be>
Date: Mon, 1 Jul 2024 09:11:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Saeed Kazemi <kazemi.ms@gmail.com>, buildroot@buildroot.org
References: <20240608094244.842147-1-kazemi.ms@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240608094244.842147-1-kazemi.ms@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719817867; x=1720422667; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7vDc0hdz32fa0AbGislKDRGGzskufJiC+4aj9HlCBsk=;
 b=RQ8VMMDgkXF8O+HiLq2Os/rznHo38uRvaW0H0Rm5YOwIho5h7Uk2wrUYC3V6F4TfFM
 fLpk1Elmm2PMXH0Jk/YiQqSCo/ArM+fe4IzmYSsq2rTATVMXw+T3gIc0eTdaQNsA461I
 FqGoxhip8HwDrUCOSl0OoMhGsnHPaPybRQcXPfqN5cakB/QJyeOgnJI20+NXI4wV9LxD
 /qto4LGyN12dRBh4aBXMu1W1W8GZY2gQctSnHBS1mI/l3P2gd4rIX1bkmGA2wmq6nV84
 8bCXd4z/0D22fF8fkR2krEo6SVkfRPqsnV02UgfMWLBcrpqmxCV50tTFQtcY/ggxy9eM
 +d/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RQ8VMMDg
Subject: Re: [Buildroot] [PATCH 1/1] package/eza: bump to version 0.18.17
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/06/2024 11:42, Saeed Kazemi wrote:
> Release notes:
> https://github.com/eza-community/eza/releases/tag/v0.18.17
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> --- >   package/eza/eza.hash | 2 +-
>   package/eza/eza.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/eza/eza.hash b/package/eza/eza.hash
> index 8765261e7e..3bc55b26ef 100644
> --- a/package/eza/eza.hash
> +++ b/package/eza/eza.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  709507bd46c1e1c4c14d6e34266355d78ae21fe2525f8bf42089cab36ebf0134  eza-0.18.8-cargo2.tar.gz
> +sha256  c01f11ba19956108e42244f0b094bbb6bc74c13ea2c68feecf6f0ff2f127df97  eza-0.18.17-cargo2.tar.gz
>   sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
> diff --git a/package/eza/eza.mk b/package/eza/eza.mk
> index 506e515566..5a44fd7826 100644
> --- a/package/eza/eza.mk
> +++ b/package/eza/eza.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -EZA_VERSION = 0.18.8
> +EZA_VERSION = 0.18.17
>   EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
>   EZA_LICENSE = MIT
>   EZA_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
