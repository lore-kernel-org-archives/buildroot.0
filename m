Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646D0C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 22:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F02141CA1;
	Fri, 22 Apr 2022 22:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cqvp9e0FAfxP; Fri, 22 Apr 2022 22:37:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A46A541A2A;
	Fri, 22 Apr 2022 22:37:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 773001C11A9
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 741E261412
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:36:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=embeddedts.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MHzxxLHKue_f for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 22:36:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.185])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 870296140F
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 22:36:58 +0000 (UTC)
Received: from 1ni1tX-000545-TD by out3c.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1ni1tY-00055i-VP; Fri, 22 Apr 2022 15:36:56 -0700
Received: by emcmailer; Fri, 22 Apr 2022 15:36:56 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3c.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1ni1tX-000545-TD; Fri, 22 Apr 2022 15:36:55 -0700
Received: from tsdebian.ts-local.net (unknown [75.164.70.254])
 by mail.embeddedts.com (Postfix) with ESMTPSA id 51D4840838;
 Fri, 22 Apr 2022 15:36:54 -0700 (MST)
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 15:36:08 -0700
Message-Id: <20220422223611.10443-2-kris@embeddedTS.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220422223611.10443-1-kris@embeddedTS.com>
References: <20220422223611.10443-1-kris@embeddedTS.com>
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
 bh=vY5HvWXfsQN2WTUNm9d42VX5ukOadLQ3LpxsP3p8uug=;
 b=KwzgzrupQ1dua6khP4jOPE7YU614W2Uc5M66d6Rwi7yKUpZ64XOD73RLdKaOug5ilb/svdvSNokXWidUmrop/mdtqX+GxMBT1Si+I/7n/s7eKj+LgKWlvgbpONMwFvLa2YZWUZjHqnQidJUjIxjVeiAHiO2j133Kbdzmqe+wC/yHsjVeumknRgjIg83dgnGC81Gw5bJTueGlRFn8t9CRnO0uMKlt5qL7ihejBWssns9iqRFIWDbESjAkS+lO7Cui9ymj1vOxiojvOrW/WxvBeVMNJTxXEwoF6hBL12v333dYqfRvMtwzVvGJ2vM3TYNVU49hbekZtFjYe0By08sWvQ==;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
Subject: [Buildroot] [PATCH v2 1/4] package/wilc1000-firmware: bump to 15.6
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
 Mark Featherston <mark@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Supports both WILC1000 (Wi-Fi only) and WILC3000 (Wi-Fi/BLE) hardware.

To support WILC3000 this commit adds a separate config option,
the original config option from this package is still valid.

License information copied from Microchip's buildroot-external
project.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
---
 package/wilc1000-firmware/Config.in              | 27 +++++++++++++++++++--
 package/wilc1000-firmware/wilc1000-firmware.hash |  2 +-
 package/wilc1000-firmware/wilc1000-firmware.mk   | 31 ++++++++++++++++--------
 3 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/package/wilc1000-firmware/Config.in b/package/wilc1000-firmware/Config.in
index df8a7a6b60..0734c7ad99 100644
--- a/package/wilc1000-firmware/Config.in
+++ b/package/wilc1000-firmware/Config.in
@@ -1,6 +1,29 @@
 config BR2_PACKAGE_WILC1000_FIRMWARE
 	bool "wilc1000-firmware"
 	help
-	  Firmware for Atmel Wilc1000 wireless device
+	  Firmware for Microchip WILC1000 wireless device
 
-	  https://github.com/linux4sc/wireless-firmware.git
+	  These binary blobs are provided directly from Microchip.
+	  Ideally, the firmware version should match driver version.
+	  Generally, the latest firmware would be acceptible regardless
+	  of driver version.
+
+	  These will be installed to /lib/firmware/mchp/
+
+	  https://github.com/linux4wilc/firmware
+
+if BR2_PACKAGE_WILC1000_FIRMWARE
+config BR2_PACKAGE_WILC3000_FIRMWARE
+	bool "wilc3000-firmware"
+	help
+	  Firmware for Microchip WILC3000 wireless device
+
+	  These binary blobs are provided directly from Microchip.
+	  Ideally, the firmware version should match driver version.
+	  Generally, the latest firmware would be acceptible regardless
+	  of driver version.
+
+	  These will be installed to /lib/firmware/mchp/
+
+	  https://github.com/linux4wilc/firmware
+endif
diff --git a/package/wilc1000-firmware/wilc1000-firmware.hash b/package/wilc1000-firmware/wilc1000-firmware.hash
index 5344efe517..9d55be9edc 100644
--- a/package/wilc1000-firmware/wilc1000-firmware.hash
+++ b/package/wilc1000-firmware/wilc1000-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a2e7a327dd545ba2051946f7613005cbde88fdd952afb8eecdd1dacda7e767d2  v14.1_Firmware.zip
+sha256  29bb5739136cdb4088cb52af59badce05cc7e562bca40e9f29fef7f8f7c19cb8  wilc1000-firmware-wilc_linux_15_6.tar.gz
diff --git a/package/wilc1000-firmware/wilc1000-firmware.mk b/package/wilc1000-firmware/wilc1000-firmware.mk
index 6f504d67a0..0af81c7110 100644
--- a/package/wilc1000-firmware/wilc1000-firmware.mk
+++ b/package/wilc1000-firmware/wilc1000-firmware.mk
@@ -4,21 +4,32 @@
 #
 ################################################################################
 
-WILC1000_FIRMWARE_VERSION = 14.1
-WILC1000_FIRMWARE_SITE = https://github.com/linux4sc/wireless-firmware/archive
-WILC1000_FIRMWARE_SOURCE = v$(WILC1000_FIRMWARE_VERSION)_Firmware.zip
+WILC1000_FIRMWARE_VERSION = wilc_linux_15_6
+WILC1000_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC1000_FIRMWARE_VERSION))
 
-WILC1000_FIRMWARE_LICENSE = PROPRIETARY
+WILC1000_FIRMWARE_LICENSE = Microchip firmware
+WILC1000_FIRMWARE_LICENSE_FILES = LICENSE.wilc_fw
 
-define WILC1000_FIRMWARE_EXTRACT_CMDS
-	$(UNZIP) -d $(BUILD_DIR) $(WILC1000_FIRMWARE_DL_DIR)/$(WILC1000_FIRMWARE_SOURCE)
-	mv $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware/* $(@D)
-	rmdir $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware
+ifeq ($(BR2_PACKAGE_WILC1000_FIRMWARE),y)
+WILC1000_FIRMWARE_FILES += \
+	wilc1000_wifi_firmware.bin
+endif
+
+ifeq ($(BR2_PACKAGE_WILC3000_FIRMWARE),y)
+WILC1000_FIRMWARE_FILES += \
+	wilc3000_ble_firmware.bin \
+	wilc3000_wifi_firmware.bin
+endif
+
+define WILC1000_FIRMWARE_INSTALL_FILES
+	cd $(@D) && \
+		$(TAR) cf install.tar $(sort $(WILC1000_FIRMWARE_FILES)) && \
+		$(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware/mchp
 endef
 
 define WILC1000_FIRMWARE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/wilc1003_firmware.bin \
-		$(TARGET_DIR)/lib/firmware/atmel/wilc1003_firmware.bin
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/mchp/
+	$(WILC1000_FIRMWARE_INSTALL_FILES)
 endef
 
 $(eval $(generic-package))
-- 
2.11.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
