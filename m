Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BA7C52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 22:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ADFD8146C;
	Fri,  9 Aug 2024 22:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WaZJZBvSJQYe; Fri,  9 Aug 2024 22:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D20278164B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D20278164B;
	Fri,  9 Aug 2024 22:00:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0441BF286
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37109414EB
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QI3eeBiuRYMM for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 22:00:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E1DB5414D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1DB5414D3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1DB5414D3
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 22:00:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00152240006;
 Fri,  9 Aug 2024 22:00:15 +0000 (UTC)
Date: Sat, 10 Aug 2024 00:00:15 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20240810000015.42bfa535@windsurf>
In-Reply-To: <20240809155527.3821320-1-neal.frager@amd.com>
References: <20240809155527.3821320-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723240816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hs/iEoZ4nsSGi60MR+id2ZomUR8U/+8rJQdeDT1C3r4=;
 b=AC0afGT0D/IGp6vXOA5HraAyn9uHiXrrOJdEpZ/3fBNJMQOtrYwyLSKSK4dyVzkjihXGTo
 SKR7i3XyGVPiGx0LwxtUPN8HxPF/ASIZYqVTRbGQAlapWDiMRtuoqrRLQv6A0FECfYcpqh
 3wMmUciMdGR5W3/WecXLq/0pvwiL3/yN0gKj1I524QzQu0KxTd/BjLp51S4+ljlodKFp4l
 HNa+klBtGTN92/N0VeL6hND4MYvZxrNaX3v4BASYkEKy6gJixWtg2PbbgPuQ9PVkEMNHSN
 OhLmW+6S4SEpLB1hjkOpnRGbrll1Duqd+gsZ6+P3xeiYKVOfAtv7PCM1wRuS8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AC0afGT0
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu106_defconfig:
 move to board rev1.0
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 9 Aug 2024 16:55:27 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Migrate the zynqmp_zcu106_defconfig to rev1.0 ddr memory, since all new boards
> will be using the rev1.0 ddr memory.
> 
> This patch also adds documentation in the board/zynqmp/readme.txt explaining
> the issue related to the change in ddr memory.  Should users not see anything
> printing from the board during boot, the most likely issue is that the board
> has the original ddr memory and the u-boot device tree needs to be configured
> accordingly to revA.
> 
> Original DDR Memory:
> BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
> 
> More information regarding this issue can be found here:
> https://support.xilinx.com/s/article/71961?language=en_US
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynqmp/readme.txt         | 26 ++++++++++++++++++++++++++
>  configs/zynqmp_zcu106_defconfig |  2 +-
>  2 files changed, 27 insertions(+), 1 deletion(-)

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
