Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F51C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDD1881B69;
	Wed,  7 Feb 2024 16:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 106gynIxcifv; Wed,  7 Feb 2024 16:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DA7E81B71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA7E81B71;
	Wed,  7 Feb 2024 16:40:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FFB21BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F20D561427
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lCulIV7CQYDZ for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6640460BBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6640460BBF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6640460BBF
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:40:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E51ED40007;
 Wed,  7 Feb 2024 16:40:38 +0000 (UTC)
Date: Wed, 7 Feb 2024 17:40:32 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240207174032.5de5fb81@windsurf>
In-Reply-To: <20240207161704.2981151-1-dario.binacchi@amarulasolutions.com>
References: <20240207161704.2981151-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707324039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bn1y8UwGYGXQwcDTJ0idRaPsqRX+9o0aPGImOS7xR3o=;
 b=fqPcA3leVaevsbFj16udLHE4Uj9z3VynTrWMi52XNpU1Tat1JXALrVkoYfFc0RQ1DWQ3je
 O70xT6ZC70H7gyQG8+QY2Ae/hQ/0MerOrJ2GvyvvEvZAfkPI2svmVGwbLZd6BFc8PGbMRR
 QPkcImC1Q9zIqNbEpf7vjojHEaPlvYZOVMgpq/s1L6LY/h7BSBd657QDPCvwwiFPRhN4Ei
 6ENYlZf0P2HFP2jZiZWZbQJEi4T158oSwGCkV3u5zAUXU7+6v69grvjGb6oqaU00TQrgpz
 hPeCikV0bDRXaWYrV17orOJyVfAqGA7N3EUIhkEWbHS6eQ9iRwI1ATX1Gr4Baw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fqPcA3le
Subject: Re: [Buildroot] [PATCH 1/1] configs: drop redundant configuration
 for no MMU platforms
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Thomas Huth <huth@tuxfamily.org>,
 Jesse Taube <Mr.Bossman075@gmail.com>, Damien Le Moal <dlemoal@kernel.org>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Feb 2024 17:17:04 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The package/busybox/busybox-minimal.config is the default configuration
> for MMU-less systems, so the setting is redundant and can be removed
> without effect.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  configs/canaan_kd233_defconfig            | 1 -
>  configs/imxrt1050-evk_defconfig           | 3 ---
>  configs/qemu_m68k_mcf5208_defconfig       | 3 ---
>  configs/qemu_riscv64_nommu_virt_defconfig | 3 ---
>  configs/qemu_xtensa_lx60_nommu_defconfig  | 3 ---
>  configs/sipeed_maix_bit_defconfig         | 1 -
>  configs/sipeed_maix_bit_sdcard_defconfig  | 1 -
>  configs/sipeed_maix_dock_defconfig        | 1 -
>  configs/sipeed_maix_dock_sdcard_defconfig | 1 -
>  configs/sipeed_maix_go_defconfig          | 1 -
>  configs/sipeed_maix_go_sdcard_defconfig   | 1 -
>  configs/sipeed_maixduino_defconfig        | 1 -
>  configs/sipeed_maixduino_sdcard_defconfig | 1 -
>  configs/stm32f429_disco_xip_defconfig     | 1 -
>  configs/stm32f469_disco_sd_defconfig      | 1 -
>  configs/stm32f469_disco_xip_defconfig     | 1 -
>  configs/stm32f769_disco_sd_defconfig      | 1 -
>  17 files changed, 25 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
