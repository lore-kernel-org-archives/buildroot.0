Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546B6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:59:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA62361056
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA62361056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8461B82430;
	Thu, 14 Oct 2021 20:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGmryZEBoKXL; Thu, 14 Oct 2021 20:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D888B81D7D;
	Thu, 14 Oct 2021 20:59:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69C301BF292
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59FF181D7D
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZLTJ_A4iRY_G for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 20:59:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 103E281D46
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 20:59:28 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id i20so28534228edj.10
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 13:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7zvnN7pPvT5i8l3qJNZvt5vKYci/gceNm4zpKmRN5Xk=;
 b=Kw/uEzgXzf7sD4UnNIM7SKZ5EI6U+6bcPaFs93qGIhz5tv9us0lIXlnGOoqbMGsZUH
 MuSAahpBQvHSbYK345xwU8hk2qVTeBHcyk+UY4mMd2tratWsR4ek5lACCl7BjYU0w6bq
 EVtt/uuA2pNUZuEqJzbDgzYbSNYI0iOx1uOoGtmKZDYCegSbZLBswlM2EcHkAYvCYEbS
 wJ4UVWYdT+KCMy6SEZLLgs/zsr1eqRc59aefNGlurC0hwcy2bPR1+/SnvF/wpycXYtsP
 j1aKTvp1PvHeRby13M7YOBd1WbrvpbkAeYojcrIwpLnyj8sJzwgvOps2oi7c53QklzsF
 iztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7zvnN7pPvT5i8l3qJNZvt5vKYci/gceNm4zpKmRN5Xk=;
 b=O0yCIlfonticDOY79PLiYKJcz1IlRU58+/E2uAgxMDsvPcxQ1ruSjkql51ylyz8L88
 tEW7w6JVhaipV5Xrgg25yqJGdp5S7l+65TrAqHXjOPRzmYC1/yqW0Wr7BNGzxDnAlk8L
 Fo60KTBg/TKi/TzRfETa7Xpti0mQNKrIZQnE3IRfnqIc8j66ZeU3PhusjHlvYZiZt4tR
 k8oC/mVhTyM3D9Y7Clo4TLSft8SRFqqax4QZg8rh7/O+PAQRDK+/6epm9o3F8ocMwCOu
 3ZDCd65fIjxAu2L/rwPC9/XPlamFgoad9i33xp/2FP8VrvvjVEpQd1q215MFpHHTf0i6
 npyw==
X-Gm-Message-State: AOAM530JAYQM8tPer4Gbv9N5uCqVGNjd9aJrXAhiVs1hPuwmua6QSOXd
 NGicE7pIlG8KGl1HjgdxJeeK1g==
X-Google-Smtp-Source: ABdhPJz2Xajif26Sylt0iHuGx7eWAYmtmKcA85hI5dmL338ApDnFxYJOH97z/xAPUzm6FAI4ys+8Ng==
X-Received: by 2002:a17:907:7691:: with SMTP id
 jv17mr1625375ejc.378.1634245167217; 
 Thu, 14 Oct 2021 13:59:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m9sm3087752edl.66.2021.10.14.13.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 13:59:26 -0700 (PDT)
Message-ID: <011b6794-544b-9166-c8f8-93b365c1c899@mind.be>
Date: Thu, 14 Oct 2021 22:59:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211007211109.3756339-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211007211109.3756339-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libgta: bump to version 1.2.1
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/10/2021 23:11, Fabrice Fontaine wrote:
> - Update site: https://marlam.de/gta/news/source-code-moved
> - Update indentation in hash file (two spaces)
> 
> https://marlam.de/gta/news
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libgta/Config.in   | 2 +-
>   package/libgta/libgta.hash | 4 ++--
>   package/libgta/libgta.mk   | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libgta/Config.in b/package/libgta/Config.in
> index 894dced096..f66d83c90e 100644
> --- a/package/libgta/Config.in
> +++ b/package/libgta/Config.in
> @@ -7,4 +7,4 @@ config BR2_PACKAGE_LIBGTA
>   	  Libgta is a portable library that implements the Generic
>   	  Tagged Array (GTA) file format.
>   
> -	  http://gta.nongnu.org
> +	  https://marlam.de/gta
> diff --git a/package/libgta/libgta.hash b/package/libgta/libgta.hash
> index d5fceb4205..49ac51d3a1 100644
> --- a/package/libgta/libgta.hash
> +++ b/package/libgta/libgta.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256 1d2ff713955eee28310de082a8fd8e236403c27dee3716ba1238c56e6643e4fb  libgta-1.0.8.tar.xz
> -sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
> +sha256  d445667e145f755f0bc34ac89b63a6bfdce1eea943f87ee7a3f23dc0dcede8b1  libgta-1.2.1.tar.xz
> +sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
> diff --git a/package/libgta/libgta.mk b/package/libgta/libgta.mk
> index 1189feeff9..9b19f42dc7 100644
> --- a/package/libgta/libgta.mk
> +++ b/package/libgta/libgta.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -LIBGTA_VERSION = 1.0.8
> -LIBGTA_SITE = http://download.savannah.nongnu.org/releases/gta
> +LIBGTA_VERSION = 1.2.1
> +LIBGTA_SITE = https://marlam.de/gta/releases
>   LIBGTA_SOURCE = libgta-$(LIBGTA_VERSION).tar.xz
>   LIBGTA_INSTALL_STAGING = YES
>   LIBGTA_DEPENDENCIES = host-pkgconf bzip2 xz zlib
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
