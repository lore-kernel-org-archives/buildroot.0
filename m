Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97932C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 16:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B6FF60854;
	Mon,  3 Jun 2024 16:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaOWYhRuAHyy; Mon,  3 Jun 2024 16:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2455060A7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2455060A7A;
	Mon,  3 Jun 2024 16:26:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28C881BF865
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 159D540992
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rNqr7jgWray for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 16:25:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E193340930
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E193340930
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E193340930
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:25:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A34C9C328C
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:21:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6C871BF204;
 Mon,  3 Jun 2024 16:20:58 +0000 (UTC)
Date: Mon, 3 Jun 2024 18:20:57 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240603182057.4a26b5d0@booty>
In-Reply-To: <20240603121435.197680-1-neal.frager@amd.com>
References: <20240603121435.197680-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1717431659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8rU+0Z8Dtvsf8QIo3NuWGLMILrLQeEBa5aSDx7C1dc=;
 b=JPul/2T+PBC+z/8zHCrPBZRaltbsp6d+LiNHV60CFxsSoYqjeVIS3DSPccxfXNiNuGKNoY
 v2kyhmgxdYvSF2IRDkULho5kmetsx32TEZrAWwZNsOhoJISTKpyJdXhP8E4yd/z8dA+1Em
 8ZgLF5H7TQUJezqMkKYlggoKU6Qa09ivVpU5k3BC3eg6Y7JrVBh6cPIlHI5E/x3t5xOkbQ
 RbOxIFCN9AicdquXhbCxRmaFvho3S1dr/NFZCax9KPOVBkkZJ5nLRxCGcIhz98In2hEqd0
 c8IgSa+L0FzBnTweeqGjTKjfucBtnYSEi0+GIVBnt0z6jrPAWYYS7ggTgwff7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JPul/2T+
Subject: Re: [Buildroot] [PATCH v1 1/2] configs/zynqmp_kria_kv260_defconfig:
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
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 3 Jun 2024 13:14:34 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynqmp_kria_kv260_defconfig to xilinx-v2024.1 which includes
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
> This patch updates the addressing in the readme.txt accordingly.
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
