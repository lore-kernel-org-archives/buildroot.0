Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191F3C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 07:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEDFF81A12;
	Wed, 24 Aug 2022 07:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEDFF81A12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ryCoM8cf1GrH; Wed, 24 Aug 2022 07:51:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B5CA8194C;
	Wed, 24 Aug 2022 07:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B5CA8194C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D3B21BF844
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 07:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5790A8194C
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 07:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5790A8194C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3ZHK50ORTO1 for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 07:51:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D48ED8161D
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D48ED8161D
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 07:51:41 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id s11so20946081edd.13
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 00:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=zzdbzf5l0wFL6Qv1EfWVKpvYbnbn/aQXabvrE9FVzGA=;
 b=ZWmOBr5jfOW01lUyxOiXKeJZdnyRmpek3LViuJEc18wx+mOQ/Vxc5sUw+vrC9THU9R
 1Rnmy+O/4CA0W3Lfa+AonGZIsh0l+IEDBF9SH+oMtOM373JGBl+zIkdN+exB2SRdaaxW
 qWye004LbDLEQuDBoZyqvZ9TgclAS0lhuoBAl0EIlJBwWIfL3fFh9lCQGJWn//uCZQM1
 +IqRgR0JGpcIFHMid1a04pvrKqxXNTgUQOQVhjyGQCeQ43AkWT0x5QbUY3oP+ZdGSRPb
 c416wm7ix86JM09mA7nOv7LSskvlYEPH7jHHTYoSZESq0XB3lBLe+0dAc129j7N+ejVD
 LnHw==
X-Gm-Message-State: ACgBeo1xPIsF6Z+PTCNsDaSgMb1wrjhjUdFS28c2kO+L8bxxSu2IyCWj
 P6Ih6z6OMhHUyCL+kvkoMacbAg==
X-Google-Smtp-Source: AA6agR7NRTXLtnQg6AGT4MauwfOGe/Yc4lppq/mZpIUh+r0fFS6iCiHob0zveGv769drx2zBLIwocw==
X-Received: by 2002:a05:6402:510a:b0:43d:ab25:7d68 with SMTP id
 m10-20020a056402510a00b0043dab257d68mr6440543edd.102.1661327500046; 
 Wed, 24 Aug 2022 00:51:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 aj9-20020a1709069a4900b0073d8891b78dsm813171ejc.90.2022.08.24.00.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 00:51:39 -0700 (PDT)
Message-ID: <59c122bb-dff1-79d1-fb06-c5ca253b86f7@mind.be>
Date: Wed, 24 Aug 2022 09:51:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
References: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
 <20220824024904.2529728-7-chris.dimich@boundarydevices.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220824024904.2529728-7-chris.dimich@boundarydevices.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=zzdbzf5l0wFL6Qv1EfWVKpvYbnbn/aQXabvrE9FVzGA=;
 b=CMNVcTf35e+QPOqeh2fD43R0NupiOI338udWIUPQOnf41W0Y2MGZCUC2qEkzHZeofk
 qmgYtzwrfiACHc/OEATlitqUEdq7tIcKWyYE3tJJebSZSgvn7tQJ7vzi4bYHmKsoJlSS
 ROXUvoVdONIqfCGk56uyl4bvVQwSmpNsyQaCY/hYVzY0nPtlnGCCGRSKxPbwkBnuISYs
 ES/C+5uyqErrdJboHxvsI4fBQDMDpmhuDhqEjvH3EFOTF0HSI2H9N1YK8WYPIuYo8m2G
 AFO18y3QyhweBy0JOsUE8C46zRSsz0W87VfhMHI5244TlE1+rW8eAjwdD3H8yHczxdxX
 xnRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CMNVcTf3
Subject: Re: [Buildroot] [PATCH 7/7]
 package/freescale-imx/imx-vpu-hantro-daemon: add package
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/08/2022 04:48, Chris Dimich wrote:
> i.MX Hantro V4L2 Daemon. Provides the vsidaemon, which is needed for
> V4L2 nodes to work.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>   package/freescale-imx/Config.in               |  1 +
>   .../imx-vpu-hantro-daemon/Config.in           | 20 ++++++++++
>   .../imx-vpu-hantro-daemon.hash                |  4 ++
>   .../imx-vpu-hantro-daemon.mk                  | 37 +++++++++++++++++++
>   4 files changed, 62 insertions(+)
>   create mode 100644 package/freescale-imx/imx-vpu-hantro-daemon/Config.in
>   create mode 100644 package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
>   create mode 100644 package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
> 
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 4a4237fb42..13d611b696 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -115,6 +115,7 @@ source "package/freescale-imx/imx-vpuwrap/Config.in"
>   source "package/freescale-imx/firmware-imx/Config.in"
>   source "package/freescale-imx/imx-sc-firmware/Config.in"
>   source "package/freescale-imx/imx-seco/Config.in"
> +source "package/freescale-imx/imx-vpu-hantro-daemon/Config.in"
>   source "package/freescale-imx/imx-vpu-hantro-vc/Config.in"
>   if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
>   source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
> diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/Config.in b/package/freescale-imx/imx-vpu-hantro-daemon/Config.in
> new file mode 100644
> index 0000000000..2ab9f97081
> --- /dev/null
> +++ b/package/freescale-imx/imx-vpu-hantro-daemon/Config.in
> @@ -0,0 +1,20 @@
> +comment "imx-vpu-hantro-daemon needs an i.MX-specific Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
> +comment "imx-vpu-hantro needs an i.MX platform with Hantro VPU"
                           -daemon

> +	depends on BR2_LINUX_KERNEL
> +	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
> +
> +config BR2_PACKAGE_IMX_VPU_HANTRO_DAEMON
> +	bool "imx-vpu-hantro"
> +	depends on BR2_LINUX_KERNEL
> +	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
> +	select BR2_PACKAGE_IMX_VPU_HANTRO
> +	select BR2_PACKAGE_IMX_VPU_HANTRO_VC if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
> +	help
> +	  i.MX Hantro V4L2 Daemon specific for the NXP i.MX SoC
> +	  integrating a Hantro Video Processing Unit (VPU) such as the
> +	  i.MX8MQ/i.MX8MM/i.MX8MP.
> +
> +	  This library is provided by NXP as-is and doesn't have an
> +	  upstream.
> diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
> new file mode 100644
> index 0000000000..811f8b21a3
> --- /dev/null
> +++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
> @@ -0,0 +1,4 @@
> +# Locally computed:
> +sha256  77e25ad1e1860f0a3983f07d6beb9a04ff32763bacf26db9aefd16559e6eea9b  imx-vpu-hantro-daemon-1.1.2.tar.gz
> +sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  COPYING
> +sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  EULA
> diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
> new file mode 100644
> index 0000000000..8e039a9d94
> --- /dev/null
> +++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# imx-vpu-hantro-daemon
> +#
> +################################################################################
> +
> +IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.2
> +IMX_VPU_HANTRO_DAEMON_SITE = $(FREESCALE_IMX_SITE)
> +IMX_VPU_HANTRO_DAEMON_SOURCE = imx-vpu-hantro-daemon-$(IMX_VPU_HANTRO_DAEMON_VERSION).tar.gz
> +IMX_VPU_HANTRO_DAEMON_DEPENDENCIES = linux
> +IMX_VPU_HANTRO_DAEMON_DEPENDENCIES += imx-vpu-hantro
> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP),y)
> +IMX_VPU_HANTRO_DAEMON_DEPENDENCIES += imx-vpu-hantro-vc
> +endif
> +IMX_VPU_HANTRO_DAEMON_INSTALL_STAGING = YES

  You don't have any commands to install to staging, so is this really correct?

  Regards,
  Arnout

> +
> +IMX_VPU_HANTRO_DAEMON_MAKE_ENV = \
> +	CROSS_COMPILE="$(TARGET_CROSS)" \
> +	SDKTARGETSYSROOT=$(STAGING_DIR) \
> +	LINUX_KERNEL_ROOT=$(LINUX_DIR) \
> +	CTRLSW_HDRPATH="$(STAGING_DIR)/usr/include" \
> +	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)
> +
> +IMX_VPU_HANTRO_DAEMON_LICENSE = NXP Semiconductor Software License Agreement
> +IMX_VPU_HANTRO_DAEMON_LICENSE_FILES = EULA COPYING
> +IMX_VPU_HANTRO_DAEMON_REDISTRIBUTE = NO
> +
> +define IMX_VPU_HANTRO_DAEMON_BUILD_CMDS
> +	$(MAKE1) -C $(@D) $(IMX_VPU_HANTRO_DAEMON_MAKE_ENV)
> +endef
> +
> +define IMX_VPU_HANTRO_DAEMON_INSTALL_TARGET_CMDS
> +	$(IMX_VPU_HANTRO_DAEMON_MAKE_ENV) $(MAKE1) -C $(@D) \
> +		DEST_DIR=$(TARGET_DIR) libdir=/usr/lib install
> +endef
> +
> +$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
