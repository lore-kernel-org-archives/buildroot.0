Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA2CC38145
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 20:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BF5781371;
	Tue,  6 Sep 2022 20:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BF5781371
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77EUDUa7YTZd; Tue,  6 Sep 2022 20:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C4C881357;
	Tue,  6 Sep 2022 20:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C4C881357
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBD3A1BF57C
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96E9860B61
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96E9860B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bw3e3A-FR85t for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 20:03:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79E58600C7
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79E58600C7
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 20:03:25 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id w2so16677521edc.0
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 13:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Xo0Hiq62NMTCG952aashLFPveehrZSQEXpfuO9TWw10=;
 b=aA9lrzM9C8PjiQlU8LRdh/usLNnMVK5BRrwvgHRIT8/dYRrtBieuGhKUv6+fjb//C4
 5nvTbutzwWL8c02lXn4e8tsvRwIcddV7hM7zWRjw2KuRZQzryd5skk9DIbqbFoee025H
 5GF7hhOzqdlOPuvzSz95kuhAvsweEQ3G871qMG3w9NNByEakpCGST9MGPG7rH52Dsjzi
 etoq6TmUQ4g1+nAIhUuFkjeQRXr3X5yDJGbPP1rSia4f7jtpfS6DOORpoMxGdgIJt80J
 1Fo7JW1/xMT9m4lbDiL5hZVCrqWW/a+4/oq81ghgtu6ImFyo8Nql554A4nOv4TY27fcU
 DEiw==
X-Gm-Message-State: ACgBeo1g0flwpozo/dp0oUIkYUBwCfYy5mF2gvcxCVVx6lIf/DG0Nfx+
 iN6Ur+vmKu4+hPGdkD28a8cYMVUTd8QljA==
X-Google-Smtp-Source: AA6agR7sOlU2FzrqVCuonwu/nKstnPtHfkv4A+Sght8Pd/uN6vu656cfkheMZxhg1LVITVFd3KU1fw==
X-Received: by 2002:a05:6402:3591:b0:448:a15e:3ca0 with SMTP id
 y17-20020a056402359100b00448a15e3ca0mr212490edc.195.1662494603698; 
 Tue, 06 Sep 2022 13:03:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 b23-20020aa7d497000000b0044ec3285b23sm2448117edr.58.2022.09.06.13.03.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 13:03:21 -0700 (PDT)
Message-ID: <2b285488-158c-b7e1-b4a8-dba4bc7d3df6@mind.be>
Date: Tue, 6 Sep 2022 22:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>, buildroot@buildroot.org
References: <20220827070436.2062-1-gwenj@trabucayre.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220827070436.2062-1-gwenj@trabucayre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Xo0Hiq62NMTCG952aashLFPveehrZSQEXpfuO9TWw10=;
 b=E0T4mOmA7lKayOc9B1d3zJCn0TjznVIYYSvSlYyjjkmH/KZZZO5kGU3PpyUC/qS4wg
 VwZ2ndKWx2NeHRYxGWUE3NL5z+4dmDshrDY7AL2uQYVhzdbpGL6BdYfMSpUN+RHYaVQK
 V7C/59OChyyaeZlJMkPdEbg3NG3YCjdICkOqcPlhjkUAw2VMLhGcy/RIaXFpeIXSmRVm
 IX+kalO6SPdb8m0mtMdW5JvNYYynhHO7YpRQ+gklk3Go00q6tE9XZJ3eyqRq6o45SYbr
 ihlhaWWJgywc9RQYKp4+e2EoOwUcugtNNmxLrpvxLTAYq6jIXvomi0vFXIkJZ6fNsE1c
 3yRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E0T4mOmA
Subject: Re: [Buildroot] [PATCH] configs/rockpro64: Use mainline ATF
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/08/2022 09:04, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Use the mainline ATF as it supports the Pine64 ROCKPro64 board.
> 
> Fixes:
> - https://gitlab.com/buildroot.org/buildroot/-/jobs/2812054016
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/rockpro64_defconfig | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/rockpro64_defconfig b/configs/rockpro64_defconfig
> index 5086320cbc..d39640f855 100644
> --- a/configs/rockpro64_defconfig
> +++ b/configs/rockpro64_defconfig
> @@ -7,9 +7,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
>   
>   # Firmware
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="11a0a46a899fcc3b1fdb214b382f3d7495d88eca"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
