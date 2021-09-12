Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E833C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 08:56:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9796D60FC0
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 08:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9796D60FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D61E82846;
	Sun, 12 Sep 2021 08:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2N7y8iBH5K4Z; Sun, 12 Sep 2021 08:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 933EF82803;
	Sun, 12 Sep 2021 08:56:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB721BF578
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 08:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A73940237
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 08:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bZyurrAlSv9h for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 08:56:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BE7E400AF
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 08:56:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bc3c:8ee4:eb9c:c13b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3623C20039C;
 Sun, 12 Sep 2021 10:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631437008;
 bh=GrHVDrFqJxbjZVpHCIFq5g4jhHtZRbl+eo50JFVgJKo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eMVwfjsyHY1uykdQ94fTztqvxbLMvLornyxp/7LIbpBthLA2My417RVbwedWTBTVT
 2lkshMAwQQlJCitZSITL37cyqhfNOmu/BDrrrt/PlpRap2X0n80ElmZq5meqGCCg7T
 Gidg1hG4k2oPqeRRYCenWRC92zFsP5wZexRLtJym1gaRLCELXaS8yx61NI4p7AwI70
 ZrRTUa/GXjQxknJsh4Ank8J4y+36qa9Fz5qmW2mV49FzlneEH1jEWz87zwYAKjD5Mi
 80stb48e2d+GYreS+fd56hMtzSbGQGRtqs5MHy4TYEhxMFm8kILVWImAM3hfe4rpkj
 U/+PqB0BrOVcA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Sep 2021 10:56:28 +0200
Date: Sun, 12 Sep 2021 10:56:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20210912085628.GC1053080@scaer>
References: <20210912050905.21355-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912050905.21355-1-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3] boot/uboot: copy IMX firmware files to
 uboot package dir
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabio Estevam <festevam@gmail.com>, Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Heiko, All,

On 2021-09-12 07:09 +0200, Heiko Thiery spake thusly:
> The mainline U-Boot can create an i.MX specific firmware image (e.g. flash.bin).
> For this the i.MX firmware files (DDR, HDMI) must be in the toplevel directory.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> ---
> 
> v3:
>  - included the comments from Fabio
>  - add Fabio's SOB
> 
> v2:
>  - small changes in commit messages (thanks Stephane)
>  - use "i.MX 8M" for consistency (thanks Stephane)
> 
>  boot/uboot/Config.in | 11 +++++++++++
>  boot/uboot/uboot.mk  | 27 +++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 0854fb13cc..8cc40cd9c5 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -239,6 +239,17 @@ config BR2_TARGET_UBOOT_NEEDS_OPENSBI
>  	  and that the OpenSBI variable pointing to OpenSBI binary,
>  	  is passed during the Buildroot build.
>  
> +config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
> +	bool "U-Boot needs firmware-imx"
> +	depends on BR2_PACKAGE_FIRMWARE_IMX
> +	depends on BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || \
> +		BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
> +	help
> +	  Some i.MX8 platforms (such as i.MX8 M, i.MX 8M Mini, i.MX 8M Nano)
> +	  encapsulate NXP specific firmware (DDR, HDMI) inside U-Boot.
> +	  This option makes sure that the i.MX firmwares are copied into
> +	  the U-Boot source directory.
> +
>  menu "U-Boot binary format"
>  
>  config BR2_TARGET_UBOOT_FORMAT_AIS
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 1a840d9cc1..a446830c6f 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -180,6 +180,33 @@ UBOOT_DEPENDENCIES += opensbi
>  UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
>  endif
>  
> +# Mainline U-Boot versions can create the i.MX specific boot images
> +# and need some NXP firmware blobs.
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE),y)
> +UBOOT_DEPENDENCIES += firmware-imx
> +
> +ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW),y)
> +define UBOOT_COPY_IMX_DDR_FIRMWARE
> +	cp $(BINARIES_DIR)/signed_hdmi_imx8m.bin $(@D)/
> +endef
> +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_DDR_FIRMWARE
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),y)
> +define UBOOT_COPY_IMX_LPDDR4_FIRMWARE
> +	cp $(BINARIES_DIR)/lpddr4*.bin $(@D)/
> +endef
> +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_LPDDR4_FIRMWARE
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_DDR4),y)
> +define UBOOT_COPY_IMX_DDR4_FIRMWARE
> +	cp $(BINARIES_DIR)/ddr4*.bin $(@D)/
> +endef
> +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_DDR4_FIRMWARE
> +endif
> +endif

I've changed that to a simpler hook:

  185 ifeq ($(BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE),y)
  186 UBOOT_DEPENDENCIES += firmware-imx
  187 UBOOT_IMX_FW_FILES = \
  188     $(if $(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW),signed_hdmi_imx8m.bin) \
  189     $(if $(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),lpddr4*.bin) \
  190     $(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR4),ddr4*.bin)
  191
  192 define UBOOT_COPY_IMX_FW_FILES
  193     $(foreach fw,$(UBOOT_IMX_FW_FILES),\
  194         cp $(BINARIES_DIR)/$(fw) $(@D)/
  195     )
  196 endef
  197 UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_DDR_FIRMWARE
  198 endif

Applied to master with this change, thanks.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
>  UBOOT_DEPENDENCIES += host-dtc
>  endif
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
