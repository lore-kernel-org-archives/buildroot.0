Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DB9C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 10:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAAE980A53;
	Mon, 19 Aug 2024 10:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpIaqfiPjcZR; Mon, 19 Aug 2024 10:59:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B272B80A60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B272B80A60;
	Mon, 19 Aug 2024 10:59:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D1E01BF228
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BFA96066E
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C09C4ChrnT-b for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 10:59:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 094B5605EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 094B5605EB
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 094B5605EB
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 10:59:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11FC01C0005;
 Mon, 19 Aug 2024 10:59:36 +0000 (UTC)
Date: Mon, 19 Aug 2024 12:59:36 +0200
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20240819125936.33b32adf@windsurf>
In-Reply-To: <20240818203134.1512793-2-geomatsi@gmail.com>
References: <20240818203134.1512793-1-geomatsi@gmail.com>
 <20240818203134.1512793-2-geomatsi@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724065177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPIc+60r6Qw/nG/mSbhTk0nSxuSWByliAKXhsyrMRBw=;
 b=CA6hpSbAmpmg3sdlVPZtt/rBR3c/P2PV1L1diKosnXA94W0NC5AtlOE2dMmsx4Q0f4teo2
 1HDeA8SUf8Bm0LAlRtw8kzC+eRvsScc0IBFPnJy3deMR6tTd9S9scFHW7IHuJXK1jXiojA
 qzZpEPuQA+4HsMdsUylXWA+R8VG+mmpGgajRD3GD/5ADnOPw+VESOnOZ8EdXq7yIU9owsD
 kh4g0nge5zx/6T4Qa1qwKT6MglKnzGk48dQL7azgx+90fPaa0HsHRgv/ET1hTTX5tBZou1
 2ZdAvFOB7fLlbMRmW8AGD4vuLeVVPHnkBHUfb4BwKGo+IoZqDARBi5c6QGc0fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CA6hpSbA
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sergey,

On Sun, 18 Aug 2024 23:31:29 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> index 92953f69f0..e013f5a9c1 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -42,7 +42,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WEXT
>  config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
>  	bool "Enable wired support"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7

Thanks, but it seems a bit drastic.

If I looked at the code:

ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIRED),y)
WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libnl
WPA_SUPPLICANT_CONFIG_ENABLE += \
        CONFIG_LIBNL32 \
        CONFIG_DRIVER_WIRED \
        CONFIG_MACSEC \
        CONFIG_DRIVER_MACSEC_LINUX

so it forces CONFIG_DRIVER_MACSEC_LINUX, what about making that
dependent on kernel headers >= 5.7, rather than preventing the whole
wired driver from being compiled?

Or, in fact even better, in ./src/drivers/driver_macsec_linux.c, change:

#if LIBNL_VER_NUM >= LIBNL_VER(3, 6)
#define LIBNL_HAS_OFFLOAD
#endif

to:

#if LIBNL_VER_NUM >= LIBNL_VER(3, 6) && LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0)
#define LIBNL_HAS_OFFLOAD
#endif

And that should only enable the offload support... when it can really
be supported. Could you check this?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
