Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A4CEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 18:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF7C8417A9;
	Mon, 10 Jul 2023 18:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF7C8417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnJQS_wmYmvt; Mon, 10 Jul 2023 18:50:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0081417AD;
	Mon, 10 Jul 2023 18:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0081417AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2601BF3AE
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8E8782052
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8E8782052
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Td0KU3xkfs0z for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 18:50:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1468182051
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 18:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1468182051
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0173586CC7; Mon, 10 Jul 2023 18:50:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 20:49:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af85e45afcd677ce240fc951a18de9afb0ec0015
X-Git-Newrev: 70ff5377f233ff936d31956b4c2747280d25d289
X-Patchwork-Hint: ignore
Message-Id: <20230710185003.0173586CC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx: ensure
 the linux firmware is installed first
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=70ff5377f233ff936d31956b4c2747280d25d289
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There was some imx SDMA firmware in the base linux-firmware package at
one time, but the firmware-imx is updated with the latest versions
from NXP releases.

This just ensures a dependency is set so that the firmware-imx package
will always come later in case an overlap occurs again.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Reviewed-by: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 99fe71a91c..4cceb67019 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -14,6 +14,10 @@ FIRMWARE_IMX_REDISTRIBUTE = NO
 
 FIRMWARE_IMX_INSTALL_IMAGES = YES
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE),y)
+FIRMWARE_IMX_DEPENDENCIES += linux-firmware
+endif
+
 define FIRMWARE_IMX_EXTRACT_CMDS
 	$(call NXP_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
