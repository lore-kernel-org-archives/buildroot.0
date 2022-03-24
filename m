Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EFDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 20:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FE0241C71;
	Thu, 24 Mar 2022 20:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GbWUhAKTxknu; Thu, 24 Mar 2022 20:21:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08933410A1;
	Thu, 24 Mar 2022 20:21:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75B1C1BF333
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72DA58447A
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=embeddedts.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xtj7aD0RH3jF for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 20:20:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.183])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E1E184477
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 20:20:57 +0000 (UTC)
Received: from 1nXTwz-0006lX-Tz by out3a.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1nXTx2-0006th-U7; Thu, 24 Mar 2022 13:20:56 -0700
Received: by emcmailer; Thu, 24 Mar 2022 13:20:56 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3a.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1nXTwz-0006lX-Tz; Thu, 24 Mar 2022 13:20:53 -0700
Received: from tsdebian.ts-local.net (unknown [75.164.75.221])
 by mail.embeddedts.com (Postfix) with ESMTPSA id 82F21140E8;
 Thu, 24 Mar 2022 13:20:52 -0700 (MST)
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 13:20:24 -0700
Message-Id: <20220324202026.5688-3-kris@embeddedTS.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220324202026.5688-1-kris@embeddedTS.com>
References: <20220324202026.5688-1-kris@embeddedTS.com>
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256
X-Authenticated_ID: 
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (b)
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedTS.com; s=mailanyone20220121;
 h=References:In-Reply-To:Message-Id:Date:To:From;
 bh=ewfjUG9Gm+zQAXY/BoX4EkmAoaX9D/dSf4Cr6aZoJnc=;
 b=OhL85dlm//bmZF+HdyP+hgO5aQ9HrJ1/O8uFvs3gZ3U1jbVy3udzzO1Gzg4ddZFB4g2lVRJytAonMNkqfCM8zpFlk0/GhtUgFzxoyBSyXKAIHRvWcrgM9lJr/QBZCw7Xc3lvVJWv2VCDA5w1Ey3HlrKDo4fpCg9gnwIhph9DbhkvG24Mb421fQbVeciNr6Ufss274SMiSdLeRjosNeP9G9NxeiIrJ3UF9aC5WT8hPflvM7YlagMdDpZgxTDoX0iHa5bAFV42eicAXKmbiI1BM+9lqlFTdX2y+bLIR15dMzftvuZw1OL+j4CNL4TpF2RBuJ3GD2gprmkYmftv9Jjiaw==;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
Subject: [Buildroot] [PATCH 2/4] package/wilc-firmware: rename from
 wilc1000-firmware
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: Kris Bahnsen <kris@embeddedTS.com>
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Featherston <mark@embeddedTS.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kris Bahnsen <kris@embeddedTS.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Separates out WILC1000 and WILC3000 in to individual config options
since in reality only one or the other set would be needed.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
---
 DEVELOPERS                                                 |  5 ++++-
 package/Config.in                                          |  2 +-
 package/{wilc1000-firmware => wilc-firmware}/Config.in     |  4 ++--
 .../wilc-firmware.hash}                                    |  2 +-
 .../wilc-firmware.mk}                                      | 14 +++++++-------
 5 files changed, 15 insertions(+), 12 deletions(-)
 rename package/{wilc1000-firmware => wilc-firmware}/Config.in (92%)
 rename package/{wilc1000-firmware/wilc1000-firmware.hash => wilc-firmware/wilc-firmware.hash} (62%)
 rename package/{wilc1000-firmware/wilc1000-firmware.mk => wilc-firmware/wilc-firmware.mk} (67%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 942bb8fe9c..17becfa189 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1660,6 +1660,9 @@ F:	board/octavo/osd32mp1-red/
 F:	configs/octavo_osd32mp1_brk_defconfig
 F:	configs/octavo_osd32mp1_red_defconfig
 
+N:	Kris Bahnsen <kris@embeddedTS.com>
+F:	package/wilc-firmware/
+
 N:	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 F:	package/bcusdk/
 F:	package/libpthsem/
@@ -1757,7 +1760,7 @@ F:	package/python-json-schema-validator/
 F:	package/python-keyring/
 F:	package/python-simplejson/
 F:	package/python-versiontools/
-F:	package/wilc1000-firmware/
+F:	package/wilc-firmware/
 
 N:	Maeva Manuel <maeva.manuel@oss.nxp.com>
 F:	board/freescale/imx8qmmek/
diff --git a/package/Config.in b/package/Config.in
index 0d5d763180..a175f105f3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -432,7 +432,7 @@ menu "Firmware"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
-	source "package/wilc1000-firmware/Config.in"
+	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
 endmenu
diff --git a/package/wilc1000-firmware/Config.in b/package/wilc-firmware/Config.in
similarity index 92%
rename from package/wilc1000-firmware/Config.in
rename to package/wilc-firmware/Config.in
index 0734c7ad99..23abc88712 100644
--- a/package/wilc1000-firmware/Config.in
+++ b/package/wilc-firmware/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WILC1000_FIRMWARE
 	bool "wilc1000-firmware"
+	select BR2_PACKAGE_WILC_FIRMWARE
 	help
 	  Firmware for Microchip WILC1000 wireless device
 
@@ -12,9 +13,9 @@ config BR2_PACKAGE_WILC1000_FIRMWARE
 
 	  https://github.com/linux4wilc/firmware
 
-if BR2_PACKAGE_WILC1000_FIRMWARE
 config BR2_PACKAGE_WILC3000_FIRMWARE
 	bool "wilc3000-firmware"
+	select BR2_PACKAGE_WILC_FIRMWARE
 	help
 	  Firmware for Microchip WILC3000 wireless device
 
@@ -26,4 +27,3 @@ config BR2_PACKAGE_WILC3000_FIRMWARE
 	  These will be installed to /lib/firmware/mchp/
 
 	  https://github.com/linux4wilc/firmware
-endif
diff --git a/package/wilc1000-firmware/wilc1000-firmware.hash b/package/wilc-firmware/wilc-firmware.hash
similarity index 62%
rename from package/wilc1000-firmware/wilc1000-firmware.hash
rename to package/wilc-firmware/wilc-firmware.hash
index 9d55be9edc..2f1fc9964d 100644
--- a/package/wilc1000-firmware/wilc1000-firmware.hash
+++ b/package/wilc-firmware/wilc-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  29bb5739136cdb4088cb52af59badce05cc7e562bca40e9f29fef7f8f7c19cb8  wilc1000-firmware-wilc_linux_15_6.tar.gz
+sha256  29bb5739136cdb4088cb52af59badce05cc7e562bca40e9f29fef7f8f7c19cb8  wilc-firmware-wilc_linux_15_6.tar.gz
diff --git a/package/wilc1000-firmware/wilc1000-firmware.mk b/package/wilc-firmware/wilc-firmware.mk
similarity index 67%
rename from package/wilc1000-firmware/wilc1000-firmware.mk
rename to package/wilc-firmware/wilc-firmware.mk
index 2bea9febe2..63fd100421 100644
--- a/package/wilc1000-firmware/wilc1000-firmware.mk
+++ b/package/wilc-firmware/wilc-firmware.mk
@@ -1,13 +1,13 @@
 ################################################################################
 #
-# wilc1000-firmware
+# wilc-firmware
 #
 ################################################################################
 
-WILC1000_FIRMWARE_VERSION = wilc_linux_15_6
-WILC1000_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC1000_FIRMWARE_VERSION))
+WILC_FIRMWARE_VERSION = wilc_linux_15_6
+WILC_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC_FIRMWARE_VERSION))
 
-WILC1000_FIRMWARE_LICENSE = PROPRIETARY
+WILC_FIRMWARE_LICENSE = PROPRIETARY
 
 ifeq ($(BR2_PACKAGE_WILC1000_FIRMWARE),y)
 WILC1000_FIRMWARE_FILES += \
@@ -20,15 +20,15 @@ WILC1000_FIRMWARE_FILES += \
 	wilc3000_wifi_firmware.bin
 endif
 
-define WILC1000_FIRMWARE_INSTALL_FILES
+define WILC_FIRMWARE_INSTALL_FILES
 	cd $(@D) && \
 		$(TAR) cf install.tar $(sort $(WILC1000_FIRMWARE_FILES)) && \
 		$(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware/mchp
 endef
 
-define WILC1000_FIRMWARE_INSTALL_TARGET_CMDS
+define WILC_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/mchp/
-	$(WILC1000_FIRMWARE_INSTALL_FILES)
+	$(WILC_FIRMWARE_INSTALL_FILES)
 endef
 
 $(eval $(generic-package))
-- 
2.11.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
