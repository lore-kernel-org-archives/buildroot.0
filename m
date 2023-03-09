Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89DAC64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38DAB60A4F;
	Thu,  9 Mar 2023 20:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38DAB60A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1FmSzdri1h6X; Thu,  9 Mar 2023 20:01:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40A2C60AD4;
	Thu,  9 Mar 2023 20:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40A2C60AD4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 016F51BF410
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFB3E403D6
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFB3E403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cGwF7zQI-1fL for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:01:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C7F0400BF
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C7F0400BF
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:01:47 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id u9so11754451edd.2
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 12:01:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392105;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LhhEaMjtZAYLOX8nJjp/8MISYYs55qMX1xdDpjF5D30=;
 b=Ud/F5HtvKFXpzFxYHnSgt2awIEmJYH20/sdUII20PjkRZv0Wi+tXN/xwUx4q1Q/YL2
 gmcvwmVkrw0iqzmfCqH2tImH8RfkfV2qytawt9AJX2rKGpsenvekSvT1StMvyQuNfdE9
 LT34rZbsdpc1nYpI2BdHYCP05rxzY1S/c+YAF6meeu56fsduSJ3Dji7kBMtWQO0IPt7j
 9wJu6AJJUWpmG4whObr/IDvPVEeAfEhdiFBp+4Irr772A3lgHuTPxanKNn3p+TwXq6On
 BeYOCKw7LX6q2gTmJ+2Cg53tGVNlCfmNBg8WmOJjqmyTU6GpBTuggfunOUeCRoFRHoyV
 VO9A==
X-Gm-Message-State: AO0yUKXrUssZybPIv9tB5eCL1NbW5RmBuULbixQbgmnp/OysZJP7RkUJ
 PwCWiPWtPppu2U5wiTQoIOfggg==
X-Google-Smtp-Source: AK7set+sq9VqIqlxfxyPKfn8Y6aEhkQt1clI03WSYocwe+sMsGSirjjPUh3/OMgEot9hAZxwm3Ya5Q==
X-Received: by 2002:aa7:d3d3:0:b0:4ae:e4ec:cf9d with SMTP id
 o19-20020aa7d3d3000000b004aee4eccf9dmr24572510edr.9.1678392105380; 
 Thu, 09 Mar 2023 12:01:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 kt21-20020a170906aad500b008d398a4e687sm9179024ejb.158.2023.03.09.12.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:01:44 -0800 (PST)
Message-ID: <bb076129-af4c-2f15-857c-e5555b7f6c0c@mind.be>
Date: Thu, 9 Mar 2023 21:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB049368DE3CF489381F94420B9FB79@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <VI1P190MB049368DE3CF489381F94420B9FB79@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678392105;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LhhEaMjtZAYLOX8nJjp/8MISYYs55qMX1xdDpjF5D30=;
 b=Il4bLFcl1ddrP3mObw7b4bnkSRV1nX29SwOijleG040cl4IcrXT+YA/GevNvXCQ+zC
 QT8zIw/QnWAztMDpbu6cCvRPDRFPhEjZcJxK02L9k/XLaduDUQ9X5rfA+EWT8KX/fSE3
 9b8BSOG8tLKUNhYJ5FaR7UcHdUVrPozt0vQWmYK0qT6Sws4C7Sa7rYaC+9wvBe25lQ8l
 +3MsSYyI97uffRJC2cmxWhEA7j57KYAZhaycLF7plrSNVJfQVeqmlm2SWzNRw5Ss2UIN
 7wW0bsKvSSswodAvvwlFJoxX7skO0hV9F6r+ijjzKPWM5iJHfgvh3/CTkf68rYPvfR2l
 X7cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Il4bLFcl
Subject: Re: [Buildroot] [PATCH v2] package/freescale-imx/imx-gpu-viv: fix
 aarch64 framebuffer support
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
Cc: "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/03/2023 19:27, Lang Daniel via buildroot wrote:
> Since e8df0f7 (package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p4.4)
> the fb folder is no longer included in the archive.
> 
> imx-gpu-viv 6.4.3.p4.4-aarch64 Building
> cp -dpfr /home/d.lang/buildroot/output/build/imx-gpu-viv-6.4.3.p4.4-aarch64/gpu-core/usr/lib/fb/* /home/d.lang/buildroot/output/build/imx-gpu-viv-6.4.3.p4.4-aarch64/gpu-core/usr/lib/
> cp: cannot stat '/home/d.lang/buildroot/output/build/imx-gpu-viv-6.4.3.p4.4-aarch64/gpu-core/usr/lib/fb/*': No such file or directory

  So this fixes something? Please indicate that with a Fixes: tag (we don't have 
it very formalized; some people would put "Fixes: e8df0f7", other people would 
put "Fixes: cp: cannot stat '....'). That way we can see immediately in 
patchwork that it should be applied to master, not next.

> 
> According to meta-freescale [0] the framebuffer output can be enabled on
> IMX8 by using the wayland libraries together with egl.pc.
> 
> Tested on an imx8mn by running kmscube. EGL and GLES support detected.
> 
> [0]: https://git.yoctoproject.org/meta-freescale/tree/recipes-graphics/imx-gpu-viv/imx-gpu-viv-6.inc
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
> v1 -> v2:
>   - Mention current build failure
>   - Add information for egl.pc selection
> ---
>   package/freescale-imx/imx-gpu-viv/Config.in   |  4 +--
>   .../freescale-imx/imx-gpu-viv/imx-gpu-viv.mk  | 27 ++++++++++++-------
>   2 files changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
> index 3e095b730c..1e3bdd6b3d 100644
> --- a/package/freescale-imx/imx-gpu-viv/Config.in
> +++ b/package/freescale-imx/imx-gpu-viv/Config.in
> @@ -45,8 +45,8 @@ choice
>   
>   config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
>   	bool "Framebuffer"
> -	# The i.MX8 blob doesn't support FB output
> -	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
> +	# Framebuffer output on aarch64 is linked wayland library.
> +	select BR2_PACKAGE_WAYLAND if BR2_aarch64
>   
>   config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
>   	bool "Wayland"
> diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> index f72735e093..00c95cc5d2 100644
> --- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> +++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> @@ -26,28 +26,37 @@ endif
>   
>   IMX_GPU_VIV_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT))
>   
> -# Libraries are linked against libdrm, except framebuffer output on ARM
> +# Libraries are linked against libdrm and wayland,
> +# except framebuffer output on ARM
>   ifneq ($(IMX_GPU_VIV_LIB_TARGET)$(BR2_arm),fby)

  The condition here is !(fb && arm), but in the Config.in the condition is !fb 
|| aarch64.

  Since the condition is a bit complicated, I think it's best to introduce an 
extra symbol in Config.in, something like:

# Library binaries are linked against libdrm.so.2 and libwayland.so, except
# framebuffer output on ARM
config  BR2_PACKAGE_IMX_GPU_VIV_USES_WAYLAND
	bool
	default y if !(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB && BR2_arm)
	select BR2_PACKAGE_LIBDRM
	select BR2_PACKAGE_WAYLAND

  This would also replace the existing select BR2_PACKAGE_LIBDRM. And we 
wouldn't need to repeat the comment in 3 places.

In the .mk file, you can then use conditions on 
BR2_PACKAGE_IMX_GPU_VIV_USES_WAYLAND instead of the complicated double condition.


> -IMX_GPU_VIV_DEPENDENCIES += libdrm
> -endif
> -
> -ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
> -IMX_GPU_VIV_DEPENDENCIES += wayland
> +IMX_GPU_VIV_DEPENDENCIES += libdrm wayland
>   endif
>   
>   define IMX_GPU_VIV_EXTRACT_CMDS
>   	$(call NXP_EXTRACT_HELPER,$(IMX_GPU_VIV_DL_DIR)/$(IMX_GPU_VIV_SOURCE))
>   endef
>   
> -ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
> +# The package comes with multiple versions of egl.pc,
> +# depending on the output the original egl.pc is replaced
> +# with a symlink:
> +# - arm/frambuffer: symlink to egl_linuxfb.pc
> +# - aarch64/framebuffer: original egl.pc without a symlink
> +# - wayland: symblink to egl_wayland.pc
> +ifeq ($(IMX_GPU_VIV_LIB_TARGET)$(BR2_arm),fby)
> +IMX_GPU_VIV_BACKEND_DIR = fb

  The commit message says that the fb folder is not included, but here you still 
use it?

>   define IMX_GPU_VIV_FIXUP_PKGCONFIG
>   	ln -sf egl_linuxfb.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
>   endef
> -else ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
> +else
> +# Framebuffer output on aarch64 uses the same libraries as wayland output
> +# but without replaceing egl.pc.
> +IMX_GPU_VIV_BACKEND_DIR = wayland
> +ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)

  So, in the fb aarch64 case, the original egl.pc is used? We have 3 versions: 
egl.pc that is used for fb on aarch64, egl_linuxfb.pc that is used for fb on 
arm, and egl_wayland.pc that is used for wayland?


  All this was a bit too complicated for me to fix up while applying, so I 
marked as Changes Requested.

  Regards,
  Arnout


>   define IMX_GPU_VIV_FIXUP_PKGCONFIG
>   	ln -sf egl_wayland.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
>   endef
>   endif
> +endif
>   
>   IMX_GPU_VIV_PLATFORM_DIR = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_PLATFORM))
>   ifneq ($(IMX_GPU_VIV_PLATFORM_DIR),)
> @@ -60,7 +69,7 @@ endif
>   # in the upstream archive here. We also remove unused backend files.
>   # Make sure these commands are idempotent.
>   define IMX_GPU_VIV_BUILD_CMDS
> -	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_LIB_TARGET)/* $(@D)/gpu-core/usr/lib/
> +	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_BACKEND_DIR)/* $(@D)/gpu-core/usr/lib/
>   	$(foreach backend,fb wayland, \
>   		$(RM) -r $(@D)/gpu-core/usr/lib/$(backend)
>   	)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
