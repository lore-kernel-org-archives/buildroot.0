Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D71CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02D408134F;
	Wed, 27 Apr 2022 17:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f12GDAsgGOff; Wed, 27 Apr 2022 17:14:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D29881321;
	Wed, 27 Apr 2022 17:14:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 353B61BF420
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 236AE60783
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-hxr1735MDe for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:14:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57A1260B64
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:14:28 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id p18so2708998edr.7
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 10:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=KCdPv9/rQFFDhzQAYpGZWJJ8B+J3MQeuq1jgUls2rwM=;
 b=RpqR0N7TFBUj/Z0qpuW2oofVKWLbrdQLgUGrIx6/Q/FRqPTN/9VWLvDO/eE0WWS+f0
 AdNwGvxnusR9XCagr56AhcSi1f2piMnbqTl/OXDxR4cSieHDsUuB/RNKyHYXtNn2b9g7
 xtcejEtY+anDN+/f0Wb+shZunqgaiOIuzW/eg07kzEO4y4OTqu4mWjsHbvSmQwOIxSyK
 3r9bWQRPPn4tQH69kXRI/X1ZvcZYD4IK+BcBLgLG0b+AURhLbmeE85ZnIcccN94tSEtT
 QkMzv7/uVEn4jCTFtHge3ncivS9K5sTUmUkiOWE++TBR/Ua8/UyBnJalSAe09Q0Pu8oT
 pWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KCdPv9/rQFFDhzQAYpGZWJJ8B+J3MQeuq1jgUls2rwM=;
 b=BvHTjsxdbsuOze3LpIxoz/Ze7Xqb/iEUo/T9KugOvjIklaHYevF2nMxnpS4mOVFbMu
 rlo4Or4aEGQ6wUz6b5BfcNo0jZKlW8ifiVR5p9voJwu1Exoj3ES8Bf04Ls1lOhGIeWS0
 jaK7v1adj+VtUX5QuyDUV8rgP3tZoC4plVNkjWHBpDsT+upSf0ON3BVJWX3w57xTvNIN
 opIhehiXY7OLx21a8kYLTl6TS01ZEuyQTGxvAJfIVtQFi1gtIcyTwfiGOeNxp15HkB5R
 R2/mmyJwrwHhHfDASm8miqAN9q/EvZsaZGgwKbvGcCY+TNDFI6v8knm/SNyQBcuV51HU
 a9mg==
X-Gm-Message-State: AOAM531NienG5UTGMISmdMqJhIEN2w2Z7eS+6eSvHnH1LHwkMk8N9aH+
 4StSRRhZiX+Xh52qCOOozbYiVQ==
X-Google-Smtp-Source: ABdhPJwpyPbe82CGJ+TOM2uFbttWCWd4RIZL78HVISKC8gWFm6zQf3SlvWDhOQiJk8JO1VbLlfWYwA==
X-Received: by 2002:a05:6402:1e89:b0:425:e3fa:f266 with SMTP id
 f9-20020a0564021e8900b00425e3faf266mr18632646edf.20.1651079666546; 
 Wed, 27 Apr 2022 10:14:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a1709067b8300b006e4a6dee49dsm7172188ejo.184.2022.04.27.10.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 10:14:26 -0700 (PDT)
Message-ID: <47db2565-7080-a32b-378d-20f4d7cbb710@mind.be>
Date: Wed, 27 Apr 2022 19:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20220425080413.769861-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220425080413.769861-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH 1/1] package/re2: bump to version 2022-04-01
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



On 25/04/2022 10:04, Michael Nosthoff via buildroot wrote:
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/re2/re2.hash | 2 +-
>   package/re2/re2.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/re2/re2.hash b/package/re2/re2.hash
> index 7cfece5d5e..28f407cc32 100644
> --- a/package/re2/re2.hash
> +++ b/package/re2/re2.hash
> @@ -1,3 +1,3 @@
>   # locally calculated
> -sha256  9c1e6acfd0fed71f40b025a7a1dabaf3ee2ebb74d64ced1f9ee1b0b01d22fd27  re2-2022-02-01.tar.gz
> +sha256  1ae8ccfdb1066a731bba6ee0881baad5efd2cd661acd9569b689f2586e1a50e9  re2-2022-04-01.tar.gz
>   sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
> diff --git a/package/re2/re2.mk b/package/re2/re2.mk
> index 30791a68e5..b6d29c3caf 100644
> --- a/package/re2/re2.mk
> +++ b/package/re2/re2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RE2_VERSION = 2022-02-01
> +RE2_VERSION = 2022-04-01
>   RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
>   RE2_LICENSE = BSD-3-Clause
>   RE2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
