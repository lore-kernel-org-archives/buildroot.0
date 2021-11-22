Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24888C433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 21:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C00EC80C3F;
	Mon, 22 Nov 2021 21:36:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPZIy_o1Gw_Z; Mon, 22 Nov 2021 21:36:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B71B080CC6;
	Mon, 22 Nov 2021 21:36:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F39B1BF82C
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 21:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 390C2400FF
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 21:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2GflLMs4RK2W for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 21:35:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B1C2403E3
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 21:35:31 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id t5so83342666edd.0
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 13:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BOH/o6Ltczn5l/0awJM8hCms6kS79QNNOtfKFGHnkPY=;
 b=JQljOz9RiJKtGgggoBJS8QdxxTcBn2n13qMrJTMGbSaH/CVd8QW++TbccBX3lc3LGz
 AN3aExoX9KimOObvIqFYRCu3wJknbRUsHZyfIIexM9hEcLqgESaCg3J6TDZZ3J37zujd
 B/puOoW3n+XYEZAbUxWajt3Jzia1h+V9JOjCq9Bec0lsyBi30fkTjC2VHokwsiSkubJq
 Tot7pT7oav66peVTr2iFz7AznWHFg8UKmeNHxd4EhrRc3MY+yZwPkd9dAETSLVd0gv+f
 L01XPu/Tkf6tUFgtcjQZL3YcCQrAegmCdUOWWLWpp7nr5+wHlxet3oR1pViRSVtB2TjT
 egbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BOH/o6Ltczn5l/0awJM8hCms6kS79QNNOtfKFGHnkPY=;
 b=v0S1il773X8yNPQorSzXmfEc2o0QwVTGoDCG/Eaqoox/GxVtTz3QrHNnmFC0tUHznE
 YRBThsJOPGfLhQEDOWZDf+25NRnjPQ0zMSYW0m45pv/DHKrqQmEgiPyWn+1wSmdjs/EV
 eAr4BIMcZPYaiu6iyZEaKtf5eVp8aqBgISQsMtBJevS+XzBNdqx8qF4h6+lirQRm0N2e
 hBLztiuPFM8V8NLtBGO7sThBUZuMdy0HDLSitp1jST+QlWT+M3J18RBx9Meb3iQ/NRT7
 DOifYv8Gti4DLGyCpflHJULoLUVxiqZC8VOOcy1HkAhDR2AOSAkk0nOf7eKcc7I3sG8y
 oJjg==
X-Gm-Message-State: AOAM53342gto7BZtnT3nff0tILjcwW7tbWN+amSjM1kZCo/L0EwsIvFL
 cY2jswIYbQ66q+YyWJPeVhmbzA==
X-Google-Smtp-Source: ABdhPJy7brAb6b+fykSfgmjLXHOMrgU7t5zokOTgkkOHS6XTvTg4R6Qpr6tKxsaeUrGYmJkVp/Xi5g==
X-Received: by 2002:a17:906:8051:: with SMTP id
 x17mr438542ejw.473.1637616929530; 
 Mon, 22 Nov 2021 13:35:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y15sm4981810eda.13.2021.11.22.13.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 13:35:29 -0800 (PST)
Message-ID: <1f722e03-73d6-7ebd-84f9-86648832afec@mind.be>
Date: Mon, 22 Nov 2021 22:35:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211104003607.2022984-1-aduskett@gmail.com>
 <20211104003607.2022984-3-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211104003607.2022984-3-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH vRFC 2/4] package/webkitgtk: add
 gobject-introspection optional dependency
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/11/2021 01:36, Adam Duskett wrote:
> Enable introspection when GObject Introspection is enabled.
> Midori 9.0 requires webkitgtk built with gobject-introspection
> support.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   package/webkitgtk/webkitgtk.mk | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index a3db249ae6..4d5d0b89e2 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -21,7 +21,6 @@ WEBKITGTK_CONF_OPTS = \
>   	-DENABLE_GAMEPAD=OFF \
>   	-DENABLE_GEOLOCATION=OFF \
>   	-DENABLE_GTKDOC=OFF \
> -	-DENABLE_INTROSPECTION=OFF \
>   	-DENABLE_MINIBROWSER=ON \
>   	-DENABLE_SPELLCHECK=ON \
>   	-DPORT=GTK \
> @@ -59,6 +58,13 @@ else
>   WEBKITGTK_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
>   endif
>   
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +WEBKITGTK_CONF_OPTS += -DENABLE_INTROSPECTION=ON
> +WEBKITGTK_DEPENDENCIES += gobject-introspection
> +else
> +WEBKITGTK_CONF_OPTS += -DENABLE_INTROSPECTION=OFF
> +endif
> +
>   # Only one target platform can be built, assume X11 > Wayland
>   
>   # GTK3-X11 target gives OpenGL from newer libgtk3 versions
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
