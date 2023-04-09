Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133E8C77B6E
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 21:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC77660AAC;
	Sun,  9 Apr 2023 21:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC77660AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1FgUBttkyNJ3; Sun,  9 Apr 2023 21:13:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E02606076C;
	Sun,  9 Apr 2023 21:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E02606076C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA7131BF3F3
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 904566076C
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 904566076C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szaDA1imIk7K for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 21:13:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DE8160745
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DE8160745
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 21:13:46 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id f26so2408550ejb.1
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 14:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681074824;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LchE6ZpgPD+/mdTKBgebDD6W+VhxC/r5BK6gTbsfQXo=;
 b=1GTbRmA/ave88OQVB9YUS/1Qp4V80mgXnideHCc2oe1oepCaluoKziFinxIY8ehO2p
 UrGj+3Kh4RODd9/hNaEA7rMVq/J7rLuql09AFbK59vx6eJmJplnSzAOTrmsAwM33EwF8
 sKBpn4UaZy2FE1BaZF5DMamU8pN2o4mq9YQkcoxLiORsTpsSa83FghUbfia2CsacHYGn
 0ARKv28WRuiB9Gv6TZqV6iiSI8c4+RKP0wd9V273n7f/ZGsX9iyDjiOl3W4AuYK9Q1pB
 I6CMTC4/UqACVijJekkUqcktaEGiPptZR5m8aVm0m+IXNFBHrHdy7cODxvN6Czne2/Uv
 3Few==
X-Gm-Message-State: AAQBX9co6OTg/diEdBEuwPSv125YtnYuvbbWmORIA0WNE3InIxdAu9ps
 0xVVcf0ahXdVM0Bjlf5K+nrZA8ac4VdltISv738=
X-Google-Smtp-Source: AKy350aKOxb9t2mptZ/cdNswWFQdxLAONE6F2CvRy5v7OPmtY6jFxA6G2MiAvtNmUDHGtNIDF11urQ==
X-Received: by 2002:a17:906:1546:b0:932:365a:969a with SMTP id
 c6-20020a170906154600b00932365a969amr5926671ejd.8.1681074824381; 
 Sun, 09 Apr 2023 14:13:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 cw10-20020a170906478a00b009486efb9192sm4511184ejc.11.2023.04.09.14.13.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 14:13:43 -0700 (PDT)
Message-ID: <275eae9c-4ad7-785a-7817-f4501a8be39c@mind.be>
Date: Sun, 9 Apr 2023 23:13:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230403220014.2729-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230403220014.2729-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681074824;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LchE6ZpgPD+/mdTKBgebDD6W+VhxC/r5BK6gTbsfQXo=;
 b=O90BeKKox4wXEIjVHEIK2y6pp88w30ngu0OxvqA3ddpo0J+zqARBROgjtDw7IteYBz
 yNbjYAJlzIlngO0SSWeaF4TnGpmKDgheexSS8GWev1qjziSh+DvLhxZmdoWoKwebmHqD
 CGAIu4lOSGQM2AYO5J1CAEy53LMPL/usn7uhI5R1en5PaqppyAi/2W5ZbvaEG2FFm8ug
 Exf9rqMd8SUNr9keGDLxiL+vXFk+aILofQOsIsgZPZTs/Uvd0bTg2VM1H6YlqRKEA/3O
 1bmC8Ycma4Rqg7IzkiOQPCEWsCg21WHYnS0S1EEPJ4Asbsgql+VyBBmJTFuwuiSyusJn
 Cq9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=O90BeKKo
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pep517: drop package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2023 00:00, James Hilliard wrote:
> This package is no longer used as python-pypa-build now uses
> python-pyproject-hooks instead.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS                               |  1 -
>   package/python-pep517/python-pep517.hash |  5 -----
>   package/python-pep517/python-pep517.mk   | 14 --------------
>   3 files changed, 20 deletions(-)
>   delete mode 100644 package/python-pep517/python-pep517.hash
>   delete mode 100644 package/python-pep517/python-pep517.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7c5880c8ee..9f795804cc 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1410,7 +1410,6 @@ F:	package/python-multidict/
>   F:	package/python-mypy-extensions/
>   F:	package/python-outcome/
>   F:	package/python-pathspec/
> -F:	package/python-pep517/
>   F:	package/python-pycares/
>   F:	package/python-pydyf/
>   F:	package/python-pypa-build/
> diff --git a/package/python-pep517/python-pep517.hash b/package/python-pep517/python-pep517.hash
> deleted file mode 100644
> index 6535e51656..0000000000
> --- a/package/python-pep517/python-pep517.hash
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# md5, sha256 from https://pypi.org/pypi/pep517/json
> -md5  7fd08b11215256601a8a4940c1ba3d34  pep517-0.13.0.tar.gz
> -sha256  ae69927c5c172be1add9203726d4b84cf3ebad1edcd5f71fcdc746e66e829f59  pep517-0.13.0.tar.gz
> -# Locally computed sha256 checksums
> -sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
> diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
> deleted file mode 100644
> index c43b09faaa..0000000000
> --- a/package/python-pep517/python-pep517.mk
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -################################################################################
> -#
> -# python-pep517
> -#
> -################################################################################
> -
> -PYTHON_PEP517_VERSION = 0.13.0
> -PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
> -PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/4d/19/e11fcc88288f68ae48e3aa9cf5a6fd092a88e629cb723465666c44d487a0
> -PYTHON_PEP517_LICENSE = MIT
> -PYTHON_PEP517_LICENSE_FILES = LICENSE
> -PYTHON_PEP517_SETUP_TYPE = flit-bootstrap
> -
> -$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
