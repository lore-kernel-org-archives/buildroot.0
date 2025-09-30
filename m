Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5B0CCA468
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 11:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D0E781E01;
	Tue, 30 Sep 2025 11:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vsu0ocpgbux5; Tue, 30 Sep 2025 11:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60E3081E05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60E3081E05;
	Tue, 30 Sep 2025 11:07:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77FEA111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 11:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6986B81E05
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 11:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gnA97tuDfl2q for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 11:07:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 725F581E03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 725F581E03
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 725F581E03
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 11:07:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6E5CAC02462;
 Tue, 30 Sep 2025 11:07:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0D301606E4;
 Tue, 30 Sep 2025 11:07:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1CB82102F17D8; 
 Tue, 30 Sep 2025 13:07:40 +0200 (CEST)
Date: Tue, 30 Sep 2025 13:07:38 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250930130738.4948264b@booty>
In-Reply-To: <20250929070052.132796-1-neal.frager@amd.com>
References: <20250929070052.132796-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1759230473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ITL2CrDGkxvXkqR7gwHVki5P7znlvi98SS1V9R5+F8s=;
 b=VE1ZQySy1OVjUSIcxp7ieAixmhQuBK+ZoozJPD+1sxnD40G3Xd5CSELQV/W3QBTFvCmLSa
 fYjAkc4Kp4OuNdL8tj6VPXGYNAlj21wWo7QTCkFNiZwlZ8gSzttpIHf8U5HGuVC3O7mADo
 CaEiuhLijv5eaQReZQz8/zg7gzfM0/AE8RU9oJCTW1M4b3twldWetLIF9D/qdLnFmDD45S
 U8fVkahIxU8aLuCerQT+LzJOUjsPuBe92yXVpRsI9pImCgoA70j5ya4pjvmj6L9DB/SZQd
 QMn4igi7Ovz0XiMUhPDdDoMJa8deYowt3MqlZKyro3wOERjunUDbZVapOyI2CQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VE1ZQySy
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: simplify
 family logic
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com, buildroot@buildroot.org,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Mon, 29 Sep 2025 08:00:52 +0100
Neal Frager <neal.frager@amd.com> wrote:

> Currently, the xilinx-prebuilt package uses an if-then-else statement for
> deciding which files need to be installed from the xilinx-prebuilt repo. This
> works fine for now because there are really only two options, either versal or
> zynqmp/kria.
> 
> Starting with the xilinx_v2025.2 release, the versal2 family along with the
> vek385 board will be added to Buildroot and thus the xilinx-prebuilt package
> as well. In the future, additional families will also probably be added to
> this package.
> 
> To avoid creating a long if-then-else-then-else statement which will only grow
> in complexity over time, simplify the logic of the xilinx-prebuilt package by
> giving each xilinx family its own if statement. In the long term, this will
> make the xilinx-prebuilt package easier to understand and maintain.

OK for splitting the if/then construct which is not very readable as of
now.

> For this reason, this patch moves the zynqmp/kria families from the "else"
> statement to having their own if statement.

Not sure about this, see below.

> --- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> +++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> @@ -103,21 +103,32 @@ define XILINX_PREBUILT_INSTALL_VERSAL_PSMFW
>  		$(BINARIES_DIR)/psmfw.elf
>  endef
>  endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
> +endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
> +
> +ifeq ($(BR2_TARGET_XILINX_PREBUILT_KRIA),y)
> +ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
> +define XILINX_PREBUILT_INSTALL_KRIA_PMUFW
> +	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
> +		$(BINARIES_DIR)/pmufw.elf
> +endef
> +endif # !BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
> +endif # BR2_TARGET_XILINX_PREBUILT_KRIA
>  
> -else # BR2_TARGET_XILINX_PREBUILT_VERSAL
> +ifeq ($(BR2_TARGET_XILINX_PREBUILT_ZYNQMP),y)
>  ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
>  define XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW
>  	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
>  		$(BINARIES_DIR)/pmufw.elf
>  endef
>  endif # !BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
> -endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
> +endif # BR2_TARGET_XILINX_PREBUILT_ZYNQMP

zynqmp and kria are doing the same thing (normal, as kria is a zynqmp),
so those are duplicated function. Unless you expect them to become
different, then I'd leave them as a single function. One of these
should work:

ifeq ($(BR2_TARGET_XILINX_PREBUILT_ZYNQMP)$(BR2_TARGET_XILINX_PREBUILT_KRIA),y)
...
endif

ifneq ($(BR2_TARGET_XILINX_PREBUILT_ZYNQMP)$(BR2_TARGET_XILINX_PREBUILT_KRIA),)
...
endif

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
