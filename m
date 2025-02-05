Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAD0C02196
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12E2560FA9;
	Wed,  5 Feb 2025 10:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXzjhxc2IANK; Wed,  5 Feb 2025 10:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6D58606B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6D58606B4;
	Wed,  5 Feb 2025 10:09:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52EC912F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 338B560631
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCB9HlkGEyf8 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:09:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D76CE60B21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D76CE60B21
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D76CE60B21
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:09:24 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so76769905e9.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 02:09:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738750162; x=1739354962;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yVyXQG7K3VdcPjAeIIwjuv9mgiFdRyiNkAVW+bxpiDg=;
 b=To+OC50CWMYjNYH60HMw0cQie8RS/FGkulMeTiZqtJSWv3X4/iFLkSJrWwHYULLzkb
 zCn7Pgzlansldgh+TUoHule6T03gC8r9EiXqSCjtwD1tfzic/jwFI55qKPjqfAog8rU3
 eP+Kc6FL+3oY8TieWzmMpFofPS4NkPcNCOeD2/WVsdE0O7hpmBeVd1/MCP1FQV4LAwgI
 XrAKeQZjjpb6PV7BmrrQtLGsxEs53V1irN59JqfiNj5AS4q98TJFp7YMNcZMCrV8XB4R
 bYXCKeHBVWjrCl8cXo3sQ3xzU3d7HvXaJ/+qbaJ5rdOBRuLg0VBXUyTkX2cJmSF/4yo8
 BExg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3KCkqRKpmARMGDuOCeDk+bDTziC7rVwm6tX7/LhSVFQ3PG7VSPCuGYsXzM90Qa2c/yV7n3Qt/9jc=@buildroot.org
X-Gm-Message-State: AOJu0Yy9AuWpzQc6DlJWcoKZmDebyVtV4GkjXNhlm2TgBwdLtEhb03sb
 F8cFe9NekDcDJ5pHTy3exgrlCj64YaMQpvjiluFFrBck/tcp6czQl2uplDY6keU=
X-Gm-Gg: ASbGncu2Ob4aArjEzkYsrAQkfAe+lCEpeRYVrbiC6P3xgbA4nsPzmRps1v18ZNqKPB+
 tw9H3vBR5Cu9IkoimbhqIt34PT0nnvDWmDANelOKEPtsBEnDLqXZqv6JbNnKzu9Fbskg7+qnJ+Z
 AshH6IF1ukQm+09WwPb5VaNW14v0D8kg+lFNUANEyYOKO8+8U9DjjhaEzXxlTJNOwe0CY2i5X85
 HKuFy5HGrS6xzoLLaXIwIe6jKaw7e00Dy91QYIeDVbpFF0kmpvLEYpv06weopXLA8eZ6RY3u9cD
 dCgrG34GfPcN85GPFc32Ysnqw/iC6gIISrkfqxA0spZd3uk=
X-Google-Smtp-Source: AGHT+IH6NXK1TUf4je+QC7VQ0pPw3L+Aq9aaB6D3VlbWdrLWBjuQOMEeV5GHYJgnph9krYVHz/yApQ==
X-Received: by 2002:a05:600c:1f85:b0:434:a1d3:a321 with SMTP id
 5b1f17b1804b1-4390d42f6b4mr17537395e9.3.1738750162587; 
 Wed, 05 Feb 2025 02:09:22 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d94d40csm16135395e9.9.2025.02.05.02.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 02:09:22 -0800 (PST)
Message-ID: <03d5d181-0593-4d1f-8175-f4a8968eb805@mind.be>
Date: Wed, 5 Feb 2025 11:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
References: <20250205-fix_zxing-v1-0-c3e4c2adfdab@bootlin.com>
 <20250205-fix_zxing-v1-1-c3e4c2adfdab@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20250205-fix_zxing-v1-1-c3e4c2adfdab@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738750162; x=1739354962; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yVyXQG7K3VdcPjAeIIwjuv9mgiFdRyiNkAVW+bxpiDg=;
 b=ae4ECR8kySl4cmNMLQy12Gh+Z/LVFVQrHyc4hCHzthXcDqWJ9Ftmj7cDeBlu2bnLZy
 BW+JMnW4TbD3+3j7KFfthGNYAscq/47+sRNxJltqghohzEOf7khzOQ6vuO68bD0hl4TD
 F+kNROfdj/IcHaJ1d0pDc+l8NVUI1OObvVfbfwuHdbq/sBM6oryBNv+0T6lfR6OhtPwN
 zq2mA7TdZ1CIB1OnNXv2DP+D7S8VDB9ev6MpV0tNr5z2iPW+A0pU3Itnjgo3cg1JvkCp
 h2i7bRFUGjrVY01MpXYI5eABOrs90NE7B+c1OTsgUdPaSTo44XtzbwxZfgj02M7tPUIZ
 XpBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ae4ECR8k
Subject: Re: [Buildroot] [PATCH 01/12] package/gstreamer1/gst-omx: remove
 gst-omx
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/02/2025 10:47, Thomas Bonnefille wrote:
> The OMX plugin has been removed from gstreamer as the OpenMAX standard
> is long dead and even the Raspberry Pi OS no longer supports it.
> 
> See release notes for more details:
>      https://gstreamer.freedesktop.org/releases/1.24/
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   Config.in.legacy                        |  7 ++++++
>   package/gstreamer1/Config.in            |  1 -
>   package/gstreamer1/gst-omx/Config.in    | 11 ----------
>   package/gstreamer1/gst-omx/gst-omx.hash |  3 ---
>   package/gstreamer1/gst-omx/gst-omx.mk   | 39 ---------------------------------
>   5 files changed, 7 insertions(+), 54 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index e091fd8c0a972c3043e9664652e3d40e6d83af8b..4f0b78d9589a65e8f69bca406cec49cdc2d5294c 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -172,6 +172,13 @@ config BR2_PACKAGE_DIRECTFB
>   	  This package was no longer maintained upstream, so it was
>   	  dropped from Buildroot.
>   
> +config BR2_PACKAGE_GST_OMX
> +	bool "gst-omx has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The gst-omx module has been removed from Gstreamer in
> +	  release 1.24 in favor of Video4Linux-based video encoders.
> +
>   config BR2_PACKAGE_SDL2_DIRECTFB
>   	bool "sdl2 directfb support removed"
>   	select BR2_LEGACY
> diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
> index 8fe8a343950334caff2954231ae55465473b39f0..67c33e5d4e518d85290a73fdbef484d55f35b617 100644
> --- a/package/gstreamer1/Config.in
> +++ b/package/gstreamer1/Config.in
> @@ -15,7 +15,6 @@ source "package/gstreamer1/gst1-python/Config.in"
>   source "package/gstreamer1/gst1-rtsp-server/Config.in"
>   source "package/gstreamer1/gst1-shark/Config.in"
>   source "package/gstreamer1/gst1-vaapi/Config.in"
> -source "package/gstreamer1/gst-omx/Config.in"
>   source "package/gstreamer1/gstd/Config.in"
>   source "package/gstreamer1/gstreamer1-editing-services/Config.in"
>   endif
> diff --git a/package/gstreamer1/gst-omx/Config.in b/package/gstreamer1/gst-omx/Config.in
> deleted file mode 100644
> index efe3d211d6d1489400ace233daaa67b5dc326a0b..0000000000000000000000000000000000000000
> --- a/package/gstreamer1/gst-omx/Config.in
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -config BR2_PACKAGE_GST_OMX
> -	bool "gst-omx"
> -	depends on BR2_PACKAGE_HAS_LIBOPENMAX
> -	select BR2_PACKAGE_GST1_PLUGINS_BASE
> -	help
> -	  GStreamer plug-in to use OpenMAX API.
> -
> -	  https://cgit.freedesktop.org/gstreamer/gst-omx
> -
> -comment "gst-omx requires a OpenMAX implementation"
> -	depends on !BR2_PACKAGE_HAS_LIBOPENMAX
> diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
> deleted file mode 100644
> index a84ffa7b6b3e35c3b788cf5a4899980fcb7eac02..0000000000000000000000000000000000000000
> --- a/package/gstreamer1/gst-omx/gst-omx.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.12.tar.xz.sha256sum
> -sha256  6b0685b92ac735032d7987d1028afaeab0a98ab726e0c51e5b9bfc8f2da7c8b1  gst-omx-1.22.12.tar.xz
> -sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
> deleted file mode 100644
> index c1ab2b19c08c69522065af914e30554f20782c02..0000000000000000000000000000000000000000
> --- a/package/gstreamer1/gst-omx/gst-omx.mk
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -################################################################################
> -#
> -# gst-omx
> -#
> -################################################################################
> -
> -GST_OMX_VERSION = 1.22.12
> -GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
> -GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
> -
> -GST_OMX_LICENSE = LGPL-2.1
> -GST_OMX_LICENSE_FILES = COPYING
> -
> -GST_OMX_CONF_OPTS = \
> -	-Dexamples=disabled \
> -	-Dtests=disabled \
> -	-Dtools=disabled \
> -	-Ddoc=disabled
> -
> -ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> -GST_OMX_VARIANT = rpi
> -GST_OMX_CONF_OPTS += -Dheader_path=$(STAGING_DIR)/usr/include/IL
> -else
> -GST_OMX_VARIANT = generic
> -endif
> -
> -GST_OMX_CONF_OPTS += -Dtarget=$(GST_OMX_VARIANT)
> -
> -GST_OMX_DEPENDENCIES = gstreamer1 gst1-plugins-base libopenmax
> -
> -# adjust library paths to where buildroot installs them
> -define GST_OMX_FIXUP_CONFIG_PATHS
> -	find $(@D)/config -name gstomx.conf | \
> -		xargs $(SED) 's|/usr/local|/usr|g' -e 's|/opt/vc|/usr|g'
> -endef
> -
> -GST_OMX_POST_PATCH_HOOKS += GST_OMX_FIXUP_CONFIG_PATHS
> -
> -$(eval $(meson-package))
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
