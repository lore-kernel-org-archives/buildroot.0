Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993F0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 20:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C649740467;
	Thu, 24 Mar 2022 20:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ioa1qsaslDUY; Thu, 24 Mar 2022 20:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A83B404AB;
	Thu, 24 Mar 2022 20:21:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 776961BF333
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 735E040467
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6D9f_avUChRw for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 20:20:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.178])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2847F401E1
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 20:20:56 +0000 (UTC)
Received: from 1nXTx0-00091w-TQ by out3b.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1nXTx1-00094x-Uk; Thu, 24 Mar 2022 13:20:55 -0700
Received: by emcmailer; Thu, 24 Mar 2022 13:20:55 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3b.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1nXTx0-00091w-TQ; Thu, 24 Mar 2022 13:20:54 -0700
Received: from tsdebian.ts-local.net (unknown [75.164.75.221])
 by mail.embeddedts.com (Postfix) with ESMTPSA id 60DF2140EC;
 Thu, 24 Mar 2022 13:20:53 -0700 (MST)
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 13:20:26 -0700
Message-Id: <20220324202026.5688-5-kris@embeddedTS.com>
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
 bh=BgBwvhz8SWlBN7qw9Mj+a4Hxnb1F4QkvXlYCrIzT96A=;
 b=BCHYW97erGL9H8sFM34Uq9jGbCC7nbiSiyqcH1N4DGReBDA/NMvYtIrqzNXhGY3Gq21c9hNPCB0c/+d4oba4TzDpN7eWkbgJjgAblO4MVmwKq1Oa9W8E9mH53dhCP2UGdw9PkRSJiSyRs18Ck0fnUCQ/r/yBDSIfzQ2LdVb04EPmI1Hl8oOPrstnWKHperf6g50ThT/oDBjqhYLdOYpGV0urrUnCuYTIKfA7Sd+g1hyWOvREAsNFrz4VBmid6jUysnDwkpNf8wDinlk2o12zcRJFHQQjQEzF4DRHZbe3Ml/YBIlpgSplbHNWMo5OSZhAerlJPMYB2eQTRE0dGfdpdg==;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
Subject: [Buildroot] [PATCH 4/4] package/wilc-driver: new package
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

WILC1000/3000 driver pulled from at91-linux tree set-up to be built
as an external module. Upstream Linux kernel does not support
WILC3000 features at this time. This package is intended to bridge
that gap until WILC1000/3000 is fully supported in kernel.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/wilc-driver/Config.in        | 58 ++++++++++++++++++++++++++++++++++++
 package/wilc-driver/wilc-driver.hash |  2 ++
 package/wilc-driver/wilc-driver.mk   | 29 ++++++++++++++++++
 5 files changed, 91 insertions(+)
 create mode 100644 package/wilc-driver/Config.in
 create mode 100644 package/wilc-driver/wilc-driver.hash
 create mode 100644 package/wilc-driver/wilc-driver.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 17becfa189..acd341873d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1662,6 +1662,7 @@ F:	configs/octavo_osd32mp1_red_defconfig
 
 N:	Kris Bahnsen <kris@embeddedTS.com>
 F:	package/wilc-firmware/
+F:	package/wilc-driver/
 
 N:	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 F:	package/bcusdk/
diff --git a/package/Config.in b/package/Config.in
index a175f105f3..ae3f13df5c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -610,6 +610,7 @@ endmenu
 	source "package/usbutils/Config.in"
 	source "package/w_scan/Config.in"
 	source "package/wf111/Config.in"
+	source "package/wilc-driver/Config.in"
 	source "package/wipe/Config.in"
 	source "package/xorriso/Config.in"
 	source "package/xr819-xradio/Config.in"
diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
new file mode 100644
index 0000000000..caf46ae281
--- /dev/null
+++ b/package/wilc-driver/Config.in
@@ -0,0 +1,58 @@
+config BR2_PACKAGE_WILC_DRIVER
+	bool "wilc kernel module"
+	help
+	  External kernel module for WILC1000/3000 devices.
+
+	  wilc kernel driver source as found in Microchip's at91-linux
+	  kernel tree with added Kbuild file to be built as a generic
+	  external module.
+
+	  The wilc1000 driver currently maintained in Linux kernel does
+	  not support BLE of the WILC3000 hardware. This package is
+	  meant to bridge that gap until Microchip can get WILC3000
+	  support upstream.
+
+	  Supports both SDIO and SPI modes.
+
+	  https://github.com/embeddedTS/wilc3000-external-module
+
+if BR2_PACKAGE_WILC_DRIVER
+
+config BR2_PACKAGE_WILC_DRIVER_SPI
+	bool "SPI"
+	help
+	  This module adds support for the SPI interface of adapters
+	  using WILC1000/3000 chipset. The WILC1000/3000 has a Serial
+	  Peripheral Interface (SPI) that operates as an SPI slave.
+	  This SPI interface can be used for control and for serial
+	  I/O of 802.11 data. The SPI is a full-duplex slave
+	  synchronous serial interface that is available immediately
+	  following reset when pin 9 (SDIO_SPI_CFG) is tied to VDDIO.
+	  Select this if your platform is using the SPI bus.
+
+config BR2_PACKAGE_WILC_DRIVER_SDIO
+	bool "SDIO"
+	help
+	  This module adds support for the SDIO interface of adapters
+	  using WILC1000/3000 chipset. The WILC1000/3000 SDIO is a full
+	  speed interface. It meets SDIO card specification version 2.0.
+	  The interface supports the 1-bit/4-bit SD transfer mode at the
+	  clock range of 0-50 MHz. The host can use this interface to
+	  read and write from any register within the chip as well as
+	  configure the WILC1000/3000 for data DMA. To use this
+	  interface, pin9 (SDIO_SPI_CFG) must be grounded. Select this
+	  if your platform is using the SDIO bus.
+
+if BR2_PACKAGE_WILC_DRIVER_SDIO
+
+config BR2_PACKAGE_WILC_DRIVER_SDIO_OOB
+	bool "Enable out-of-band interrupt"
+	help
+	  This option enables out-of-band interrupt support for the
+	  WILC1000/3000 chipset. This OOB interrupt is intended to
+	  provide a faster interrupt mechanism for SDIO host controllers
+	  that don't support SDIO interrupt. Select this option If the
+	  SDIO host controller in your platform doesn't support SDIO
+	  time division interrupt.
+endif
+endif
diff --git a/package/wilc-driver/wilc-driver.hash b/package/wilc-driver/wilc-driver.hash
new file mode 100644
index 0000000000..bfd8eaebc4
--- /dev/null
+++ b/package/wilc-driver/wilc-driver.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  62a03d1a4f6aa92f5ecae36b5c8798a121506e8b09a8a68192b664416bf6e745  wilc-driver-linux4microchip-2021.10.tar.gz
diff --git a/package/wilc-driver/wilc-driver.mk b/package/wilc-driver/wilc-driver.mk
new file mode 100644
index 0000000000..3b1fab8954
--- /dev/null
+++ b/package/wilc-driver/wilc-driver.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# wilc-driver
+#
+################################################################################
+
+WILC_DRIVER_VERSION = linux4microchip-2021.10
+WILC_DRIVER_SITE = $(call github,embeddedTS,wilc3000-external-module,$(WILC_DRIVER_VERSION))
+
+WILC_DRIVER_LICENSE = GPL-2.0
+WILC_DRIVER_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_WILC_DRIVER_SPI),y)
+WILC_DRIVER_MODULE_MAKE_OPTS += \
+	CONFIG_WILC_SPI=m
+endif
+
+ifeq ($(BR2_PACKAGE_WILC_DRIVER_SDIO),y)
+WILC_DRIVER_MODULE_MAKE_OPTS += \
+	CONFIG_WILC_SDIO=m
+endif
+
+ifeq ($(BR2_PACKAGE_WILC_DRIVER_SDIO_OOB),y)
+WILC_DRIVER_MODULE_MAKE_OPTS += \
+	CONFIG_WILC_HW_OOB_INTR=y
+endif
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.11.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
