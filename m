Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD41C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 20:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8DDA40992;
	Mon,  6 Jun 2022 20:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1eoUDy1nqYM; Mon,  6 Jun 2022 20:27:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED67F4014C;
	Mon,  6 Jun 2022 20:27:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 655ED1BF297
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 549EB83EC5
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sbh2wn49iMjO for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 20:27:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B8DB83EC3
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 20:27:53 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id fu3so29662615ejc.7
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 13:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hKEakBh3MHT86kNmi8e0VoRUkmR9ymgiTNi7Vu+YSsQ=;
 b=N6mv+cDBrLm9xkEW8VQEf/zBa8mtE0tHyDYFkzbxpnqkMXcqkHWpAZIqUb6I+iwJ6V
 vtR0hmxghtKtJ0p7sJ+ph8s+TabPwyLr/Ca6SBdLsrlXnEyCbmRUKiqLAMyN3pFl2nvr
 wukLC/7wuFhFXaeatTWiaW5Bw0QPECzihnx+UVoxBX7Dfo6/gXj26fYziRxHT0fcvJEm
 eOjegnpYxlM1/uV1FBMWrOVSP+IMUgxQhozOg+cW67fme733w2YoFg5O80TLYTzAHalW
 1TzbTL/qZul6xdrv6hQvFmSeeCt5SuzGafrV5bmBqJ0nhAwdE3aFDYdIUvV1SqkxSIXd
 Lz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hKEakBh3MHT86kNmi8e0VoRUkmR9ymgiTNi7Vu+YSsQ=;
 b=WXQK5hDWxzC5zGVc/cwtb0t/CVvc3La4Akp8qOymlXkAVN1mt4hvEZiElK9j07b5Mu
 9rIHsCqvKI6ldh4ce1zByR5sptQ6aTNpwfvBI8NRU/yYXZFxUhVMxigNzZaQnK4FfWjV
 Feaxeyo6tWVbDmRTBsEAThqxxMvfVBzfD7asNI6Oi07k99O/Vjr/F5RjvWuCB9C3Vjgd
 xaW6wcip9wN4WVpRKwtX3t2L3ySwMv1Gc9a+08Y8IK3qDI3wuONs+FymhC+YzAqvYCDB
 +tfG1sGKoIbxp3Mvg7f4sBFnM+oqlXc7OIup56inIxtagnhMsGkuYLu+hX2m9H2gWC8b
 a0Ew==
X-Gm-Message-State: AOAM533zEv0pWrqWaXIJMdmcIzCoxBMFWKOfdINIZ8bFFLUrUJRmFALu
 aiQ/N0BK9vCToMNiN9krOQ6HWA==
X-Google-Smtp-Source: ABdhPJzWHYMPvPEI8HAeIMVCOQNDlhlUdlR8QBxf8GY1Fhb2EC0uqkPDdd+lic2kkBwHYTt/VUXmUA==
X-Received: by 2002:a17:907:7256:b0:711:dd35:61eb with SMTP id
 ds22-20020a170907725600b00711dd3561ebmr1102965ejc.445.1654547271591; 
 Mon, 06 Jun 2022 13:27:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a50ef1a000000b0042bae6fbee2sm9050105eds.74.2022.06.06.13.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 13:27:51 -0700 (PDT)
Message-ID: <120dc99d-a41f-313d-f754-4732bf50e288@mind.be>
Date: Mon, 6 Jun 2022 22:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
 <20220514175612.2510884-8-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220514175612.2510884-8-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 08/19]
 package/x11r7/xdriver_xf86-video-intel: switch dependency from mesa3d to
 libgl
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/05/2022 19:56, Bernd Kuhls wrote:
> DRI support for this driver is provided by the xserver_xorg-server
> package when BR2_PACKAGE_HAS_LIBGL is enabled:
> https://git.busybox.net/buildroot/tree/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#n91
> 
> Change the dependency to follow the logic of xserver_xorg-server.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   .../xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk   | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> index d911234c92..7ed2882a5d 100644
> --- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> +++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> @@ -32,11 +32,16 @@ XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = \
>   	xserver_xorg-server
>   
>   # X.org server support for DRI depends on a Mesa3D DRI driver

  This comment should be updated as well.

  Regards,
  Arnout

> -ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
> +ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
>   XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += \
>   	--enable-dri2 \
>   	--enable-dri3 \
>   	--enable-uxa
> +else
> +XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += \
> +	--disable-dri2 \
> +	--disable-dri3 \
> +	--disable-uxa
>   endif
>   
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
