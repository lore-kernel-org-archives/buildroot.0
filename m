Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EC3C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:46:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6D5760BD3
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6D5760BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ABD5404E9;
	Thu,  5 Aug 2021 16:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w_jM3Y0c_Q1W; Thu,  5 Aug 2021 16:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B94E404B4;
	Thu,  5 Aug 2021 16:46:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 879B41BF574
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7719D40473
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4AHnJkwQC0m9 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 16:46:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12A8440453
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 16:46:49 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id zb12so5839842ejb.5
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 09:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CkFHVMDcV9QruAYkgwR5Y+hVfsTJpZyP36bSj9xTFIk=;
 b=Mbia37VtxIZis0ttNEzFAdJOYMVfHmNIvSBCOo3cGuc40+dF3m/bhsXLgOgzaQgvLN
 61fsYiLTNjPxD15YeZw+jWRLz0kmuIwh/A/WidnZBAN0my9xUil0YBGVZMEQVLBi+IF5
 s+gcdnnwG4XBc8+5dA2Yulkee5nmOEb0WPkbgPBWN+dowkZZpUHR7IaxlzDAgm1IL7cY
 R1BLpc8Ng6fY01x880mK5wx5Cmm44Ghwu2D8YughjRUeRx4m6LybGsdU7CYZZbhxrYah
 Cc8q0+ZEhceDbEh3whs4iY9YVu3JEkTraDMZ+QLFGxT01nvSiM7gw+WI7MsPxJ4YYac4
 t8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=CkFHVMDcV9QruAYkgwR5Y+hVfsTJpZyP36bSj9xTFIk=;
 b=S6n3l7z0/0qsRoeOJ49YylkeClwGAl1npXwz0+Il+QG43pO1R17JtiEQ20LfyBu1k2
 E4OO2uBBCQ5GVdLhlC1s3tYlIAFojMNlI+igcINOpxWph/aEI3ocV9jrHRLRNewg4o3m
 2ia9Fh0BtG2kvBz/AXSLPldqM8M6UIiOIbS5lyTJFeYepnSAN0eN6MPmq4J/wVWHx73A
 GjLADJZdn6AioB1e+TzrnmRkXgjBxryWLYOplhlc69ClYhuEQ7bYzpZj0rToo67s6QJd
 /pHalb2c5I60395vpiUxZAIve8aXgJNpVpqcU6NQT1uRCP1CTW2tV3EldXKwdFyTFO5e
 h+vg==
X-Gm-Message-State: AOAM530BH/mDYp+EuztI3lee13YZ3fhxDB01s7khB/NG4mvOINHaaTQq
 zfkg1B3O5ErtECRkf+BGIygPTg==
X-Google-Smtp-Source: ABdhPJxkfEUREcFHOsRg351BvMz/9ia+4iRRUrUl2wqL9dVkxtABx8JV/QOW96JrJGYXWPLxPYYZIg==
X-Received: by 2002:a17:907:988d:: with SMTP id
 ja13mr5973859ejc.548.1628182008291; 
 Thu, 05 Aug 2021 09:46:48 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id n26sm2524721eds.63.2021.08.05.09.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 09:46:47 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210802210402.1730871-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <745c6d69-2201-80c5-0d61-52eb2105c2c9@mind.be>
Date: Thu, 5 Aug 2021 18:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802210402.1730871-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/php: drop mcrypt
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 02/08/2021 23:04, Fabrice Fontaine wrote:
> mcrypt has been dropped from php since version 7.2.0 and
> https://github.com/php/php-src/commit/5a17f632d4c7d936385485a0cb187172f33eb97a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  Config.in.legacy       | 6 ++++++
>  package/php/Config.ext | 6 ------
>  package/php/php.mk     | 5 -----
>  3 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 4e4a464709..54476acf9a 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>  
>  comment "Legacy options removed in 2021.08"
>  
> +config BR2_PACKAGE_PHP_EXT_MCRYPT
> +	bool "PHP mcrypt extension removed"
> +	select BR2_LEGACY
> +	help
> +	  mcrypt has been removed from php since version 7.2.0.
> +
>  config BR2_BINUTILS_VERSION_2_34_X
>  	bool "binutils 2.34 has been removed"
>  	select BR2_LEGACY
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index 83bb3c481f..7c97316048 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -83,12 +83,6 @@ config BR2_PACKAGE_PHP_EXT_LIBSODIUM
>  	help
>  	  libsodium support
>  
> -config BR2_PACKAGE_PHP_EXT_MCRYPT
> -	bool "mcrypt"
> -	select BR2_PACKAGE_LIBMCRYPT
> -	help
> -	  mcrypt support
> -
>  config BR2_PACKAGE_PHP_EXT_OPENSSL
>  	bool "openssl"
>  	select BR2_PACKAGE_OPENSSL
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 6780b6a962..a1ad6e3296 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -136,11 +136,6 @@ PHP_CONF_OPTS += --enable-mbstring
>  PHP_DEPENDENCIES += oniguruma
>  endif
>  
> -ifeq ($(BR2_PACKAGE_PHP_EXT_MCRYPT),y)
> -PHP_CONF_OPTS += --with-mcrypt=$(STAGING_DIR)/usr
> -PHP_DEPENDENCIES += libmcrypt
> -endif
> -
>  ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
>  PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
>  PHP_DEPENDENCIES += openssl
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
