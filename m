Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6AED44162
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 10:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03BC6403AC;
	Fri, 12 Dec 2025 10:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGMNG8KlAEzf; Fri, 12 Dec 2025 10:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22E2E40724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765534569;
	bh=AF3mGM5wRLLUWxkYVgXMV/ybnCs2Mo8TMutxfrvPhdg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=dJQHtSBfCKuQnnsZ3JHjKgUNLhLD4lE+VlUAiAe12+i2X8B903KrYL9F8/i+rvg+D
	 3WfjXSZPyjHz9k6GdB6X38+G1zkO9c7ZcNFjsa8hQIfkGMWwqjN2RRNG7SOODllQ8w
	 TqZC8Dpn8ewTIV6NmUMo+QrPCCLbQ/4jPfdLwjiN2WxNqC8C7BH4lOZPrVL0Xo0aPH
	 jVaVGNFCEqhsjS0bursCtvLgqTVHmXYdaH4RBicUzaxcOQcFikioxZRjV9/Snip5AL
	 sHGdinQpn1fwPyb3o3SmecygoffIq6JsfLAhHwHbXGrpPcorOI9ehJFTyWGTWG/88W
	 lyFaQVQZUohaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22E2E40724;
	Fri, 12 Dec 2025 10:16:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F738E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16C988110D
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOXLMLwa3mzk for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 10:16:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1322C810D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1322C810D6
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1322C810D6
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:16:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EB7B34E41BAC
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:16:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C184C606DF;
 Fri, 12 Dec 2025 10:16:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A87D8103C8DFF; Fri, 12 Dec 2025 11:16:03 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 12 Dec 2025 10:15:30 +0000
Message-ID: <20251212101533.820554-4-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212101533.820554-1-kory.maincent@bootlin.com>
References: <20251212101533.820554-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765534564; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ugt4iE5fNRikgbLdzYDUdd+bQI8KuxH5EimG5WSdfI0=;
 b=tFU4i8AlmD255mAZ6v1PEN7np9Jwhkr5jD7dluoJgcJZjCcZskWuWS/WtHhJ3fE9LTy2db
 89Qf3YjIZ26ih7tnNOWl/nQ3uEH8fhEr6iriPR1KQkD3PwLppV9onyVmOF0wwptGeMGX7b
 Qapi/fswRNixxvEYHjO11SRPs6XndLJlu9fw8FjHoo66/UkSic7FMBVU73JNUdT3RAPJSr
 wFWVii8386JV6fCQFSBNmhVJypL43OpZOsl5UMVWKzYQZ7zMjSNsjDQZWF/LIRVzoasYZh
 kOU3plpnabEG7l4B6HHyg74tiTRGc+o2EzpJmhyeqreIkm9zIAlEoFGaedSIwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=tFU4i8Al
Subject: [Buildroot] [PATCH 3/3] board/beaglebone: Add BeagleBone Green Eco
 support
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
 Bryan Brattlof <bb@ti.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Lothar Felten <lothar.felten@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>

Add the am335x-bonegreen-eco device tree to enable support for the
BeagleBone Green Eco variant. This ensures the device tree is built
from the Linux kernel sources and included in the boot partition.

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
index cf884bae23..955f2dfc1a 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -11,7 +11,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/ti/common/am335x/linux.config"
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
