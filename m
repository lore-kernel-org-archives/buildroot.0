Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7062C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 406306FB3C;
	Sun, 11 Sep 2022 09:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 406306FB3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_GyDJWBlBxL; Sun, 11 Sep 2022 09:06:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39A566FB36;
	Sun, 11 Sep 2022 09:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39A566FB36
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 259881BF990
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92DB06FB28
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92DB06FB28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yTJa5xAbSUZX for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9BC7606E6
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9BC7606E6
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B53C283620; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 23:18:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 028611be7195b4e616ea1910126aae36e62d33bf
X-Git-Newrev: 4a340349bccf74ff402ae5487fcd1d7d4af5db1b
X-Patchwork-Hint: ignore
Message-Id: <20220911084826.B53C283620@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: allow to
 generate BL2 from RCW
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a340349bccf74ff402ae5487fcd1d7d4af5db1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the option BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW that
allows TF-A to encapsulate a pre-loaded RCW (Reset Configuration Word)
file into BL2.

Upcoming NXP QorIQ family board needs this option.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in               | 8 ++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 100ac83482..aa571502b3 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -162,6 +162,14 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
 	  for the 'qemu_sbsa' platform. In this case, due to the EDK2
 	  build system, the dependency between ATF and EDK is reversed.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW
+	bool "Include NXP RCW in BL2"
+	depends on BR2_PACKAGE_HOST_QORIQ_RCW
+	help
+	  Include the NXP RCW (Reset Control Word) in BL2. See
+	  package/qoriq-rcw/ for more details. This is mostly useful
+	  on NXP LayerScape platforms.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS
 	string "Additional ATF make targets"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 7c4e7edb00..246c0699bb 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -144,6 +144,12 @@ define ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
 endef
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-qoriq-rcw
+ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += pbl
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RCW=$(BINARIES_DIR)/PBL.bin
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
