Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6527C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 21:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BD4940361;
	Thu, 17 Mar 2022 21:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WRmaFwaw3m1R; Thu, 17 Mar 2022 21:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 776854033D;
	Thu, 17 Mar 2022 21:38:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C667D1C1135
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCE0E80BD6
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYnwnXl4aVQ7 for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 21:38:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6F2D84344
 for <buildroot@busybox.net>; Thu, 17 Mar 2022 21:38:28 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id d10so13380911eje.10
 for <buildroot@busybox.net>; Thu, 17 Mar 2022 14:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=fn9a0cOa4wKc6yNHQOaoQecjBoD6XMkhio/HuWGnfKs=;
 b=VtjuG9seO+OrxKAPZj3RTuBh8HzRmMc4dRmtCRFrd12X/NyLZlxE2ycOy6g6bqE257
 1BPxLyyf9nys+Cf1KHwTk7YdI0RBE/Co+m5eieGd5cOlY5M7v5gY9ZsCC/5Le7vbbWBJ
 e8FFnGDp0WLFVYa9yODm4/qdNg/DRVBSLNMYb0uLjzwogAb1Gud+HPS75mu23Uchqj10
 +XrjD48NlZRuk+EyXK21Z7aKwCA2DTWRHDkNQnnpoO5elWd9TX4Op2eEJOQM9obLGnpI
 QGEGBWDizlt+5JfKEn9XwCZ/hiHru1gY6VbVo+inEDNywsG9SyErooqF3i2/CXdrHdEG
 BB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fn9a0cOa4wKc6yNHQOaoQecjBoD6XMkhio/HuWGnfKs=;
 b=VAcS9zKu3oI5ama9938ptt40MDHkExOzJjeb0Keudy9mW6XkbBs0RS+EcfD0Tdi8LW
 mEMwijzw4BRM1MNZH6WBoXR3gyqjT615oyZ2Lbd+cmsSQMeJIOtoveMf2w+B5Ss8c5Xe
 LDvlIczovEIYWvhHvNuNVq7qgUUA6ZqV0ZkRDbNLS4N0hAYydD223HbFjq2Fk92opcHb
 ZtCsvxDSqjqQWXXc3itA3qKVxgHGB5jh1Uk/tfDWNdgWLDx40QPEhmVpXXQre7ScR1Wi
 cfit2zXPKTgxSiH4stjUQd8b9Q+PvPYoasd4Q/2wDUB4upO8suYZbNhv/K9i45gwysBx
 e2Lg==
X-Gm-Message-State: AOAM530aAggB/3HZUyqj/4SjcFfwgVnnWKRCwXoCLhUWsfqlQN8cj5H0
 t9dct3hki+cbghQNnO/sfZ+eqQ==
X-Google-Smtp-Source: ABdhPJx1wfA0Z8DgtS5UM8xnVcLVJpM9APXysNQYjt7GChvKjP/3Ft+BCNG7Jqr5uiuji/lGY3bYlA==
X-Received: by 2002:a17:906:6a1b:b0:6df:af36:dd43 with SMTP id
 qw27-20020a1709066a1b00b006dfaf36dd43mr1688175ejc.359.1647553106692; 
 Thu, 17 Mar 2022 14:38:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a17090694c100b006da91d57e93sm2817164ejy.207.2022.03.17.14.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 14:38:26 -0700 (PDT)
Message-ID: <ed23e6ab-2ec3-b625-2c0a-740fc51a2ae7@mind.be>
Date: Thu, 17 Mar 2022 22:38:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220310114220.920056-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220310114220.920056-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/webp: bump to version 1.2.2
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



On 10/03/2022 12:42, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/webp/webp.hash | 2 +-
>   package/webp/webp.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/webp/webp.hash b/package/webp/webp.hash
> index cf7b1dc9d..a95086e81 100644
> --- a/package/webp/webp.hash
> +++ b/package/webp/webp.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  808b98d2f5b84e9b27fdef6c5372dac769c3bda4502febbfa5031bd3c4d7d018  libwebp-1.2.1.tar.gz
> +sha256  7656532f837af5f4cec3ff6bafe552c044dc39bf453587bd5b77450802f4aee6  libwebp-1.2.2.tar.gz
>   sha256  5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  COPYING
> diff --git a/package/webp/webp.mk b/package/webp/webp.mk
> index f23e1c92e..670a7b801 100644
> --- a/package/webp/webp.mk
> +++ b/package/webp/webp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WEBP_VERSION = 1.2.1
> +WEBP_VERSION = 1.2.2
>   WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
>   WEBP_SITE = http://downloads.webmproject.org/releases/webp
>   WEBP_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
