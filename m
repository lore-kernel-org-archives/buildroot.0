Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F234C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 19:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C2C1416DD;
	Wed, 16 Feb 2022 19:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wp1pMKmdibnN; Wed, 16 Feb 2022 19:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7543D416DB;
	Wed, 16 Feb 2022 19:51:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7F81BF592
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ABE883E3E
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KvLmlQo1MU7V for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 19:51:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 619D08330B
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 19:51:53 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a8so1672389ejc.8
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 11:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7J/7pZ6+5gPTlm/Wn9IdlVo9jl5pb4tly4cKQU+gDLU=;
 b=ejKuFnxzXg0XkUGv/Mc+YCH1wwo5COhof0H/InQIqfzD2gj1Mtwsy8afmjU0oIz0+x
 yG+nzAyfVy7wwb6mYfSl6krY2XONRztIHOhbL3MOZ8LwN5rX8B1YC93x7uTEC7PDsQJW
 muSwGuEZlKe9o/5eRU4Ayh5grWvBrIddj98P7yG2Gix4SO3AqZjeIx9t3s9xqb1JkXkc
 zgpskOSPCjRvYQhtdHZAzUsc9qRaKnK93Svstwgy9C6+xOGITiJo8QNcRTYjuFRpvaSk
 lgUwcdQVmZ4BqBdHsnFZfeTULBvrPbvAQiShlHHLXnWCj/RcW0uZ0vkoAXEyjVRuwl/c
 WODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7J/7pZ6+5gPTlm/Wn9IdlVo9jl5pb4tly4cKQU+gDLU=;
 b=lLynzrsAbdtPD+Xs/EHoarJtvMrjx2ARCRbtWliwRV5q1u+ZJnaxZ/fumxPNzax007
 2ofoJsAlXT7egqI31riQfn3hztpj3lFryMHlZIgcj2iAkzZz/R70dfebPkxXNjlpsdo7
 cQifY05AlNAoXUfpT7ioUqVHuUmpAkNYYl5gF9V4SyW+e34gOErReR2Elk22NmLISCBa
 Kk/zWlQuPnzhJjgeLGNPWbXJttRKTEEByIxkPCbkFv5QYSeg+0G5j5jujDhmIR0mX6HT
 CuejOFUP7J8MuRtko2GeCEgZzO4dXnCwXGHmVHRZ2nHQT5QK8Z4f+GcQEmnXUWk+hErG
 zGOA==
X-Gm-Message-State: AOAM532DUXIcpARjhJ6uvQ44qo/LcKpQCdvXmR1vHWpBXcW2xwdvZnqK
 xxE9d5QKCGTImXNUT3MAIJFfMdXq1tSEWw==
X-Google-Smtp-Source: ABdhPJyTT/MfVRgwP3a+ke+1Y2DdcDuxpdFOmYoZloANHfEIa99Y/YLKOM8RFXL8jl9Z13SHLZVJeQ==
X-Received: by 2002:a17:906:2719:b0:6cf:37ec:d47f with SMTP id
 z25-20020a170906271900b006cf37ecd47fmr3691100ejc.401.1645041111660; 
 Wed, 16 Feb 2022 11:51:51 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c12sm2239269ede.70.2022.02.16.11.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:51:51 -0800 (PST)
Message-ID: <d6033ff0-8cc3-5c86-7e41-bf163f0ed12d@mind.be>
Date: Wed, 16 Feb 2022 20:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Kyle Harding <kyle@balena.io>, buildroot@buildroot.org
References: <20220213135540.49983-1-kyle@balena.io>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220213135540.49983-1-kyle@balena.io>
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.15.0
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
Cc: Stefan Ott <stefan@ott.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2022 14:55, Kyle Harding via buildroot wrote:
> Signed-off-by: Kyle Harding <kyle@balena.io>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   package/unbound/unbound.hash | 4 ++--
>   package/unbound/unbound.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
> index ca6fe174e0..99caf7dd3d 100644
> --- a/package/unbound/unbound.hash
> +++ b/package/unbound/unbound.hash
> @@ -1,5 +1,5 @@
> -# From https://nlnetlabs.nl/downloads/unbound/unbound-1.14.0.tar.gz.sha256
> -sha256  6ef91cbf02d5299eab39328c0857393de7b4885a2fe7233ddfe3c124ff5a89c8  unbound-1.14.0.tar.gz
> +# From https://nlnetlabs.nl/downloads/unbound/unbound-1.15.0.tar.gz.sha256
> +sha256  a480dc6c8937447b98d161fe911ffc76cfaffa2da18788781314e81339f1126f  unbound-1.15.0.tar.gz
>   
>   # Locally calculated
>   sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
> diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
> index 61fdc5389b..1e6e0d99d7 100644
> --- a/package/unbound/unbound.mk
> +++ b/package/unbound/unbound.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -UNBOUND_VERSION = 1.14.0
> +UNBOUND_VERSION = 1.15.0
>   UNBOUND_SITE = https://www.unbound.net/downloads
>   UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
>   UNBOUND_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
