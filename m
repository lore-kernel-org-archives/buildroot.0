Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C3EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:08:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDB3A61165
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDB3A61165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EA0560D4F;
	Wed, 13 Oct 2021 19:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4BnjEVm522e; Wed, 13 Oct 2021 19:07:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA48560B09;
	Wed, 13 Oct 2021 19:07:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC4581BF372
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A74DB404E8
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBlRQTakXuoE for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:07:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7714440155
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:07:55 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id w19so14624669edd.2
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6GpsO0OmLqrPKOOyRSTdFNZocCZ1UdwK09xTzVg8Jbo=;
 b=azeLLB0ejPtoJ+b0ICdPFNYHHpzrhWReUytjOL9TWVFEYN0eJZ8DdnR6g4jwX/dgrE
 ++YHSGmAtT/dpsuqdQnFq6WQVE1lsRQC6TuBgqlo2T5+gvQQEPqvcpJlr2v5o6oTH/o2
 MGpYBNE+AeNsJoYguJOKF38TXJ9Hvpgxx00ENg8Bnte2eenIm2cmB/iuTcHG97up1NeL
 PFjRNXWwsNvNWbLZhO58HxKV1ImD2o4iQD1PkYPCIOIqk0NnwRWS6uSF2AhXHJuKk0gN
 DnBL85oc3AIDPve//T2V5RNSJNOeZ8qCdc19WLNrVYyeax8RfxubWj8DbYfXR3ITbWqC
 9BIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6GpsO0OmLqrPKOOyRSTdFNZocCZ1UdwK09xTzVg8Jbo=;
 b=mPOhJUx5YYzQdihOKWp0LjzMTg1jfV6YxoDicvxBabwMnHp2FxekY6AiRpT2ZS2Uyk
 c1p6GHCiZ66Z27vp029m9RnDyPcFTwA8HI5XChQkU8GGIn/N9v3S8esbUNuVosI0gRuB
 mWW9aC33BSQfkNIJM8AiYMHOkUDdw/olTjJ+Q7mcsGLdJ5ga5UaF6VN0gO83EU2GUJrw
 hX3nQr3BMVec59zhUwun8v/1vkQdW2JUU5so4PzbQE822xzfa5CEdYUMAE06Qkkiz+EE
 KRqfHIxF1/wdEBINnNNbBwsnbydP0U5mvU8HyKxtxEfdYZlwEgDjmcSvGD1X9TWyYq3a
 m1/g==
X-Gm-Message-State: AOAM531GrWSRUl59y6yE40D486Feg1vVpE43/J/ZkVRE/fuwLn4e98G7
 sO8lTHl6B3mpM4qPTyMAzuIjHv4WWMI7zEGl
X-Google-Smtp-Source: ABdhPJxdHlSjLnGPpAz3MSCjkVDOTJbN26rj+Jd5bfzoVY5uYh3cMIihFCSGEe+0+HdrVlF2sUq33w==
X-Received: by 2002:a50:be82:: with SMTP id b2mr1723396edk.56.1634152073728;
 Wed, 13 Oct 2021 12:07:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v13sm297259ejh.62.2021.10.13.12.07.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:07:53 -0700 (PDT)
Message-ID: <2ccce449-d453-f50c-7310-c898b5ab5f0b@mind.be>
Date: Wed, 13 Oct 2021 21:07:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
 <20211006204135.2813745-6-chris.dimich@boundarydevices.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006204135.2813745-6-chris.dimich@boundarydevices.com>
Subject: Re: [Buildroot] [PATCH 06/12]
 package/freescale-imx/imx-vpu-hantro-vc: add package
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 22:41, Chris Dimich wrote:
> i.MX VC8000E Encoder library. Intended for the i.MX 8M Plus processor.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/freescale-imx/Config.in               |  1 +
>   .../freescale-imx/imx-vpu-hantro-vc/Config.in | 13 ++++++++++
>   .../imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash  |  4 +++
>   .../imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk    | 25 +++++++++++++++++++
>   4 files changed, 43 insertions(+)
>   create mode 100644 package/freescale-imx/imx-vpu-hantro-vc/Config.in
>   create mode 100644 package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
>   create mode 100644 package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
> 
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index bedd05a471..4a4237fb42 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -115,6 +115,7 @@ source "package/freescale-imx/imx-vpuwrap/Config.in"
>   source "package/freescale-imx/firmware-imx/Config.in"
>   source "package/freescale-imx/imx-sc-firmware/Config.in"
>   source "package/freescale-imx/imx-seco/Config.in"
> +source "package/freescale-imx/imx-vpu-hantro-vc/Config.in"
>   if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
>   source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
>   source "package/freescale-imx/libz160/Config.in"
> diff --git a/package/freescale-imx/imx-vpu-hantro-vc/Config.in b/package/freescale-imx/imx-vpu-hantro-vc/Config.in
> new file mode 100644
> index 0000000000..9ae139550a
> --- /dev/null
> +++ b/package/freescale-imx/imx-vpu-hantro-vc/Config.in
> @@ -0,0 +1,13 @@
> +comment "imx-vpu-hantro-vc needs an i.MX-specific Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
> +comment "imx-vpu-hantro-vc needs an i.MX platform with Hantro VPU"
> +	depends on BR2_LINUX_KERNEL
> +	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
> +
> +config BR2_PACKAGE_IMX_VPU_HANTRO_VC
> +	bool "imx-vpu-hantro-vc"
> +	depends on BR2_LINUX_KERNEL
> +	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
> +	help
> +	  i.MX VC8000E Encoder library. Intended for the i.MX 8M Plus processor.
> diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
> new file mode 100644
> index 0000000000..aadf5b121f
> --- /dev/null
> +++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
> @@ -0,0 +1,4 @@
> +# Locally computed:
> +sha256  d5efae484c4271c098286d007590d6bf40c272d4f35702ff65625f2362715ab3  imx-vpu-hantro-vc-1.4.0.bin
> +sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
> +sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
> diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
> new file mode 100644
> index 0000000000..b07e116674
> --- /dev/null
> +++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# imx-vpu-hantro-vc
> +#
> +################################################################################
> +
> +IMX_VPU_HANTRO_VC_VERSION = 1.4.0
> +IMX_VPU_HANTRO_VC_SITE = $(FREESCALE_IMX_SITE)
> +IMX_VPU_HANTRO_VC_SOURCE = imx-vpu-hantro-vc-$(IMX_VPU_HANTRO_VC_VERSION).bin
> +IMX_VPU_HANTRO_VC_DEPENDENCIES = linux
> +
> +IMX_VPU_HANTRO_VC_LICENSE = NXP Semiconductor Software License Agreement
> +IMX_VPU_HANTRO_VC_LICENSE_FILES = EULA COPYING
> +IMX_VPU_HANTRO_VC_REDISTRIBUTE = NO
> +
> +define IMX_VPU_HANTRO_VC_EXTRACT_CMDS
> +	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPU_HANTRO_VC_DL_DIR)/$(IMX_VPU_HANTRO_VC_SOURCE))
> +endef
> +
> +define IMX_VPU_HANTRO_VC_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/usr/lib/libhantro_vc8000e.so $(TARGET_DIR)/usr/lib/libhantro_vc8000e.so
> +	$(INSTALL) -D -m 0755 $(@D)/usr/lib/libhantro_vc8000e.so.1 $(TARGET_DIR)/usr/lib/libhantro_vc8000e.so.1
> +endef
> +
> +$(eval $(generic-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
