Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382E4EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE0FF60FA7;
	Sun, 18 Jun 2023 13:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE0FF60FA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kVBs5xb7v1VB; Sun, 18 Jun 2023 13:10:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 048E360F8F;
	Sun, 18 Jun 2023 13:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 048E360F8F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46EAD1BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C67341295
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C67341295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Le9LT5stFB3h for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:10:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB114410EC
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB114410EC
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:10:00 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-986d871a9beso301410266b.1
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093799; x=1689685799;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SiHIVBOuxtWjHwenZ4fGsOYCuwdQMe++dDHFtGJPZRw=;
 b=Ndo1OJCRYYKO0JlNqDWNy32Md6XtzCgQgOKYFWbmIHCZGZ98yr4zo/U6kSiv32hPoy
 b5tk9crVuU/zpl8Fz30orsiHMsbyljV5oSSWCq1fMBwUo7aYjlsfHVSoCD6m00lTERnE
 gHVYOUudXly/7K8FbR3uogTiO/1YFrKYmwmn73uKGFjnwQKtGt0GcpJ3qj0Afu3wm9o1
 vmrFPTbo4zcqQ1YQ/+7t85+XVZ4NKmDgX+c30aWR7Bev6/PXTrDtvVvak058AVAuPtSJ
 7J0G9OLb/m9F3AL0iGUZ7nC6YV3lJaNI667wGgpUwZa8vCtSiLgYSwejtng83jdC3K8f
 MCrA==
X-Gm-Message-State: AC+VfDwxVUpG1zp7vOiPjMmzr92VD8mnuaPZOYB13hB+3CMgDSdoP3DS
 bbrCMSFd2DKxPqAgg4eGO3k6rQ==
X-Google-Smtp-Source: ACHHUZ4gLKqE98t6G5MxaYVCOjh2BjiqOL4KEntUE5jC8uraGz9OgE4Y7G8x9AAWnc2zBshsARWxhA==
X-Received: by 2002:a17:907:9450:b0:974:86a7:d3a3 with SMTP id
 dl16-20020a170907945000b0097486a7d3a3mr7141499ejc.13.1687093798976; 
 Sun, 18 Jun 2023 06:09:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 bl5-20020a170906c24500b00982b8cd7a44sm4371003ejb.139.2023.06.18.06.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:09:58 -0700 (PDT)
Message-ID: <88577936-70aa-f115-cb84-1563b33796d1@mind.be>
Date: Sun, 18 Jun 2023 15:09:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605073324.1889371-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605073324.1889371-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687093799; x=1689685799;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SiHIVBOuxtWjHwenZ4fGsOYCuwdQMe++dDHFtGJPZRw=;
 b=EqUdS8oFbgxP6cEFn/RFK8r1gf+ZpFeZNGWAnL4Ie9wWVvDDcr96aWXz/JXbMvaFys
 UBLaawn4OsdcxV6T96y/Kl4593eBJfxQj+E2b+ChcXNyqnMn18nnOCajzbLaxwFKooeh
 1Vz06VDoadxwcl491dWP45ZDckHQOwy2rc6dAQrGpIDs3jiC/poJvzomFsaDzj5q1SAB
 AXXGs69i9MvJ36G818I+Jil4PAUwIDwWF5jnsz+5He+ma/nz4FBXH34/LfyHA3Jf3Y4Q
 8gVrqGyUb7n4aGdYc8rqmR2MLEsLOmjhsfOncbHWN68lQLHeJvNAPWIcclbIXagPh0ok
 MM5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EqUdS8oF
Subject: Re: [Buildroot] [PATCH 1/1] package/python-requests: bump to
 version 2.31.0
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



On 05/06/2023 09:33, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-requests/python-requests.hash | 4 ++--
>   package/python-requests/python-requests.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
> index b6f696000b..c4aeabb25d 100644
> --- a/package/python-requests/python-requests.hash
> +++ b/package/python-requests/python-requests.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/requests/json
> -md5  09b752e0b0a672d805ae54455c128d42  requests-2.28.2.tar.gz
> -sha256  98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2df24bf  requests-2.28.2.tar.gz
> +md5  941e175c276cd7d39d098092c56679a4  requests-2.31.0.tar.gz
> +sha256  942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd6ad1e1  requests-2.31.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
> diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
> index 8f9f4b2db4..2c74db3711 100644
> --- a/package/python-requests/python-requests.mk
> +++ b/package/python-requests/python-requests.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_REQUESTS_VERSION = 2.28.2
> +PYTHON_REQUESTS_VERSION = 2.31.0
>   PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
> -PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/9d/ee/391076f5937f0a8cdf5e53b701ffc91753e87b07d66bae4a09aa671897bf
> +PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/9d/be/10918a2eac4ae9f02f6cfe6414b7a155ccd8f7f9d4380d62fd5b955065c3
>   PYTHON_REQUESTS_SETUP_TYPE = setuptools
>   PYTHON_REQUESTS_LICENSE = Apache-2.0
>   PYTHON_REQUESTS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
