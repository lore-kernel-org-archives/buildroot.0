Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0A3C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 17:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07A0F42007;
	Fri, 17 Dec 2021 17:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m5B8O4gwNI1r; Fri, 17 Dec 2021 17:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AAAF41FEF;
	Fri, 17 Dec 2021 17:44:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDDC11BF2AF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D719140C09
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SZdZRURC1usJ for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 17:44:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8F3E40BF8
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 17:44:11 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y13so10551026edd.13
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 09:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7r3UrjCpz7z/QDnAGoKFT38vAYnERDY775Fehp5eXDg=;
 b=FaY9I8fPCGlxkgaZTf9C4CHcgBVYs0CYWy7GZvuSqw3zAerOeGox6/o+qB1dBPm7dB
 94gSTeaHn3dWuf7g0jyvjCEX1QyIGZStwCUxuu9+IIE1qhKYNJNkmZV1Lk0QH/b1gDU4
 v/8zTaEptur/m/JpWo4/qlvgSoLn0sWk0C01iwoyVozPNG8kRERxqnYHqghABIWJFSCC
 SlIpRgoxFrQuGZG8l68lm+6gvR489xVOw23hpChU6GeZA9IZRvj+lRznYjUGQRciZULE
 E25Gm8sRt6DwwuStbCm3+B9EC6kc9g5N0gnJUA59MJW+EI1lyi47nhxO7JCFr2OifdjJ
 ksZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7r3UrjCpz7z/QDnAGoKFT38vAYnERDY775Fehp5eXDg=;
 b=TtkRTA44/z3mrb+iYdAlSgejh1PCHYL4K8hFBaSWWiduIvt8hLgG+bvPOMLD40KtP/
 hvbhl7JbiFQmURLeIMabyPRrA7Ev0HFMM17e2IvEqyFzkQzw1FMyBaAeibNeT41d8st1
 jGreIjCakdQKoOvzU/H0x1FpHS7fYaWoZfP/W5/9eWZVbuQEf/M0f+N/OdwDXOL11HRl
 zEKAinsmSTRKhVqKtcWg4555cdnM0ZFuZ+gnIyPyUBXtElcPJxAQKHrwt5AX6Mc1bco5
 okh6I1NerYzTm94JX2Wr1sTSj56xlPCDXeozUk5WJImZvQJQlh+zjqYpzhMNC8l6gPWW
 nC2Q==
X-Gm-Message-State: AOAM530HoOtpEnPo7/xvrorvFlVLm8V/ZMh7AF3ULpOvNc3ZfME9ncdH
 k0rERcx+o1bA2vXKrizJ0Hn+DQ==
X-Google-Smtp-Source: ABdhPJwfurFFLvQ2ykuQLdwQCjNw6lVl84ljueJnXaKZLIUQhFp4CeJlbuFZ1WZexCk81yLk0clGIw==
X-Received: by 2002:a05:6402:d05:: with SMTP id
 eb5mr3935646edb.360.1639763050077; 
 Fri, 17 Dec 2021 09:44:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gs14sm134013ejc.183.2021.12.17.09.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 09:44:09 -0800 (PST)
Message-ID: <d00f7d3c-0256-620d-f996-8bd428138311@mind.be>
Date: Fri, 17 Dec 2021 18:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211216222624.1026887-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211216222624.1026887-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: c-ares is optional,
 not mandatory
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
Cc: Vadim Kochan <vadim4j@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  The commit message doesn't really cover what happens here: IMHO the most 
salient aspect of this commit is that you add options for BMP and NHRPD. So I 
rewrote teh commit message like that.

On 16/12/2021 23:26, Fabrice Fontaine wrote:
[snip]
> -FRR_DEPENDENCIES = host-frr readline json-c \
> -	libyang libnl c-ares
> +FRR_DEPENDENCIES = host-frr readline json-c libyang libnl \
> +	$(if $(BR2_PACKAGE_C_ARES),c-ares)

  I've kept this as is. However, is this dependency meaningful if BMP and NHRPD 
are not enabled? The usual way would be to include the dependency within the 
conditions below.

  Regards,
  Arnout

>   
>   HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
>   
> @@ -35,6 +35,18 @@ FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
>   
>   HOST_FRR_CONF_OPTS = --enable-clippy-only
>   
> +ifeq ($(BR2_PACKAGE_FRR_BMP),y)
> +FRR_CONF_OPTS += --enable-bgp-bmp
> +else
> +FRR_CONF_OPTS += --disable-bgp-bmp
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FRR_NHRPD),y)
> +FRR_CONF_OPTS += --enable-nhrpd
> +else
> +FRR_CONF_OPTS += --disable-nhrpd
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBCAP),y)
>   FRR_DEPENDENCIES += libcap
>   FRR_CONF_OPTS += --enable-capabilities
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
