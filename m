Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787E5C54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E46B6087C;
	Fri, 15 Mar 2024 19:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RC88uRRDBgUX; Fri, 15 Mar 2024 19:31:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B3FD60E95
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B3FD60E95;
	Fri, 15 Mar 2024 19:31:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAD0D1BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A374F416E7
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:31:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bg1Bg10O_Nbj for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:31:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41624416E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41624416E5
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41624416E5
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:30:59 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-413fea12b50so12952795e9.0
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 12:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710531058; x=1711135858;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EokB2vLkrqIRd26x2tgPRkyZ2DgVe+d/isl194YGPu0=;
 b=Pe7JVO41VpGuiJro/ObNmDzVnSKR8c7rQcm+hvtBQgAfu8WfrfcmI/rL9cz9GUvdxN
 wZvfILV5fI1e5cArDQ/dHpuVY9eyhrJNumOPhjIyBElUTu+xaORXinlgcChLMi4R2i8c
 hbv0xarzIq9p/zU/6GArhsMhzFkLnLZ3XXCZ9NY+HbvEIwsFh3cJytqaxOMzZPlBTYc8
 f/AkcCb7Nudqc3EepEQa6GSqjygSd9a5zdlFAB1y5BF7RVwLyFEvFrv8RODhvGCejNEa
 jTJU4/57n3rZy1nSFTNF/e1VuPKSPeafKVtG3FmEi7gu+24gpQPnFYaBND+caH0tu0mb
 1HjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW23t98+2sV+hUlqH3CVjW+GXM+s38JVLC1fFgvz+TiniiUZRoRBGXhvl+BYgd0P1yTZcHhC53U5V9tNd9SDjlsdr3buX0ORA==
X-Gm-Message-State: AOJu0YyMQ7qeyCiwVksBeUsd9q3XiA20zttwPD4RuvW2pizdAfZxGYgw
 8DbZWYYk+v+cPC84wHTlsjd2bF3jsdOuILCm4fQ9DBJkqbPfWL0mR+GnK4xO9+k=
X-Google-Smtp-Source: AGHT+IFAtbG1nEYgHNK00NzFApj7Wi3nIoCXYVmfSZC/Wnc434DMa43ySp+aEQvkY51v72GnswnfRQ==
X-Received: by 2002:a05:600c:2545:b0:414:14:3b75 with SMTP id
 e5-20020a05600c254500b0041400143b75mr90006wma.15.1710531057872; 
 Fri, 15 Mar 2024 12:30:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a05600c45c900b00412e3717ae6sm10067769wmo.36.2024.03.15.12.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 12:30:57 -0700 (PDT)
Message-ID: <af2a398a-8147-4a86-8df0-b74b58114325@mind.be>
Date: Fri, 15 Mar 2024 20:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240314211557.20391-1-bernd@kuhls.net>
In-Reply-To: <20240314211557.20391-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710531058; x=1711135858; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EokB2vLkrqIRd26x2tgPRkyZ2DgVe+d/isl194YGPu0=;
 b=UHPF848CWtUG7nVl5AECBzfjkA5fQ6ZZ1qAUMcF4G2yyPtcGERwTJDD8Yo0SyMGP+h
 kTxQwy7JD2aCHgm7TQzqDSpncoNt97mdoCOQxrHFWLV6KXt20xYNzmcsIGehRu/Ia4Vq
 QeP1NSd5a7Q4emSZIoVUbkgTmOatPZArwWNvi8oQUE/UHXDpxhdqNMTL4Q5X9jMgb65P
 qFIbVn1pznTq0EwJCC62maNObOpdLVk0BvppNeEL1JiwvLSN4786X4Vr+gKQWZVNB0Go
 CU8B1ZrRxrr8nqTk0lyOB8jExNuVmVLLHZuUTMLEvnA1WQ+FF5f7KZG3m9vlKucmkfaA
 1Sog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UHPF848C
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mesa3d: rework dri3 handling
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/03/2024 22:15, Bernd Kuhls wrote:
> From: Bernd Kuhls <bernd.kuhls@t-online.de>

  Could you make sure that your From is set the same as your SoB?

> 
> While fixing a build error
> 
> ../src/egl/drivers/dri2/platform_x11.c: In function 'dri2_x11_get_msc_rate':
> ../src/egl/drivers/dri2/platform_x11.c:1229:44:
>   error: 'struct dri2_egl_display' has no member named 'screen_resources'
> 
> with this defconfig:
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
> BR2_PACKAGE_MESA3D_OPENGL_GLX=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_XORG7=y
> 
> (crocus and i915 drivers are also affected) it turns out that we can
> assume the need for dri3 support when X.org is enabled as a hard depen-
> dency even if mesa3d's configure does not throw errors when missing,
> like for the Intel drivers.
> 
> Before this patch these Config.in options were used:
> 
> config BR2_PACKAGE_MESA3D_DRI3
>    select BR2_PACKAGE_XLIB_LIBXSHMFENCE
> select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7

  THere was another select like that in 
BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM. I removed that one as well, and 
applied to master, thanks.

  Regards,
  Arnout

> 
> which can be translated into:
> 
> select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7
> 
> and used at option BR2_PACKAGE_MESA3D_DRIVER.
> 
> Configure option -Ddri3=enabled is passed to mesa3d when at least one
> driver is enabled along with X.org:
> ifeq ($(BR2_PACKAGE_MESA3D_DRIVER)$(BR2_PACKAGE_XORG7),yy)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: rebased
> 
>   package/mesa3d/Config.in | 14 ++------------
>   package/mesa3d/mesa3d.mk |  4 +---
>   2 files changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 39a4f706e2..ca7b9c8178 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -56,11 +56,7 @@ config BR2_PACKAGE_MESA3D_OPENCL
>   	select BR2_PACKAGE_LIBCLC
>   	select BR2_PACKAGE_HAS_LIBOPENCL
>   
> -# inform the .mk file of gallium, dri, dri3 or vulkan driver selection
> -config BR2_PACKAGE_MESA3D_DRI3
> -	bool
> -	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
> -
> +# inform the .mk file of gallium or vulkan driver selection
>   config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>   	bool
>   	select BR2_PACKAGE_MESA3D_DRIVER
> @@ -71,6 +67,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>   
>   config BR2_PACKAGE_MESA3D_DRIVER
>   	bool
> +	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7
>   
>   # Gallium xa state tracker.
>   # Quote from mesa3d meson.build: "XA state tracker requires at least
> @@ -103,7 +100,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
>   config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
>   	bool "Gallium Etnaviv driver"
>   	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
> -	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
>   	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>   	select BR2_PACKAGE_LIBDRM_ETNAVIV
>   	help
> @@ -117,7 +113,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
>   	# can't see is just spurious. However, that dependency is about
>   	# the toolchain having sync4 primitives, which is always a given
>   	# for arm/aarch64.
> -	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
>   	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>   	select BR2_PACKAGE_LIBDRM_FREEDRENO
>   	help
> @@ -141,7 +136,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
>   config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
>   	bool "Gallium lima driver"
>   	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
> -	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
>   	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>   	help
>   	  Mesa driver for ARM Mali Utgard GPUs.
> @@ -158,7 +152,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
>   config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
>   	bool "Gallium panfrost driver"
>   	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
> -	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
>   	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>   	help
>   	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
> @@ -239,7 +232,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
>   	bool "Gallium v3d driver"
>   	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
> -	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
>   	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>   	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4 # runtime
>   	select BR2_PACKAGE_MESA3D_OPENGL_EGL
> @@ -255,7 +247,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
>   	bool "Gallium vc4 driver"
>   	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
> -	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
>   	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>   	select BR2_PACKAGE_LIBDRM_VC4
>   	select BR2_PACKAGE_MESA3D_OPENGL_EGL
> @@ -306,7 +297,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
>   	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
> -	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
>   	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>   	help
>   	  Vulkan driver for Intel hardware from Ivy Bridge onward.
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index df0079bf80..71929014c8 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -29,11 +29,9 @@ MESA3D_CONF_OPTS = \
>   	-Dgallium-omx=disabled \
>   	-Dpower8=disabled
>   
> -ifeq ($(BR2_PACKAGE_MESA3D_DRI3),y)
> +ifeq ($(BR2_PACKAGE_MESA3D_DRIVER)$(BR2_PACKAGE_XORG7),yy)
>   MESA3D_CONF_OPTS += -Ddri3=enabled
> -ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
>   MESA3D_DEPENDENCIES += xlib_libxshmfence
> -endif
>   else
>   MESA3D_CONF_OPTS += -Ddri3=disabled
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
