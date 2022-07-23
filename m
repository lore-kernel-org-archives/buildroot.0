Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BB9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 08:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B53F284B26;
	Sat, 23 Jul 2022 08:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B53F284B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FhNGXpruoUyO; Sat, 23 Jul 2022 08:48:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4012084B12;
	Sat, 23 Jul 2022 08:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4012084B12
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C13691BF2C7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86EBF617B7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86EBF617B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSKUDCIAItB3 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 08:48:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D26C60FCB
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D26C60FCB
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:48:04 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 i205-20020a1c3bd6000000b003a2fa488efdso670268wma.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 01:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HcIXnGW1XIA8Ymk0BHPtuMfm4u4FchDwRiIu1/gGX8I=;
 b=lVpR6heFL5Z5GiOwECSnksIZs/gp4E/sc+e0TPbjmIjaeDh6sIQMoLiVqJt8ACYuvM
 Rd1xwvBYDOftAjsSSSLNuaZszOpzRFSzIcZJrWx8z6Uoyk7gkY2AQyUl/7Lk1qiRax/9
 OzGYKjRVViUFpKn2K8ZlnbcM/jhx0qlUq28uMPSaT0zDHUH5cTGK87tJ2HXbJkPcqLXC
 gNEUsZ5CMdnhdz/VZnZDOnXzUAIwO+rYCTmIJ8Yb7iH7/dkClg7yT6xXhAR9XN/lK/QF
 oiP5Z+50XIgVSsJCTprsNj8F9O7rY6ghMFlLtXUvWWu/k/ZGNykK7nj315pE8DYAj98O
 ZxUw==
X-Gm-Message-State: AJIora9v0MrtlDYFPheIs9E+utqtJPRInbYINWn81iB+DM8fyfryIlLh
 OENbRKEW4aSkTcmz6Z2ERw6c5QeSGiBQ4Pil
X-Google-Smtp-Source: AGRyM1s+wr1eCpTdVR2YRCloID49BSCgVwN1gUthb3NcUnpYkmbTzzIl8vt64qr8HiNumH9vQQLyGQ==
X-Received: by 2002:a05:600c:4ece:b0:3a3:1ce4:1e05 with SMTP id
 g14-20020a05600c4ece00b003a31ce41e05mr2276123wmq.25.1658566082170; 
 Sat, 23 Jul 2022 01:48:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a056000105200b0021e4f446d43sm6288796wrx.58.2022.07.23.01.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 01:48:01 -0700 (PDT)
Message-ID: <43e30f67-d82b-b6af-13bc-cc2088b3e253@mind.be>
Date: Sat, 23 Jul 2022 10:48:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Alexandru Ardelean <ardeleanalex@gmail.com>, buildroot@buildroot.org
References: <20220721144939.1265027-1-ardeleanalex@gmail.com>
 <20220722070150.40715-1-ardeleanalex@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220722070150.40715-1-ardeleanalex@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HcIXnGW1XIA8Ymk0BHPtuMfm4u4FchDwRiIu1/gGX8I=;
 b=bGhFvLsAbfbGYfb/XPzCoyIU7iGkwLs8reAcOU2A26P1haTssn7c6aZvTVtTqSGgoC
 +MRLh8rkKx5WB9C2mBk2KJqbco2tpO88gi1S1At3bQ4MXFdWrjYlj7sOi+8tC5eEQt5i
 I+JOF7i1h62Rtqw9oqp/F06fpVaBpbZrt1FZERjYtx62kxleuT6XpFbEGi7/qZR58+gW
 gUgv+4b0K35gevwRtkKWn8UxA3RrkG19Uav28E7XxJkdLsHEU2nDpFY0HwMLtilqP2c+
 RRqmA57+wuOkT1fB+K27tSAS+mDRpj+YGYI1zVGQ0D/VNocZ4gH/niS2GiHUm2WeWP3F
 OpbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bGhFvLsA
Subject: Re: [Buildroot] [PATCH v2] package/cog: add libgbm as dependency
 when building with DRM support
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
Cc: aperez@igalia.com, thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/07/2022 09:01, Alexandru Ardelean wrote:
> When building with the DRM support, it can happen that the libgbm library
> is not yet built by the provider of this lib (specified by
> BR2_PACKAGE_PROVIDES_LIBGBM).

  I've applied this one to master already, however there are two comments on v1 
that remain unaddressed.

> 
> The docs in cog `docs/platform-drm.md` specify this dep-list:
> - **WPEBackend-fdo**:
> - **Wayland**:
> - **libdrm**:
> - **libgbm**:
> - **libinput**:
> - **libudev**:

  This would imply that a dependency on udev is needed as well (both in the 
Config.in and the .mk). It is actually implied by libinput, so we won't get 
build failures, but it's better to have explicit dependencies.

> 
> libgbm needs to be added.
> Adding libegl as well.
> 
> Updated package/cog/Config.in to define the dependencies (for DRM)
> according to libegl & libgbm.
> 
> Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> ---
>   package/cog/Config.in | 9 ++++++---
>   package/cog/cog.mk    | 2 +-
>   2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/package/cog/Config.in b/package/cog/Config.in
> index d4238750f9..484eb85c70 100644
> --- a/package/cog/Config.in
> +++ b/package/cog/Config.in
> @@ -39,7 +39,8 @@ config BR2_PACKAGE_COG_PLATFORM_FDO
>   config BR2_PACKAGE_COG_PLATFORM_DRM
>   	bool "DRM backend"
>   	depends on BR2_PACKAGE_HAS_UDEV # libinput
> -	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_HAS_LIBGBM

  It apparently needs the 
BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT feature. You can test 
that by trying a build with rockchip-mali or ti-sgx-um as provider, since those 
packages don't have that feature.


  Regards,
  Arnout

>   	select BR2_PACKAGE_LIBDRM
>   	select BR2_PACKAGE_LIBINPUT
>   	help
> @@ -52,7 +53,9 @@ config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
>   	help
>   	  Expose remote control interface on system bus
>   
> -comment "DRM platform needs mesa3d w/ EGL driver and GBM"
> -	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
> +comment "DRM platform needs EGL and GBM"
> +	depends on \
> +		!BR2_PACKAGE_HAS_LIBEGL || \
> +		!BR2_PACKAGE_HAS_LIBGBM
>   
>   endif
> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index f2ca0af93d..da660eb7c1 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -28,7 +28,7 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
>   COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
> -COG_DEPENDENCIES += libdrm libinput
> +COG_DEPENDENCIES += libdrm libinput libgbm libegl
>   else
>   COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
