Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37CDC3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 162CC612F2;
	Fri,  2 Aug 2024 21:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmcIU8k-0y8s; Fri,  2 Aug 2024 21:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB0E760779
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB0E760779;
	Fri,  2 Aug 2024 21:06:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 886AA1BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76AD960744
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zr0gddBJN4Df for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:06:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0294560779
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0294560779
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0294560779
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:06:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7853D60002;
 Fri,  2 Aug 2024 21:06:45 +0000 (UTC)
Date: Fri, 2 Aug 2024 23:06:44 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240802230644.69b29bac@windsurf>
In-Reply-To: <20240627193335.4069574-3-aperez@igalia.com>
References: <20240208095531.99049-1-aperez@igalia.com>
 <20240627193335.4069574-3-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722632805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/r75ohNCqNB7RtSvOMddkqy+B9R87oBbenDMrgyJSU=;
 b=ajWGO75+PS54VsZSZu+/GjPcNs6HWnotIVmfVkedWVI2B1N0142BH4ugnHgHO06rS0oZks
 SlwexfGrqr0/b18xBndLk16rVzJuG2aE+8S+NJO+pHop636ZH4Pbc8zM19cgUsF+szHDg7
 T8pTNENkOgQD5fJM1smjhhnw8djNPB5a8qDRT7irGvNuKuLLDmoPC/Kh9xXdHkcFaLSNre
 6vP12ZjWYLqa42KRyaDqEbYvjI4jwygn/uVlPr45A8njUPlCF9xQDslJMt56pEagNz5xHy
 qNUsZxM7gtgJmQhO4wlB+8iQ9/dzUs5lJVWcb8LvaKso699S1jnGAN56S+BABg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ajWGO75+
Subject: Re: [Buildroot] [PATCH v2 2/4] package/cog: depend on
 wpebackend-fdo only if needed
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 27 Jun 2024 22:33:30 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Make the Cog headless platform plug-in selectable, allowing to configure
> the build without any plug-in at all. When all plug-ins are disabled,
> Cog does not require wpebackend-fdo at build time, and it is still
> able to use its built-in "fallback" support to load other WPE backends
> like wpebackend-rdk.

This seems to makes sense to me, but I completely fail to understand
the complicated implementation you are proposing below.

There is in fact something already super wrong in package/cog: it has
wpebackend-fdo in COG_DEPENDENCIES, but it doesn't select it. It works
because it depends on wpewebkit, which itself selects wpebackend-fdo,
but that's really wrong. This should be fixed in a first patch.

> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/cog/Config.in | 28 ++++++++++++++++++++++++++--
>  package/cog/cog.mk    | 13 ++++++++++---
>  2 files changed, 36 insertions(+), 5 deletions(-)
> 
> ---
> v1 -> v2:
> - Unchanged.
> 
> diff --git a/package/cog/Config.in b/package/cog/Config.in
> index d2a910f9b89..d706b045b15 100644
> --- a/package/cog/Config.in
> +++ b/package/cog/Config.in
> @@ -19,6 +19,10 @@ config BR2_PACKAGE_COG
>  
>  if BR2_PACKAGE_COG
>  
> +config BR2_PACKAGE_COG_NEEDS_WPEBACKEND_FDO
> +	bool
> +	default n

I believe this is not needed.

>  config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
>  	string "home uri"
>  	default "https://wpewebkit.org"
> @@ -30,6 +34,8 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
>  config BR2_PACKAGE_COG_PLATFORM_FDO
>  	bool "Wayland backend"
>  	default y
> +	depends on BR2_PACKAGE_WPEBACKEND_FDO
> +	select BR2_PACKAGE_COG_NEEDS_WPEBACKEND_FDO

If the Wayland backend needs wpebackend-fdo, just select it:

	select BR2_PACKAGE_WPEBACKEND_FDO

>  	select BR2_PACKAGE_LIBXKBCOMMON
>  	select BR2_PACKAGE_WAYLAND_PROTOCOLS
>  	help
> @@ -43,6 +49,8 @@ config BR2_PACKAGE_COG_PLATFORM_DRM
>  	depends on BR2_PACKAGE_HAS_LIBGBM
>  	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
>  	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
> +	depends on BR2_PACKAGE_WPEBACKEND_FDO
> +	select BR2_PACKAGE_COG_NEEDS_WPEBACKEND_FDO

If the DRM backend needs wpebackend-fdo, just select it:

	select BR2_PACKAGE_WPEBACKEND_FDO

>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_LIBINPUT
>  	help
> @@ -50,16 +58,32 @@ config BR2_PACKAGE_COG_PLATFORM_DRM
>  	  with video drivers that support kernel mode-setting (KMS)
>  	  via the DRM user-space API.
>  
> +config BR2_PACKAGE_COG_PLATFORM_HEADLESS
> +	bool "Headless backend"
> +	depends on BR2_PACKAGE_WPEBACKEND_FDO
> +	select BR2_PACKAGE_COG_NEEDS_WPEBACKEND_FDO

Same, just select wpebackend-fdo.

> +	help
> +	  Enable the headless platform backend.
> +
>  config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
>  	bool "expose system D-Bus control interface"
>  	help
>  	  Expose remote control interface on system bus
>  
> -comment "DRM platform needs EGL and GBM"
> +comment "Headless platform needs wpebackend-fdo"
> +	depends on \
> +		!BR2_PACKAGE_WPEBACKEND_FDO
> +
> +comment "DRM platform needs EGL, GBM, wpebackend-fdo"
>  	depends on \
>  		!BR2_PACKAGE_HAS_LIBEGL || \
>  		!BR2_PACKAGE_HAS_LIBGBM || \
>  		!BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF || \
> -		!BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
> +		!BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT || \
> +		!BR2_PACKAGE_WPEBACKEND_FDO
> +
> +comment "Wayland platform needs wpebackend-fdo"
> +	depends on \
> +		!BR2_PACKAGE_WPEBACKEND_FDO

Drop all those changes.

>  endif
> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index 7f680bb7005..166f095118b 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -8,7 +8,7 @@ COG_VERSION = 0.18.4
>  COG_SITE = https://wpewebkit.org/releases
>  COG_SOURCE = cog-$(COG_VERSION).tar.xz
>  COG_INSTALL_STAGING = YES
> -COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo wayland
> +COG_DEPENDENCIES = dbus wpewebkit wayland
>  COG_LICENSE = MIT
>  COG_LICENSE_FILES = COPYING
>  COG_CONF_OPTS = \
> @@ -19,8 +19,6 @@ COG_CONF_OPTS = \
>  	-Dcog_home_uri='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
>  	-Dplatforms='$(subst $(space),$(comma),$(strip $(COG_PLATFORMS_LIST)))'
>  
> -COG_PLATFORMS_LIST = headless
> -
>  ifeq ($(BR2_PACKAGE_WESTON),y)
>  COG_CONF_OPTS += -Dwayland_weston_direct_display=true
>  COG_DEPENDENCIES += weston
> @@ -28,6 +26,11 @@ else
>  COG_CONF_OPTS += -Dwayland_weston_direct_display=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_COG_PLATFORM_HEADLESS),y)
> +COG_PLATFORMS_LIST += headless
> +COG_DEPENDENCIES += wpebackend-fdo
> +endif
> +
>  ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
>  COG_PLATFORMS_LIST += wayland
>  COG_DEPENDENCIES += libxkbcommon wayland-protocols
> @@ -48,4 +51,8 @@ ifeq ($(BR2_PACKAGE_LIBMANETTE),y)
>  COG_DEPENDENCIES += libmanette
>  endif
>  
> +ifeq ($(BR2_PACKAGE_COG_NEEDS_WPEBACKEND_FDO),y)
> +COG_DEPENDENCIES += wpebackend-fdo
> +endif

Drop this, and instead do:

ifeq ($(BR2_PACKAGE_COG_PLATFORM_HEADLESS),y)
COG_PLATFORMS_LIST += headless
COG_DEPENDENCIES += wpebackend-fdo
endif

ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
COG_PLATFORMS_LIST += wayland
COG_DEPENDENCIES += libxkbcommon wayland-protocols wpebackend-fdo
endif

ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
COG_PLATFORMS_LIST += drm
COG_DEPENDENCIES += libdrm libinput libgbm libegl udev wpebackend-fdo
endif

Could you rework a v3 according to those suggestions?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
