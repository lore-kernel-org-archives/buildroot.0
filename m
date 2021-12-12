Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C30AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E11AF4053D;
	Sun, 12 Dec 2021 12:16:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tW6KZOKP66eB; Sun, 12 Dec 2021 12:16:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01E5240543;
	Sun, 12 Dec 2021 12:16:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A65251BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A32AB60E8E
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53XqTajhWVyZ for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:16:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C670F606BA
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:16:19 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x10so26315524edd.5
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 04:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=6kYfviO5LKJ6lCSsOPaniP/SuFRLlOcYhj3rhbPDIro=;
 b=YVP30/5xT7GU3C6HDpgeZzGl56J0lBlHeKpMPx6c/jxeuu+ykRQjLkLOdDmkeA0WKg
 NOjf+qeBAMktmRmZm8QTA+tWFqZhiypGj/YbSsdyrxSmtUj23yUoVtZ+FHmY3MGs1m9R
 pwAViz/iiod8Iv/C2ljcqCa0/hBGCCQHPorSj/5+7LDs86RIH0J4NE9ATCEJkIp2zSZ4
 LTSWvyIFgYtN/dOqJs3XdI6GgmiS8LQoPAet+Z3tHTffVvhb0R0bKKcXtVXzw4GO1hgU
 d3yAOvevYC3mzEQ23QPIHTr2wFzqYDgPBqMKEgdnuIobdVhFQMHo7GfbqunIFXKmCUTx
 RJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6kYfviO5LKJ6lCSsOPaniP/SuFRLlOcYhj3rhbPDIro=;
 b=6PIX8Xo3cJxVacIZD1ZTnDyJpCdOxxxXAoKGAvgq9Cqi90GBtTz79bbTEnU14lBuWM
 +E381vA9p4Y8A5t6dI5bipAIraSI/9a5fgTw14DbSc9f5Y18XslJuk9ptOcQHmIJjDs4
 KrJkh54v3+60WwTC0CjP0RV1MDkrOw83o1zDY7r4KExZpB/7n32HQ4m0qrAsmP+eok3V
 DN7fV/ddI5K+Oc04/ZaokSYVxQMaA8AhuXxIg1kESOgUFaQBNYU6c/g7tSllBdMf+IN5
 Oe8M2H8p/bxMhwGMOBch35P/rLR7ehJsqdDgrVct0wo8bmLAIwH0XWYQHmc1XcAwiYLA
 7ecw==
X-Gm-Message-State: AOAM531/IuQ1Ua8ZTC608BmKa48Uo8exVwfOXvPp951SfrqdWRP9gADJ
 o5JhQ7q3Mwp3gIPk7m/415V2ztIBELA2ug==
X-Google-Smtp-Source: ABdhPJy3emert0efGenlZ6cbYajrW8P16ItC3MOdKS1JWz9uSkDx9fwZsT4P6/H7hv9F4cf24GlzVA==
X-Received: by 2002:a05:6402:27c8:: with SMTP id
 c8mr55874982ede.151.1639311378104; 
 Sun, 12 Dec 2021 04:16:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jx10sm4338734ejc.102.2021.12.12.04.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 04:16:17 -0800 (PST)
Message-ID: <57c35930-ca3f-4c84-6866-8eb5a8e33fbd@mind.be>
Date: Sun, 12 Dec 2021 13:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211206224333.2232316-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211206224333.2232316-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/midori: use official tarball
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



On 06/12/2021 23:43, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/midori/midori.hash | 2 +-
>   package/midori/midori.mk   | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/midori/midori.hash b/package/midori/midori.hash
> index d0be396a5a..f14ec6d929 100644
> --- a/package/midori/midori.hash
> +++ b/package/midori/midori.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  913a7cba95ddcc3dc5f6b12d861e765d6fa990fe7d4efc3768d3a3567ea460db  midori-9.0.tar.gz
> +sha256  5e0a531455c47b0ff7589940aa2b0d9c16f59c99ba933e5fcdcab68114262016  midori-v9.0.tar.gz
>   sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
> diff --git a/package/midori/midori.mk b/package/midori/midori.mk
> index 693507dbb3..aeafa9bfdc 100644
> --- a/package/midori/midori.mk
> +++ b/package/midori/midori.mk
> @@ -5,7 +5,8 @@
>   ################################################################################
>   
>   MIDORI_VERSION = 9.0
> -MIDORI_SITE = $(call github,midori-browser,core,v$(MIDORI_VERSION))
> +MIDORI_SOURCE = midori-v$(MIDORI_VERSION).tar.gz
> +MIDORI_SITE = https://github.com/midori-browser/core/releases/download/v$(MIDORI_VERSION)
>   MIDORI_LICENSE = LGPL-2.1+
>   MIDORI_LICENSE_FILES = COPYING
>   MIDORI_CPE_ID_VENDOR = midori-browser
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
