Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA65EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A39E061035;
	Sun, 18 Jun 2023 13:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A39E061035
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Kd_sQ5cU6-C; Sun, 18 Jun 2023 13:03:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3C8260FC2;
	Sun, 18 Jun 2023 13:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3C8260FC2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FEDE1BF5A8
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E79DC410E4
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E79DC410E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l5HNJdHh1DOQ for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:02:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2778414C0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2778414C0
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:02:45 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9889429a89eso41161166b.1
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093363; x=1689685363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6aJkitSPKzIr+/3S8k7JTVCt9fBR/rO4Qcpe9WwV5Xk=;
 b=g8MoQDLySGXQ9w9S+/9ZVqsj6HLN1J45GjgoefGzNdk3MHXW7zfWJ0I8L8bYqnZHma
 P31pe16rQp6WkeLCaw4EzYxxbK5RqkJCHYzrVZR/fJY0IVcKdvvfPn/xOayY4YmXxkeR
 bS4unzfacBp6X+PAuZYVpRacxQyi8jIUs2DsXFfPqTcLBUnGNTNWJQgU+ie//wr63ig1
 2UsZz9rgEF/RYSFeDHQd/TDRRlaxfDoF+HSRHN82/hTQtNF+R6zQiz6D4lUJoplc//hP
 OlWt/CzJ8u2lRXoK1WX8iwS5uEOdMKpxeR9sI2gEdfzxDV+xlcF8Xza0b1wMe2+OzvHF
 +CxQ==
X-Gm-Message-State: AC+VfDxZAdx7Yes30p1LxG/UtGX4jPyS+NDAQlGj5Zj5f72RzPxOD5Gf
 EcdGtquC4E4Z2qsoNAB9Gh+s5g==
X-Google-Smtp-Source: ACHHUZ53fuZBR3DW15gITDegb5Sk6TzVPZwcsavNWBuXEN5+xFyFMYvAtYd1/8qR+QM0rDBZkqNqJg==
X-Received: by 2002:a17:907:6e16:b0:988:a292:4bc3 with SMTP id
 sd22-20020a1709076e1600b00988a2924bc3mr293795ejc.36.1687093363527; 
 Sun, 18 Jun 2023 06:02:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a170906068f00b009886aaeb722sm1008787ejb.137.2023.06.18.06.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:02:43 -0700 (PDT)
Message-ID: <0fc72d11-35b2-b6a2-8028-89c3093567a5@mind.be>
Date: Sun, 18 Jun 2023 15:02:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605070859.1877231-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605070859.1877231-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687093363; x=1689685363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6aJkitSPKzIr+/3S8k7JTVCt9fBR/rO4Qcpe9WwV5Xk=;
 b=AoubiX/QUaa+06H2FEFKXxCefrx7iciSZpJvYsoCjHYM+imtbeaxNbc5SfdxbIViRj
 k+Se0ZpCGVJvHKVEpp/z3EMheKxfjKdk+KmKl7RCiVK0TaGa8Ud0TfMIcVSxnMYCD8C0
 nyIqTSgkKFkUOV9FbLnztCWe2uhDplGPqtBqTWwnxPiIPVkvrqYvlDnJk1dwdex9emFO
 vfKj/GlzlE7DL1rgFBZAfPpvUPWeftLBy15rQDr7c4Mu0XWmo5N3KVjr+gfi4/yNN7Vd
 ZXkRWL5TNX+ROe+0d5sPRuIuYtfX4CFMTSk3jQ5/6Ovy5pzI4JEA32y9/9jP3/0kmK3D
 SxzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AoubiX/Q
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 67.8.0
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



On 05/06/2023 09:08, James Hilliard wrote:
> License hash changed due to name removal:
> https://github.com/pypa/setuptools/commit/5957d58266e479f124b31f30e4322e798fdf386b
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-setuptools/python-setuptools.hash | 6 +++---
>   package/python-setuptools/python-setuptools.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
> index 76ad1ba1ce..be13063728 100644
> --- a/package/python-setuptools/python-setuptools.hash
> +++ b/package/python-setuptools/python-setuptools.hash
> @@ -1,4 +1,4 @@
>   # From https://pypi.org/pypi/setuptools/json
> -md5  1fd8bd04b0bed95ad6c81f03b1c080bc  setuptools-65.6.3.tar.gz
> -sha256  a7620757bf984b58deaf32fc8a4577a9bbc0850cf92c20e1ce41c38c19e5fb75  setuptools-65.6.3.tar.gz
> -sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
> +md5  628ab1ae7d14185e5e536740ea31b5ce  setuptools-67.8.0.tar.gz
> +sha256  62642358adc77ffa87233bc4d2354c4b2682d214048f500964dbe760ccedf102  setuptools-67.8.0.tar.gz
> +sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index 226ef2b479..6d10172cdc 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_VERSION = 65.6.3
> +PYTHON_SETUPTOOLS_VERSION = 67.8.0
>   PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b6/21/cb9a8d0b2c8597c83fce8e9c02884bce3d4951e41e807fc35791c6b23d9a
> +PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/03/20/630783571e76e5fa5f3e9f29398ca3ace377207b8196b54e0ffdf09f12c1
>   PYTHON_SETUPTOOLS_LICENSE = MIT
>   PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
>   PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
