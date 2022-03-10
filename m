Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733EBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35D3A60B43;
	Thu, 10 Mar 2022 21:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O9ugqmZEKLc7; Thu, 10 Mar 2022 21:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1916160B09;
	Thu, 10 Mar 2022 21:26:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FC751BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EA0B84390
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8bxy22OlmSM for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:26:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D50758436C
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:26:15 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a8so14950506ejc.8
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 13:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=AAasLCJ0lYH3k8K9Mi1N9m6PUD3PVzpW/aUG2rve9Zc=;
 b=WnJCUGlsbpYG5Nakp3oXIgQhBW27eE33Kau9sGScQAUStUy5h85TWpBPB9zy35OEVl
 zyQgHpyT2nxioyICkbnsFuTlysMkXTp7TRxDsXcrmGRq2XwkpUBFN0MM/YWCnV50hCn4
 cPCQb5MZPPhnbAQpAUuFyTIiCQ0j1pcCjGGtTKWRcZPS5iBWxBms8WnGsldQtv41j3jx
 NroGCbaDDtjzrN7rl1PRwbS/So7nBa8vFTc5smc3gsgnNACwbaYfHvmvs9zbGn+QLDAI
 bLc9XRzPVhUUHPUbpycY/oLsrni/XD6MdxXg8Nsv7uTUpeLz0Mq1/GG9y+BWis74gcOs
 k79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AAasLCJ0lYH3k8K9Mi1N9m6PUD3PVzpW/aUG2rve9Zc=;
 b=jGPhA/v330au4KTcFUXL45lNd4Ob9xta5bOQcUa457BMpwcRobhOenPEzaE0FJWYNI
 pqzG3dokBUJPnhnT1cyoVe+I987cBXc0oyq1e+moX4KPlQ/OKodCQLX2ahZ1xJjO7+kZ
 AqAemkYniguwHjJ2NVIGjSYvIAPlMMHofsggh6f7LCo+jK0QNvQv+HyBLXP+0WiKDjA9
 VMUIDuv3TrP8kEMI6L8bPXgqqSlXksoCp9mLN8W/4uSpyNxatykVHf/i0wwhy3aTjcbI
 UruH0UVLYrBOuSKGE2IbNR51MDJ0NjYcLXvf1Ea+0lGrGgKKXUTiLbsu+ka5KxQf0koz
 mSiA==
X-Gm-Message-State: AOAM531rWnl5QuewDlgwqqD6eupHAnflWNhuKnpwoSP5XXS7KTxCgb09
 HUYUGeFMUpabHnPdmI+k6gQ85nebXFAUfw==
X-Google-Smtp-Source: ABdhPJwGIDSjlwFSbBG1YH0i72rXBr52F01BW9SlKjt+f2tgbI+S7zAoQe+skiy/xDfDJFKc4t9vRQ==
X-Received: by 2002:a17:906:c113:b0:6d7:7b53:9cb with SMTP id
 do19-20020a170906c11300b006d77b5309cbmr6177976ejc.197.1646947574154; 
 Thu, 10 Mar 2022 13:26:14 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a056402268f00b00416474fbb42sm2500206edd.19.2022.03.10.13.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 13:26:13 -0800 (PST)
Message-ID: <8f96b3e5-bb85-e3e3-6047-f98127c08e21@mind.be>
Date: Thu, 10 Mar 2022 22:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220215214125.20412-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220215214125.20412-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/assimp: bump version to 5.2.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/02/2022 22:41, Peter Seiderer wrote:
> For details see [1].
> 
> [1] https://github.com/assimp/assimp/releases/tag/v5.2.1
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/assimp/assimp.hash | 2 +-
>   package/assimp/assimp.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
> index 50f0b3e6d6..a778b79132 100644
> --- a/package/assimp/assimp.hash
> +++ b/package/assimp/assimp.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  52ad3a3776ce320c8add531dbcb2d3b93f2e1f10fcff5ac30178b09ba934d084  assimp-5.1.6.tar.gz
> +sha256  c9cbbc8589639cd8c13f65e94a90422a70454e8fa150cf899b6038ba86e9ecff  assimp-5.2.1.tar.gz
>   sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
> diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
> index 766b2c9b5a..42440f0fa9 100644
> --- a/package/assimp/assimp.mk
> +++ b/package/assimp/assimp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ASSIMP_VERSION = 5.1.6
> +ASSIMP_VERSION = 5.2.1
>   ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
>   ASSIMP_LICENSE = BSD-3-Clause
>   ASSIMP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
