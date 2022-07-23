Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A29C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11CFB61AC3;
	Sat, 23 Jul 2022 15:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11CFB61AC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jlo-q07KlzfW; Sat, 23 Jul 2022 15:02:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24CFB60D58;
	Sat, 23 Jul 2022 15:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24CFB60D58
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47C011BF859
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C88F4241C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C88F4241C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u5PEQHOn7S4O for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:02:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A722942415
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A722942415
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:02:22 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d13so2433138wrn.10
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6a5jV2uVvjT2or0Rxvi4FIBGEe5EBL7/XptE1P/XW9E=;
 b=fudBljMzgMAVD+Y2PS6r6Hk7LpXsT4hOD4WXvJsZ0eNu6fY3ywaVuSmq6Lh/o5/iY/
 IknIt3PB06DPI1IBx0zftwAo36LVBywOzI55khYEIJvV5Km+EG8JhPJcIPrYHPAFOvse
 /WWgELdQUIJxXujJ3tNEaIA0xRMld6kqXUKgtQlFggoImrYC0xc/gDR/oqcnnarwlqzx
 xfdCevELScbdiAYz/fxIdUV5TitbFI6Qh+c0E1W1b48W1TJEVymjTndvNRP7RDTRbcG5
 3dBZKxo0YDoZG1A2rsqTT0KZi3Zu0X1/bITPoCLvI/PTQJcWvFg4FCQRvlvoKZyWrIgM
 IAag==
X-Gm-Message-State: AJIora8X3heelKR56kf7JNCb5p/v6Mh3iYBUvPZ3h/BT1TTaGAlEF2/F
 rdf9+CaqHAWd20jYkfmIl3N/FuHc6hV9Pw==
X-Google-Smtp-Source: AGRyM1uMVhWH+90TLGgKeMN7vcb4oGtfTpesZAtgZjxWpixkWwoBtNi16IMWxnVkHeFJfp6+C3yTzA==
X-Received: by 2002:a05:6000:c2:b0:21d:9e90:80dc with SMTP id
 q2-20020a05600000c200b0021d9e9080dcmr2888650wrx.14.1658588540846; 
 Sat, 23 Jul 2022 08:02:20 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 v1-20020adfe281000000b0021e5adb92desm6167786wri.60.2022.07.23.08.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 08:02:20 -0700 (PDT)
Message-ID: <b5654d11-97cc-18a5-fcd1-73be54f59db2@mind.be>
Date: Sat, 23 Jul 2022 17:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Dimi Tomov <dimi@tpm.dev>, buildroot@buildroot.org
References: <20220717224524.8771-1-dimi@tpm.dev>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220717224524.8771-1-dimi@tpm.dev>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6a5jV2uVvjT2or0Rxvi4FIBGEe5EBL7/XptE1P/XW9E=;
 b=IUdZ0rQwitx52G67Off88npXncUtBXbHP21N+FImY7PrVtnKoSxAMW1bX3eYKBxK0W
 1EIOxxNU8VxaS9pyhqqqBfQ3EFOltbC9v3G6KT0jgstnReoFhVoEn1y3A5pYm9r1dEW9
 qisTsphiAwhOvqmFS8OYkf0Y5ud9CR6gdDgpc8r8w7eDJvs/Zrb7W8hAajsyg6us1xNH
 HsliiSJVHQQdB9DXCjmV0JQtchPUacM8m0WqQ9r/hQKAiqqlt2sw1gcRuT+lHwd3V3GQ
 SjEa1T4Pxds+GKR8gbroccURLICHTdmAIJLpBMUpoWg6x39rpA30TEjqu7BA5mpzKnHN
 VWuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IUdZ0rQw
Subject: Re: [Buildroot] [PATCH 1/2] package/wolftpm: Update version to
 v2.4.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/07/2022 00:45, Dimi Tomov wrote:
> From: Dimitar Tomov <dimi@tpm.dev>
> 
> Signed-off-by: Dimitar Tomov <dimi@tpm.dev>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/wolftpm/wolftpm.hash | 4 ++--
>   package/wolftpm/wolftpm.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
> index b9a9628b68..d24df58eaa 100644
> --- a/package/wolftpm/wolftpm.hash
> +++ b/package/wolftpm/wolftpm.hash
> @@ -1,4 +1,4 @@
> -# Hash from https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.3.1.tar.gz
> -sha256  f0d7c095491ac2cc9e44aa4ac3c22febf15942ef080431d8b43a9d0312ca6567  wolftpm-2.3.1.tar.gz
> +# Hash from https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.4.0.tar.gz
> +sha256  31d1a5f5d60af14c4d07e14a9b0667404d4801fed32afd3fc0649749020ad17b  wolftpm-2.4.0.tar.gz
>   # Locally calculated
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> index a4a9edce85..c5ebeca18e 100644
> --- a/package/wolftpm/wolftpm.mk
> +++ b/package/wolftpm/wolftpm.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WOLFTPM_VERSION = 2.3.1
> +WOLFTPM_VERSION = 2.4.0
>   WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
>   WOLFTPM_INSTALL_STAGING = YES
>   WOLFTPM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
