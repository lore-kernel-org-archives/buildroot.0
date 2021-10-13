Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D98BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:04:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 060E3610FE
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 060E3610FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0E1440403;
	Wed, 13 Oct 2021 19:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4bQATFhBxwvQ; Wed, 13 Oct 2021 19:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1032B4047F;
	Wed, 13 Oct 2021 19:04:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B47BD1BF3A9
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3F1A60AF9
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ohd-qj4AJDEw for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:04:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CED2160885
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:04:43 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w14so14237325edv.11
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=raoVmwn/OmahsucuhGYV+virGUl+/oPfeaOnILEzfH8=;
 b=WtDpoU9CTaH5GwWQnPtnOpCEiuiNVOwnLayvgKcfxGWE0E41DnWvVaGzmhT/NNsFT/
 DCJT+hn8IJgu0UAXb+o4I+l4wC8HZzIllRlgNEwyfo7esfJK1O2+s4xr6q3GB1oHBo2P
 IN3dxvHM1SRZRAexJjQgqhlcwvq7YuHV/WCEPOkny7OyCqJEAQ3apBQ2+gUhCR242OVA
 3Enmou2ZKzfJxTonV2oLM0F1RUjmspHjMy5HIe1T8bcWqrtCbV1Vodsr1Vyj4XxESyVX
 4ax/9hJ1rhSioyrwcMLkLD8aYtPgA7rU8Euk3Cbewe1DCRrdu5rBia0iSSO6/eQnMkLL
 phJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=raoVmwn/OmahsucuhGYV+virGUl+/oPfeaOnILEzfH8=;
 b=eJA7BNgRXt4x4cZPrvkgeV/FmdEYKQaCKkvzVbbsH17wg0/GzsKLPpJP8BXxGyTkqP
 Gg/5KYCc/XJhr4TvT+r7BHS5mNz1aRwLCZ5HHFjEQfPWJ4A8UNixnLmJ43qyl6vJepL/
 SPiOFJAzWcQ2cnKThfUqBkEN1D0cvdylfW2MjvOTNz0SqwJx1kTQ0XhKEpGOVkMXbYZO
 mC5/f2TsUO70LHCObmdfXJ6km3NHw8rYdBclkkLInPxcgHz3TYeNZYryDC38BEtSF1vE
 mKKyRnS+cIyy69U85ytCdy9PeUbCRTVt8+/vyJut2/8HcuwgT0nxtd8v/8F5YZh+gCkh
 7SNw==
X-Gm-Message-State: AOAM531L5g/JhGNffz0HJ8Wo1BE5p6FyAOQRACZAVgqUCUXjfi3M7/W6
 unsAIsXEjchG/6oaXe4miKJsrg==
X-Google-Smtp-Source: ABdhPJxr6EjtuFoZrqmlwQbexmqL9yrkp/y6fJNQagWzvKqwJKk1+wemekAYhkTcAG1w/7rloCM0EA==
X-Received: by 2002:a50:da0a:: with SMTP id z10mr1662058edj.298.1634151881818; 
 Wed, 13 Oct 2021 12:04:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q11sm318790edv.80.2021.10.13.12.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:04:41 -0700 (PDT)
Message-ID: <1f8b00ee-6fb0-4282-ef55-964c9dcc0f44@mind.be>
Date: Wed, 13 Oct 2021 21:04:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
 <20211006204135.2813745-5-chris.dimich@boundarydevices.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006204135.2813745-5-chris.dimich@boundarydevices.com>
Subject: Re: [Buildroot] [PATCH 05/12] package/freescale-imx/firmware-imx:
 bump version to 8.12
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 22:41, Chris Dimich wrote:
> To match NXP 5.10.35-2.0.0 release.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>

  Applied to master with the license comment, thanks.

  Regards,
  Arnout

> ---
>   package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
>   package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
> index c434ce7ebd..98a0e73048 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.hash
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  1a7aaab69cd8c48d10ffb0118c938f4b3daf4c7fd86f0342f4d352906f8e0ecb  firmware-imx-8.11.bin
> -sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
> -sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
> +sha256  6b6747bf36ecc53e385234afdce01f69c5775adf0d6685c885281ca6e4e322ef  firmware-imx-8.12.bin
> +sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
> +sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 29241342be..60c97fd2b8 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FIRMWARE_IMX_VERSION = 8.11
> +FIRMWARE_IMX_VERSION = 8.12
>   FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
>   FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
