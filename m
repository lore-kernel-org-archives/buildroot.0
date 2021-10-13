Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1360DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:15:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7980611CA
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7980611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79C36407A6;
	Wed, 13 Oct 2021 19:15:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DToIkg-T2j3o; Wed, 13 Oct 2021 19:15:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD2F9407B4;
	Wed, 13 Oct 2021 19:15:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 034EF1BF372
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6DFA407B4
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6ZlzlmN1BVy for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:15:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF11A407A6
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:15:10 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id d9so14376505edh.5
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HyBcZ3kbXMeSCJ5wYCA4IC3EyZHp5V976X2pkvD5wOY=;
 b=JcJwPgHrfsQzbtk8VK6QGLowpATOeVX2wXVVsF6p/twF+Nu7LcFsv2HGAInn3hAEWZ
 xtXBMn7YedSjMF4+vaUWoaVrEypURSPw+xSDq7Mj7IROGet1YZxS31UthT5CuXRX1K/c
 /e/J/HLhy25Hnrr0LCWcKLYmadmMynq5YtW7tpgkhdoEbz+1XOSbgRc4WgEe3+8sX2fZ
 8MgdjcgKA555B5R/+K1Kyd/aY9pvbOxvpixhtlVrKUc5Cmy6k1pCd59AYvTh4Bt9LsuT
 yKzm/hImKQo9B0RwDrMudZYhI/rCN2Ftz9HLIqtw1J4sV08TJEi8DjOiN6UpLoGMJJcr
 VOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HyBcZ3kbXMeSCJ5wYCA4IC3EyZHp5V976X2pkvD5wOY=;
 b=ZHF1pDRQoO6awzSxrm8lNrtRuX3Qd+0jXaBgYXzfZUmv6iY+tzBrVJkq27VYeNs59j
 0qQVJngAMz4G7e1CMJJW8x3uAFHNs2q9qpwFsUY608+48gWKy2ruvPkPbTBB6YUwvA7T
 FpsI0+pOcVyV9EsN46Er1bScKDNGAzbrHzCfJdSyF2VnfM8ifz+9t2b+Ir9wmO+mFEiq
 VGPP3eP7hojDu7278sPY8OlGtsG8xzguxI+XgEK94zwk3rbLfGV/OFeiuvSR+nT01SwI
 8HmHAeWX64Zc716JMj+diu4nrHqIflgfmsPCLxTXfwIIQG7x4m2d6pX8bSN4MYa4hHP0
 dpmg==
X-Gm-Message-State: AOAM5311cWzRqBCdxi95/1c5rUbqBUWoH5PVk7K3r7J01m3YIHo0HP4H
 CtHC0nVUQjrcrNGHHkvYhiHWUA==
X-Google-Smtp-Source: ABdhPJxDaPDXziWcq6k2a8Hchk+yznw9u72E4oqe/vCz8crxThHORQk0ioO2pI96vrfL3/pIILq46w==
X-Received: by 2002:a17:906:274a:: with SMTP id
 a10mr1259022ejd.323.1634152508559; 
 Wed, 13 Oct 2021 12:15:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v13sm306997ejh.62.2021.10.13.12.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:15:08 -0700 (PDT)
Message-ID: <b322c166-7703-672c-4ae4-01d6fc9c7f6c@mind.be>
Date: Wed, 13 Oct 2021 21:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
 <20211006204135.2813745-7-chris.dimich@boundarydevices.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006204135.2813745-7-chris.dimich@boundarydevices.com>
Subject: Re: [Buildroot] [PATCH 07/12]
 package/freescale-imx/isp-vvcam-module: add package
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
> Verisilicon ISP that can be found in i.MX processors such as the i.MX 8M Plus.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>   package/freescale-imx/Config.in               |  1 +
>   .../freescale-imx/isp-vvcam-module/Config.in  |  8 ++++++
>   .../isp-vvcam-module/isp-vvcam-module.hash    |  2 ++
>   .../isp-vvcam-module/isp-vvcam-module.mk      | 26 +++++++++++++++++++
>   4 files changed, 37 insertions(+)
>   create mode 100644 package/freescale-imx/isp-vvcam-module/Config.in
>   create mode 100644 package/freescale-imx/isp-vvcam-module/isp-vvcam-module.hash
>   create mode 100644 package/freescale-imx/isp-vvcam-module/isp-vvcam-module.mk
> 
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 4a4237fb42..5f02d24909 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -116,6 +116,7 @@ source "package/freescale-imx/firmware-imx/Config.in"
>   source "package/freescale-imx/imx-sc-firmware/Config.in"
>   source "package/freescale-imx/imx-seco/Config.in"
>   source "package/freescale-imx/imx-vpu-hantro-vc/Config.in"
> +source "package/freescale-imx/isp-vvcam-module/Config.in"
>   if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
>   source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
>   source "package/freescale-imx/libz160/Config.in"
> diff --git a/package/freescale-imx/isp-vvcam-module/Config.in b/package/freescale-imx/isp-vvcam-module/Config.in
> new file mode 100644
> index 0000000000..d3a96c0d02
> --- /dev/null
> +++ b/package/freescale-imx/isp-vvcam-module/Config.in
> @@ -0,0 +1,8 @@
> +comment "bdsdmac_module needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_ISP_VVCAM_MODULE
> +	bool "ISP-VVCAM Kernel module"
> +	depends on BR2_LINUX_KERNEL

  I haven't applied this (and the rest of the series) because I was thinking it 
would make sense to add something like BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU for 
this module.

> +	help
> +	  Verisilicon ISP that can be found in i.MX processors such as the i.MX 8M Plus.

  This line is too long, as check-package can tell you.

  Regards,
  Arnout

> diff --git a/package/freescale-imx/isp-vvcam-module/isp-vvcam-module.hash b/package/freescale-imx/isp-vvcam-module/isp-vvcam-module.hash
> new file mode 100644
> index 0000000000..4b2fc15a81
> --- /dev/null
> +++ b/package/freescale-imx/isp-vvcam-module/isp-vvcam-module.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  e52166a29a7d58b1f7d30639b451eb8f38971903c898c24e8fcc03dbfc7a503f  isp-vvcam-module-47588cb88cc75400b5d2c35a17527e99b752d9be-br1.tar.gz
> diff --git a/package/freescale-imx/isp-vvcam-module/isp-vvcam-module.mk b/package/freescale-imx/isp-vvcam-module/isp-vvcam-module.mk
> new file mode 100644
> index 0000000000..652250c65e
> --- /dev/null
> +++ b/package/freescale-imx/isp-vvcam-module/isp-vvcam-module.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# ISP_VVCAM_MODULE
> +#
> +################################################################################
> +
> +ISP_VVCAM_MODULE_VERSION = 47588cb88cc75400b5d2c35a17527e99b752d9be
> +ISP_VVCAM_MODULE_SITE = https://source.codeaurora.org/external/imx/isp-vvcam
> +ISP_VVCAM_MODULE_SITE_METHOD = git
> +ISP_VVCAM_MODULE_LICENSE = GPL-2.0
> +ISP_VVCAM_MODULE_DEPENDENCIES = linux
> +
> +define ISP_VVCAM_MODULE_BUILD_CMDS
> +	cd $(@D)/vvcam/v4l2; \
> +	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" \
> +		ARCH=$(KERNEL_ARCH) KERNEL_SRC=$(LINUX_DIR)
> +endef
> +
> +define ISP_VVCAM_MODULE_INSTALL_TARGET_CMDS
> +	cd $(@D)/vvcam/v4l2; \
> +	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" \
> +		ARCH=$(KERNEL_ARCH) KERNEL_SRC=$(LINUX_DIR) \
> +		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
> +endef

  Why isn't this using the kernel-module infrastructure? That should definitely 
be explained in the commit message.

  Regards,
  Arnout

> +
> +$(eval $(generic-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
