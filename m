Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D27C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E705E418ED;
	Sun,  5 Nov 2023 21:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E705E418ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8Xtk893qKJ4; Sun,  5 Nov 2023 21:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 139E44182B;
	Sun,  5 Nov 2023 21:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 139E44182B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D86081BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACBF36104D
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACBF36104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RV12yGcREsf1 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:06:09 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9360D6104C
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9360D6104C
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5409bc907edso6244933a12.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699218368; x=1699823168;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ty4p0UqwaS81YTDDUGB1UnXCFK8SPgZH5xpAWGhOBbM=;
 b=SlNHLN2LiQhftHds+ov56jj5J8EPGe5BytLzXMNXGBYH8fDBzQW8Fb7Ii+cHlk2LI1
 YZwkvSm9BlYVIJzKEwOm8Ja7ayEEmulVfLs3zxcEenTt01EvLj50dAFMs2kOXlvYs0Y7
 g3ok/r+rkRuh4dJ4e9Np3c18rGnOwb8MY/ABt5ZSoLwxfCr+oxHP+5bIH2mu+Mqv0O61
 0p6IK2WjyqnyVFTrQ1ZNaUSM/PUOTu/TV+regq7MVFr09JjasGgyDbKhGdMnwtlJQZxZ
 JrVfaNP2OdbbORTRrF6b/Y9IsnZIeUhlz7g4J96BpS5CIMoHC9posnDXaqG+BbQNKCFK
 3DoQ==
X-Gm-Message-State: AOJu0YynFKIS0qIly7x5bO40blYQU52uN1wqqN1gTK7U2PEMsC2xCOAz
 Zbsh4afBmQpQdZdndbkP1JBfS3TC1s9OmW67M54=
X-Google-Smtp-Source: AGHT+IEC0oBtRsJhL4negq59Yx7nP++EFjkibkKI6K0MaVCoXhO3F7ZLDsDpW3YWTIxhtREBdYErJA==
X-Received: by 2002:a17:906:9c83:b0:9bd:a662:c066 with SMTP id
 fj3-20020a1709069c8300b009bda662c066mr13737491ejc.76.1699218367550; 
 Sun, 05 Nov 2023 13:06:07 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 bw4-20020a170906c1c400b00992e94bcfabsm3343523ejb.167.2023.11.05.13.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 13:06:07 -0800 (PST)
Message-ID: <14d3d814-2918-4214-af8d-3a7ec893ec90@mind.be>
Date: Sun, 5 Nov 2023 22:06:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231104231851.2671316-1-james.hilliard1@gmail.com>
In-Reply-To: <20231104231851.2671316-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699218368; x=1699823168; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ty4p0UqwaS81YTDDUGB1UnXCFK8SPgZH5xpAWGhOBbM=;
 b=hSYAziKHC4qxipA/N+evfV+3Lyr6WPmwljLhBzIdOyunfzPQzo8FS/5a3dmFEsN6gF
 teOkfVOCgx7zPq/9d1A3XrI4XK7OScB4BRoLK5/Q92J98k6jkwnjpdoqt77AnFDFQp8t
 sewIEwUfFyU0WVL3PXm835SsCijkUw0OxZAuZunE9d9UoAJ4xvUVgboAPRWlhAW7Huy+
 EnCJU6VBkiCHUpoQ6dwet6SMsIlFEd1/LuyTc/PeXxiN6Pgqptgh5A70BqCZvzhwMWwo
 wQc5S4UdNYxp9mB5A56iPYVQQ90cz90XfGEDDld3nwaJ8Tibcu9gOiYa9xILWgvmXL0o
 x7aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hSYAziKH
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiodns: bump to version
 3.1.1
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



On 05/11/2023 00:18, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aiodns/python-aiodns.hash | 4 ++--
>   package/python-aiodns/python-aiodns.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
> index 2cdedc6f95..bf65691b89 100644
> --- a/package/python-aiodns/python-aiodns.hash
> +++ b/package/python-aiodns/python-aiodns.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aiodns/json
> -md5  181e11935c78965de2b2b7b0e5efba8d  aiodns-3.0.0.tar.gz
> -sha256  946bdfabe743fceeeb093c8a010f5d1645f708a241be849e17edfb0e49e08cd6  aiodns-3.0.0.tar.gz
> +md5  13fdfc38f30c9498e3e23c6f372e40ba  aiodns-3.1.1.tar.gz
> +sha256  1073eac48185f7a4150cad7f96a5192d6911f12b4fb894de80a088508c9b3a99  aiodns-3.1.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  eb0455d35129425ed399883cd710923de3e246a510e2eb84d9f00032d0bbec97  LICENSE
> diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
> index 2318dcab3a..f5cbb65334 100644
> --- a/package/python-aiodns/python-aiodns.mk
> +++ b/package/python-aiodns/python-aiodns.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIODNS_VERSION = 3.0.0
> +PYTHON_AIODNS_VERSION = 3.1.1
>   PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
> -PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/27/79/df72e25df0fdd9bf5a5ab068539731d27c5f2ae5654621ae0c92ceca94cf
> +PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/fa/10/4de99e6e67703d8f6b10ea92a4d2a6c5b96a9c0708b75389a00203387925
>   PYTHON_AIODNS_SETUP_TYPE = setuptools
>   PYTHON_AIODNS_LICENSE = MIT
>   PYTHON_AIODNS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
