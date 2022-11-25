Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F05C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 22:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44EE2611FE;
	Fri, 25 Nov 2022 22:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44EE2611FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ft22bjs3o1M; Fri, 25 Nov 2022 22:19:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CCBE611D7;
	Fri, 25 Nov 2022 22:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CCBE611D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 302951BF3D0
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 22:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 156068142F
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 22:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 156068142F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cd2YEOKEAZKV for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 22:18:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ABD681414
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 22:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ABD681414
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28052846F3; Fri, 25 Nov 2022 22:18:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 23:16:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4060a6d5307d81475f8cc3b572cd6eca9a94ffbf
X-Git-Newrev: b49d8c03da2dc25aa28f14a3db1d38298221c7c3
X-Patchwork-Hint: ignore
Message-Id: <20221125221857.28052846F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/qoriq-cadence-dp-firmware: also install to target if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=b49d8c03da2dc25aa28f14a3db1d38298221c7c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This firmware is loaded by U-Boot, so when U-Boot is loading the Linux
kernel from the root filesystem, it is very likely that it will also
want to load this firmware from the root filesystem.

Therefore, this patch makes sure that that Cadence DP firmware is
installed alongside the kernel image in /boot in the root filesystem
when the kernel is installed
there (BR2_LINUX_KERNEL_INSTALL_TARGET=y).

We keep installing the firmware in $(BINARIES_DIR) in any case.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
index 2ccdd8b903..4f75287269 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -11,12 +11,18 @@ QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP Semiconductor Software License Agreement
 QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING EULA EULA.txt
 QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
+ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),)
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET = NO
+endif
 
 define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
 	$(call NXP_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
 endef
 
+define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(TARGET_DIR)/boot/ls1028a-dp-fw.bin
+endef
+
 define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
