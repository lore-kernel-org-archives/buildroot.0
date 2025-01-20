Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1557C02185
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 17:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C9B26104B;
	Mon, 20 Jan 2025 17:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cP8CH9-H0yVZ; Mon, 20 Jan 2025 17:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D476E61026
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D476E61026;
	Mon, 20 Jan 2025 17:33:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B15769
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 17:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6827A844D3
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 17:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nW8YpBExIYzw for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 17:33:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C35983FAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C35983FAB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C35983FAB
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 17:33:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2469EFF803;
 Mon, 20 Jan 2025 17:33:13 +0000 (UTC)
Date: Mon, 20 Jan 2025 18:33:12 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250120183312.073aafb3@booty>
In-Reply-To: <20250120113405.3938838-1-neal.frager@amd.com>
References: <20250120113405.3938838-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737394395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bkf+0KWmeloVThac61GZofKpsOHpUIVmq09tCDl0ZIk=;
 b=PPquppXAKUTQgCg81XQVzfjsxx8Lm5vpKQP4QSylMvwNVeUZOgNokW9qKyNQ2W5RlUU2Yu
 +/rHM/sXClO7TAepWTNa4CW503aX6GEa/CcQwRD1LTyqc4GPyBFpfiFtzwZgMdKjJFnGF+
 X2ruy/J7nVDZKk+d7juvMB/TQMhvNDTbN2fpxcK1me196lLpaGxGLqjU8iMHSLJM+XaWEB
 t4g4rQKUH1blLcmcqkxN5jBYGu+WL+CDyMPceyvNbzMEv/u3EeirFFuBWcYu63p3lPvjzj
 5r+W6M011UIsyqgfv9HBih5+1JhApZguxzmhFlKaTE1ZW0UnzENlD5egmVZEfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PPquppXA
Subject: Re: [Buildroot] [PATCH v2 1/4] boot/xilinx-embeddedsw: new boot
 package
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
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, romain.naour@smile.fr,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

thanks for pushing this forward.

On Mon, 20 Jan 2025 11:34:02 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a new boot package to Buildroot for building boot firmware
> applications from the https://github.com/Xilinx/embeddedsw repo.
> 
> If a user chooses to build a boot firmware application, it will not be
> installed by the xilinx-prebuilt package since it will come from the
> xilinx-embeddedsw package.  In this way, users can mix and match applications
> to be built by the xilinx-embeddedsw package and applications to be copied
> from the xilinx-prebuilt package.  This is necessary for the versal platform
> because the pdi file can only be built by AMD Vivado.
> 
> Support for additional applications in the https://github.com/Xilinx/embeddedsw
> repo can always be added to this package as needed or requested.
> 
> The xilinx-embeddedsw package replaces previous solutions including
> zynqmp-firmware, versal-firmware and xilinx-source.
> 
> A patch is required for the xilinx-embeddedsw repo because the LICENSE file
> has the name license.txt.  A patch is thus included to create a symbolic link
> from LICENCE to licence.txt, so that the Buildroot hash check will succeed.
> This patch is not upstreamable.

Isn't changing the _LICENSE value the correct fix?

-XILINX_EMBEDDEDSW_LICENSE_FILES = LICENSE
+XILINX_EMBEDDEDSW_LICENSE_FILES = license.txt

...

> +if BR2_TARGET_XILINX_EMBEDDEDSW
> +
> +config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
> +	string "xilinx-embeddedsw version"
> +	default "xilinx_v2024.2"
> +	help
> +	  Release version of Xilinx/embeddedsw.
> +	  Must be xilinx_v2023.1 or newer.
> +
> +config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
> +	bool "versal plm"
> +	help
> +	  Build versal plm application from Xilinx/embeddedsw repo.
> +	  If selected, the xilinx-prebuilt package will not install
> +	  the plm.elf since it will come from the xilinx-embeddedsw
> +	  package.
> +
> +	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm
> +
> +config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
> +	bool "versal psmfw"
> +	help
> +	  Build versal psmfw application from Xilinx/embeddedsw repo.
> +	  If selected, the xilinx-prebuilt package will not install
> +	  the psmfw.elf since it will come from the xilinx-embeddedsw
> +	  package.
> +
> +	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_psmfw
> +
> +config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
> +	bool "zynqmp pmufw"
> +	help
> +	  Build zynqmp pmufw application from Xilinx/embeddedsw repo.
> +	  If selected, the xilinx-prebuilt package will not install
> +	  the pmufw.elf since it will come from the xilinx-embeddedsw
> +	  package.
> +
> +	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/zynqmp_pmufw
> +
> +config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS
> +	string "xilinx-embeddedsw optional zynqmp_pmufw user cflags"

+ depends on BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW

> +	help
> +	  Add optional cflags when building xilinx zynqmp_pmufw.
> +
> +	  Example cflag options can be found here:
> +	  https://github.com/Xilinx/embeddedsw/blob/master/lib/sw_apps/zynqmp_pmufw/src/xpfw_config.h
> +
> +endif # BR2_TARGET_XILINX_EMBEDDEDSW

...

> diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> new file mode 100644
> index 0000000000..9a89f27d10
> --- /dev/null
> +++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> @@ -0,0 +1,80 @@
> +################################################################################
> +#
> +# xilinx-embeddedsw
> +#
> +################################################################################
> +
> +XILINX_EMBEDDEDSW_VERSION = $(call qstrip,$(BR2_TARGET_XILINX_EMBEDDEDSW_VERSION))
> +XILINX_EMBEDDEDSW_SITE = $(call github,Xilinx,embeddedsw,$(XILINX_EMBEDDEDSW_VERSION))
> +XILINX_EMBEDDEDSW_LICENSE = MIT
> +XILINX_EMBEDDEDSW_LICENSE_FILES = LICENSE
> +XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
> +XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
> +XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
> +
> +# ZYNQMP_PMUFW application allows users to add cflags
> +XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS = \
> +	$(call qstrip,$(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS))
> +XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_CFLAGS = \
> +	"-Os -flto -ffat-lto-objects $(XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS)"
> +
> +XILINX_EMBEDDEDSW_CFLAGS = "-Os -flto -ffat-lto-objects"
> +
> +ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)

I still think this looks like a good approach from a user point of
view. However I cannot say whether the implementation, based on a
package looking into the config knobs of another package, is clean or
not. I'll leave this to more experienced Buildroot reviewers to judge.
Same for the following options.

Other than that it looks overall good.

I've also successfully tested on KV260.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
