Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C22C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D860940133;
	Sun, 27 Mar 2022 15:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sp8hAnA_ReRi; Sun, 27 Mar 2022 15:34:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB4F2400CC;
	Sun, 27 Mar 2022 15:34:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6D061BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3F6881A6F
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SpNFb3WyVjEO for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:34:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 485FE81A65
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:34:52 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bg10so23992167ejb.4
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jYScbg7xSE/dsVPgxVzTJRtYF/uJhu7gAU1k04Qs7f0=;
 b=S6znBbV9seod3D+l51K288oK3jchAyKmmNFHBJcdGdfe/UMSgrPfMaXmFqnz03g5vc
 e4ID7yZJ5rkEy+rn2PPz3pDE/vKTYkBL3Jwtk2E7hjY2kXy4vaMLVCFPcaZy4dSr77Kw
 HNWTWW+fjbz6afaRNEzfA5shqxpm6uEI0l3eUeHG7xJEAmM0O7AG1AyTilE/1Apt5eYL
 7aAKN6ZS76fRB6xVzRYUnsIyAoJTm4/YQwwcfY0n0HarYRYZSRBQi2q9javC8gEyPBnR
 xTjVfRs89SLKoXFfILDFMZ4TUZep+Q5ObVRzU+l9jBzuM2mOYqokBB5dMrSgVl3gZSRg
 pHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jYScbg7xSE/dsVPgxVzTJRtYF/uJhu7gAU1k04Qs7f0=;
 b=fFZAhh+6IO8/ZOdw6sQmbsdoQfFworYgJ8WWcG4GgDiabgslQV16O5zYeWFWSDztwA
 uDhnTa9kdBwavOG/HuhmEe4O6Ki30SSwaGtPDfh0BAN6V0EdJLDysCA18Dz3/eDUAZMZ
 4+KssBFaAhZmXM/NC4+l+do49GcRrP6mQLJSplzxYjX2Qp5T+xOQ2awNsMv3MjAXEqEm
 +NHFTfyrZtmX4dncJbHR1Uuqkls6C4pqjRcCo0p3rrOvdSWfqeLgXnxeb2sciaFD4gBb
 zSbDnya8yDYwvltDrIVTcAFlfY8SDoz4GZgEMjzmr3xvWUYPJuhFCSEEruWR9prldwb6
 lnUA==
X-Gm-Message-State: AOAM53050nPjRZhQgSwhPflFKGPixBEhpGPU8CjCs2YOw1oDdGx7kwBv
 kKpP3q7G4kCU+ddjLeJl+gsPPg==
X-Google-Smtp-Source: ABdhPJzF0U1BlJLB1Ob6rrF/D+yVT7v3oYVDTlMkXGssgZnMMK/egIU24AxbLlamEagZEPbrjVWtFw==
X-Received: by 2002:a17:906:1411:b0:6da:f354:fb83 with SMTP id
 p17-20020a170906141100b006daf354fb83mr22596533ejc.539.1648395290321; 
 Sun, 27 Mar 2022 08:34:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm4649988ejz.57.2022.03.27.08.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:34:49 -0700 (PDT)
Message-ID: <5bf8ccc2-820e-763d-03a5-7633f91658bb@mind.be>
Date: Sun, 27 Mar 2022 17:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220317185615.179351-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220317185615.179351-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libminiupnpc: drop dependencies
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/03/2022 19:56, Fabrice Fontaine wrote:
> libminiupnpc can be statically built with or without binfmt flat since
> version 1.7 and
> https://github.com/miniupnp/miniupnp/commit/c183a72c46cae9e37ddf635318dfb0bdcd56ed9d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>   - Rebase patch on current master
> 
>   package/libminiupnpc/Config.in       | 6 ------
>   package/libminiupnpc/libminiupnpc.mk | 8 ++++++++
>   2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libminiupnpc/Config.in b/package/libminiupnpc/Config.in
> index a3410a0225..51f4b43bbb 100644
> --- a/package/libminiupnpc/Config.in
> +++ b/package/libminiupnpc/Config.in
> @@ -1,7 +1,5 @@
>   config BR2_PACKAGE_LIBMINIUPNPC
>   	bool "libminiupnpc"
> -	depends on !BR2_BINFMT_FLAT
> -	depends on !BR2_STATIC_LIBS
>   	help
>   	  The UPnP protocol is supported by most home adsl/cable routers
>   	  and Microsoft Windows 2K/XP. The aim of the MiniUPnP project
> @@ -14,7 +12,3 @@ config BR2_PACKAGE_LIBMINIUPNPC
>   	  ANSI C.
>   
>   	  http://miniupnp.free.fr
> -
> -comment "libminiupnpc needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> -	depends on !BR2_BINFMT_FLAT
> diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
> index 0633ccd234..52fe9849f2 100644
> --- a/package/libminiupnpc/libminiupnpc.mk
> +++ b/package/libminiupnpc/libminiupnpc.mk
> @@ -18,4 +18,12 @@ LIBMINIUPNPC_CPE_ID_VERSION = $(LIBMINIUPNPC_VERSION_MAJOR)
>   LIBMINIUPNPC_CPE_ID_UPDATE = $(LIBMINIUPNPC_VERSION_MINOR)
>   LIBMINIUPNPC_CONF_OPTS = -DUPNPC_BUILD_SAMPLE=OFF -DUPNPC_BUILD_TESTS=OFF
>   
> +ifeq ($(BR2_STATIC_LIBS),y)
> +LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=OFF -DUPNPC_BUILD_STATIC=ON
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=ON -DUPNPC_BUILD_STATIC=OFF
> +else
> +LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=ON -DUPNPC_BUILD_STATIC=ON
> +endif
> +
>   $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
