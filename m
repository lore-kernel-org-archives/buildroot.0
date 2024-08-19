Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C130FC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85CC880D64;
	Mon, 19 Aug 2024 20:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KaMOE5K9X_5h; Mon, 19 Aug 2024 20:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DF2680D6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DF2680D6A;
	Mon, 19 Aug 2024 20:07:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E0011BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BB124039F
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85DMH_1BtE8P for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:07:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B882D4038E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B882D4038E
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B882D4038E
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:07:42 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ef25511ba9so45261321fa.0
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 13:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724098060; x=1724702860;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2o8HbBr4L97Rf7g+toGeetg8vR9cw5qn9xVs7HqE0T8=;
 b=RZr9Q1EJkKRatI2UyCzfMDeaC3OOO4GZvPM3kdXt+SBcIRb+c/0ZVQZbT29H68+TS0
 yO9qISgpH/9ZNSmDdguh7l2T0OpS7vM1PNhlKvn/0IyPY3DH07eyAdlkRIKJkz3U6BMd
 2I4B/aIg3mzSpAo5ULuHum8GMwFrmpVPT3EwwXnuAsrueWVDkn8UCcTOeNZrmVHk4lE1
 5KwybN3wa9R/8QScb8IH/4nnMV4EebL60A2wf1R9SVMYsNCbqa0VTM59of9R/JcUl/B2
 Ro/QzmM+ThraVNcCvyN4Cp7p2WpFIT++io89ySEfT9y27WFD4GlgEvUwWEhqhescnd2u
 3U0g==
X-Gm-Message-State: AOJu0YwDVJQPm8esMF+OtvlNQChM2rmRJJu7Vw1h6UdJFiwri1qcioWZ
 HWIIFtKVrrE0kHYBFIAfOfknoGCL/MiO20dF9vf3ZrWMwROZ+BraNGul3Q==
X-Google-Smtp-Source: AGHT+IFYY1stZVCNY586GSwmL6rPGmgn/1/1xvf/j3KXRjKr8JUMFPgM/fatCEbc+YtQjWMDzS/Fag==
X-Received: by 2002:a05:6512:b0e:b0:52f:228:cf91 with SMTP id
 2adb3069b0e04-5333f1b9bacmr314311e87.1.1724098059988; 
 Mon, 19 Aug 2024 13:07:39 -0700 (PDT)
Received: from curiosity ([5.188.167.245]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d3ff733sm1595541e87.143.2024.08.19.13.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 13:07:39 -0700 (PDT)
Date: Mon, 19 Aug 2024 23:07:38 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsOmCiZLr7t6bPYz@curiosity>
References: <20240818203134.1512793-1-geomatsi@gmail.com>
 <20240818203134.1512793-2-geomatsi@gmail.com>
 <20240819125936.33b32adf@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240819125936.33b32adf@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724098060; x=1724702860; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2o8HbBr4L97Rf7g+toGeetg8vR9cw5qn9xVs7HqE0T8=;
 b=WaE8iRbnZlOX+FC7ZgwEbWNvxsdegrhqiV+Jv1W/wFy4Iapd6zZ9a9AcXKn6o6BkHJ
 NqUJg08HQWG/HWc4sROE1yjp11qaiqRTrrxvbrk+kmgJ7nCUVE8aHuC9vVUXZIl7Yg3k
 5j/SWgywPGgh9NgQjKjZIs+q6bRmLW5J81LBFqPiy/JA6U9krvdw0dwOfVhqYfubItKu
 oxGq4/dBGXfRq2SRp9hrIT4w26kk77PmuKZdlGba7bNfxfmULXAGKRSa4V5CxCHuG3XD
 BoskQjJYWrT2oDov76YlL5Tm83EWj7H3ARKwpcgE+brUaYC1Hsc/SsqUhZ/t+hie4oeX
 MoRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WaE8iRbn
Subject: Re: [Buildroot] [PATCH 1/2] package/wpa_supplicant: wired driver
 needs headers >= 5.7
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Mon, Aug 19, 2024 at 12:59:36PM +0200, Thomas Petazzoni wrote:
> Hello Sergey,
> 
> On Sun, 18 Aug 2024 23:31:29 +0300
> Sergey Matyukevich <geomatsi@gmail.com> wrote:
> 
> > diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> > index 92953f69f0..e013f5a9c1 100644
> > --- a/package/wpa_supplicant/Config.in
> > +++ b/package/wpa_supplicant/Config.in
> > @@ -42,7 +42,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WEXT
> >  config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
> >  	bool "Enable wired support"
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
> > -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
> > +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
> 
> Thanks, but it seems a bit drastic.
> 
> If I looked at the code:
> 
> ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIRED),y)
> WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libnl
> WPA_SUPPLICANT_CONFIG_ENABLE += \
>         CONFIG_LIBNL32 \
>         CONFIG_DRIVER_WIRED \
>         CONFIG_MACSEC \
>         CONFIG_DRIVER_MACSEC_LINUX
> 
> so it forces CONFIG_DRIVER_MACSEC_LINUX, what about making that
> dependent on kernel headers >= 5.7, rather than preventing the whole
> wired driver from being compiled?
> 
> Or, in fact even better, in ./src/drivers/driver_macsec_linux.c, change:
> 
> #if LIBNL_VER_NUM >= LIBNL_VER(3, 6)
> #define LIBNL_HAS_OFFLOAD
> #endif
> 
> to:
> 
> #if LIBNL_VER_NUM >= LIBNL_VER(3, 6) && LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0)
> #define LIBNL_HAS_OFFLOAD
> #endif
> 
> And that should only enable the offload support... when it can really
> be supported. Could you check this?

I like the second option with explicit kernel and libnl version check.
I build-tested several configurations and it works just fine:

: diff --git a/src/drivers/driver_macsec_linux.c b/src/drivers/driver_macsec_linux.c
: index c86715498..9ad24183e 100644
: --- a/src/drivers/driver_macsec_linux.c
: +++ b/src/drivers/driver_macsec_linux.c
: @@ -19,6 +19,7 @@
:  #include <netlink/route/link.h>
:  #include <netlink/route/link/macsec.h>
:  #include <linux/if_macsec.h>
: +#include <linux/version.h>
:  #include <inttypes.h>
:  
:  #include "utils/common.h"
: @@ -32,7 +33,7 @@
:  
:  #define UNUSED_SCI 0xffffffffffffffff
:  
: -#if LIBNL_VER_NUM >= LIBNL_VER(3, 6)
: +#if (LIBNL_VER_NUM >= LIBNL_VER(3, 6) && LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0))
:  #define LIBNL_HAS_OFFLOAD
:  #endif

I will send a fix to hostapd mailing list. If it is not acceptable for
whatever reason, we can fallback to the separate Buildroot option for
MACSEC.

BTW, the idea and draft is yours, so let me know if I should keep
your authorship of the hostapd patch.

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
