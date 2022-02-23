Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD162C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B033827A1;
	Wed, 23 Feb 2022 20:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OWynxHmsLPWp; Wed, 23 Feb 2022 20:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7835082611;
	Wed, 23 Feb 2022 20:03:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFBAC1BF5EA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D842860FC8
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EscxtlU6Q1g6 for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:03:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90E4660FC7
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:03:05 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id bq11so24655554edb.2
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zcMKyo9l0A7C6k48jN5GiwtpIoxTWg1cjWiOwLfHNyY=;
 b=N5oABAND523x7aOpHHQ/DUPjazxxR6AMOGhgLW58Kt0hc9g9gImHtmJXgb3JlvBkgH
 acb7vrZjGw+HfA9WdSzQZpeoQeskS0hQ9UE9Ahr1dIdtasX6HONmZKlEZLVMXmaihjKh
 xWOGGiO3QcQoqJ/4IFuugxhpvzirJNhNjL+AB2zENLXQJZ73AujzawQUJbfkBViX2Wdq
 eut9oFmujdSxA1L+FZ/XsyLqsAqscqXtOonCt9N5d+V0ag5/XJfGqbuUzGhYz8dA0QWg
 aAPMpSP6zIsQKx5UjJJNh0NWjp0NyWdQNFfZ35uqr9Uq7VFJyvQyM6qeqJCdMlDJ9nlG
 dgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zcMKyo9l0A7C6k48jN5GiwtpIoxTWg1cjWiOwLfHNyY=;
 b=JaIKlM42guZQB4RCZEY25wcYS/VyYfcG522B0Oj/zFbJmWe4iCi3GGQ562a6yKUSTl
 MVr7oMtxn3AgJgq2KPyrn5Y3LRvZKFkokWLIVZC/8yZiwJlgV1ayKv4gWE/EduDkUix1
 Q09rohBDuU2ber6zWa0Ekb8Vj97MlJUQLGaY+/ap4OWLuy8dy/V7isonvmXnVMT5vmqv
 Aj1L3T6png5zX2evy4CTvv/93QwJkPaIFr1zapL8eaA6p+HpVyDsfXmDuWNUWv/UhHjk
 DgrWueCd7b7FpFgtYx2hd4+vf/7YG8/gH++LassAzoO4dcw6Ct2zm5xhJQ456POJEak2
 hRUw==
X-Gm-Message-State: AOAM53375l6uob3zcqbfOmQTVTBKSPqJWta7jxsOntsy7J7fAhtBUHYb
 RCY+b034wcFrKj1YJz/I0fd9plgs6ED8qQ==
X-Google-Smtp-Source: ABdhPJw7mnp6mdl8M2rzxSmDBYoCgBpxdPx0ZzhZP/LrJJPsTCYp+dmNUC9Wt7VZcMrdDRYDgkSy8w==
X-Received: by 2002:a05:6402:4389:b0:410:9a9d:ab53 with SMTP id
 o9-20020a056402438900b004109a9dab53mr1074234edc.16.1645646583567; 
 Wed, 23 Feb 2022 12:03:03 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qf12sm248438ejc.54.2022.02.23.12.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 12:03:03 -0800 (PST)
Message-ID: <8040cc3b-bb83-1a50-335e-3bdc4c1b32ef@mind.be>
Date: Wed, 23 Feb 2022 21:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220214193940.3615904-1-fontaine.fabrice@gmail.com>
 <20220214193940.3615904-2-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220214193940.3615904-2-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/weston: drop fbdev
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/02/2022 20:39, Fabrice Fontaine wrote:
> fbdev raises the following build failure since bump to version 10.0.0 in
> commit f67a6e9b7a7be9adbc405b3126000056120a01af and
> https://gitlab.freedesktop.org/wayland/weston/-/commit/6338dbd5816689b2f08f48b359a972e16ff038d8:
> 
> ../output-1/build/weston-10.0.0/meson.build:133:7: ERROR: Tried to access unknown option 'backend-fbdev'.
> 
> Drop fbdev to avoid this build failure as upstream is reluctant to
> properly fix this issue by renaming the fbdev option in stable release:
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/791

  Reading that, it seems that only the option BR2_PACKAGE_WESTON_DEFAULT_FBDEV 
is broken and we could keep BR2_PACKAGE_WESTON_FBDEV.

  However, it makes sense to remove this deprecated option anyway, so applied 
both to master, thanks.

  Regards,
  Arnout

> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e669a6237c19783c627169c819d7372e20daaf54
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   Config.in.legacy         | 12 ++++++++++++
>   package/weston/Config.in |  8 --------
>   package/weston/weston.mk |  6 ------
>   3 files changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index aefb0ba6ea..b90b9dbcbc 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,18 @@ endif
>   
>   comment "Legacy options removed in 2022.02"
>   
> +config BR2_PACKAGE_WESTON_DEFAULT_FBDEV
> +	bool "weston fbdev removed"
> +	select BR2_LEGACY
> +	help
> +	  fbdev was deprecated in weston 10.0.0.
> +
> +config BR2_PACKAGE_WESTON_FBDEV
> +	bool "weston fbdev compositor removed"
> +	select BR2_LEGACY
> +	help
> +	  fbdev compositor was deprecated in weston 10.0.0.
> +
>   config BR2_PACKAGE_LINUX_TOOLS_BPFTOOL
>   	bool "bpftool was moved"
>   	select BR2_LEGACY
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 073a3ae567..6ad8241caa 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -34,10 +34,6 @@ if BR2_PACKAGE_WESTON
>   choice
>   	prompt "default compositor"
>   
> -config BR2_PACKAGE_WESTON_DEFAULT_FBDEV
> -	bool "fbdev (deprecated)"
> -	select BR2_PACKAGE_WESTON_FBDEV
> -
>   config BR2_PACKAGE_WESTON_DEFAULT_DRM
>   	bool "drm"
>   	select BR2_PACKAGE_WESTON_DRM
> @@ -62,7 +58,6 @@ endchoice
>   
>   config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
>   	string
> -	default "fbdev"    if BR2_PACKAGE_WESTON_DEFAULT_FBDEV
>   	default "drm"      if BR2_PACKAGE_WESTON_DEFAULT_DRM
>   	default "headless" if BR2_PACKAGE_WESTON_DEFAULT_HEADLESS
>   	default "wayland"  if BR2_PACKAGE_WESTON_DEFAULT_WAYLAND
> @@ -71,9 +66,6 @@ config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
>   config BR2_PACKAGE_WESTON_DRM
>   	bool "DRM compositor"
>   
> -config BR2_PACKAGE_WESTON_FBDEV
> -	bool "fbdev compositor (deprecated)"
> -
>   # FreeRDP needs threads and !static, already the case for weston
>   config BR2_PACKAGE_WESTON_RDP
>   	bool "RDP compositor"
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index a0a18d9358..90cf160688 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -85,12 +85,6 @@ else
>   WESTON_CONF_OPTS += -Dbackend-rdp=false
>   endif
>   
> -ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
> -WESTON_CONF_OPTS += -Ddeprecated-backend-fbdev=true
> -else
> -WESTON_CONF_OPTS += -Ddeprecated-backend-fbdev=false
> -endif
> -
>   ifeq ($(BR2_PACKAGE_WESTON_DRM),y)
>   WESTON_CONF_OPTS += -Dbackend-drm=true
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
