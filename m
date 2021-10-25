Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23870C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:13:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44F0560EFE
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44F0560EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 004D360892;
	Mon, 25 Oct 2021 19:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNk8GrqOxqQQ; Mon, 25 Oct 2021 19:13:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5823A60893;
	Mon, 25 Oct 2021 19:13:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DAB9D1BF309
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7DA1403C2
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UB_3VJzVlThW for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:13:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A60D640288
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:13:15 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id u13so3519569edy.10
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0v1Ahq3IsswRtS+O82eCmP2Km+5SwbH2sLqTGWd6A+o=;
 b=d9TxC9tbq7RM5c2sOtn0Ihfh3jViztSmM84W11tEij+o8iC5SJe+iwu8hQeT82GJE5
 Rt1I+P0d4x2vETTq3Ci5cp/GehhvKlb4fzY5Y8MDwGG9VIZsOq74L7HKBZQRTwhLj46S
 DxIqNtsuk2cFp4Cr1n+HtYKLZBxLTScpu128mNsKT68k2JoMyVHpwQwouDFSt7kHKYBv
 3qescNWP0jQUcilQWt1iv5CM6CONthUi+U/VK8ER/Q6CP6o1NCmgRqcqug9yM+pFdtt6
 dlBvRiLQZ5pBgrO7F7clz5DcDUZXpfo0vouncL2QoAGYQITno1gX4e/fUfTPcdqic6H5
 0Dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0v1Ahq3IsswRtS+O82eCmP2Km+5SwbH2sLqTGWd6A+o=;
 b=4zl67HpEpcxTPtYxPwz5yb6jlVy83ZsmuQJpVB+J/GQFyRaeWVRBkbGFkaK56ynkSz
 bWORmIjBk43FfSz4TUMwz0Uj25V2IEgNdVaS2nZ8bDbVf6Ixuxm/NtlCU9VrfyZbzEwO
 TWcJQ6eJvfWG9UrqM64M2xtfyVzs4WlbjL2wySykLurzwPLa3/nOcYOr7MW2eBkUd6fL
 4j6WaUaTPBKtopgo5Ckb6RepQZ6vPdoeYpLiGWv/coYwnuR4dDhwf649oEeQPYqWU+fF
 L3OZJAD3Fbf/Snlm1Dv6jHcmELWJR0ZvUF7e0XjPsgRl3JlnWfG4ytEhTQsyKigdFr4X
 KbCg==
X-Gm-Message-State: AOAM530PlgCxAkmecfFekCEBgLnup82jipyyWlA7au0yTMKz+3pbXK+w
 xIJiS/LX2W05MTAlaw0/oAMAvg==
X-Google-Smtp-Source: ABdhPJwtufRS28TI4dew5JgQVTHF+vdKJxpFONWI43aqokdskZLNApqYB11GwxqqjI7HePOCrknYqg==
X-Received: by 2002:a17:907:60cc:: with SMTP id
 hv12mr21659855ejc.86.1635189193637; 
 Mon, 25 Oct 2021 12:13:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n1sm2981613edf.45.2021.10.25.12.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 12:13:13 -0700 (PDT)
Message-ID: <bc642573-5119-0edf-b763-3e08562c9620@mind.be>
Date: Mon, 25 Oct 2021 21:13:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211014225849.832479-1-aduskett@gmail.com>
 <20211014225849.832479-3-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211014225849.832479-3-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 02/11] package/python-pydantic: bump to
 version 1.8.2
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2021 00:58, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>   package/python-pydantic/Config.in            | 1 +
>   package/python-pydantic/python-pydantic.hash | 6 +++---
>   package/python-pydantic/python-pydantic.mk   | 4 ++--
>   3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pydantic/Config.in b/package/python-pydantic/Config.in
> index 07b506a20f..ac81aeb342 100644
> --- a/package/python-pydantic/Config.in
> +++ b/package/python-pydantic/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_PYTHON_PYDANTIC
>   	bool "python-pydantic"
>   	depends on BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
>   	help
>   	  Data validation and settings management using python 3.6
>   	  type hinting.
> diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
> index 7bb076fe2f..215b5d1714 100644
> --- a/package/python-pydantic/python-pydantic.hash
> +++ b/package/python-pydantic/python-pydantic.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pydantic/json
> -md5	ce0c1824d1797bc7d67953428c4fe965  pydantic-1.3.tar.gz
> -sha256	2eab7d548b0e530bf65bee7855ad8164c2f6a889975d5e9c4eefd1e7c98245dc  pydantic-1.3.tar.gz
> +md5  7845d2f3c8fe8602f73f53ec5b6dfa29  pydantic-1.8.2.tar.gz
> +sha256  26464e57ccaafe72b7ad156fdaa4e9b9ef051f69e175dbbb463283000c05ab7b  pydantic-1.8.2.tar.gz
>   # Locally computed sha256 checksums
> -sha256	66badbfe56618ec52ddcbfda62450e43752d16fe1e7cae78d346c7ed10a35306  LICENSE
> +sha256  9e3946690ac88b6b73e8f001a0586af13568be8852fd514e4393f39761764387  LICENSE

  If the license hash has changed, you have to explain what changed in the 
commit message.

  In this case, it's a copyright year update.

  Applied to master, thanks.

  Regards,
  Arnout

> diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
> index 0f9dd66a6f..b282241506 100644
> --- a/package/python-pydantic/python-pydantic.mk
> +++ b/package/python-pydantic/python-pydantic.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYDANTIC_VERSION = 1.3
> +PYTHON_PYDANTIC_VERSION = 1.8.2
>   PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
> -PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/3e/69/b22c0eb3157115e1e3d111f574a6a41552539f1e53b064121ef4e9ac1368
> +PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/b9/d2/12a808613937a6b98cd50d6467352f01322dc0d8ca9fb5b94441625d6684
>   PYTHON_PYDANTIC_SETUP_TYPE = setuptools
>   PYTHON_PYDANTIC_LICENSE = MIT
>   PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
