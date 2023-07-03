Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865A6C001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CD2460BDD;
	Mon,  3 Jul 2023 18:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CD2460BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9cDB5gBRI39; Mon,  3 Jul 2023 18:17:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DE0760AB9;
	Mon,  3 Jul 2023 18:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DE0760AB9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 770461BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5054881A29
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5054881A29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QA3XSOcxgG_n for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:17:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35E8E81A1C
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35E8E81A1C
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:17:31 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-98df3dea907so558259466b.3
 for <buildroot@buildroot.org>; Mon, 03 Jul 2023 11:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688408250; x=1691000250;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IMGHPGKR+tLQBbbsyFNawhvgnipUBGLEY0H+hU/+FVI=;
 b=JOM1cPeh4o8Ob+PZfliZHvRvrm/7jlHYiI1+b3dRNoY9FVr0O43zmd/prrVGMunbQR
 XsTRbaLnGqZiuA55184N7d8sIkwaMjjrKbnYKoKzNp8sMajNDdGqNNa145xPEU31euyI
 VORQvuvQEYZiab5/Rxmww51nsnw9UCydSkUWHEYujr2sDyNWSpB9YeNvJUNPPfT9NWyo
 JKpyT6QfrMoQNY9YNjMVEJ22wAOz9zixm2viI00eIJmNe+QkcTKMzuclizKFOXUVjuAT
 adn6OtXkDlFif0w2S430VSMLyKXIbBoVLKTolocbWRzmTRig0zX82n28RP+qH/uazmYk
 q2JA==
X-Gm-Message-State: ABy/qLYfHb+r3DtlkIgVaqs5nQ3fOLI92MHVqsjaobkyYo2Tc5KzFO3G
 gPd9i9MyQiq1Tzj4zSv3LQCY2w==
X-Google-Smtp-Source: APBJJlGTLgsdXzBl/p7tlCuGy08JGLSNadpNO9bst37RIM23a9sr+k2+ddIds47EZxeoox4cnuP5Ig==
X-Received: by 2002:a17:907:2bcb:b0:978:b94e:83dd with SMTP id
 gv11-20020a1709072bcb00b00978b94e83ddmr9032009ejc.75.1688408249978; 
 Mon, 03 Jul 2023 11:17:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 k25-20020a17090666d900b009737b8d47b6sm12207094ejp.203.2023.07.03.11.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 11:17:29 -0700 (PDT)
Message-ID: <f0b49503-1f81-947d-92bf-d66d830be512@mind.be>
Date: Mon, 3 Jul 2023 20:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230702103121.289122-1-bernd@kuhls.net>
In-Reply-To: <20230702103121.289122-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1688408250; x=1691000250;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IMGHPGKR+tLQBbbsyFNawhvgnipUBGLEY0H+hU/+FVI=;
 b=BbD0jmz3RUM6FJXiCRjAfpXMFAU2CmXMjHt5cOddbMj0wffiAtlJkF3DkzkeKRXiZ9
 p4yul+b2UsEuTC9AAG4cPuV7aK1Ii/dEhWDP8qItaUZwz5MddpHBJYdHFYaZp7t86fTZ
 QUwEB4Pi45O9Zlq92R+8SsI3p3RKnbfWqLGAK2LoH/TlEe3J/8TNMjfx0GgwxE6rTICy
 Vs/Baywf4erV6BTrr2nO5gGzVAMGv03sznpreDuHg55uiftJn97qNn8vpjCV3mZ6N82p
 rfQUT1p1vScDGLP0wHM2qH24w83XA2dTmxGYYh+eq6S4KM3A//El8BJGS2d8pStsDphs
 KF2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BbD0jmz3
Subject: Re: [Buildroot] [PATCH v4 1/1] package/python-pyicu: fix build
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2023 12:31, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/977/977c043615603dd3541e23b81c5f11374606aff6/
> 
> Set environment variables to cross-compile friendly values, this prevents
> icu-config picking up host libraries:
> https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L89
> https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L179
> https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L216
> 
> This follows the upstream build docs:
> https://gitlab.pyicu.org/main/pyicu#building-pyicu
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v4: removed variable ICU_BASE (Thomas)
> 
>   package/python-pyicu/python-pyicu.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
> index 090ed51bff..213c099d07 100644
> --- a/package/python-pyicu/python-pyicu.mk
> +++ b/package/python-pyicu/python-pyicu.mk
> @@ -12,4 +12,10 @@ PYTHON_PYICU_LICENSE_FILES = LICENSE
>   PYTHON_PYICU_DEPENDENCIES = icu
>   PYTHON_PYICU_SETUP_TYPE = setuptools
>   
> +PYTHON_PYICU_ENV += \
> +	ICU_VERSION="`$(PKG_CONFIG_HOST_BINARY) icu-i18n --modversion`" \
> +	PYICU_CFLAGS="`$(PKG_CONFIG_HOST_BINARY) icu-i18n --variable=CXXFLAGS`" \
> +	PYICU_LFLAGS="`$(PKG_CONFIG_HOST_BINARY) icu-i18n --libs-only-L` \
> +		`$(PKG_CONFIG_HOST_BINARY) icu-i18n --libs-only-l`"
> +
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
