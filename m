Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABC7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 007BF60EAE;
	Fri, 17 Dec 2021 21:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2HJhAmJNUE8P; Fri, 17 Dec 2021 21:00:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48D5F61106;
	Fri, 17 Dec 2021 21:00:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2167D1BF2F0
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E0F7421E7
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CQiikOhJehN for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:00:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82A36421E6
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:00:45 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z7so12463805edc.11
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 13:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lVED36MyS6Re5Q0wOqCwQxvPoAEYdoCTNNwhad/fvtA=;
 b=LPOpaIhSfu8QPeAGZmo8wDLafdUd4gi3+EdvB121UjtD6sINk0VE2h7KS8LGezyhq5
 YgDoK99aPbXggRcF8ZjxCKdBO+1YOR5u1qiplUOfWc/+sPEpLNbTNtG455FZ4PlPQA74
 jfxAFnp1P/gktXN6Qx7GLQPn1cCjQkvbJCoyNR2ZDM9oGBX4isMGmRDCqn/TVIbtViEm
 y4U10ZxmaskKmZwSAfWXoOsODKaP01qKF2wmnN+JtDabn6qaJ3juEpba5whvRE5JKS6R
 IB5v51gNVO0OkR/Ry7jXM3bq61j7hnZSTYARbU+XYULRx6HXch4fHR3zXFo3dLXy/K9g
 jptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lVED36MyS6Re5Q0wOqCwQxvPoAEYdoCTNNwhad/fvtA=;
 b=Ar26p70ZovgKkubuEtCqr5gugh7Tj9FxfOohHpVQP9SbJLCtIX6msAWDbKOoU2roX+
 gpDZEagPO+c8WEvM2j49+TL0dABnSCAXTgNz9tLmPv+jZ7mhX3culd9UyoqdjFYHSU6/
 KFertvDzttvAp5FaqZIoUN2GUut/bKTxXpCsmmQINvCks/QG3qwAlyueh2ZEjJW9QzB6
 nieyer1J0RkuoYJrRMkftM1V/pJQcq/VLRA4AGPcGbuhZOp9ZvpgBLXmkqf7mbNkKkDi
 FF+qzGMP2bSRuBMPaDVYTYlpRr1DiyGHMujTjHQI8QvbMRoltWlbCH4Fcg39n1oJcLev
 n/Eg==
X-Gm-Message-State: AOAM533ya5sKhxFXlTRbBJABNeaoalRUAd/sd2fKzC7AUv/MlJgcMFkF
 /uZUMDjgdyadsikZQZCNSEBmWQ==
X-Google-Smtp-Source: ABdhPJxSiXBcJco8P79molXxihXrC7E7aLdvxssxoN3/Via072/OnCikexv6aJUtyn/OMxe+tU2T9A==
X-Received: by 2002:a17:907:97cd:: with SMTP id
 js13mr3907899ejc.357.1639774843801; 
 Fri, 17 Dec 2021 13:00:43 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f5sm2699899edu.38.2021.12.17.13.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 13:00:43 -0800 (PST)
Message-ID: <a9d377d8-61f7-edc1-06f6-03291c100dca@mind.be>
Date: Fri, 17 Dec 2021 22:00:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20210612223011.26118-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210612223011.26118-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1 1/2] package/mesa3d: add config option
 for DRI3 support
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Marek Kraus <gamelaster@outlook.com>,
 Romain Naour <romain.naour@gmail.com>, Michael Taubert <info@arachnodroid.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/06/2021 00:30, Peter Seiderer wrote:
> Add config option for DRI3 support and use it instead
> of DRI3 enable/disable logic in *.mk file.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  As discussed in another thread, I applied a heavily modified version of both 
patches to master, thanks. Please try again if master works for you.

  Regards,
  Arnout

> ---
>   package/mesa3d/Config.in |  8 ++++++++
>   package/mesa3d/mesa3d.mk | 12 +++++++-----
>   2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index d1b3af2054..36acd9758c 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -16,6 +16,11 @@ menuconfig BR2_PACKAGE_MESA3D
>   
>   if BR2_PACKAGE_MESA3D
>   
> +config BR2_PACKAGE_MESA3D_DRI3
> +	bool "Enable DRI3 support"
> +	help
> +	  Enable DRI3 support.
> +
>   # Some Gallium driver needs libelf when built with LLVM support
>   config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
>   	bool
> @@ -65,6 +70,8 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER
>   		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
>   		!BR2_PACKAGE_MESA3D_OPENGL_EGL && \
>   		!BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
> +	select BR2_PACKAGE_MESA3D_DRI3 if \
> +		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
>   	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
>   		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
>   
> @@ -359,6 +366,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
>   	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
>   	depends on BR2_PACKAGE_XORG7 # xorgproto
> +	select BR2_PACKAGE_MESA3D_DRI3
>   	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>   	select BR2_PACKAGE_XORGPROTO
>   	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 5c5f8a33f3..da6e55bf93 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -35,6 +35,12 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
>   MESA3D_CONF_OPTS += -Db_asneeded=false
>   endif
>   
> +ifeq ($(BR2_PACKAGE_MESA3D_DRI3),y)
> +MESA3D_CONF_OPTS += -Ddri3=enabled
> +else
> +MESA3D_CONF_OPTS += -Ddri3=disabled
> +endif
> +
>   ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
>   MESA3D_DEPENDENCIES += host-llvm llvm
>   MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
> @@ -122,13 +128,10 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
>   MESA3D_CONF_OPTS += \
> -	-Ddri-drivers= -Ddri3=disabled
> +	-Ddri-drivers=
>   else
>   ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
>   MESA3D_DEPENDENCIES += xlib_libxshmfence
> -MESA3D_CONF_OPTS += -Ddri3=enabled
> -else
> -MESA3D_CONF_OPTS += -Ddri3=disabled
>   endif
>   MESA3D_CONF_OPTS += \
>   	-Dshared-glapi=enabled \
> @@ -142,7 +145,6 @@ MESA3D_CONF_OPTS += \
>   else
>   MESA3D_DEPENDENCIES += xlib_libxshmfence
>   MESA3D_CONF_OPTS += \
> -	-Ddri3=enabled \
>   	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
>   endif
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
