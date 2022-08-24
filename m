Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D359C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 07:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A132360BAC;
	Wed, 24 Aug 2022 07:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A132360BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJTN_d7ugL5v; Wed, 24 Aug 2022 07:36:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 443F360B64;
	Wed, 24 Aug 2022 07:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 443F360B64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EA2D1BF844
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 07:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBED681777
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 07:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBED681777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Avq9uqcCH1cR for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 07:36:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32C678175A
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32C678175A
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 07:36:07 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id b16so20939517edd.4
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 00:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=z3VQZ687B1Nh8IqgUBLGGHzNWl6y1dtzUeOVWe8W3Ec=;
 b=d2dUaAi2o8zm5o9G9LKRtCaifXrLf0ONwsiadyEm9+6i64+76Ju5RmwCLDdAKaGcf+
 UNc9WvGZZHyl7XRefNW19TXRxlHmu5uXvG2sfZsW+i61dzFYD4H+HHwKgU6Pf1xah3B5
 FATnmm1yGP2dDzI46/zJUdP/uaKj6hVj3V2J8P7jEU+xhTENj9QmUxNRTB8nJjrfVacw
 zak4/fxRrb5+viGqJ1rthmdgC4FJyynf5pZL1FuzjBoNXwKi4clWwBlnml1KxsEiKCFK
 eTU/JBn9NDPSQjvWJNhxBNuFfQv3pBcoIS+AsX6GB3qX6Yi8VKRZnIQ5DWQ6Q9Na9QOp
 AVVw==
X-Gm-Message-State: ACgBeo1BJynUxmsfFrP9OuKoiwVyYVfsIU7JCSIXyl7zWNLy/DVuYtsZ
 rRAyH+uyUf1RI4SbbO0gBJSLCQ==
X-Google-Smtp-Source: AA6agR7M8M1HhnIO0p4clI3F0upK8l/WjBFwu7qcobyO5qTnBkgKLNyXwDLce5f1pZ5YzMf571Conw==
X-Received: by 2002:aa7:c946:0:b0:43d:3038:1381 with SMTP id
 h6-20020aa7c946000000b0043d30381381mr6644366edt.354.1661326566057; 
 Wed, 24 Aug 2022 00:36:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a17090609c100b0073d234e994csm589807eje.185.2022.08.24.00.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 00:36:05 -0700 (PDT)
Message-ID: <92604132-cdbf-6110-8fdb-7ffce1daccba@mind.be>
Date: Wed, 24 Aug 2022 09:36:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
References: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
 <20220824024904.2529728-2-chris.dimich@boundarydevices.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220824024904.2529728-2-chris.dimich@boundarydevices.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=z3VQZ687B1Nh8IqgUBLGGHzNWl6y1dtzUeOVWe8W3Ec=;
 b=UUN0fOoTkAjx5ex/TJyyx0y6/Z0MLOe3pRGlajiYSUkk1/LQGLwZ9qyDPl/a5baGSz
 NuE9V+vN094Imj4uNWYmKqgs8tuhskePUr0vYqQquKJpw4SEMwIWX2M+bTA2U7utEx+n
 R46oeAKu3qZSPOaZzU2OWZ74o8wLo/Gzl2qoDcmM/jIy2+P5Mcm/aU8W4Ad4BzzEQG3O
 9/QHbVf0VFUNsDt8OCfHVV0UenByAy9qJzylCyf02pif5HX9YPFzVrG9x9TNfUk+T73T
 YlTOWubM2NXcXZM2KQ26TKSaDfi9ciob0PLpAs1ro+mDOPLrFqUFgrEJp2cgMt0FIZE0
 Eqbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UUN0fOoT
Subject: Re: [Buildroot] [PATCH 2/7] package/weston: add
 BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL config
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Chris,

On 24/08/2022 04:48, Chris Dimich wrote:
> In the case of the vivante sdk, the deprecated-wl-shell option needs to
> be enabled. Otherwise, apps using the sdk cannot run on weston/wayland.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>   package/weston/Config.in | 4 ++++
>   package/weston/weston.mk | 4 ++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 3b4e932b7d..8f7b1824c7 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -164,4 +164,8 @@ comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland ba
>   		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGLES || \
>   		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>   
> +config BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL
> +	bool "deprecated wl shell"
> +	default n

  default n is the default, no need to add it.

  Please also add a help text for this option - in particular, when/why it 
should be enabled.

  Regards,
  Arnout

> +
>   endif
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index e6c54ee7aa..ad4d81425e 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -186,4 +186,8 @@ else
>   WESTON_CONF_OPTS += -Ddemo-clients=false
>   endif
>   
> +ifeq ($(BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL),y)
> +WESTON_CONF_OPTS += -Ddeprecated-wl-shell=true
> +endif
> +
>   $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
