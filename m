Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBB8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 18:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E59182883;
	Mon, 25 Apr 2022 18:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3_MgXvTTInX; Mon, 25 Apr 2022 18:41:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E05C682865;
	Mon, 25 Apr 2022 18:41:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A2241BF312
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 18:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5460141606
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 18:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9V3Ng8DlWhxa for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 18:41:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 497BF415F2
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 18:41:14 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id w16so10101712ejb.13
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 11:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VpbpXexCoXG6y3JRX6Ic7ZZrOJAWwdmktJitNg19kj8=;
 b=BGDQYrY0/UuMMS1DBTdcp9kslsjrQ9jcznu0ZVTtxnwxD9eXzm96fmbjhGGzlNKLGy
 d7V4Yb1U4GGzQaJACJOgGNMmsobY3zBwximOOuzTpqRkSId6VoCIjk16r7Oj7ZlL37oR
 sRHzzcJUyTjd9k8X4xr33TSEUsuPuaB4IoTNvhS7H3jXDFegb4fKTgdMshxuVmU7Evyn
 aBTam0ZcOEUv7nfW/stpUHilUimk+eXiimaxtWBz7JXv0S62dzjJzLabZPrrz6MniDoQ
 JjujOAAkb9zTBMt3MZWooK8mQ4Rp440E7LTky1ejXuYTeVdUx9HOAk59yq5Xj/x5QgTR
 cQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VpbpXexCoXG6y3JRX6Ic7ZZrOJAWwdmktJitNg19kj8=;
 b=ADUrcQf5nRzigXOT4T0eTm0p+GvPpL45RpXVvRio1RV9c2m2f5hO12Q5RJaG7wU/hH
 FVJI+uzbfri8qDIotNhoJJGqahA7m2iFx5diqR65PWemoaR4m/Yez2GekihtHnyes8mD
 i+G2vZeDPxtff1m+ZGve+U0y2bLDjcXxXT8r8cxkmzv03SjRtyk3sdts8xD/v/Rmr+CQ
 zp2ZvkUjz3py36L4tqml6zweropJjiKvo9sCSQUUzjHilQBz2kul4bHxQNl4Lsu3UNti
 /qENIbaIbaRwWpxauSsCPs21o1aWInYyyWcRJYJD2AVh/HDPpElt9nqChdoi3PEivgwc
 17XQ==
X-Gm-Message-State: AOAM530ZxDL+KEEYKg1uIFyGrxGdZRGWkRVFq0vjJUnnkvZ8jlfBjUIg
 blUZ8eJbaRfB5X3kr+/3XUKt/Q==
X-Google-Smtp-Source: ABdhPJznfLKIPMG3m5Zl4IyB7RokvnO6qYspubC76FD4WChc3yGWXb2xs+Q6J2MmgfTLqFeOSirHXQ==
X-Received: by 2002:a17:907:6e04:b0:6e0:736b:d786 with SMTP id
 sd4-20020a1709076e0400b006e0736bd786mr17475769ejc.667.1650912072236; 
 Mon, 25 Apr 2022 11:41:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 mf1-20020a170906cb8100b006f378365a5esm2632678ejb.116.2022.04.25.11.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 11:41:11 -0700 (PDT)
Message-ID: <f0fac25a-c5a1-2f3d-e9e2-be6108bdfaf9@mind.be>
Date: Mon, 25 Apr 2022 20:41:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220422174132.663076-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422174132.663076-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 22.0.2
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



On 22/04/2022 19:41, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2022-April/000670.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-March/000667.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-March/000665.html
> https://www.phoronix.com/scan.php?page=news_item&px=Mesa-22.0-Released
> 
> Upstream removed all DRI-based drivers:
> https://www.phoronix.com/scan.php?page=news_item&px=Mesa-Classic-Retired

  Oh, nice, this simplifies the Config.in quite a lot!

[snip]
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> index 5b74e14fef..6f06c85760 100644
> --- a/package/mesa3d/mesa3d.hash
> +++ b/package/mesa3d/mesa3d.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/mesa-announce/2022-March/000666.html
> -sha256  e70d273bdc53a4e931871bb5550ba3900e6a3deab2fff64184107c33e92d9da7  mesa-21.3.8.tar.xz
> -sha512  0462c44fa8e358dafd03088411452bc172a365902795b3198df1e6cfbf1d87675ef5b72b572de7f15e5ee87b30ce5b2f217c81ea72b376962f6428c6ff83f2e9  mesa-21.3.8.tar.xz
> +# From https://lists.freedesktop.org/archives/mesa-announce/2022-April/000670.html
> +sha256  df4fa560dcce6680133067cd15b0505fc424ca703244ce9ab247c74d2fab6885  mesa-22.0.2.tar.xz
> +sha512  939ddf9acd280e1b20b3540349b3ad07bbeee5d821198f1d667e86634449bf5d0a0df5832753b8b3f8816709c2f02959cce25f3d26a33cc758dd8e25d158ddb8  mesa-22.0.2.tar.xz
>   
>   # License
> -sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
> +sha256  4bc15d14dcc134b024cbdca3b5330010136ce8a427b6f8353440ce2ad7aab037  docs/license.rst

  If the license file hash changes, you must explain in the commit message what 
changed about it (in particular, if any additional licenses have been added or 
removed, or if it's just a copyright year update).

[snip]
> diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
> index c42255f55c..14c36930d5 100644
> --- a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
> @@ -1,7 +1,6 @@
>   config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
>   	bool "xf86-video-amdgpu"
>   	depends on BR2_USE_MMU # libdrm
> -	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
>   	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm

  So this used to require a DRI driver, now it only requires GBM? BTW the 
dependency was probably already wrong (should have been on MESA3D_GBM).

  Please explain why this is correct in the commit message. Or remove the 
package entirely if it doesn't actually work.

  Same with a bunch of other legacy X video drivers below.

>   	select BR2_PACKAGE_LIBDRM
>   	select BR2_PACKAGE_LIBDRM_AMDGPU
> @@ -13,5 +12,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
>   
>   comment "xf86-video-amdgpu needs egl/opengl support from mesa3d"
>   	depends on BR2_USE_MMU
> -	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
> -		!BR2_PACKAGE_MESA3D_DRI_DRIVER
> +	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
> diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
> index 1246014dca..090e00dad5 100644
> --- a/package/x11r7/xdriver_xf86-video-ati/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
> @@ -4,7 +4,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
>   	depends on BR2_PACKAGE_MESA3D
>   	select BR2_PACKAGE_LIBDRM
>   	select BR2_PACKAGE_LIBDRM_RADEON
> -	select BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
>   	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
>   	select BR2_PACKAGE_XORGPROTO
>   	help
> diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> index 13cee14deb..5f6e2bdf77 100644
> --- a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> @@ -4,7 +4,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
>   	depends on BR2_PACKAGE_IMX_GPU_G2D
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
>   	select BR2_PACKAGE_MESA3D # Needed in order to compile xorg with glx/dri
> -	select BR2_PACKAGE_MESA3D_DRI_DRIVER
>   	select BR2_PACKAGE_LIBDRM
>   	select BR2_PACKAGE_XORGPROTO
>   	help
> diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> index d911234c92..03b4221e57 100644
> --- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> +++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> @@ -31,12 +31,4 @@ XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = \
>   	xorgproto \
>   	xserver_xorg-server
>   
> -# X.org server support for DRI depends on a Mesa3D DRI driver
> -ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
> -XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += \
> -	--enable-dri2 \
> -	--enable-dri3 \
> -	--enable-uxa
> -endif
> -
>   $(eval $(autotools-package))
> diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
> index eee8fec2e8..bc7b347eac 100644
> --- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
> +++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
> @@ -12,8 +12,4 @@ XDRIVER_XF86_VIDEO_MACH64_LICENSE_FILES = COPYING
>   XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
>   XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xorgproto
>   
> -ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
> -XDRIVER_XF86_VIDEO_MACH64_CONF_OPTS += --disable-dri

  Shouldn't this just be an unconditional --disable-dri? Please explain why not. 
Same below.


  Marked as Changes Requested.

  Regards,
  Arnout

> -endif
> -
>   $(eval $(autotools-package))
> diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
> index 3c668a5c98..96ca5e0578 100644
> --- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
> +++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
> @@ -12,8 +12,4 @@ XDRIVER_XF86_VIDEO_MGA_LICENSE_FILES = COPYING
>   XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
>   XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
>   
> -ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
> -XDRIVER_XF86_VIDEO_MGA_CONF_OPTS += --disable-dri
> -endif
> -
>   $(eval $(autotools-package))
> diff --git a/package/x11r7/xdriver_xf86-video-nouveau/Config.in b/package/x11r7/xdriver_xf86-video-nouveau/Config.in
> index c9fd2e3d2f..a68f85c781 100644
> --- a/package/x11r7/xdriver_xf86-video-nouveau/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-nouveau/Config.in
> @@ -1,7 +1,6 @@
>   config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU
>   	bool "xf86-video-nouveau"
>   	depends on BR2_PACKAGE_MESA3D
> -	select BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
>   	select BR2_PACKAGE_LIBDRM
>   	select BR2_PACKAGE_LIBDRM_NOUVEAU
>   	select BR2_PACKAGE_XORGPROTO
> diff --git a/package/x11r7/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
> index a93d14376b..6b2e236f00 100644
> --- a/package/x11r7/xdriver_xf86-video-openchrome/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
> @@ -1,6 +1,5 @@
>   config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
>   	bool "xf86-video-openchrome"
> -	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
>   	select BR2_PACKAGE_LIBDRM
>   	select BR2_PACKAGE_XLIB_LIBX11
>   	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
> @@ -11,6 +10,3 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
>   	  VIA/S3G UniChrome and UniChrome Pro graphics chipsets.
>   
>   	  https://www.freedesktop.org/wiki/Openchrome/
> -
> -comment "xf86-video-openchrome needs a DRI driver from mesa3d"
> -	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER
> diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
> index 690041d4c6..51435c9389 100644
> --- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
> +++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
> @@ -11,8 +11,4 @@ XDRIVER_XF86_VIDEO_R128_LICENSE = MIT
>   XDRIVER_XF86_VIDEO_R128_LICENSE_FILES = COPYING
>   XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xorgproto
>   
> -ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
> -XDRIVER_XF86_VIDEO_R128_CONF_OPTS += --disable-dri
> -endif
> -
>   $(eval $(autotools-package))
> diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
> index 102aa2c48e..2306c14915 100644
> --- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
> +++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
> @@ -12,8 +12,4 @@ XDRIVER_XF86_VIDEO_SAVAGE_LICENSE_FILES = COPYING
>   XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
>   XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
>   
> -ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
> -XDRIVER_XF86_VIDEO_SAVAGE_CONF_OPTS += --disable-dri
> -endif
> -
>   $(eval $(autotools-package))
> diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
> index f96b0a9d0e..e05573de1f 100644
> --- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
> +++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
> @@ -11,8 +11,4 @@ XDRIVER_XF86_VIDEO_SIS_LICENSE = MIT
>   XDRIVER_XF86_VIDEO_SIS_LICENSE_FILES = COPYING
>   XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
>   
> -ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
> -XDRIVER_XF86_VIDEO_SIS_CONF_OPTS += --disable-dri
> -endif
> -
>   $(eval $(autotools-package))
> diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
> index 14c40e4d89..b9e57705ae 100644
> --- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
> +++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
> @@ -15,8 +15,4 @@ XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = \
>   	xorgproto \
>   	xserver_xorg-server
>   
> -ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
> -XDRIVER_XF86_VIDEO_TDFX_CONF_OPTS += --disable-dri
> -endif
> -
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
