Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E205C433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 14:46:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E089461B95
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 14:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E089461B95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF894605D8;
	Mon, 15 Nov 2021 14:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPpLhpRU-mM8; Mon, 15 Nov 2021 14:46:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C137605DC;
	Mon, 15 Nov 2021 14:46:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF4F1BF343
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 14:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BB6880D53
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 14:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajfUzIsWhrkn for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 14:46:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DF3E80D4F
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 14:46:24 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 8FCB710000B;
 Mon, 15 Nov 2021 14:46:20 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 15 Nov 2021 15:46:20 +0100
Message-Id: <20211115144620.80555-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/rpi-firmware: update vcdbg runtime
 dependencies
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
Cc: mahyar.koshkouei@gmail.com, thomas.petazzoni@bootlin.com,
 martin@barkynet.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We used to select the rpi-userland to make the vcdbg tool work but it
conflict with the use of mesa. It implies we can not install vcdbg with
mesa libraries but it is false. We could use the prebuilt libraries from
the rpi-firmware sources to run vcdbg.

This patch removes the select dependency of rpi-userland package and
installs the prebuilt libraries needed by vcdbg only if rpi-userland
is not selected.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/rpi-firmware/Config.in       |  1 -
 package/rpi-firmware/rpi-firmware.mk | 11 +++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index f5a25c5680..d8bcc8ba96 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -98,7 +98,6 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
 	depends on BR2_arm # prebuilt arm binary, rpi-userland
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_INSTALL_LIBSTDCPP # rpi-userland
-	select BR2_PACKAGE_RPI_USERLAND
 	help
 	  Install vcdbg, to help debug communication with the GPU.
 
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index d74f7155c7..743a259dc3 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -32,12 +32,23 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 endef
 endif
 
+# Install prebuilt libraries if RPI_USERLAND not enabled
+ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
+define RPI_FIRMWARE_INSTALL_TARGET_LIB
+	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libvcos.so \
+		$(TARGET_DIR)/usr/lib/libvcos.so
+	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libdebug_sym.so \
+		$(TARGET_DIR)/usr/lib/libdebug_sym.so
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
 define RPI_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0700 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
 		$(TARGET_DIR)/usr/sbin/vcdbg
 	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libelftoolchain.so \
 		$(TARGET_DIR)/usr/lib/libelftoolchain.so
+	$(RPI_FIRMWARE_INSTALL_TARGET_LIB)
 endef
 endif # INSTALL_VCDBG
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
