Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ECDC43334
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 08:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 866A284292;
	Fri,  3 Jun 2022 08:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GyyzWKKCUg5B; Fri,  3 Jun 2022 08:01:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A146A84162;
	Fri,  3 Jun 2022 08:01:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 180A61BF362
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 08:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14BC9400F3
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 08:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVzBOoDICls4 for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 08:01:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B553D400AF
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 08:01:04 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id u79so4104296oie.5
 for <buildroot@buildroot.org>; Fri, 03 Jun 2022 01:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YyB7TCu7aHO8+lbBF9SavOrrz5W0rmNckKKw3nGS5Xg=;
 b=EWdIk31WLa6d1pZ9XpF/scOBg/mXREEdE2KID3XHxN1d6OwCrjP8Gw3N2poCtEz7vj
 qEY9f6bJwjvgwr1f9cJrvQauug36TL5T/+zJjrzUznYHGST1cVhsPC9/ChRPrB0Xa4Dx
 0ey8PNDCZOPhvgXlort50E/Ca51OYRRSg+G9QCvyITkDB+Jhg2JnBetRGj50HZEbYgri
 FutXfQwE1iW2aBu0euEMHiEYzr8kuKy34bMDTKnNitYjXNlFksMgo5sHtI06KcWCdqcR
 kxeTG9mUIhDoYTCqf6ZczZGYSCYEzdLelwlQ76E4EW6V5uqRhnO4tupuHTa1f/66DzQm
 zjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YyB7TCu7aHO8+lbBF9SavOrrz5W0rmNckKKw3nGS5Xg=;
 b=A6Zen/HBS7HSj5hHBn70xskaPj6OfRa4M8tUqREgo9gfuBBiEP+czn6vfevWIeNw88
 V4WHfb86FVlOxZ1Da9qMHg/xbKKvfDSWMHU6tH39O3PFmkbjzdT+kHioBFRLzLSQe5gG
 ELFESBhnj3sImc25+r94K6usPPt4jTfqks6RIPCL9b5fUyV86sOgGf6X2iX02BMeD8Iv
 K76RDAcglN15gu5qXEq7XX6dKtZugckVYzlSpyWLn3e15GIF6WjQc/1GgB6z1A/XFq1i
 RjKHkYZSnuzpRAHpKAqoazxUFMafp85FfP48kXv/pdirtpv9godjY7znn5TzA+9NZX59
 nVhw==
X-Gm-Message-State: AOAM5313Daab5SJci5quEYZjXLolMZLiIPpAi9uhKgC57Gxs+W42NF96
 UuheyMTY0PsyXGE0CBPsQTmjB3QXpbNSREULDWvCLta0+4PiBw==
X-Google-Smtp-Source: ABdhPJz5HQxwz8MwLdAm0qXVvqtHZO087t2AGbE5xZihkzrfMlxGfIluxw28hzmnY2goz6MvB7mVvkS41hi3RWQWxNg=
X-Received: by 2002:a05:6808:124a:b0:32c:45f0:5011 with SMTP id
 o10-20020a056808124a00b0032c45f05011mr4748384oiv.217.1654243263595; Fri, 03
 Jun 2022 01:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220602090012.2008381-1-kory.maincent@bootlin.com>
 <20220602090012.2008381-2-kory.maincent@bootlin.com>
In-Reply-To: <20220602090012.2008381-2-kory.maincent@bootlin.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 3 Jun 2022 10:00:52 +0200
Message-ID: <CAN5uoS-i+Yr8gAVa=BP-1OkrDgZ_6p_z308U2npzhV9h3EAb_A@mail.gmail.com>
To: kory.maincent@bootlin.com
Subject: Re: [Buildroot] [PATCH 2/2] boot/optee-os: add support to build
 with python-pillow
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kory,

On Thu, 2 Jun 2022 at 11:00, <kory.maincent@bootlin.com> wrote:
>
> From: Kory Maincent <kory.maincent@bootlin.com>
>
> SOC constructor version of optee-os may uses python-pillow to build the

s/uses/use/

> Trusted User Interface feature.
> Add support to build these specific versions by adding a new
> BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_PILLOW option which will
> select host-python-pillow dependency.
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---

LGTM (Acked-by: Etienne Carriere <etienne.carriere@linaro.org>) with 2
minor spelling issues.



>  boot/optee-os/Config.in   | 7 +++++++
>  boot/optee-os/optee-os.mk | 4 ++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> index fb8a189a75..b459393191 100644
> --- a/boot/optee-os/Config.in
> +++ b/boot/optee-os/Config.in
> @@ -72,6 +72,13 @@ config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
>           python-cryptography. Select this option if optee-os needs
>           python-cryptography to be built.
>
> +config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_PILLOW
> +       bool "OP-TEE OS needs host-python-pillow"
> +       help
> +         OP-TEE OS version from SOC manufacturer may use python-pillow
> +         to build the Trusted User Interface feature.
> +         Select this option if optee-os need python-pillow to be built.

s/need/needs/

> +
>  config BR2_TARGET_OPTEE_OS_CORE
>         bool "Build core"
>         default y
> diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
> index 5313a1badc..88f14b48e4 100644
> --- a/boot/optee-os/optee-os.mk
> +++ b/boot/optee-os/optee-os.mk
> @@ -29,6 +29,10 @@ else
>  OPTEE_OS_DEPENDENCIES += host-python-pycryptodomex
>  endif
>
> +ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_PILLOW),y)
> +OPTEE_OS_DEPENDENCIES += host-python-pillow
> +endif
> +
>  ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_DTC),y)
>  OPTEE_OS_DEPENDENCIES += host-dtc
>  endif
> --
> 2.25.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
