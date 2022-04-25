Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B86C4332F
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C1E940A8B;
	Mon, 25 Apr 2022 20:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DI5AkrNQ3uFP; Mon, 25 Apr 2022 20:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0547640574;
	Mon, 25 Apr 2022 20:23:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FEAE1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DD5B828F7
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eAAd-miCiCnp for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:23:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5487C828A5
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:23:50 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g23so12827377edy.13
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 13:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8Uuk9GouP4SWubYciJqRk/31EQzgOFmOiJTPISqjSNE=;
 b=R6b3Rc7b3c6bx01Av8XpuSZyxuqAMvsI3jtW+qkUhEVNzklhJ1oGNhxbJBwelgHT3g
 OFeTazhV3qM8yMvmqkmT54Egtn6PBZQeDZz3qiGcYzKL81I8FD3k+3Sghha5wDexnUzn
 JmQtOhgtk77bU1uZs3ep1brrP75HifDNb1opEf7659Rg380bi7SOa5dCfXCJsDjbO1UZ
 dieVLMGBUJrcBGzzeAbnTprhQoTPAIg68wzG8wyyEJ7yspOoNWq2YyfYrovMpTarUwOI
 +SEWSAz3XfFhaZTso+yve/fyaLe973dcyFs0Bi9HGv+CWu+SiQLGbbqBFHBsLeLZv4/v
 2oqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8Uuk9GouP4SWubYciJqRk/31EQzgOFmOiJTPISqjSNE=;
 b=cViruBQfwou6KnbxyYGpgWNNFq+UJk/mUqVHGXGsBUIq/JVqBNyEO8azd+X9GcZm1W
 yrY2LMfuhJpcST2O8aXmdKzCXHwkVt7KZJLAd/N6d6oGDm/HDPdngf+UNLUSjSY7bW8+
 6B9W979QBtAMfNoU7NxOmkvOznJajuA0yzuHjiwJ3nNJQVmSL2/NOYjvXOhn7IRamPO6
 QO040pwXlV/JlWN5Erq8wPrflc1KxPnJu9icU6yq6Bupm6A7g0WJhwn48nmaECcwoJfn
 7+5IuNlvHvtdqfA4YjKeK+yikG9BdeG+uqQz0PEXgVV1lmQ4tV+CN2Y3lGOiNRynV3b6
 Mm5w==
X-Gm-Message-State: AOAM530WoEE2QEdQUjd7cu6oZM94iAb/bgaf39a0drma4xgGmzqKLRNu
 JCdf2PR/m4s3o41JVxDtjoPIiqAqOvUn5w==
X-Google-Smtp-Source: ABdhPJxl5A4/jBPEY6V+w412qW55XQnbXamE85XZaLeDJWokIfiGzq0j09CDKtDvWM96gmekYZ57iw==
X-Received: by 2002:aa7:c3ca:0:b0:425:ecfc:4258 with SMTP id
 l10-20020aa7c3ca000000b00425ecfc4258mr5850440edr.266.1650918228539; 
 Mon, 25 Apr 2022 13:23:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ak18-20020a170906889200b006f39a445b93sm1226104ejc.141.2022.04.25.13.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:23:48 -0700 (PDT)
Message-ID: <c62db3cd-b900-74c9-618d-8d6731742a0f@mind.be>
Date: Mon, 25 Apr 2022 22:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20220422145530.1963337-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422145530.1963337-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/libinput: security bump to version
 1.20.1
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/04/2022 16:55, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2022-1215: libinput format string vulnerability
> 
> For details, see the advisory:
> https://www.openwall.com/lists/oss-security/2022/04/20/2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libinput/libinput.hash | 2 +-
>   package/libinput/libinput.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
> index d1c7cfb104..d8282ff03b 100644
> --- a/package/libinput/libinput.hash
> +++ b/package/libinput/libinput.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  6c1f97892a7d599f97349e5e7c1239901fe00edcd4f6289f410034d5dc06cc85  libinput-1.20.0.tar.bz2
> +sha256  08c003f724f361ed21f4dfbfe755a6c115b85385f1418907bb98f185457273f0  libinput-1.20.1.tar.bz2
>   
>   # License files
>   sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
> diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
> index b814e3416d..a66b0afde5 100644
> --- a/package/libinput/libinput.mk
> +++ b/package/libinput/libinput.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBINPUT_VERSION = 1.20.0
> +LIBINPUT_VERSION = 1.20.1
>   LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
>   LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
>   LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
