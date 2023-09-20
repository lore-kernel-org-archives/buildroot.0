Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD853C2FC08
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 21:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D1EA612FE;
	Wed, 20 Sep 2023 21:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D1EA612FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANLfN78N7-rz; Wed, 20 Sep 2023 21:50:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 950A561355;
	Wed, 20 Sep 2023 21:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 950A561355
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E96501BF3F3
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 21:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C65F40291
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 21:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C65F40291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EM2kCqYcplzR for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 21:50:06 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 546B940207
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 21:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 546B940207
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3172A1C0005;
 Wed, 20 Sep 2023 21:50:01 +0000 (UTC)
Date: Wed, 20 Sep 2023 23:50:01 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230920235001.4ca15d1b@windsurf>
In-Reply-To: <20230919193754.121091-1-fontaine.fabrice@gmail.com>
References: <20230919193754.121091-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695246603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tv8wz+gqQW9U204vwDns5ctxxaZtezpGrqbIJH11+vI=;
 b=b5IftD6n+tr9Mpy/vFJgjCce94CtNFOJmOkVlylarJ4zOZO8zskBE+/FhQywMZQSoeEMMJ
 T+ltddhQ+tTYuGojWMkRswyzCOZYWR2thrbYmQgmdeugo3Dg8yrR6Y/eGCWRqorpqKiXP7
 ejeP9sx5N6Etv7vx4gcLyzEoTXsBDRFrHzdLR9IJz8vRFQrlXbZFRtBBJqYUWxLqmP0VrU
 bgZf4rtR0tRTwrWH4R+wtj0OVSUoyEimmGJHddj6cOP1/oxIYpnBs5Ybfimd8gtmzcee6D
 E3xjSl+WqI5utng82I6GX6WfKFnZetFKTMTYv2UIWbS6j5xjyaNAZjQN8iEn5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b5IftD6n
Subject: Re: [Buildroot] [PATCH 1/1] package/vulkan-loader: fix x11 handling
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
Cc: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 19 Sep 2023 21:37:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/vulkan-loader/Config.in b/package/vulkan-loader/Config.in
> index 9c215dc9ce..1ea6c94505 100644
> --- a/package/vulkan-loader/Config.in
> +++ b/package/vulkan-loader/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_VULKAN_LOADER
>  	depends on !BR2_STATIC_LIBS # dlfcn.h
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_VULKAN_HEADERS
> +	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7

This will imply that when XORG7 is enabled, all of libX11, libxcb and
libXrandr are automatically enabled (because xrandr -> libx11 ->
libxcb).

>  	help
>  	  The Khronos official Vulkan ICD desktop loader.
>  
> diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
> index f6dd9d0ac3..b1545a4972 100644
> --- a/package/vulkan-loader/vulkan-loader.mk
> +++ b/package/vulkan-loader/vulkan-loader.mk
> @@ -26,13 +26,16 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBXCB),y)
>  VULKAN_LOADER_DEPENDENCIES += libxcb
> -VULKAN_LOADER_CONF_OPTS += \
> -	-DBUILD_WSI_XCB_SUPPORT=ON \
> -	-DBUILD_WSI_XLIB_SUPPORT=ON
> +VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON
>  else
> -VULKAN_LOADER_CONF_OPTS += \
> -	-DBUILD_WSI_XCB_SUPPORT=OFF \
> -	-DBUILD_WSI_XLIB_SUPPORT=OFF
> +VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXRANDR),yy)
> +VULKAN_LOADER_DEPENDENCIES += xlib_libX11 xlib_libXrandr
> +VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XLIB_SUPPORT=ON
> +else
> +VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XLIB_SUPPORT=OFF
>  endif

So here it wouldn't make sense to separate Xlib case from the Xcb case,
because both of them would always be enabled due to your select. In
addition, you're already testing in the condition here that
BR2_PACKAGE_XLIB_LIBXRANDR=y making the select somewhat useless.

Could you have a closer look into this?

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
