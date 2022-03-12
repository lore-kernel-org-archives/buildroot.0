Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2CBC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20307410E5;
	Sat, 12 Mar 2022 17:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ocI3HmL5acZ; Sat, 12 Mar 2022 17:00:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 362D5410E1;
	Sat, 12 Mar 2022 17:00:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C72DA1BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3C5C81B60
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qODmSvv4d7KR for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:00:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBD0A81B26
 for <buildroot@busybox.net>; Sat, 12 Mar 2022 17:00:17 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id dr20so25136830ejc.6
 for <buildroot@busybox.net>; Sat, 12 Mar 2022 09:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=sXZ4MQ5nQ9rWikf9XgpJBtk4RgIbcDUSzbNTaoubZFc=;
 b=hKFL1aT6Zo09RKcO7KQSJpiv+dbAYPDrmJ2EJ1tZZ8LprLHmCN+6LfILl63TgYFalC
 o0h0EHeu76/J4mt6tYH51CHyeLle7kRzuv2NjZG7E1OzG9nSy++02q1C4ImO7yFdy7oL
 qdHelsBZVkwhLnCoicHLtxAWb5EhuxnJTGlIte3MpNAV9Mp9/YveijIupzT1yztEB8fx
 3rpJbj4SHrvA+IUWzqhSgmh/nPyRNGPItucL9y6SyL4BQg96Z/9DlLk3DpmCi99Vw+4T
 NEihvc7rljpciVWGQYmEI5eJ5ZwBQtuy1ZPqduojXZi5PrtegwlADl33sV1Mx366GFvU
 igTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sXZ4MQ5nQ9rWikf9XgpJBtk4RgIbcDUSzbNTaoubZFc=;
 b=7Xlz4nLwxwPSu6EEOvWjq8oV7dA5Equlp/VZlBgSnPUZb066CC1q88CtWQ84d4a/hn
 AccVzQuZ4RvlEj6/2fAljYZxFGSZU6JMm6xM/UTylou6qxPvssUEL0b6QHlva43SGPGp
 qI4dpjMXogYIMv0dzCEAae/kXtOXrL/9CYopZLYwujt5feEDWqeCvUYMCie7bUTGEhK+
 6V5RCPOCytR/00I7ZOIrxhj8KLAb3s5lGjjF9mKptJpV/IoPAktMGziXa55o7Z3b/eN0
 3CMbtsRW7chqp4hps4hLxDrdvBJaOxw+phqRAgjvgjY9XJrhw3wWrCXe1krOmPXbab0d
 UzGg==
X-Gm-Message-State: AOAM531G60rq5Ww8vh5hSFd1jh3adZEvjc7O51vgBK3fATGH+ntIbRk8
 44Q1CUtD/oGcZ7+RLdEhMBB4kw==
X-Google-Smtp-Source: ABdhPJzCASajX7OSE7B2ikiYriRnS3ip0fdSM9aqK3Db8ckwfO7Rk8ri8jWQvLxGIJX9SA/V6qrdFA==
X-Received: by 2002:a17:907:6ea1:b0:6d6:f910:5141 with SMTP id
 sh33-20020a1709076ea100b006d6f9105141mr12797905ejc.123.1647104416051; 
 Sat, 12 Mar 2022 09:00:16 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 kw3-20020a170907770300b006d2a835ac33sm4560927ejc.197.2022.03.12.09.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:00:15 -0800 (PST)
Message-ID: <22bed9cc-6ba8-f83c-f7c3-7a538f7f65eb@mind.be>
Date: Sat, 12 Mar 2022 18:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>, buildroot@busybox.net
References: <20220219103507.29176-1-guillaume.bressaix@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220219103507.29176-1-guillaume.bressaix@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/libnids: bump version to 1.26
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



On 19/02/2022 11:35, Guillaume W. Bres wrote:
> Change repo source to official github.com repository which
> is actively maintained. Previous sourceforge.net sources
> remained untouched since 2010.
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libnids/libnids.hash | 4 ++--
>   package/libnids/libnids.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libnids/libnids.hash b/package/libnids/libnids.hash
> index 4a2949c39d..e51dbf151c 100644
> --- a/package/libnids/libnids.hash
> +++ b/package/libnids/libnids.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256 314b4793e0902fbf1fdb7fb659af37a3c1306ed1aad5d1c84de6c931b351d359  libnids-1.24.tar.gz
> -sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
> +sha256  3f3e9f99a83cd37bc74af83d415c5e3a7505f5b190dfaf456b0849e0054f6733  libnids-1.26.tar.gz
> +sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
> diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
> index 3e36838c40..57e68654dc 100644
> --- a/package/libnids/libnids.mk
> +++ b/package/libnids/libnids.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -LIBNIDS_VERSION = 1.24
> -LIBNIDS_SITE = https://sourceforge.net/projects/libnids/files/libnids/$(LIBNIDS_VERSION)
> +LIBNIDS_VERSION = 1.26
> +LIBNIDS_SITE = $(call github,MITRECND,libnids,$(LIBNIDS_VERSION),$(LIBNIDS_VERSION).tar.gz)
>   LIBNIDS_LICENSE = GPL-2.0
>   LIBNIDS_LICENSE_FILES = COPYING
>   LIBNIDS_CPE_ID_VENDOR = libnids_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
