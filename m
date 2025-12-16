Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCC0D609A7
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 15:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0BBC827A1;
	Tue, 16 Dec 2025 15:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V711yBXa0TIx; Tue, 16 Dec 2025 15:15:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC10882768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765898117;
	bh=pgc6uDBTeLITvA9OIYk26V39Bpsk8RospvW6aJFOntA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=kylpzPr2DdC2CJsKDwC/GMx3D1pXhqzNUN4jKRwu1VBC/1ICA9WjMpT4Wsz6jJln2
	 EygCGOIzmdPkaabMU/uL7MaCQHEIGx6CFdPTjOkMol+6E5E98VXyec1oMvGK0nUO/w
	 9GKnoIJPbSE9COU5RcITIKPUdLYA/gntXTR/q2a4a0Fk4aCXvha60Ha+WyEAHcD0UB
	 uIr6yFhEJDlgNnUvaaybkERCDJ33TB8spnbQVTt1UWZtWneaeNaKHHq8d/mdpDGRDM
	 LhmGg0YnVSMoaK5wauYRXuCVVivo+H1kXvGO7aSEseehKEVi3EjSUGIiFd1wTJGP84
	 vUL2B6AihNjuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC10882768;
	Tue, 16 Dec 2025 15:15:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35C96372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2877640BA5
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j08AHxVN0YWj for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 15:15:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2AB1F4089D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AB1F4089D
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AB1F4089D
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:15:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E02C8C1967A;
 Tue, 16 Dec 2025 15:14:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 519FB6071C;
 Tue, 16 Dec 2025 15:15:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EEC64119A8E0F; Tue, 16 Dec 2025 16:15:07 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 15:14:43 +0000
Message-ID: <20251216151449.395253-4-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216151449.395253-1-kory.maincent@bootlin.com>
References: <20251216151449.395253-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765898108; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=bCcGiylhloSC+vwoRPWvXczjMeaVCeU+Fw8njWSr9Kc=;
 b=Zu1An3d+rOeBOXzVRIN/lNUxaTCmHHxuXRxLe94rPNHgx3AtlUWJIILN9V8JvfTBB0nFa3
 PWv/dew6tbBoPeHr+nWcloa6cFguU85AOriXvmjQ2YbEwt4bbFzwRHsUSr2tym0ibX6Gy3
 JDwGtK+DNi8zmhyV2aFlmD8QTtygoDX/M6Wv6/KKsZMs+tDtqcT9c0UoPMueGmeOMG771Y
 iFsxaux3zc82Tru+beNs7M6M+3l24v/IGx/C7JzxxFwZbvhXi5It1PakJULaa/aQR7tutX
 05BUcP9NhKMUgDfROduB4OahUhznyxcTJl4dvr5RHmTD1bBHTt5NE2VJoJtFkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Zu1An3d+
Subject: [Buildroot] [PATCH v3 3/5] board/beaglebone: Add BeagleBone Green
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
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>

Add the am335x-bonegreen-eco device tree to enable support for the
BeagleBone Green Eco variant. This ensures the device tree is built
from the Linux kernel sources and included in the boot partition.

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
index 04c63af8c1..6a17c737d0 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -16,7 +16,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beagleboard/beaglebone/linux.config"
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
