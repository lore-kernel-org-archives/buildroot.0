Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2BDC2A096
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 10:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 592956062E;
	Mon,  5 Jan 2026 10:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEjrSQBvDNWJ; Mon,  5 Jan 2026 10:56:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7568160652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767610576;
	bh=Ay/79dGCZQTGE5RzUYlmNjGXtxQXepqETDEi+Kc7Uzg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=r+euwJoeC728KMviuvEqJUadEKE6QbIkNOWOS/BLG0vPQcCnAcuGVGu5ikT7KONDv
	 dJ9IvWFLuQO1NCP7cnPYTcDCBDqcdbEq5pJRmbotBBT1oRQxiEeQXaqzgmtWxV/lfT
	 OPHj843KcW9sY5E4acS941lRLNE54hDkmCxYp2gIzxoUtZPcwAyIY3nkCezdRh7kgv
	 tWvgImbQ9jzK2MQmaSjueRQuqbsEDGhWPiGmrE5OsV9bvAdC1Hvm1LLCGkmI6lMCkt
	 xKhgxbNVkDhybO4Z6ylvffVCaWR54HjR1PqmuhPPlq+1CjUjwGJ8lp6U9HC56wMY36
	 7Fd09Up6Z+gBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7568160652;
	Mon,  5 Jan 2026 10:56:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72F502DF
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59EA18077E
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44g91Vjo-7Nq for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 10:56:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 273358073F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 273358073F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 273358073F
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:56:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 239B24E41F6E;
 Mon,  5 Jan 2026 10:56:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EE86960726;
 Mon,  5 Jan 2026 10:56:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6DCEE103C8416; Mon,  5 Jan 2026 11:56:09 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 10:55:52 +0000
Message-ID: <20260105105558.1991-3-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105105558.1991-1-kory.maincent@bootlin.com>
References: <20260105105558.1991-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767610570; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=fnAgpLxM9UjjMGROpH/1xSn0vwRx2HxNheL43PwJrUM=;
 b=03sppLx7ZDHL5K7PNuNRURtgmoEmBj+ufKM2N7oBgn9uaPlg5FcA9OgPqR4Q95Kw/YnNWg
 LDKsaoEGPbQwECsMOmyEfxBSgqlqMTR5DmLm2P4HPR+Tg6nmkAyR/bC15ABntaVwmimMHz
 kEyjRaUbbYxZkk4NSA1FO5C9BtbxLaFy7WVIUUsbGJSy7LzRghZEYpD8ciuIOJ3tKWV+n2
 zqhfa7NvuiSTjb8XDfCThZNmsrX8W/Znja6LkF7tx61XrAbWa3ZbW0SJHrfc6SnZDXdft/
 fbXz68y11uedCla94o/tsQbvmnO5HfpRkQuVU9Tl7X4sBC+h0bwZEuk4GbLsWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=03sppLx7
Subject: [Buildroot] [PATCH v4 2/4] board/beaglebone: Add BeagleBone Green
 Eco support
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "Kory Maincent \(TI.com\)" <kory.maincent@bootlin.com>,
 Lothar Felten <lothar.felten@gmail.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Mohammed Sadik Shaik <s-sadik@ti.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>

Add the am335x-bonegreen-eco device tree to enable support for the
BeagleBone Green Eco variant. This ensures the device tree is built
from the Linux kernel sources and included in the boot partition.

Tested-by: Mohammed Sadik Shaik <s-sadik@ti.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 board/beagleboard/beaglebone/genimage.cfg | 1 +
 board/beagleboard/beaglebone/readme.txt   | 1 +
 configs/beaglebone_defconfig              | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/beagleboard/beaglebone/genimage.cfg b/board/beagleboard/beaglebone/genimage.cfg
index 4b026fda84..095e6e200b 100644
--- a/board/beagleboard/beaglebone/genimage.cfg
+++ b/board/beagleboard/beaglebone/genimage.cfg
@@ -12,6 +12,7 @@ image boot.vfat {
 			"am335x-bonegreen.dtb",
 			"am335x-boneblack-wireless.dtb",
 			"am335x-bonegreen-wireless.dtb",
+			"am335x-bonegreen-eco.dtb",
 			"extlinux"
 		}
 	}
diff --git a/board/beagleboard/beaglebone/readme.txt b/board/beagleboard/beaglebone/readme.txt
index a11377eaee..f896e1285a 100644
--- a/board/beagleboard/beaglebone/readme.txt
+++ b/board/beagleboard/beaglebone/readme.txt
@@ -31,6 +31,7 @@ output/images/
 +-- am335x-boneblack-wireless.dtb
 +-- am335x-boneblue.dtb
 +-- am335x-bonegreen.dtb
++-- am335x-bonegreen-eco.dtb
 +-- am335x-bonegreen-wireless.dtb
 +-- am335x-bone.dtb
 +-- am335x-evm.dtb
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 38d5d3b52f..11859a6c02 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless ti/omap/am335x-bonegreen-eco"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 BR2_PACKAGE_XZ=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
