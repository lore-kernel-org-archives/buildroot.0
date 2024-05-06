Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4C9C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A49DB811F8;
	Mon,  6 May 2024 19:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bo6v11AaFy_9; Mon,  6 May 2024 19:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96CF18120D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96CF18120D;
	Mon,  6 May 2024 19:59:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED12C1BF308
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA082811E7
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LClFAjk9oSCp for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:59:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DB0B810CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DB0B810CC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DB0B810CC
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:59:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5A891BF204;
 Mon,  6 May 2024 19:59:13 +0000 (UTC)
Date: Mon, 6 May 2024 21:59:13 +0200
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20240506215913.43aa1fd3@windsurf>
In-Reply-To: <20240505195427.3622027-1-geomatsi@gmail.com>
References: <20240505195427.3622027-1-geomatsi@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715025554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMi52NfippwzjqMeQlt66URGuShas3PXfTOWhnipo1I=;
 b=m+sE6ktf0ucwJ18Ak/905hoi7GO+OtA/xP9ZujKdMMuybeyZakqQQn/9gJ1GhLMRKMsiIR
 Uz/v2gO48IovfeB+VHKY7goc4C+Kilnr2p25y0muEEIdL5EvgSX9Y2ULPSIybhhMv4CKC1
 v94qVarbm+DWz1Mrck2xzyFJL7AvaS6Dezlr2RBUjt3SrUjFU0+YFxm38UM32lNXR9vgFt
 Ickaajs6sNXEMgIxGHUakDEHHgSwr+1goaLOE+BnCsyeaaC06L6HW+1WM5A2p4pynLthJi
 AfTVHgiREdpV1hMk8/rukaWIjUDZ6QY8dHzPU+r6kg+9GOgnFKoCl/HhBfvGOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m+sE6ktf
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/orangepi_zero2w: new board
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 May 2024 22:54:19 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> This patch adds basic support for the new OrangePi Zero2W board:
> - http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-2W.html
> 
> Brief summary of the board features:
> - H618 Allwinner SoC
>   - Quad-Core ARM Cortex-A53 Processor 1.5GHz
>   - Mali G31 MP2 GPU
> - LPDDR4: 1GB/2GB/4GB
> - Wi-Fi5.0+BT 5.0
> - 2x Type-C USB 2.0
> - 1x Mini HDMI
> - Wi-Fi 5.0 + BT 5.0
> - 40-pin expansion interface (GPIO / UART / I2C / SPI / PWM)
> - 24-pin expansion interface (2x USB 2.0 / ETH / IR / audio)
> 
> BSP includes the following components:
> - mainline ATF v2.10
> - mainline U-Boot v2024.04
> - mainline Linux kernel v6.8
> 
> No custom scripts required: all is covered by common orangepi scripts.
> However new option BR2_DOWNLOAD_FORCE_CHECK_HASHES requires checksums
> for all the BSP components. They are added as board specific patches.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---

You had forgotten to add board/orangepi/orangepi-zero2w/ to the
DEVELOPERS file, so I did that when applying. Thanks for this
contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
