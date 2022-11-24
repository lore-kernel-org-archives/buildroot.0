Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E03FC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3401242A41;
	Mon, 20 Feb 2023 21:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3401242A41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ny5kqWZG3b2Z; Mon, 20 Feb 2023 21:34:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E959B42DAA;
	Mon, 20 Feb 2023 21:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E959B42DAA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4978F1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 464A561026
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 464A561026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZzH1Xl5SwtXD for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BE3A61081
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BE3A61081
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A3AA86494; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 22:59:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 269c1e9368e5473fa0dc117ff6b020143c014c8b
X-Git-Newrev: 9fe82e56d205c1fb3efe4ef6ae5b24d2284f1429
X-Patchwork-Hint: ignore
Message-Id: <20230220205153.5A3AA86494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wilc-driver: fix build
 failure due to missing Linux options
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fe82e56d205c1fb3efe4ef6ae5b24d2284f1429
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable Linux options depending on the bus has been chosen, so:
1) enable by default common Linux options:
CONFIG_NET
CONFIG_WIRELESS
CONFIG_CFG80211
CONFIG_CRC_ITU_T
CONFIG_CRC7
2) enable for SDIO bus:
CONFIG_MMC
3) enable for SPI bus:
CONFIG_SPI

Fixes:
http://autobuild.buildroot.net/results/d8c4f0f959dd2ec110db8a75980f13172c3c116c/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Kris Bahnsen <Kris@embeddedTS.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wilc-driver/wilc-driver.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/wilc-driver/wilc-driver.mk b/package/wilc-driver/wilc-driver.mk
index a89af30e29..a7a902b6db 100644
--- a/package/wilc-driver/wilc-driver.mk
+++ b/package/wilc-driver/wilc-driver.mk
@@ -13,11 +13,17 @@ WILC_DRIVER_LICENSE_FILES = LICENSE
 ifeq ($(BR2_PACKAGE_WILC_DRIVER_SPI),y)
 WILC_DRIVER_MODULE_MAKE_OPTS += \
 	CONFIG_WILC_SPI=m
+define WILC_DRIVER_SPI_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SPI)
+endef
 endif
 
 ifeq ($(BR2_PACKAGE_WILC_DRIVER_SDIO),y)
 WILC_DRIVER_MODULE_MAKE_OPTS += \
 	CONFIG_WILC_SDIO=m
+define WILC_DRIVER_SDIO_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
+endef
 endif
 
 ifeq ($(BR2_PACKAGE_WILC_DRIVER_SDIO_OOB),y)
@@ -25,5 +31,15 @@ WILC_DRIVER_MODULE_MAKE_OPTS += \
 	CONFIG_WILC_HW_OOB_INTR=y
 endif
 
+define WILC_DRIVER_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC_ITU_T)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC7)
+	$(WILC_DRIVER_SPI_LINUX_CONFIG_FIXUPS)
+	$(WILC_DRIVER_SDIO_LINUX_CONFIG_FIXUPS)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
