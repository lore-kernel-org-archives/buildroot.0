Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC8CC02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41DDD401C2;
	Sat, 14 Sep 2024 13:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zm2MQPI0Q25O; Sat, 14 Sep 2024 13:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA42B4020B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA42B4020B;
	Sat, 14 Sep 2024 13:03:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 075AC1BF232
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0387F8417F
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1T9vtrK3cuW1 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:03:31 +0000 (UTC)
X-Greylist: delayed 3135 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 14 Sep 2024 13:03:30 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B80E84175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B80E84175
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=sabeeh-khan@ti.com;
 receiver=<UNKNOWN> 
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B80E84175
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:03:30 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48ECBEWx075897;
 Sat, 14 Sep 2024 07:11:14 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48ECBEa6005202
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 14 Sep 2024 07:11:14 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 14
 Sep 2024 07:11:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 14 Sep 2024 07:11:14 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com
 [128.247.83.36])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48ECBEXV105005;
 Sat, 14 Sep 2024 07:11:14 -0500
To: <buildroot@buildroot.org>
Date: Sat, 14 Sep 2024 07:10:15 -0500
Message-ID: <20240914121016.3530250-1-sabeeh-khan@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1726315874;
 bh=LPvmrULGvhN+p8DZcIDIN8bpu/DiWw4krqcUDpFUWrE=;
 h=From:To:CC:Subject:Date;
 b=Cds/7xg0xpBHmcMrzxzfIEyYOCeGqbdrusj06JYmHJoLFsiFCDKEbo6opae8MBhcD
 F34ObD71rNduxVXpoUd2ZGYf2xTHEoM11bUOzDw2m/Ko+7cO0pCV3TIAD+3iXEBzEY
 7F67Ajm2+axNhTrvdey8NASmvvLqAp3poaqw8Gaw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Cds/7xg0
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add WLAN and BLE
 chip TI cc33xx firmware option
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
From: Sabeeh Khan via buildroot <buildroot@buildroot.org>
Reply-To: Sabeeh Khan <sabeeh-khan@ti.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, Sabeeh Khan <sabeeh-khan@ti.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an option to install the cc33xx firmware files.
The TI cc33xx family of devices support WiFi 6 and BLE 5.4.

Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4a17ceaf0b..f0d5fefc2e 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -527,6 +527,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX
 	help
 	  Firmware files for WLAN and Bluetooth modules wl18xx
 
+config BR2_PACKAGE_LINUX_FIRMWARE_TI_CC33XX
+	bool "TI cc33xx"
+	help
+	  Firmware files for cc33xx WLAN and BLE family of chips
+
 config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WIL6210
 	bool "Qualcomm Atheros wil6210"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ae10e160b9..80a6f38a85 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -486,6 +486,15 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
 
+# cc33xx
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_CC33XX),y)
+LINUX_FIRMWARE_FILES += \
+	ti-connectivity/cc33xx_2nd_loader.bin \
+	ti-connectivity/cc33xx_fw.bin \
+	ti-connectivity/cc33xx-conf.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WIL6210),y)
 LINUX_FIRMWARE_FILES += wil6210.*
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
