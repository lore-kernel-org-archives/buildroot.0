Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC391C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BCD6409EC;
	Fri, 12 Jul 2024 15:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEfMOI5fF3eF; Fri, 12 Jul 2024 15:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F111409FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F111409FB;
	Fri, 12 Jul 2024 15:00:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D6041BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 197BC405BD
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Hg4_P1qa2yg for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:00:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 652EC4010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 652EC4010F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 652EC4010F
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:00:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1D9E240009;
 Fri, 12 Jul 2024 15:00:15 +0000 (UTC)
Date: Fri, 12 Jul 2024 17:00:12 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20240712170012.7b912bf2@windsurf>
In-Reply-To: <20240618033849.2389758-1-neal.frager@amd.com>
References: <20240618033849.2389758-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720796416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mYC2g/jy9JKWbaJwPfDCio/xdRL6NW8NkIv+D5L0Ruo=;
 b=Z4V3LZtbWU4Y18WfWJ/vY2LMNeL8fxV6v8dwVN1I2RCYbukrBO/Afnnr3CqM+E9LqCVWQZ
 HwbTGDTTWOqtsg8MxPA0J6/J7Q6kCYNlegd7hrMtY3HJ8ueAMXZuOtd8+M2h6xN6IYs3kt
 WM82TVv4TWdQzZHXAXjqY2IJY/0VigNxPotuh06+2haTbb3H4+Nj3CG4zIciZYndQkYuZk
 YrTO9npDueST0WeyxYiX0laJHc97GEBNCKpgnTLV0B3MPNva6/ddBr+l/fvz97znHOGkLA
 9r5vHYyMfAB95J4ips78n3+CcmWDaDqn8I97NdwOvoN2QWbE1p4YLnlywqgXZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z4V3LZtb
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 18 Jun 2024 04:38:48 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

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
> ---
> V1->V2:
> - Removed numbers from patch and added Upstream link
> V2->V3:
> - Updated patch with version that does not init serdes
> V3->V4:
> - Migrated to xilinx-prebuilt
> - Added force check hashes
> ---
>  .checkpackageignore                           |   1 -
>  ...arm64-zynqmp-Enable-usb3-for-k24-som.patch |  81 ++++
>  ...nqmp-Fix-k24-psu_init_gpl.c-clocking.patch | 401 ------------------
>  ...ynqmp-Add-output-enable-pins-to-SOMs.patch |  79 ----
>  configs/zynqmp_kria_kd240_defconfig           |  20 +-
>  5 files changed, 93 insertions(+), 489 deletions(-)
>  create mode 100644 board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
>  delete mode 100644 board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch
>  delete mode 100644 board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch

Series applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
