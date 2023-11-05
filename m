Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC87C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F12741B42;
	Sun,  5 Nov 2023 21:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F12741B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fv_qqATG_H0S; Sun,  5 Nov 2023 21:07:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74C8241962;
	Sun,  5 Nov 2023 21:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74C8241962
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BAD01BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6205040A68
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6205040A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnzEZ9HjPZHM for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:06:53 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CCB940A5F
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CCB940A5F
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5401bab7525so6444077a12.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699218411; x=1699823211;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8UgGuhHt7j34SBJI5Gonsa29owyc7En/9Lr8bgIhNnI=;
 b=DmYAGikoCaH6DTSkClV2WRvtu3z6Hu5LIIgdQKUzOdok8SMqYUVyiKQ4ACgxVdTmCk
 qJUh6XHz8cYSsEqZINq3agk/bYzQXpAVFudsLSm5wzA3qNNV6RVW28/P8+/9bxpCYse9
 Gz1oyN8jFv7mefQ9d7hNP2+xqzmSpDZ9/mz3wVEW14hqnFwvOLxOEszXHxsN+lWCoVGL
 6unBTAjVUVHtI1oFz2UaMoYMCFTUdihx1+aywxYEpo64xIgUnArlj14eIFB7hid/Fk2u
 TKxX2aX95VF70Wd9Unt7H54LuwlKwjXvMHCSmIfJioGhBFfzRp2dRAqOhmBYXJ0I6dRe
 BRMg==
X-Gm-Message-State: AOJu0YwJiGShJWkot/Rvp1zHORsQyi+wtEHdO0yjNBd8/0d3wdgV04Lz
 Mu//dzxNAwAgAuyYthezsAdWTBWzQEteD6x+6OA=
X-Google-Smtp-Source: AGHT+IHCiWHEWgtAO1CRiaKdaTsx4orZcklzK4GUeCZSDesrV4H0zYJhau9/bQ7/csD9I5yMqCEvAQ==
X-Received: by 2002:a17:907:9406:b0:9df:bc50:2519 with SMTP id
 dk6-20020a170907940600b009dfbc502519mr1863229ejc.56.1699218411152; 
 Sun, 05 Nov 2023 13:06:51 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 bw4-20020a170906c1c400b00992e94bcfabsm3343523ejb.167.2023.11.05.13.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 13:06:50 -0800 (PST)
Message-ID: <74b55286-079a-4d73-b637-f5461735e138@mind.be>
Date: Sun, 5 Nov 2023 22:06:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231104234337.2684087-1-james.hilliard1@gmail.com>
In-Reply-To: <20231104234337.2684087-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699218411; x=1699823211; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8UgGuhHt7j34SBJI5Gonsa29owyc7En/9Lr8bgIhNnI=;
 b=aS/6+1UnFlkJzMeId2UhpY1BulHkVXtWBaTZFO68MQdskRpRFMAtubm5hBsrafEexl
 Tn7CHpYlbjdA/pzJo2TFBr6wXglC7IIjCyYkELYqlwKco+asz2bykJXJwfUEZWMMTyvo
 E4o2Agh/xht+nRg+WXEuhaChL9x+yZBK/Ejk+6FZHYfuzof2UpVE0KfQhVkstNN1Kf+e
 Ltxh529Z2T9a+sYVZNgEdTiqAThYqbqsVQQOO3MVUrHEpyYS28ocdu9MwZ6sL9heSmxe
 lNVhxX68yn8oqXTX4YPAsXnpKAE3W3Bt09/Ka2yVDSr9Aa3GFvGxDz9SVTqdF2uxQLQh
 EChw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aS/6+1Un
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiomonitor: bump to
 version 0.6.0
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



On 05/11/2023 00:43, James Hilliard wrote:
> Add new host-python-setuptools-scm build dependency.
> 
> License hash changed due to line ending removal:
> https://github.com/aio-libs/aiomonitor/commit/9ec9910145c70037da8ab52e007b9fc286c3a4c7
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aiomonitor/python-aiomonitor.hash | 6 +++---
>   package/python-aiomonitor/python-aiomonitor.mk   | 5 +++--
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-aiomonitor/python-aiomonitor.hash b/package/python-aiomonitor/python-aiomonitor.hash
> index 652702c479..b67d68e478 100644
> --- a/package/python-aiomonitor/python-aiomonitor.hash
> +++ b/package/python-aiomonitor/python-aiomonitor.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aiomonitor/json
> -md5  5f184e4b97ea161fc2d690aef604f997  aiomonitor-0.4.5.tar.gz
> -sha256  6232c1ab14bf06cd7217845801c27340032f74e283bdaf32d01cdd3b7c673d0e  aiomonitor-0.4.5.tar.gz
> +md5  0f786c8278a68e7df8b24317e7d33271  aiomonitor-0.6.0.tar.gz
> +sha256  31d30d1e9c0a23926edba2a2242b8572c6e8639af9aae2692dee863064d27e48  aiomonitor-0.6.0.tar.gz
>   # Locally computed sha256 checksums
> -sha256  9b42fe3a288996988c552e387e7877be7525a1649e62086aedd6b32d3cb56365  LICENSE
> +sha256  98397c300949e0cc1ddc68b0e48e67b10f2d0a4ffada4903d891a1315fe04156  LICENSE
> diff --git a/package/python-aiomonitor/python-aiomonitor.mk b/package/python-aiomonitor/python-aiomonitor.mk
> index a8860097d5..1a3b999b90 100644
> --- a/package/python-aiomonitor/python-aiomonitor.mk
> +++ b/package/python-aiomonitor/python-aiomonitor.mk
> @@ -4,11 +4,12 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOMONITOR_VERSION = 0.4.5
> +PYTHON_AIOMONITOR_VERSION = 0.6.0
>   PYTHON_AIOMONITOR_SOURCE = aiomonitor-$(PYTHON_AIOMONITOR_VERSION).tar.gz
> -PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/98/76/b62e9fbe267287527fb6f4b6774394d4f00650195774173bb0055a99ab3d
> +PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/13/ab/36fbaf36c1c7cb4d5a81b945faf69e95a48dd38cbc9b57915d41d9445f55
>   PYTHON_AIOMONITOR_SETUP_TYPE = setuptools
>   PYTHON_AIOMONITOR_LICENSE = Apache-2.0
>   PYTHON_AIOMONITOR_LICENSE_FILES = LICENSE
> +PYTHON_AIOMONITOR_DEPENDENCIES = host-python-setuptools-scm
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
