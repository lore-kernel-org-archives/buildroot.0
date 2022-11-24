Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40BBC43217
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 22:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69B7F8225A;
	Thu, 24 Nov 2022 22:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69B7F8225A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fe6CE8v1LZ9; Thu, 24 Nov 2022 22:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A71CD8214B;
	Thu, 24 Nov 2022 22:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A71CD8214B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B41121BF2B4
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 22:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E67241C7C
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 22:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E67241C7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2Eujf0L0fi8 for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 22:10:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0A7B41C7B
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 22:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0A7B41C7B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A7D084647; Thu, 24 Nov 2022 22:10:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 22:59:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 269c1e9368e5473fa0dc117ff6b020143c014c8b
X-Git-Newrev: 9fe82e56d205c1fb3efe4ef6ae5b24d2284f1429
X-Patchwork-Hint: ignore
Message-Id: <20221124221056.8A7D084647@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wilc-driver: fix build failure due
 to missing Linux options
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
