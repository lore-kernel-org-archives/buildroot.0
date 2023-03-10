Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5016C6FD19
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 21:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48F6F41728;
	Fri, 10 Mar 2023 21:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48F6F41728
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0D68gV8X5z4; Fri, 10 Mar 2023 21:00:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 893DB4170F;
	Fri, 10 Mar 2023 21:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 893DB4170F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26C101BF390
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 21:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3F4561AD8
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 21:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3F4561AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T0jGIXUHrzKU for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 21:00:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 952AF60FE1
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 952AF60FE1
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 21:00:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g3so6228226wri.6
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 13:00:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678482049;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=khJDLfiCOO3IRwif8/GpFrBVv0g9ZCpZbz1tGnrCYcM=;
 b=rq3D+dQU2j98PjaMlUu3me2ZZjFTvEbVa+BpEVlkNf2LHj1uek+VSwZonZNCt62tVw
 buF+5nQz7uRpLfnvfA7hu/2Q1lEcTyg5snY0HD7PzyYvmmH9Dj1c0ff5MlGMS2fLoPri
 GI5yBY27OKRH9QFs5Vig0N2rcWq4IzMP3mF9Fnt8vyzlODypSGkqZDpw73WjQUS2yfts
 p9x/stxZ2SHVB6XzIYXG38BY6j27q2HFetks4/Z/8SAYJNB6WIV0Brgs0HsMykUzmVpw
 2fEzmMB7VlRYF39Kn7ux2LmFzUFvu6QW3ENJriobvGVFVfWsToH56UZLTxotkB6g7DVZ
 0g/A==
X-Gm-Message-State: AO0yUKXFr+OCqxx6YgFJzcy8/86j7rrEaARAc45xRSbxELMQEVb5CQLi
 ++I6uolUtkiuGj1JnLVAPJk0at+Go/qMU9pFCKI=
X-Google-Smtp-Source: AK7set8HzDnvkibQzj6cGFEezI1KxCAGPP/ovFBg+Jt5wAaaWt4OL6ef1YWietr4uetVklCRmcLfrg==
X-Received: by 2002:a05:6000:1:b0:2c7:11a5:d7bc with SMTP id
 h1-20020a056000000100b002c711a5d7bcmr17983180wrx.43.1678482049538; 
 Fri, 10 Mar 2023 13:00:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05600001c800b002c7e1a39adcsm683828wrx.23.2023.03.10.13.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 13:00:48 -0800 (PST)
Message-ID: <a1d28c09-ad71-2fc7-8a79-4f02508c8a16@mind.be>
Date: Fri, 10 Mar 2023 22:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230221130040.868693-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230221130040.868693-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678482049;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=khJDLfiCOO3IRwif8/GpFrBVv0g9ZCpZbz1tGnrCYcM=;
 b=egg7QNmcTVLPnCb4VhaPBorAEYHFoVQPfjIwsNmnb48+lkjWfL54+87rKV6gIJekGY
 8RYb0s0/rDjpH7kOHAnpoWQQ7BY6d40iar3OIJQrvJ1kIYmkNv1/+6xrgRGz2u1Agrpo
 cKXg61ig94jEiYS8+P9EPEloi+7ou8e7vf3u4FYFu4r0VlLodnkRgjwJalFGohB6KE7M
 yLUwM6ZyK1pbL7s4Lll9SKqeY6Sj6205JFAd52a7/8U4Y+sJ6WXdK5e6A6jmoGBB4C/w
 zvJIAGPA4DF86SVSh/gvl+aSt4ckpuuY29QEB5o9lTHsqTXtVpXVW2GV7FNJCiqheKSi
 ZoQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=egg7QNmc
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: fix build with
 -Dmodem_manager=false
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/02/2023 14:00, Fabrice Fontaine wrote:
> Fix the following build failure with -Dmodem_manager=false raised since
> commit c36f6938858d3246ca493dacc925717586e2ea0f:
> 
> ../output-1/build/network-manager-1.40.10/meson.build:1060:0: ERROR: Unknown variable "mobile_broadband_provider_info_database".
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/896879c8e8ce022556ee834216ced2f962ff279c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...build-failure-with-Dmodem_manager-fa.patch | 38 +++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
> 
> diff --git a/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch b/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
> new file mode 100644
> index 0000000000..648be027e0
> --- /dev/null
> +++ b/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
> @@ -0,0 +1,38 @@
> +From 736a2c356c1c4871e8c4e70be622c65c87d3bca8 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 21 Feb 2023 13:03:00 +0100
> +Subject: [PATCH] meson.build: fix build failure with -Dmodem_manager=false
> +
> +Fix the following build failure with -Dmodem_manager=false raised since
> +https://gitlab.freedesktop.org/ffontaine/NetworkManager/-/commit/03ba04d4784fa4fc7ec31455070fb5ecf25ade23:
> +
> +../output-1/build/network-manager-1.40.10/meson.build:1060:0: ERROR: Unknown variable "mobile_broadband_provider_info_database".
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/896879c8e8ce022556ee834216ced2f962ff279c
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1544]
> +---
> + meson.build | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 84ce52c736..b79240efc0 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1057,7 +1057,9 @@ output += '  jansson: ' + jansson_msg + '\n'
> + output += '  iptables: ' + config_h.get('IPTABLES_PATH') + '\n'
> + output += '  nft: ' + config_h.get('NFT_PATH') + '\n'
> + output += '  modemmanager-1: ' + enable_modem_manager.to_string() + '\n'
> +-output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
> ++if enable_modem_manager
> ++  output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
> ++endif
> + output += '  ofono: ' + enable_ofono.to_string() + '\n'
> + output += '  concheck: ' + enable_concheck.to_string() + '\n'
> + output += '  libteamdctl: ' + enable_teamdctl.to_string() + '\n'
> +--
> +2.39.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
