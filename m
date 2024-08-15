Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4963EC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 09:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5C9A81E8E;
	Thu, 15 Aug 2024 09:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kaKjTaLd0Mbd; Thu, 15 Aug 2024 09:14:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB80F81E8F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB80F81E8F;
	Thu, 15 Aug 2024 09:14:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 377901BF5E0
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 09:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24E3F81E8F
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 09:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1GgRn_BxK-9 for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 09:14:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 65CDB80E4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65CDB80E4C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65CDB80E4C
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 09:14:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5020B40007;
 Thu, 15 Aug 2024 09:14:16 +0000 (UTC)
Date: Thu, 15 Aug 2024 11:14:15 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240815111415.25844e3a@windsurf>
In-Reply-To: <20240809-boot-uboot-fix-dependency-on-xilinx-prebuilt-v1-1-7014697db0c6@collins.com>
References: <20240809-boot-uboot-fix-dependency-on-xilinx-prebuilt-v1-1-7014697db0c6@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723713256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VkRs6/xH7L6PN7DBZ7+i1CUpv7Em1LgCv73m3T6Bi4M=;
 b=SzT0AKyo/7fdCGlCRuiCC4DEU58vzII8lwrrK9HR4HUsL3sApOWtydNQBwqCb8B7KGc4KL
 gZatvrnwPBi+ZB4Q9rgEt45aHjME8F1hpSeFshK7FarSFyk+3mAnXInIlEG126Vq205MI3
 MxaocAqWZzOYD3i0hF+qAE1cnZjhBLWfbNUS8S+p5/3ap7vcunaElKYAyPI36tTxfFXjL1
 9Utt9eYzpOmLBIGCdHSMZHbSSX4kjs/uGMsLyKZ6qqJLT6tApNxSQcKix6k0Hi/5y8ZNbe
 JIxDKY6V0kf+UeOOMlU05DLYdN72BtOEdJNln3l0K/BZIiryuI0d3l4m/Xjz+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SzT0AKyo
Subject: Re: [Buildroot] [PATCH] boot/uboot: fix dependency on
 xilinx-prebuilt
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon,

On Fri, 09 Aug 2024 16:30:18 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> When building with `make -j` and PER_PACKAGE_DIRECTORIES, a race
> condition occurs between xilinx-prebuilt and u-boot, resulting in the
> following error.
> 
>   objcopy -O binary -I elf32-little .../images/pmufw.elf .../images/pmufw.bin
>   objcopy: '.../images/pmufw.elf': No such file
> 
> U-Boot registers a KCONFIG_FIXUP_CMD that uses the pmufw.elf from
> xilinx-prebuilt. But KCONFIG_FIXUP_CMDS does not use the normal
> DEPENDENCIES, so xilinx-prebuilt is not guaranteed to have run before
> fixup.
> 
> Instead move the `objcopy` call out to a PRE_BUILD_HOOK so it will run
> after xilinx-prebuilt has finished.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Thanks for fixing this, I have applied to master. I have a few
questions/suggestions below.

> +ifeq ($(suffix $(UBOOT_ZYNQMP_PMUFW_PATH)),.elf)
> +UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH)).bin
> +define UBOOT_ZYNQMP_PMUFW_CONVERT
> +	objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_PATH) $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)

Should we be using $(TARGET_OBJCOPY) instead of objcopy to use the
target toolchain objcopy?

> +endef
> +UBOOT_PRE_BUILD_HOOKS += UBOOT_ZYNQMP_PMUFW_CONVERT
> +else
> +UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(UBOOT_ZYNQMP_PMUFW_PATH)
> +endif
>  define UBOOT_ZYNQMP_KCONFIG_PMUFW
> -	$(if $(filter %.elf,$(UBOOT_ZYNQMP_PMUFW_PATH)),
> -		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin
> -		$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin"),
> -		$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)"))
> +	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)")

This means this KCONFIG_SET_OPT is not unconditionally if I'm not
wrong (so even on platforms that are not Xilinx ones). Shouldn't it
only be done if $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL) is not empty?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
