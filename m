Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E34CDB482
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFA1281DFC;
	Sun, 15 Oct 2023 20:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFA1281DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWWbS0eS8uUC; Sun, 15 Oct 2023 20:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25B4781BC6;
	Sun, 15 Oct 2023 20:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25B4781BC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E32151BF83B
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C93774179D
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C93774179D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dKfvvrdlkFgl for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:16:41 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D4CB41794
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D4CB41794
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9bdf5829000so302888066b.0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 13:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697401000; x=1698005800;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Qh5hJp+DrCvJqyTGc2msNSm9IRpXrz8GaHi2trfA6M=;
 b=KFOGqeJ/zvslRSKR835k/HZ0dScrndpvLrgkyn3qXJ5teIDwNehB7JB5x8YT+ZUGKG
 tt2LsiGKhOosviN3jPEw9EObHHfzrSN+uE/hDP/W+JmsH85PNqkP3QTCuIIdMBVpBbRx
 7EK9VEbjtS47pB3q0eTI7HxLeSkI4marj7jjiVKih9O8WaVYVGo06L4XBUfeygqT+Obf
 lpx3qGkyZOENn0cl9m8Y07kI2uRBuASvjuc10+bfBVufKP2F7A1o3mJT6HrMjJaEr+rt
 QljluavceDuPijkQhFTJM56O09B2XatzXCVypTvk2zHzW/ZYjPZWLuHzvx7JS0L+bvi6
 r7fg==
X-Gm-Message-State: AOJu0YyxOOfHTK8qLCQpFL2Il1HzKPFxzsLAnTuTeyqeUW5ccIeYBoC+
 eQOAx7iQXF0J3zMF3n1fUueSBu0/MD/OirXbBtQ=
X-Google-Smtp-Source: AGHT+IGlDHnOYbnE231L5yXXQgMPd09hduNxikqAimlMmkeghCyoezg40/8BSMWgzxxTiJl8yvFGFg==
X-Received: by 2002:a17:907:748:b0:9bf:4915:22c8 with SMTP id
 xc8-20020a170907074800b009bf491522c8mr2771863ejb.5.1697400999732; 
 Sun, 15 Oct 2023 13:16:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 jy12-20020a170907762c00b0099d804da2e9sm2710954ejc.225.2023.10.15.13.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 13:16:39 -0700 (PDT)
Message-ID: <40b075d9-cffc-321a-294d-39f24ca5d5a6@mind.be>
Date: Sun, 15 Oct 2023 22:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20231015064117.1362398-1-troglobit@gmail.com>
 <20231015092650.392835-1-troglobit@gmail.com>
In-Reply-To: <20231015092650.392835-1-troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697401000; x=1698005800; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Qh5hJp+DrCvJqyTGc2msNSm9IRpXrz8GaHi2trfA6M=;
 b=JhV4g6gFTuohu4QifO+NoIxYmKNeSy2uMa0Jd01yoDFFuWCqfkbrEWvvWN8Zunwk4c
 3lhnWQexxubS4AzyN0RS9Uka1bRxKGQche135JgStGiseZGtTNx2TN2hrj0Dr8YLmCX3
 6ITn8dbEtb5bxJPHFW0/oEwDN3N6o2M0mB5cFsZr9abFvN8j8S74ZzeCD+ea/1Hb3lV/
 PcQillbFwII9/K08rYlGIlH1rTDJ2H4lNxQLQpci65DggSkQSDgBn65AaS58xr6h3l7Y
 GWVrMCv2IDcl+eNTCBmo8JMYa6wQgJ/uMnyD0uHKcJdytvAsqM7qAuLtRewYH/42bMhU
 YD5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JhV4g6gF
Subject: Re: [Buildroot] [PATCH 1/1] package/libite: bump to v2.6.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2023 11:26, Joachim Wiberg wrote:
> Changes:
>   - New APIs introduced in v2.6.0, for details, see
>     https://github.com/troglobit/libite/releases/tag/v2.6.0
>   - FTBFS fix for uClibc and musl libc, v2.6.1
>     https://github.com/troglobit/libite/releases/tag/v2.6.1
> 
> Packaging:
>   - LICENSE hash changed due to bump in copyright years
>   - Disable doxygen (html docs) in build, introduced in v2.4.1
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libite/libite.hash | 4 ++--
>   package/libite/libite.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libite/libite.hash b/package/libite/libite.hash
> index 7dac198ab8..3abad09b0a 100644
> --- a/package/libite/libite.hash
> +++ b/package/libite/libite.hash
> @@ -1,7 +1,7 @@
>   # Upstream .sha256 from GitHub
> -sha256  ca086adc7ebf0c2ebf2ed7a6787f9567fb802db8583576228dd5dd5ddfb7bb97  libite-2.5.3.tar.xz
> +sha256  0185c3e76874c5821825deaf17cd45e81ce49aaa424e09de5f3665243c59026b  libite-2.6.1.tar.xz
>   
>   # Locally calculated
> -sha256  20db0601195f708d68ff7907907b3cd3b25808efa8332e064b11f00c839a5d2f  LICENSE
> +sha256  3a2b964c1772d03ab17b73a389ecce9151e0b190a9247817a2c009b16d356422  LICENSE
>   sha256  c2882adb51555b836f35babc59f618d9ddceadcaa2d1dc80bbd4699614d2cd14  src/chomp.c
>   sha256  bff7fa7b74324f13a24d56ebb8b49bc9c63ea01836a1c8b5a6afcbbabed62918  src/pidfile.c
> diff --git a/package/libite/libite.mk b/package/libite/libite.mk
> index 1cef992e53..e4bd845487 100644
> --- a/package/libite/libite.mk
> +++ b/package/libite/libite.mk
> @@ -4,12 +4,12 @@
>   #
>   ################################################################################
>   
> -LIBITE_VERSION = 2.5.3
> +LIBITE_VERSION = 2.6.1
>   LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
>   LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
>   LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
>   LIBITE_LICENSE_FILES = LICENSE src/chomp.c src/pidfile.c
>   LIBITE_INSTALL_STAGING = YES
> -LIBITE_CONF_OPTS = --without-symlink
> +LIBITE_CONF_OPTS = --without-symlink --disable-doxygen-doc
>   
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
