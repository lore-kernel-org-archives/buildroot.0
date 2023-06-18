Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949E3EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D73D60FD4;
	Sun, 18 Jun 2023 13:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D73D60FD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHhHcI-9YOGA; Sun, 18 Jun 2023 13:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74510608A5;
	Sun, 18 Jun 2023 13:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74510608A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0423F1BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D046F408B3
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D046F408B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-kVBCBw6z2N for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:14:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C12B4089A
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C12B4089A
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:14:53 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9829a5ae978so409698666b.2
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687094091; x=1689686091;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CI2ooo9Q/iJw2UfbzRJu58I5/053nvt1g6kOWsOgAQQ=;
 b=EHhMF65Hngo0wP94hrLuHGbf5ijVFSvKLGAWw4O1a7XmaGJE+ErS/Ft9x0EUi+Iq9J
 hrg8cR+zmUmK4o7kh2VAccFdJYOjRwDFWaUA91e9wuKQ22XLhqF6+BJPBSPqr88rTkRj
 vlRA1/E8UwEZvNCXJ2A4sgqB0wrTGaIcfZex29x/r8UXe97njiKV3r7D/KP6Rpd/xbpr
 CAnYk9TFmtbG0zKWSu3JgvNAHKZq/YklN9pzEoQGQHNyYOtXePDX+vPZ8b41J34j5KMk
 15eKHg+qdhmu5vO5ZQ3z7U2i49mzvWi7w/5lvVFXKH+iXFXOfUbIM7MevMFMduQ0s90x
 nH2A==
X-Gm-Message-State: AC+VfDzyj6tA/8uISFwH0/TKJ6uzNkhRvj2eRUtHIr3gXBih8BdTazGW
 Rcx8aDnuJSefzRPBN6LWqCBLRQ==
X-Google-Smtp-Source: ACHHUZ557lFDgsm8Vc0s2WViV42w27/paJ54Hn921PEXJBQLm6JXE0oA7MZs+4yo/ARCC9MDUuXNag==
X-Received: by 2002:a17:907:16a2:b0:982:9a9f:d43c with SMTP id
 hc34-20020a17090716a200b009829a9fd43cmr7121445ejc.48.1687094091492; 
 Sun, 18 Jun 2023 06:14:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 v15-20020aa7cd4f000000b0051a3f9770dasm2333195edw.8.2023.06.18.06.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:14:51 -0700 (PDT)
Message-ID: <fe710637-3ded-7f09-8105-2c062ee84bf3@mind.be>
Date: Sun, 18 Jun 2023 15:14:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605075100.1901700-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605075100.1901700-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687094091; x=1689686091;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CI2ooo9Q/iJw2UfbzRJu58I5/053nvt1g6kOWsOgAQQ=;
 b=M1hdm/a+MfaZi8OtqXCmZnObJG+O2mErDuttIu64e5iDpCqlw1PpFb3qU0RnBMbFRR
 EhSnajTovYYJ98awHF2qTa7MH7Fpi4+2P98Ex93icnt7pjmHP3x+MZ3W0Ynn7gfZY4ye
 Q2neT1rX2UCZY88ACaI6nFOTz+qobGSj5zXaJ527Wq3GjEjYo5hPxfV0qH0kls1CZ78y
 gqJ4uZ0FfE9V3HWVHPhKydv6Rv1lT5HT0xVvbI6FXOUg//NT8sd+O/rP+I6yq2ICFOvG
 lDMpwCa7VrOuDiRo4KHHRSRtp6mdoYm+FlrN9SKpY3LJaw0yTQu30f2MMLY9ilH35olj
 JOmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=M1hdm/a+
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydal: bump to version
 20230521.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2023 09:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pydal/python-pydal.hash | 4 ++--
>   package/python-pydal/python-pydal.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
> index c55a17a545..8ed25084d1 100644
> --- a/package/python-pydal/python-pydal.hash
> +++ b/package/python-pydal/python-pydal.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pydal/json
> -md5  eeaf44cdcdb6bd2040713c710a4a04be  pydal-20221110.1.tar.gz
> -sha256  7c3e891c70f8d8918e36276f210a1959bb7badf3b276f47191986ffcf5b6a390  pydal-20221110.1.tar.gz
> +md5  47f0425745bcd1bb413aa9208cd06b3c  pydal-20230521.1.tar.gz
> +sha256  10478a61e627c5b8cb7691f7f7ebf7210845485316493d37d740c297fb6d1845  pydal-20230521.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
> diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
> index f55c7fc2c5..1cc7e90b11 100644
> --- a/package/python-pydal/python-pydal.mk
> +++ b/package/python-pydal/python-pydal.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYDAL_VERSION = 20221110.1
> +PYTHON_PYDAL_VERSION = 20230521.1
>   PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
> -PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/73/83/b904c464b6ab060e12b3f406f1fab7deb97bcd9d2021d8c87325e6225c2d
> +PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/68/b4/15dc227f965cc0525ca7f432368706cc4087ad6d587a5a05b251d133023e
>   PYTHON_PYDAL_LICENSE = BSD-3-Clause
>   PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
>   PYTHON_PYDAL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
