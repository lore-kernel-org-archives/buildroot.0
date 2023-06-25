Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68599EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 14:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 095DB81342;
	Sun, 25 Jun 2023 14:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 095DB81342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0A_AJUknwjER; Sun, 25 Jun 2023 14:08:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42728812FC;
	Sun, 25 Jun 2023 14:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42728812FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 440051BF3BD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A42A40A02
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A42A40A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BEfdHQagsrud for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 14:08:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22048409FE
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22048409FE
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 14:08:43 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51bdf83a513so2663060a12.2
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 07:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687702121; x=1690294121;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G1QJ8cPO2U2k6cZm5QJaw8KTd2YpjUtTpnH0KE7eiCk=;
 b=io9RBWo9xr+J3/XUvRP4b34ZbsiEv/n5gSPa6V7+jJmVWcFYmOfAzc5BfnSub+O9l9
 eeOI9JXubVRMmXKdB05IoN/6vnos00a/6dMa3Rnr7UMXlFXZ1gOaeyNu4hDddNE4g0my
 E9XspudLw1ebrxHX9airvl77SBF6UAM9EIIu0lCL4eQrP788t6QbgGPP7HogQJunUJST
 eChRb046/BvRLS7A//Wn1sELWyaDhtBWFe54eenvNf/bAOnX0OALnLHPckWMaLCjWysk
 Xum2wXUbGK18Qta+3ykkq5QNlnCPEQOVIPcElQ9OcyHpBn2bWJfHyZhti0RTqI/MLdHU
 EsUg==
X-Gm-Message-State: AC+VfDy6uDhmrgvY7xfR9mXMEuqgagSLfxhTC8M16AQR1xTArXCsnOMk
 0w2xzT50TxRQOzCmkrDDwFnVFqOAv7zNmSoPt0Q=
X-Google-Smtp-Source: ACHHUZ6gFKItdqS/D7nRli408klxvWctSaFZwREsjsROlZSE77ysQs0kmnEyCT9N4iWnxMUmzOrdyQ==
X-Received: by 2002:a50:fc16:0:b0:51b:f570:3674 with SMTP id
 i22-20020a50fc16000000b0051bf5703674mr4682536edr.33.1687702121280; 
 Sun, 25 Jun 2023 07:08:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b0051d961ab28asm578437edq.67.2023.06.25.07.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 07:08:40 -0700 (PDT)
Message-ID: <84e36d52-1a64-b53e-eeee-932a73425fde@mind.be>
Date: Sun, 25 Jun 2023 16:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230624222705.606301-1-james.hilliard1@gmail.com>
 <20230624222705.606301-2-james.hilliard1@gmail.com>
In-Reply-To: <20230624222705.606301-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687702121; x=1690294121;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G1QJ8cPO2U2k6cZm5QJaw8KTd2YpjUtTpnH0KE7eiCk=;
 b=T0m0Q2A0fsG5CawvXXMxePrJ7GaK47hV57U0B5KD25AgoAKsGt8Xg6Tyi8Ylqo4HVZ
 LZ291nMHYULzzKfYkbyfWFWKy9YKqGMm2RNB0Mri5TN1vW+zezz3YIY+tETfNQqYjry7
 NIN5JxyXptTM5BOmjOwUgnDfdopxe1yTIg8+RKuoLlOHjaHyAo4CCS5Nev6ZhomW0+OE
 MITaD4fz0EOtwkid3fJfweBeYtXShv9QmWW1wOd78j5imCn5qkd+1IV+h3i6QvqZpAm9
 eZW1BmPn3k/yf8GNJwXcYsQFZKhYCOJxg6XYMV5L7TlJduFSzXmsUm4ToLoSwpPdTCF3
 48mA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=T0m0Q2A0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-setuptools: migrate
 to pep517 build backend
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/06/2023 00:27, James Hilliard wrote:
> Now that all dependencies of host-python-setuptools no longer
> use setuptools as a build backend we can now migrate setuptools
> itself to the pep517 build backend.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  setuptools used to be one of the the "simple" methods that requires almost no 
additional dependencies... but now it's pulling in this long chain of pep517 
deps... Oh well, progress I guess :-) I don't understand why at least some of 
them are not part of stdlib.

  Applied to master, thanks.

  Regards,
  Arnout


> ---
>   package/pkg-python.mk                          | 2 +-
>   package/python-setuptools/python-setuptools.mk | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index c15a168f60..78e4410022 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -237,7 +237,7 @@ endif # ($(4),target)
>   # interpreter (both host and target).
>   #
>   ifeq ($$($(2)_SETUP_TYPE),setuptools)
> -$(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
> +$(2)_DEPENDENCIES += host-python-setuptools
>   else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
>   $(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
>   ifeq ($$($(2)_SETUP_TYPE),flit)
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index 2674947162..d957930455 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -11,7 +11,8 @@ PYTHON_SETUPTOOLS_LICENSE = MIT
>   PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
>   PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
>   PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
> -PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
> +PYTHON_SETUPTOOLS_SETUP_TYPE = pep517
> +HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
>   
>   $(eval $(python-package))
>   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
