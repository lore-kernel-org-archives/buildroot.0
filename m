Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED41C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED1F760EFF;
	Wed, 27 Apr 2022 17:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HP_scyfzluO0; Wed, 27 Apr 2022 17:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECEA460B64;
	Wed, 27 Apr 2022 17:12:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 566911BF420
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 454AF82AC6
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KJ2R4Tyoh-x for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:12:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 058128266D
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:12:14 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id dk23so4702245ejb.8
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=i1v0SApDKIR3m6VpJZp2ts+g9BaJk5pe5mZ5cvVgTn8=;
 b=Y3qM0YW2rW+rZFgg/wFXwWrYoV3QQV33ESQ8R8htwIagZy0t2LxFN+wbAVfAo9wqQU
 9go0aM4D3sRoQzjuWB1fDzoCOKGFx+Ybm77noaPa5ysH3egdo0TlNcQbuwFLZKeHeTYp
 NHR/P08oAarRXatoF9bVT43vaU5+k4HrPDoGblMksTp/8RyMId7k1WexP3BX3d4fseIm
 1uWTwmvYxpmTlQGCthaRx05xwK8lcBVqAY1widZUxPyarKJqijvnK3lHP7oUD+F5qlcv
 yOa+zJcz40fyFhH0pPo8RrDOoqn06KJeqIXKLq900DUUsgljQvIr7yPJ2MUObKxIuRZl
 H2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=i1v0SApDKIR3m6VpJZp2ts+g9BaJk5pe5mZ5cvVgTn8=;
 b=Y8d1hPyrNJPwgO+ruI23TJOnMD/hCyYo668E8v7Y/yiISquuVtImhJdbTpDqu+XHa3
 Huc7cQG2+ov7k0dVBpboFvj0IyGrSmAFpZAjDGm7XYsK60F1mySGOdaUzUHbUpdMI1yJ
 aJFXd+myVLj0eU4C27ucdvsW15wKtiyZFZ+wPR7b0DiyzV+3VlyPV0ZkwOVlRyxDfcWy
 4XT9JeX+tsEgF3TkyPQVi5efjtKRwgo0jhs6HtUVEgck+jcNgI9gqg0T2j4FlVXNF4Qo
 oSFKNm7BcPCUnVnSDLoWWqNKQcLLf42OukhzDrstaltv6sE/BqadFrLgsbVafUPXY3oS
 e2qg==
X-Gm-Message-State: AOAM530pK8HPCU56XF/zS6vM3ZBbMAXmRNG1/0dNZA+UuotbMQkqyfsZ
 j59r2ZRCjoCHFhtOu7TDw/ewrbJOUI2RrA==
X-Google-Smtp-Source: ABdhPJwtEkJZn1Cx4b/KuhMnV0yqWeM8x1AsFLp6l7T1+Dkt/zE+hghDsfUXUzwHjbjoUKlZtt/uwg==
X-Received: by 2002:a17:907:3e18:b0:6f3:6abc:a904 with SMTP id
 hp24-20020a1709073e1800b006f36abca904mr23325804ejc.341.1651079533139; 
 Wed, 27 Apr 2022 10:12:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a170906505100b006f3beab8af8sm2149711ejk.204.2022.04.27.10.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 10:12:12 -0700 (PDT)
Message-ID: <30726643-c858-3394-a788-b24a50ac1a00@mind.be>
Date: Wed, 27 Apr 2022 19:12:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220423154903.155257-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220423154903.155257-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/ding-libs: bump to version 0.6.2
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/04/2022 17:49, Fabrice Fontaine wrote:
> - Update site to get latest release
> - Update indentation in hash file (two spaces)
> 
> https://github.com/SSSD/ding-libs/releases/tag/0.6.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/ding-libs/Config.in      | 2 +-
>   package/ding-libs/ding-libs.hash | 8 +++++---
>   package/ding-libs/ding-libs.mk   | 5 ++---
>   3 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/package/ding-libs/Config.in b/package/ding-libs/Config.in
> index 64b111e6a1..e4f869728a 100644
> --- a/package/ding-libs/Config.in
> +++ b/package/ding-libs/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_DING_LIBS
>   	  initialization format (INI) into a library collection data
>   	  structure (libini_config).
>   
> -	  https://pagure.io/SSSD/ding-libs
> +	  https://github.com/SSSD/ding-libs
>   
>   comment "ding-libs needs NLS enabled"
>   	depends on BR2_SYSTEM_ENABLE_NLS

  This isn't there in master, and I didn't see any other patch on ding-libs. 
What's going on here?

  Anyway, applied to master, thanks.

  Regards,
  Arnout

> diff --git a/package/ding-libs/ding-libs.hash b/package/ding-libs/ding-libs.hash
> index 2ac5bd8eee..d5d87faccd 100644
> --- a/package/ding-libs/ding-libs.hash
> +++ b/package/ding-libs/ding-libs.hash
> @@ -1,4 +1,6 @@
> +# From https://github.com/SSSD/ding-libs/releases/download/0.6.2/ding-libs-0.6.2.tar.gz.sha256sum
> +sha256  e5f07f34f5921bcb5ccccfe3751c28497879a6451cd7b395e99e24d9b5728e8d  ding-libs-0.6.2.tar.gz
> +
>   # Locally computed
> -sha256 ad3c573641701f67d4b6bd8a5a71f0b65d45fd39fe961495ef5f5d3c57fc0963 ding-libs-ding_libs-0_6_1.tar.gz
> -sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
> -sha256 6c57f43c939054fd4b831f271a14c97a488c38f98cdda5e887c5d396e3b3bc58 COPYING.LESSER
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> +sha256  6c57f43c939054fd4b831f271a14c97a488c38f98cdda5e887c5d396e3b3bc58  COPYING.LESSER
> diff --git a/package/ding-libs/ding-libs.mk b/package/ding-libs/ding-libs.mk
> index 1e8fa59d69..a4ee7351b5 100644
> --- a/package/ding-libs/ding-libs.mk
> +++ b/package/ding-libs/ding-libs.mk
> @@ -4,10 +4,9 @@
>   #
>   ################################################################################
>   
> -DING_LIBS_VERSION = 0.6.1
> -DING_LIBS_SOURCE = ding-libs-ding_libs-$(subst .,_,$(DING_LIBS_VERSION)).tar.gz
> +DING_LIBS_VERSION = 0.6.2
>   DING_LIBS_SITE = \
> -	https://pagure.io/SSSD/ding-libs/archive/ding_libs-$(subst .,_,$(DING_LIBS_VERSION))
> +	https://github.com/SSSD/ding-libs/releases/download/$(DING_LIBS_VERSION)
>   DING_LIBS_DEPENDENCIES = host-pkgconf \
>   	$(TARGET_NLS_DEPENDENCIES) \
>   	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
