Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26D3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14E3C61100
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14E3C61100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C247B82F84;
	Sat, 11 Sep 2021 20:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d2-SCxQtFeMw; Sat, 11 Sep 2021 20:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1577C827CE;
	Sat, 11 Sep 2021 20:57:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EE3D1BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D87940292
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cUIffw_oQHt for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:57:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A0B34028A
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:57:20 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id b10so5094945ejg.11
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VOFsS4d2N4zYqAew6X6Fzl2D1ZGVMgvvbdQ8hy79V7Y=;
 b=HhkzpkJsk4r5mOysNWUtNcLprtUsShq2U8q9/upSHl0CwT5WCnySE38LFhZGue/1kb
 3PT9CsA1zQeBstA1xsWoUC35cLQsoU7yrqJcw1G/ciURZLaCDo/0E5JaOtj0M8zpB8WM
 BZ9gmJbyfK5+NV9SlTOBK9vli7LFOjKD/FLKLl4XTG/remRrmCIOOr1zNUHziG0gYfee
 tBZNFOBax+i6eExUU0axBtz0dTCyy3/JJFmTsyiCGODX+8n81qSNT3CNnqbRyHX5k5RZ
 dWAKkNkP3RSonaMsg5+tK0K+D0+k212DebgXKXnh0KfpKtAqZEVNSZdZSGMB8/EOpCKy
 JY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VOFsS4d2N4zYqAew6X6Fzl2D1ZGVMgvvbdQ8hy79V7Y=;
 b=FQcnGMKG8BONUzTrDgqLxJrDMjGtGK7Z0pjBAXqkrbskLa1bScl9ikNtK01oAw2i3Z
 zmXDIi8Oi2IIM+UB6E21TJkKfpwxMvATipZ9CXpfinbzaJrIRyXEoHe/BcDGg503Vvjz
 x1dmrhk+lEBrkyUUJmLVgdtRWEH6rRyO0biJoXZplJYBoAC/Vu2P2H+SVer/F7eTzv9J
 l2Y9D+hit19ahsazbQTXYOOB59NmmRLYdibcAVA0YKSBeX/pKTTlFpFYZAOSowu1R7Up
 cUOESjEaIZ/P95ofbu6Cni14gYWU/Cr6bqqb3OKWdK3DqI4uCNJD6fR+MRvaJKTpOrme
 LK8A==
X-Gm-Message-State: AOAM531Amhlhvi3wa0iXCdX1yLEpmvsw61hUxgWVn7ZKe7gvC15tnm57
 67pXpubJVYnQxBQMS0k3OIMTlKbkdlviwA==
X-Google-Smtp-Source: ABdhPJx7IEVus6u511X/nGHqE5qjxdvXByauY5R8WyteOJEOMdAANy4L0Te/pj/h/mN6gRHYi6SlIQ==
X-Received: by 2002:a17:907:c23:: with SMTP id
 ga35mr4267895ejc.203.1631393838473; 
 Sat, 11 Sep 2021 13:57:18 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s15sm1417623edr.6.2021.09.11.13.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 13:57:18 -0700 (PDT)
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20210910140925.28138-1-heiko.thiery@gmail.com>
 <20210910140925.28138-4-heiko.thiery@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <20c4593a-a0e1-fa95-582c-046cced31b15@mind.be>
Date: Sat, 11 Sep 2021 22:57:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910140925.28138-4-heiko.thiery@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 3/3] boot/uboot: copy IMX firmware files
 to uboot package dir
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Xavier Roumegue <xroumegue@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 10/09/2021 16:09, Heiko Thiery wrote:
> If the U-Boot image is to be built with binman and one of the i.MX
> firmware files (ddr, hdmi) is used, the files are expected in the
> toplevel directory.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

 I was too lazy to update with all of Fabio's comments :-) so I marked as
Changes Requested.

 Regards,
 Arnout

> ---
> 
> v2:
>  - small changes in commit messages (thanks Stephane)
>  - use "i.MX 8M" for consistency (thanks Stephane)
> 
>  boot/uboot/Config.in | 12 ++++++++++++
>  boot/uboot/uboot.mk  | 27 +++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 0854fb13cc..da518db118 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -239,6 +239,18 @@ config BR2_TARGET_UBOOT_NEEDS_OPENSBI
>  	  and that the OpenSBI variable pointing to OpenSBI binary,
>  	  is passed during the Buildroot build.
>  
> +config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
> +	bool "U-Boot needs firmware-imx"
> +	depends on BR2_PACKAGE_FIRMWARE_IMX
> +	depends on BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || \
> +		BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
> +	help
> +	  Some IMX platforms (such as iMX8m, iMX8mq, iIMX8mm, iIMX8mn)
> +	  encapsulate NXP specific firmware (DDR, HDMI) inside U-Boot.
> +	  This option makes sure the imx firmware gets built prior to
> +	  U-Boot and copies the files from the buildroot binary dir
> +	  into the U-Boot source dir.
> +
>  menu "U-Boot binary format"
>  
>  config BR2_TARGET_UBOOT_FORMAT_AIS
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 1a840d9cc1..cf8d6b1f39 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -180,6 +180,33 @@ UBOOT_DEPENDENCIES += opensbi
>  UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
>  endif
>  
> +# New U-Boot versions can create the IMX specific boot images
> +# and needs the some NXP firmware blobs.
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
> +
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
>  UBOOT_DEPENDENCIES += host-dtc
>  endif
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
