Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83170EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13D3181E44;
	Sun, 25 Jun 2023 13:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13D3181E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 553jYnRWKRBi; Sun, 25 Jun 2023 13:54:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EC5381E3B;
	Sun, 25 Jun 2023 13:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EC5381E3B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2F2D1BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B4A940130
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B4A940130
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7_U_cjH3Zc4 for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:53:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CB0D40900
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CB0D40900
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:53:53 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-987accb4349so370807966b.0
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 06:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687701231; x=1690293231;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ya+/iSnOXjJEt05zqecp/xZQJShWIEcMCVvW4dPtq9M=;
 b=Ld9pO+e+E/YJ7oydcQA681oUVzgNC2PLepndEMi1Zogr+PEjxQe1JZuYT1DeGNOTVB
 2gXApzAmyiAsgb/afTrh5thagsQnLAu8wQchJK88JZZWZEXIhF0y0pwBJ6+urbumYbIW
 7yB8ppN/deg4+YxQ5Hm9HudqeQaEGDCCF1DPvehJ7IlCU9y9cdEiEpnqJefvnBEsyL0Y
 3ybaVqG+ffv4Mek+BQlAatyTsV1GKWeLwwNWg79Sm4bd5bnQXVB9/IWkKo/YJTB3xV/g
 y/OBkOSGNTbB2ECXEXk6ccbSC0hMllLLPvtGXw++qYq9ShyZy4ditZKnHuhem6NRpx/Y
 sh9Q==
X-Gm-Message-State: AC+VfDyRb7sckF2Y8L0DIJBmSQqCliDsETv3LkpsvXi4wJMzzHb1CHik
 Yu/vF53ISPEWbHHjHopau32vEaXVFpxOjYRmDIs=
X-Google-Smtp-Source: ACHHUZ62JJl3/jW0wmhY1j9DUz39dC+TQsfIsdSlF8SYB3YA/R1e/v8r++aRBMi23rMgqoICMsMctg==
X-Received: by 2002:a17:907:806:b0:974:5e14:29c0 with SMTP id
 wv6-20020a170907080600b009745e1429c0mr25609930ejb.21.1687701231236; 
 Sun, 25 Jun 2023 06:53:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a056402033200b0051be83f75e6sm1767317edw.95.2023.06.25.06.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 06:53:50 -0700 (PDT)
Message-ID: <cf95eb66-ab1b-9c1b-d50a-cff4304323c5@mind.be>
Date: Sun, 25 Jun 2023 15:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230624152120.2879074-1-bernd@kuhls.net>
In-Reply-To: <20230624152120.2879074-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687701231; x=1690293231;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ya+/iSnOXjJEt05zqecp/xZQJShWIEcMCVvW4dPtq9M=;
 b=Q3Y+MffT4ZKgYAKBsXA2EoMY09VlQejRiMWmulAdfoCy/kWNauCVrsSpV8VoS6sj4b
 oNn+AtbdlwrFH5USw4J1wMnvikKqrwT2Q7nx1RaB0dJJhlW61ifvGuZxNgoGPt6oq8qS
 W+NoS/kL7Mg3N+21zrCsj11sNvIyaqmt/DqYeiWMWTYztDPbdSN8zW/1eFX6lPcMF2be
 hK7EVtbpGkHSBOl/w2hVZOQA5rVRHA57GponY8qDFep8vJEXuH/GkxLTS8JF449OB/jU
 WrJMsrr1qHe39OWhbjCQ8g5BkwMveufSH+cc5EtImEVWi8U6MLeQfsM4/pyhYC6jbZYc
 1u7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q3Y+MffT
Subject: Re: [Buildroot] [PATCH 1/2] package/ell: bump version to 0.57
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



On 24/06/2023 17:21, Bernd Kuhls wrote:
> Changelog:
> https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ell/ell.hash | 2 +-
>   package/ell/ell.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ell/ell.hash b/package/ell/ell.hash
> index c0f1731676..dd4722480c 100644
> --- a/package/ell/ell.hash
> +++ b/package/ell/ell.hash
> @@ -1,5 +1,5 @@
>   # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
> -sha256  58eb8b2b64087f7479d5db6a830a0656c536d93e5f11d4c9a4443ce8760a1b63  ell-0.56.tar.xz
> +sha256  7603928ee584b758ca27c67e4dc513049a09b038d7d28459a9440f8443c91018  ell-0.57.tar.xz
>   
>   # License files
>   sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
> diff --git a/package/ell/ell.mk b/package/ell/ell.mk
> index 994b0e19f0..08deb62abe 100644
> --- a/package/ell/ell.mk
> +++ b/package/ell/ell.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ELL_VERSION = 0.56
> +ELL_VERSION = 0.57
>   ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
>   ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
>   ELL_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
