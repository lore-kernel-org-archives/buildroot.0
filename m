Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C264EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E840A611A2;
	Sun, 18 Jun 2023 13:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E840A611A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 390lz8f8QGHt; Sun, 18 Jun 2023 13:15:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FD81610BC;
	Sun, 18 Jun 2023 13:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FD81610BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8B5D1BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2958403AE
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2958403AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xo5wWNNNYr7B for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:15:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBE4C403AC
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBE4C403AC
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:15:07 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9883123260fso88763766b.0
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687094106; x=1689686106;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=COd7ndTiclowySfTyVjLU5boNNzQEWv8qVwOqR1Tv9U=;
 b=X9rFFaHs4spSHFLkIL0YXBRQcat5YzP2q/YU8msYnGoH2WEe1UTqy9/tUV8FGEUIie
 b8O9nriJtELHJKzp1KMO3oW/jLgBQKDGp0HBiUA3h+TWnNSe8iLE3vyWsPsmviKq7CPm
 so73Wc3Y8vVYjYdfMTng24ofzTAUSCfq0lD7X7Xx9e0/bACT9AVW7hst4g44Fbujsjjr
 9l5Xf+uX7MxwB/ndiVfZMc7d2S6MDZo7FlD5pXRSHa83eSKCG6xNSl1FzUH6Al0EFKdE
 RjSmK1Y9qUpLRKI2qTZJgRfqRrpANgGg1KwIY17TYXHx2k4FajYpbsaXb+enzbpVvt6e
 fVUg==
X-Gm-Message-State: AC+VfDztGh0cIfBLowppLwZlt1uVaid/TvMvWbzN4YAIx/eYNSLv9IOK
 +HH+zzX0MtdzcoKaJddpvc4FQg==
X-Google-Smtp-Source: ACHHUZ4VTP6FI3id0ZZMSwoxkZEj5u3RkS1lyZMMttvBYsqSlHjRq3RxbK6GKgW7kC4/MYS/RxdqfA==
X-Received: by 2002:a17:907:8688:b0:97e:56d5:b885 with SMTP id
 qa8-20020a170907868800b0097e56d5b885mr6664927ejc.60.1687094105894; 
 Sun, 18 Jun 2023 06:15:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 rp5-20020a170906d96500b00988781076e2sm821548ejb.78.2023.06.18.06.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:15:05 -0700 (PDT)
Message-ID: <82dd38eb-e85d-dd2e-42cc-2a68128303ea@mind.be>
Date: Sun, 18 Jun 2023 15:15:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605074732.1899050-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605074732.1899050-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687094106; x=1689686106;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=COd7ndTiclowySfTyVjLU5boNNzQEWv8qVwOqR1Tv9U=;
 b=XGZruqJRAC6xDod+vyi37cErfycqnLbMsko/hRi2iTYcA6PGhcgJ9BjEndVpD8dsgR
 myGOrIXbzwQ5kcEcBG/PTKE/XYRZNVNlp1268+TfG8KXHpCnqpt1QlKjFtWsizk4Tn3t
 N8Im0zcTcoOy5+BcCX1YxbUV94bQyJ4CxnA5Xk/1DXpQU3fgr6QAlrY0fw4Lo8djHne/
 KrjrPpdMVq2tF5Bnx1QBe+0oeKHSPqmLkJ6CzoQb9tdf2uxcMI5fz8gF0wez2N1ZLn29
 aDO4tiGWbmovbfmI/plgdViMxPpriL5/L70WCSJXgc99mitNcEMyck9V51Uga1uY3es9
 Erzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XGZruqJR
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to
 version 1.10.8
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



On 05/06/2023 09:47, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pydantic/python-pydantic.hash | 4 ++--
>   package/python-pydantic/python-pydantic.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
> index e73a3099a8..88b17f4575 100644
> --- a/package/python-pydantic/python-pydantic.hash
> +++ b/package/python-pydantic/python-pydantic.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pydantic/json
> -md5  2e036b5f993b93dd83f6a7009252ae78  pydantic-1.10.4.tar.gz
> -sha256  b9a3859f24eb4e097502a3be1fb4b2abb79b6103dd9e2e0edb70613a4459a648  pydantic-1.10.4.tar.gz
> +md5  f0e286c32f40ec45aba9603742739cd6  pydantic-1.10.8.tar.gz
> +sha256  1410275520dfa70effadf4c21811d755e7ef9bb1f1d077a21958153a92c8d9ca  pydantic-1.10.8.tar.gz
>   # Locally computed sha256 checksums
>   sha256  9e3946690ac88b6b73e8f001a0586af13568be8852fd514e4393f39761764387  LICENSE
> diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
> index a1a4dc9b16..b800426d22 100644
> --- a/package/python-pydantic/python-pydantic.mk
> +++ b/package/python-pydantic/python-pydantic.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYDANTIC_VERSION = 1.10.4
> +PYTHON_PYDANTIC_VERSION = 1.10.8
>   PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
> -PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/53/17/34e54e352f6a3d304044e52d5ddd5cd621a62ec8fb7af08cc73af65dd3e1
> +PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/23/65/2aa13873e9e0084ecaec00fbe6c6096b65e1ab99ba66bdbf7e4e7c4cc915
>   PYTHON_PYDANTIC_SETUP_TYPE = setuptools
>   PYTHON_PYDANTIC_LICENSE = MIT
>   PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
