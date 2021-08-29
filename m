Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6A5C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 16:57:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2974860F39
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 16:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2974860F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDB7480DDD;
	Sun, 29 Aug 2021 16:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zpjd9Mu_TI18; Sun, 29 Aug 2021 16:57:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D7BF80E61;
	Sun, 29 Aug 2021 16:57:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 442811BF298
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 16:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 340F5606BE
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 16:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fRU43_LakrFX for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 16:57:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56AC66070A
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 16:57:25 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id u19so1240358edb.3
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 09:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yCS1NCiXl9Z+h7kezBpk6546FNYdjN0EtytlnbwRieY=;
 b=Bu9pE7DGiiBUkcTOKKpkAlT/gR4TvaH30cLngj2sQHwqrv5sGtU6AUMxnzAlVRuuGu
 RLqUlA2IehKb/01uPEi7lX+vtN1ANxqW34+8CBkdCSrcDUqi5iWR61mWozxU4FW+GFWi
 WHkaS9ELSnsOnbKSbjh9cTLRc0c4g8D582vRuzNnazIjlxIggr3aHoZwO7zBzq/tDF0Y
 jtLjBdh71uPy6jAmuH1tWCMn5+JfWw68YyrOpXUSA2Kb4MsPualalSzGc2ehxLHg0pM4
 9k12mne3h1RYe0iUKwTzekkFpYG2WbKjRFh0YxhdaI67vhRlJsZwUoB7gnXPiy7PMRpm
 P4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yCS1NCiXl9Z+h7kezBpk6546FNYdjN0EtytlnbwRieY=;
 b=dgUEX7lZ5/HEBHAd8N4aYXgUiYsZMCDV6/yYauepmqvlpYJHIKY9i/YfnVNPWkFbQj
 YzlgUdWk0XL5+NAj3aR3MXYVKjQUtavOfIgm3eD756hICDOR+VB0uCKL5gFxCOAixgNW
 3ut/fD9+syzGC9nGaSTq1kE+vkPSiOoYegJ2SI7qJbCjBg9eWFgwLDDHb74yO/+/Db13
 uIgBuqLWDPeo4NMC+40cHCwhoezIDTBptX4Ui85awbiN+HhAobXyeSeKFCMh4+9fU4Om
 PNOi0wzQoDZTYnb/vhLMEMEXp9EqTUkPAdgZZ4UBGnHR+TmD1Gv92OBHB5rbH2Y9yAwD
 6JxA==
X-Gm-Message-State: AOAM532FEiuAwJWSl579Joq8o4D3iWu9wnCjTC3tg1YpwJxvCDKbmdmC
 rGzd533exwKiOj7GRxZ046xLdVo0L/Vpvg==
X-Google-Smtp-Source: ABdhPJwV5fDQENsi5zZ9CjWVEcykotUqCLqTm7c4aj1cDgq8JXKUAJAhAFjiGhu7n0F1vbvyq4HWSg==
X-Received: by 2002:a05:6402:c05:: with SMTP id
 co5mr20679955edb.41.1630256243521; 
 Sun, 29 Aug 2021 09:57:23 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p5sm5616393ejl.73.2021.08.29.09.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Aug 2021 09:57:23 -0700 (PDT)
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, buildroot@buildroot.org
References: <20210806124854.1832099-1-tomi.valkeinen@ideasonboard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <955e7707-8577-ceb6-722a-67d4fb06fe52@mind.be>
Date: Sun, 29 Aug 2021 18:57:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806124854.1832099-1-tomi.valkeinen@ideasonboard.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/rwmem: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 06/08/2021 14:48, Tomi Valkeinen wrote:
> rwmem is small tool to read & write device registers. Some of the
> features include:
> 
> - support mmaped and i2c devices
> - addressing with 8/16/32/64 bit addresses
> - accessing 8/16/32/64 bit memory locations
> - little and big endian addressess and accesses
> - bitfields
> - address ranges
> - register description database

 I added a sentence here to say that python bindings are disabled for now.

 With that, applied to next, thanks.

 Regards,
 Arnout

> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  package/Config.in        |  1 +
>  package/rwmem/Config.in  | 10 ++++++++++
>  package/rwmem/rwmem.hash |  2 ++
>  package/rwmem/rwmem.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/rwmem/Config.in
>  create mode 100644 package/rwmem/rwmem.hash
>  create mode 100644 package/rwmem/rwmem.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 046c04e994..6e97346eb1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -134,6 +134,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/ramsmp/Config.in"
>  	source "package/ramspeed/Config.in"
>  	source "package/rt-tests/Config.in"
> +	source "package/rwmem/Config.in"
>  	source "package/sentry-native/Config.in"
>  	source "package/spidev_test/Config.in"
>  	source "package/strace/Config.in"
> diff --git a/package/rwmem/Config.in b/package/rwmem/Config.in
> new file mode 100644
> index 0000000000..0fd9142e92
> --- /dev/null
> +++ b/package/rwmem/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_RWMEM
> +	bool "rwmem"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_FMT
> +	select BR2_PACKAGE_INIH
> +	help
> +	  Simple program to read/write from/to any location in memory.
> +
> +	  https://github.com/tomba/rwmem
> diff --git a/package/rwmem/rwmem.hash b/package/rwmem/rwmem.hash
> new file mode 100644
> index 0000000000..9becbc5b21
> --- /dev/null
> +++ b/package/rwmem/rwmem.hash
> @@ -0,0 +1,2 @@
> +sha256  55d28f029c0cd5c21d3e1c89371e2905d5217f571ef5389ed0fce163804d1c4a  rwmem-c8291705c82bb0686be9adf6a427a2b72114719a.tar.gz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/rwmem/rwmem.mk b/package/rwmem/rwmem.mk
> new file mode 100644
> index 0000000000..24c4e92efc
> --- /dev/null
> +++ b/package/rwmem/rwmem.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# rwmem
> +#
> +################################################################################
> +
> +RWMEM_VERSION = c8291705c82bb0686be9adf6a427a2b72114719a
> +RWMEM_SITE = $(call github,tomba,rwmem,$(RWMEM_VERSION))
> +RWMEM_LICENSE = GPL-2.0
> +RWMEM_LICENSE_FILES = LICENSE
> +RWMEM_CONF_OPTS = -Dpyrwmem=disabled
> +RWMEM_DEPENDENCIES = host-pkgconf fmt inih
> +
> +$(eval $(meson-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
