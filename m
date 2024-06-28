Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5420DC2BBCA
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 07:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC13382103;
	Fri, 28 Jun 2024 07:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_fxD4fKHoqG; Fri, 28 Jun 2024 07:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D079A82302
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D079A82302;
	Fri, 28 Jun 2024 07:31:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E866D1BF3BE
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 07:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4B3F4176C
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 07:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfhzn40cm898 for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 07:31:49 +0000 (UTC)
X-Greylist: delayed 3291 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 28 Jun 2024 07:31:49 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4675E41767
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4675E41767
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4675E41767
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 07:31:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A9C760004;
 Fri, 28 Jun 2024 07:31:45 +0000 (UTC)
Date: Fri, 28 Jun 2024 09:31:44 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240628093144.6237a4bc@booty>
In-Reply-To: <20240618033849.2389758-1-neal.frager@amd.com>
References: <20240618033849.2389758-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719559906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dr6gSPnYrB7EQaVTGXP2/kQCJT1bse1DKIrLtXAZ4JI=;
 b=kmogIxxzwaaRl9eugE5yNJT5LiL0bZdZNW6sksfnF0ypc0vd/LROZEpOii1RXiNLlIbzY1
 NKKi6XJUFy/HFMfQP9QuqacAyWBGgQh4Cw4PX0ZYl8CTHG19/cJSXPbxsiy/gtqPXQ4JDP
 polHDuDObY3mu15M5acEEH6lueZOiELEE2+Tt0zzggQxSRa7g8GEuig3L0DBfF4sSSGg+z
 gtRLDnyxjLHzKHkYh0xIsJA/wfauWi145bIglI0A0lPwX8UVmNDLZNi0+dato0HR9+i7ce
 1ZNrTEYzYjQuGigfMJQKgeKKrqzmXOsZ8cf0yr69b2QqZbDsv1EsT2fv0GEEGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kmogIxxz
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/zynqmp_kria_kd240_defconfig:
 bump to xilinx-v2024.1
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Tue, 18 Jun 2024 04:38:48 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynqmp_kria_kd240_defconfig to xilinx-v2024.1 which includes
> the following updates:
> 
> - Linux v6.6.10
> - U-Boot v2024.01
> - ATF v2.10
> - PMUFW xilinx-v2024.1
> 
> Migrated u-boot to xilinx_zynqmp_kria_defconfig, so uboot.fragment no longer
> needed.
> 
> With u-boot 2024.1, CONFIG_SYS_SPI_U_BOOT_OFFS has a new meaning. It is now
> the offset between the base address of the boot.bin and u-boot.itb instead of
> a raw base address of u-boot.itb. This allows for A/B firmware updates since
> the u-boot.itb is set by default to a 0x80000 offset of the boot.bin.
> 
> Thus, Kria SOMs come with the following QSPI address table.
> 
> Partition A:
> 0x200000 - boot.bin
> 0x280000 - u-boot.itb
> 
> Partition B:
> 0xF80000 - boot.bin
> 0x1000000 - u-boot.itb
> 
> In addition, the kd240 still requires a board specific patch for the usb to sd
> card bridge device.  Without the board specific patch in the
> ./board/zynqmp/kria/kd240/patches directory, the usb will not come up correctly
> and u-boot will not be able to find the sd card containing the Linux kernel and
> file system.
> 
> Upstream: https://patchwork.ozlabs.org/project/uboot/patch/20240604083854.2033917-1-neal.frager@amd.com/
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
