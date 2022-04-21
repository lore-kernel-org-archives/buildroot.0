Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA1FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E557640C66;
	Thu, 21 Apr 2022 20:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYy89GPhkkXH; Thu, 21 Apr 2022 20:53:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F262340C5B;
	Thu, 21 Apr 2022 20:53:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40AD11BF3DB
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EB1541995
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:53:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pAsbGnwgvpP9 for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:53:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 303FA417CE
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 20:53:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e2so2008985wrh.7
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 13:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Y7BkzdVTASJazGxXfaiUWZzVfr+Nj6S0zhqNSPprU7c=;
 b=OwzKjZYGtrdMPeDW82HKFPLqlEK4uK5+wyZ+vSu8Rh9ROtXGKYEX6MTqlxhzlRtknx
 jSnqT/2e5BHsDM0XkpEze6EZNDO05QzOYcICKSy2UtuzVOqIOjcGK9IhZsZG7UkkiZKH
 q1lpfiuMpXYhFqKpQtbIu+fVh8/w9n+jgV5NsIjoYnGxloHjaomEK3W6ic0qK8qm+09/
 C5r8XCjWt1C4dSBHpej3B1HmIm/hPdbb05sbm5m1YK5dD1Corxw9FRC4J5lYzsDWXuMY
 l2X2N0bycvDhPypNVTwcBofVCVVmZbZ4K26r7fIZ76rbGPtTd49jg37R8hu/3B1rpjFg
 +3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Y7BkzdVTASJazGxXfaiUWZzVfr+Nj6S0zhqNSPprU7c=;
 b=DuFA/5Gf3jVWwxeNb92u70IVZfJdlxhKxsRuySuzlUvZw/LLZQDTQHBhebVFN1ikUR
 YsRYrzxGdnDNbq/i2WRefYRaMhgUdwWR6cpUJou2wUl6j38xMwsaVHQskAz//5CNoLYH
 AMjqb5qiOEEIuumK7U8LvbyCFQducpUHq6u2UrgmE6tTiVTbg+F4MWyAh3u3jHyo0AqZ
 ntJ6Z3i/xWLkHYsyBoWVWylu2fXV9zxBtgVs1nejs11EcoilZuToQ2fsYkKIzdXjGLUN
 QnLPqiWPs6cvXM0H0L0UQg7kHa1/D1iNzeKRDIQv5w9Vgfjgx8f2gdvUshW96yrGUhiy
 BE6A==
X-Gm-Message-State: AOAM532x8ynR+DUnomfz4a+vthkiKhgWGHh5KjC2cT4lzP8TidScAqTd
 zsRsbMa2dy9EZ93M66/bLk9uTQ==
X-Google-Smtp-Source: ABdhPJzZHVYx+eZ57eGFTQw3rsR1cBIJW2AvHS3BtPvR03bunTSu6q2XNosZletHFXkgBnXJI+83JA==
X-Received: by 2002:a5d:4085:0:b0:207:b13e:e8dd with SMTP id
 o5-20020a5d4085000000b00207b13ee8ddmr1046019wrp.557.1650574426281; 
 Thu, 21 Apr 2022 13:53:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a7bc105000000b0038eb9932dacsm30853wmi.48.2022.04.21.13.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:53:45 -0700 (PDT)
Message-ID: <fa175e14-5389-c4e5-797d-fec78401afcf@mind.be>
Date: Thu, 21 Apr 2022 22:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220416210750.3065016-1-fontaine.fabrice@gmail.com>
 <20220416210750.3065016-2-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220416210750.3065016-2-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/opencv4: add tbb support
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/04/2022 23:07, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/opencv4/Config.in  | 14 ++++++++++++++
>   package/opencv4/opencv4.mk | 10 ++++++++--
>   2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
> index 31c32385da..23d34a9d22 100644
> --- a/package/opencv4/Config.in
> +++ b/package/opencv4/Config.in
> @@ -309,6 +309,20 @@ config BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
>   	help
>   	  Use shared protobuf from the target system.
>   
> +config BR2_PACKAGE_OPENCV4_WITH_TBB
> +	bool "tbb support"
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # tbb
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # tbb
> +	select BR2_PACKAGE_TBB
> +	help
> +	  Use shared tbb from the target system.
> +
> +comment "tbb needs a glibc or musl toolchain"
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC
> +
> +comment "tbb needs exception_ptr"
> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> +
>   config BR2_PACKAGE_OPENCV4_WITH_TIFF
>   	bool "tiff support"
>   	select BR2_PACKAGE_TIFF
> diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
> index e75f7144de..0563026b18 100644
> --- a/package/opencv4/opencv4.mk
> +++ b/package/opencv4/opencv4.mk
> @@ -155,8 +155,7 @@ OPENCV4_CONF_OPTS += \
>   	-DBUILD_WITH_DYNAMIC_IPP=OFF \
>   	-DWITH_INTELPERC=OFF \
>   	-DWITH_IPP=OFF \
> -	-DWITH_IPP_A=OFF \
> -	-DWITH_TBB=OFF
> +	-DWITH_IPP_A=OFF
>   
>   # Smartek stuff
>   OPENCV4_CONF_OPTS += -DWITH_GIGEAPI=OFF
> @@ -313,6 +312,13 @@ else
>   OPENCV4_CONF_OPTS += -DWITH_QT=OFF
>   endif
>   
> +ifeq ($(BR2_PACKAGE_OPENCV4_WITH_TBB),y)
> +OPENCV4_CONF_OPTS += -DWITH_TBB=ON
> +OPENCV4_DEPENDENCIES += tbb
> +else
> +OPENCV4_CONF_OPTS += -DWITH_TBB=OFF
> +endif
> +
>   ifeq ($(BR2_PACKAGE_OPENCV4_WITH_TIFF),y)
>   OPENCV4_CONF_OPTS += -DWITH_TIFF=ON
>   OPENCV4_DEPENDENCIES += tiff
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
