Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC328C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 19:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BA2D61C40;
	Wed, 16 Feb 2022 19:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5z-8XJkQS2UA; Wed, 16 Feb 2022 19:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7FD361C46;
	Wed, 16 Feb 2022 19:40:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12D0B1BF592
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00A9E400D6
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OoYQUeHyKrbc for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 19:39:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D55A3400A6
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 19:39:55 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gb39so1677316ejc.1
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 11:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bEo5w9G9slrOURVaWq597q4bNQedqTY95iu7vEHyMXA=;
 b=bpJcVYe/p7hD+kqL3TrbB5cfEt/GOT14Pr1VIDDb5mfXjPsxalD9kJ+O0mRojBjBRt
 iRP7derlzB2pwJuVnqgSW5W3LLq2uoPpy2S5i2SaFkrgnuvVn5tWY9F10FDxnuAqXA9S
 z4tJgfioWJnz8PxcRaTDeWNMLC+RaNGB869ofDzrlAgsGOhzyZbyFRrT4sqFRyiQ4Q2v
 tLwNVty/zrUdZ34GxOoK0umZ/ZTuYJ/d07cqaJr6M3tnUsR38a5OOk6yoVHOo3Qs5qb2
 qnoe+duULlbzlQYj9KPZ5m9Zz1r9eIdBUNNwSMPAQs+r1V5zdkspeQYzXYjL4J8RBpdb
 pBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bEo5w9G9slrOURVaWq597q4bNQedqTY95iu7vEHyMXA=;
 b=1ChA1bUtNJoBSdqwKlrH1M/k4zFEdR7ClUenWkjuwrawb4DzkQFaBRoQS6pIOtqCnI
 hStNirtC9mAexPysKgykZ4R8+FI+MesK5sU2SsTbk2gk6OJHKiEfHjNpnZi4tObw7v+P
 tPwtRVFoVOQHfbdFBNY/i/GsYrLA08J9hVHkfZQYeYQ3IQt/oTmRCWg1SBOdQ8p2UDEt
 7NJJupDpqTKvHkNZbRxC2j2+mN/LU8h5vzOcaVkEu4qwVYehk2pm9NbhS7+InyhFeM1O
 oKQskpZEjZ4GB/93ZF5d3v1QBoPfpG/iJGqYocUpoo8k3KWEajLufWRlAH7GVR2yUoLb
 pKZQ==
X-Gm-Message-State: AOAM533eGShXTkWOANOvx41UDmk7gKRs9P+EkKKj4Fi6Qd3/EPXgbsGv
 3A/x7uwCOFF2a8H99WBdUQS1mQ==
X-Google-Smtp-Source: ABdhPJy0YnmkdTnvo4y9ksn00gJkJXXLpG6ttxTV6xV9bEsj9pwFJsQ1RSaVjPIu3Xn1F+uTpv79CQ==
X-Received: by 2002:a17:906:2a1b:b0:6ce:a15b:a561 with SMTP id
 j27-20020a1709062a1b00b006cea15ba561mr3591127eje.403.1645040394158; 
 Wed, 16 Feb 2022 11:39:54 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g6sm257399ejz.170.2022.02.16.11.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:39:53 -0800 (PST)
Message-ID: <b029767f-e494-baab-6caa-7c090d239bfa@mind.be>
Date: Wed, 16 Feb 2022 20:39:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220212111843.1210441-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220212111843.1210441-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 60.8.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/02/2022 12:18, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   package/python-setuptools/python-setuptools.hash | 4 ++--
>   package/python-setuptools/python-setuptools.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
> index 8df7155d4c..e04235e041 100644
> --- a/package/python-setuptools/python-setuptools.hash
> +++ b/package/python-setuptools/python-setuptools.hash
> @@ -1,4 +1,4 @@
>   # From https://pypi.org/pypi/setuptools/json
> -md5  082637e8fbc2e1fd9c637665d8fcccd8  setuptools-60.7.0.tar.gz
> -sha256  b83cf328a4f6a987c95610e76b29a30778db05174eef71f771776c48f8f25d1b  setuptools-60.7.0.tar.gz
> +md5  f47a5750f6084cce3418f213a9d97785  setuptools-60.8.2.tar.gz
> +sha256  66b8598da112b8dc8cd941d54cf63ef91d3b50657b374457eda5851f3ff6a899  setuptools-60.8.2.tar.gz
>   sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index 584f83f7a0..8653c42259 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_VERSION = 60.7.0
> +PYTHON_SETUPTOOLS_VERSION = 60.8.2
>   PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/29/dd/48d662bb93e5e51e72265ef612f869947d4ae4126328d7156824cd50d440
> +PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ae/0b/e458b0d07dced3d7fa2d21d828e708f374ef82040f2012c05d35f47f9af3
>   PYTHON_SETUPTOOLS_LICENSE = MIT
>   PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
>   PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
