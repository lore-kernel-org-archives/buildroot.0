Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DEAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 21:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8114400C8;
	Sat, 11 Dec 2021 21:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X1ykSqlwRlvM; Sat, 11 Dec 2021 21:10:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB21240173;
	Sat, 11 Dec 2021 21:10:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFE521BF3A0
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F400856AA
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fXLCMzTtF05J for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 21:10:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 745EC856A9
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 21:10:07 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id r25so39896008edq.7
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 13:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Hf2uydgzJuyGH9CxBK8ZmZEycSjNshYFR3K3UcrBWX0=;
 b=Rsidh09EeIhPj0SxYG3z3Uhw4WQzFtJDApG7gu7ritKgxkGkED6eMLCbo85TOYaIWM
 F4h4+PWP8Epx3jQu8rsAWOfXs0lRvnPXgUNR8R0XX/1bnNlvIXqXNrpj21F5o0+enwqN
 CtCwBqxJElhSCtzsdWe896TK3bP6LbFeE85ZipY1Bik0T+MyjGdk7b9BuveZsy125AvJ
 ouDIwYNvSuOQNqczeVjA8xH4wySJyqEFKd8hczoUSlLKXwO9QMF1Y68S3c6weql1pIca
 QTKraNFZG/8L5JLH+k0HTzE9aRBpZ+8bF2R/IXHAO/TOoRfmdBt0Iyfy2v4QdDbXWWKw
 l9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Hf2uydgzJuyGH9CxBK8ZmZEycSjNshYFR3K3UcrBWX0=;
 b=BexPF2mpe45RRrPH7GJSXf1E580xscs37dG76KSawJMsHjCAhkcVSudHszwxKaaO5X
 l1+5ig9F3eRWdh3PzuO40Lj/G+2Ad7EEt9VBPZCP9KUHLgfGwi4zkdqnsQcP6034+4Lm
 vVFUQ5YurCgWcI1gJSZYUB0TRWL0Y9aIlBskVFsbceEgddSpmWd8y3AzK0gk4f/6bGe8
 WmVUnSmI0vzeNMEQOTxUDeot7x9j7s8nb5rJB9Ss8GYElxsEF8vIrtmbLfG6IK4hru14
 Xe5e3immMQtcZeRD6yQFUj9YIr0fzWSqwglNzoqg/Ytg+FGH2QwOnvGJSM88n1zdAcdd
 1ApQ==
X-Gm-Message-State: AOAM532iPJO58n+rb0zBeYmh9Ky2j7cucoYfhSIbIhcym7sPjYrdNJ7r
 uKfyqxPIK0GMjMP6BUHwwsN8MQ==
X-Google-Smtp-Source: ABdhPJzDpYxl9NtU6bF1ZUCPSu7GL1ZTMsIOQjuU8ooFaSzhoSKQpCxoV+o7hloLHcaKuNP6Xm7sgQ==
X-Received: by 2002:a05:6402:190d:: with SMTP id
 e13mr50315609edz.282.1639257005755; 
 Sat, 11 Dec 2021 13:10:05 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jl8sm3469493ejc.59.2021.12.11.13.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 13:10:05 -0800 (PST)
Message-ID: <9d4b5e43-4bda-ba4d-a3b0-c6421e19ed07@mind.be>
Date: Sat, 11 Dec 2021 22:10:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211206185800.797075-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211206185800.797075-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.3.1
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/12/2021 19:58, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2021-December/000656.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>   package/mesa3d/mesa3d.hash               | 6 +++---
>   package/mesa3d/mesa3d.mk                 | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index 39797f61b7..6469716806 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -12,7 +12,7 @@ endif
>   
>   # Not possible to directly refer to mesa3d variables, because of
>   # first/second expansion trickery...
> -MESA3D_HEADERS_VERSION = 21.3.0
> +MESA3D_HEADERS_VERSION = 21.3.1
>   MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
>   MESA3D_HEADERS_SITE = https://archive.mesa3d.org
>   MESA3D_HEADERS_DL_SUBDIR = mesa3d
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> index 6ada5aebc4..f12918dbfe 100644
> --- a/package/mesa3d/mesa3d.hash
> +++ b/package/mesa3d/mesa3d.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/mesa-announce/2021-November/000654.html
> -sha256  a2753c09deef0ba14d35ae8a2ceff3fe5cd13698928c7bb62c2ec8736eb09ce1  mesa-21.3.0.tar.xz
> -sha512  b27c0ccf2fc9b96bbece715612cec4f4e267ab25dc5386c3debd2346c385afa0146317c67a3d2eec198dbf5338fb182b458c5fe5567216b265153c0b7b560de1  mesa-21.3.0.tar.xz
> +# From https://lists.freedesktop.org/archives/mesa-announce/2021-December/000656.html
> +sha256  2b0dc2540cb192525741d00f706dbc4586349185dafc65729c7fda0800cc474d  mesa-21.3.1.tar.xz
> +sha512  43f019d4810bafd177b1a41207ae20a77982e4e6df3ab2b7a700273748cbc766694bd44594c898c4bd7848a94200fd28237a67d290c4e06595e6eab71cb716e8  mesa-21.3.1.tar.xz
>   
>   # License
>   sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index c4e8cf0608..0859265afb 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 21.3.0
> +MESA3D_VERSION = 21.3.1
>   MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>   MESA3D_SITE = https://archive.mesa3d.org
>   MESA3D_LICENSE = MIT, SGI, Khronos
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
