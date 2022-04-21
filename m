Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3DEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20E7B60C19;
	Thu, 21 Apr 2022 20:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uVbFneb1U7Za; Thu, 21 Apr 2022 20:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11C4860B2F;
	Thu, 21 Apr 2022 20:54:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 647D91BF3DB
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6139141995
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-eDpDkjg1Xy for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:54:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BDD9417CE
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 20:54:07 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id p189so3911205wmp.3
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 13:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=fDKvNovmN85QFWXZsD0/uyHT4jPpR91p6oh3Y+Bsqm0=;
 b=UIPSe/qHeDrC1rcNMQqXU0klu3smHEhmaFM5yaL44k6IGx3jpuM63uKju3HwhaNn7s
 eYHtJ7n1IBqJuVcvMMNS/ySjp/ojeomv2GPPvT5qYmdA2Hyq/FvMuD3mJVnQJVsq0OIY
 9J9cs4Y012CI2N+FRunj4doU8SYfiJaJp7ZvTuNS2RjAwx8G+TcoyuMf5ORbDk8H9ESD
 J0DTLZTWRnh+okERipQ6koijsdnIBFlF3FrfLrN+Jk38//D7yW4wKCZAxQNdDzcmagDO
 MlXyP9T3xiE0hXQVvBAQw3z6Z40yDYEu0Q5qz6UJc2WySjM+eNKX6IAXqeOgt3ISsT1J
 6zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fDKvNovmN85QFWXZsD0/uyHT4jPpR91p6oh3Y+Bsqm0=;
 b=5/wxkjq2FQRs4bftB3ESl84I3HN/dl+wuEy9CtM5A7L0r+iJUciH4GQz5JqAMo95P5
 q3Tai6qSr2k31vVMLxntKDtDPt8g6Atyy7gKpTz13fnq1RC5W0IGDvSDHoLERuZKduTH
 iEnusmeMtQH+2cY8eCoYodEJHwEuEmw9pRdxsrMpbMGhCgiAyMdAyJyGEEIRiuSDkcGl
 Yg3IDxvS5ed5H2iGJ/owGYUzwIpe1Mrx5KJNbWUo9ekYU6r02Qdar8fXXRTKCvD9899i
 z8lBHwkLQnIPesOm/B/sY5wzGjEqbPLIlya4xVD1kIm6YYJZrxmmdLHSRvlLNhfbmaoA
 Apvw==
X-Gm-Message-State: AOAM532pEd2+JDumjN84U2j0ZqZbTMlrk3BHvOi+lt+Sm3MdPMbSLzlW
 fDxANFW00LBUF4QttryoYIixpg==
X-Google-Smtp-Source: ABdhPJwu/rkY8gWHcD0kzJZenRNOaxV8J+WiNa4bBMjK6ItOcVH6MeKvw0QnMxsSfHQ/GxGxSUxS7Q==
X-Received: by 2002:a05:600c:19cd:b0:392:1419:9d2 with SMTP id
 u13-20020a05600c19cd00b00392141909d2mr10379410wmq.64.1650574445463; 
 Thu, 21 Apr 2022 13:54:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 20-20020a05600c22d400b0038c8dbdc1a3sm37168wmg.38.2022.04.21.13.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:54:04 -0700 (PDT)
Message-ID: <dfc96207-9dd7-208c-2545-22c3643bc841@mind.be>
Date: Thu, 21 Apr 2022 22:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220416214528.3515227-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220416214528.3515227-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/aircrack-ng: fix sqlite3 build
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



On 16/04/2022 23:45, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 1.2 in
> commit 242227dd86efaaec7c785b32a14e8133f2e86dec:
> 
> powerpc-buildroot-linux-gnu-gcc: WARNING: unsafe header/library path used in cross-compilation: '-I/usr/include'
> In file included from src/aircrack-ng/aircrack-ng.c:54:
> /usr/include/math.h:476:21: error: '_Float128' is not supported on this target
>    476 | # define _Mdouble_  _Float128
>        |                     ^~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/83a114ce197fb6af53a26ed68184cf3bbb30c8a7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/aircrack-ng/aircrack-ng.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
> index ff87766d6f..95cda7c5a6 100644
> --- a/package/aircrack-ng/aircrack-ng.mk
> +++ b/package/aircrack-ng/aircrack-ng.mk
> @@ -69,7 +69,7 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_SQLITE),y)
>   AIRCRACK_NG_DEPENDENCIES += sqlite
> -AIRCRACK_NG_CONF_OPTS += --with-sqlite3
> +AIRCRACK_NG_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
>   else
>   AIRCRACK_NG_CONF_OPTS += --without-sqlite3
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
