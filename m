Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927A3C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:04:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B50161139
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B50161139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEF6881C56;
	Wed, 13 Oct 2021 19:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OuY4YvQdbH_i; Wed, 13 Oct 2021 19:04:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AB37818CA;
	Wed, 13 Oct 2021 19:04:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B05001BF3A9
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD5E780D6C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLVeyPF74OOJ for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:04:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFEE580DAA
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:04:18 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g8so14373951edt.7
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rgwYWbVb7IR9ipyGpx9R5dL3qkbG0msOlwVFjzbPfCE=;
 b=DHejqDN4H3Q42Wc3KbvsQMmGFXJgaRhyExsO18w4UJ9tmAuW+TtYq6iiH+pfjjxlKv
 MO4B0HYk5GmecZI/14c8oSDeDGlxYJvnAROgPotjqgFUGptzaUmtICB6YwAaPEx7bKzw
 Vr1xDJuHg41f3fdm9WrbnmC7RWKY0bApFYYoCOTfW8PWSo4g1QqSGQJOUYfmZYK6Y+z3
 GYnyCKmSBlBFH4G7UwU79EIGtm9o+RZNjai2X7HpMwO8Q3NvbBB/Ba07PtI4/zqomBrR
 qI7jEN7qj9cxIFYJ55Vg4myEjd/+MHNBacghdbnhpvFPu+qbAAC2CD+ej6TGeW5N9YmE
 Q4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rgwYWbVb7IR9ipyGpx9R5dL3qkbG0msOlwVFjzbPfCE=;
 b=S7XsF8w3a/n7c9qJOWkDTubkVdYA1PzDhyq6rYREcg9d5Al5/+Tv2oIcw7DNAc2/ca
 TnIzNuKsrxNV46+8FX35Xj9NkRMnETsmTrmrx2Dwd4tES2dXaOISMZdv7rZvJcgVc1CL
 G+8FXlsZSVEZnbOmqCM31oE4kPAjQp8tEAp3qhKwiueYHl1umq9lXLmqIYPDlufyQOtI
 C5i7GODQjnGq4Yf7ZgeH9wtzXMfB2DkjNqKRNaxqHVEoyVc7CvBbkWTF/cVtSd3h1kjd
 qOtD2XY2webY5z3QS8bG22bq8/ZU9Mxp/k+D/EqbN0+UN5VZpHKMowX1EPmrJMuHYhQg
 ZTdA==
X-Gm-Message-State: AOAM533FSl01TzKRsgbsEnCTXqQdRvYqAY8kkqZQU3RvcY9kOIBKH9J+
 erLNs/aF27vbj1859ej/uzOn3w==
X-Google-Smtp-Source: ABdhPJxx5f3qq31aU2eVllDsmc3Q0yEe1CqboKsMU+HEkE7CPLzVrehMa3uW454Hd69FaDQmuUjwCg==
X-Received: by 2002:a17:906:3148:: with SMTP id
 e8mr1211168eje.240.1634151857045; 
 Wed, 13 Oct 2021 12:04:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q14sm278482eji.63.2021.10.13.12.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:04:16 -0700 (PDT)
Message-ID: <6be3300f-d761-43ad-29ec-df83c7d18d50@mind.be>
Date: Wed, 13 Oct 2021 21:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
 <20211006204135.2813745-4-chris.dimich@boundarydevices.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006204135.2813745-4-chris.dimich@boundarydevices.com>
Subject: Re: [Buildroot] [PATCH 04/12] package/freescale-imx/imx-gpu-g2d:
 bump version to 6.4.3.p2.0
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
>   package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
>   package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
> index 4f05ca78b0..4d28b037d0 100644
> --- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
> +++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  9fd1b2c05ecabb3cc1468c357fc85f024a736de54abb9942e17230f24fa280c0  imx-gpu-g2d-6.4.3.p1.2-arm.bin
> -sha256  1b0369e9f75bf8fff7b8a86ade8d0d1748a52579b02ef72e53ad5565eee4dc60  imx-gpu-g2d-6.4.3.p1.2-aarch64.bin
> -sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
> -sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
> +sha256  39fe307916e19a0892a514621121086e276a43858af90230372a1344852116a2  imx-gpu-g2d-6.4.3.p2.0-arm.bin
> +sha256  2642a49e088daae4cf568a150d01e7c095995e8a6ff1883c02c3fa6d26d254b3  imx-gpu-g2d-6.4.3.p2.0-aarch64.bin
> +sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
> +sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
> diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
> index 12f881105d..0e4078a962 100644
> --- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
> +++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
> @@ -5,9 +5,9 @@
>   ################################################################################
>   
>   ifeq ($(BR2_aarch64),y)
> -IMX_GPU_G2D_VERSION = 6.4.3.p1.2-aarch64
> +IMX_GPU_G2D_VERSION = 6.4.3.p2.0-aarch64
>   else
> -IMX_GPU_G2D_VERSION = 6.4.3.p1.2-arm
> +IMX_GPU_G2D_VERSION = 6.4.3.p2.0-arm
>   endif
>   IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
>   IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
