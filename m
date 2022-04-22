Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BEBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 22:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F34140B10;
	Fri, 22 Apr 2022 22:37:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3OT5MzBGLD8; Fri, 22 Apr 2022 22:37:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7513040B0E;
	Fri, 22 Apr 2022 22:37:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A2BE1BF2BE
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46B7940B03
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gc3T03RKahG2 for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 22:36:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.179])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F18F40195
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 22:36:59 +0000 (UTC)
Received: from 1ni1tY-0007zx-UA by out3d.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1ni1tZ-00081U-UY; Fri, 22 Apr 2022 15:36:57 -0700
Received: by emcmailer; Fri, 22 Apr 2022 15:36:57 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3d.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1ni1tY-0007zx-UA; Fri, 22 Apr 2022 15:36:56 -0700
Received: from tsdebian.ts-local.net (unknown [75.164.70.254])
 by mail.embeddedts.com (Postfix) with ESMTPSA id 9ACCC4083E;
 Fri, 22 Apr 2022 15:36:55 -0700 (MST)
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 15:36:11 -0700
Message-Id: <20220422223611.10443-5-kris@embeddedTS.com>
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
 bh=fPpj4lGrJTEHFstnNGQCVqA3cb499aV2ugEYxS1hAIA=;
 b=IFL6Q3t7b6e76BkcmMfd7GY0TawDKJ1qZwM/k0fhFlQ/Qgifd4xHcS0jlHiNSemvy1JdGYvuXjBMdhElaZLTRtEC5fmz0HqAA1wtu3+7FIR8FtZzowAFb5B16K6E20aT36go/KDTYCLPuLIt1QoaigxWZwFbeo9+Nc5uVVX3WBBdt9+SUKWdwO/oWWKoS1PWGBjvNZR6clJjkqJ93Za4cTnFKYTzTs91UcLVy7kbSze19enubrBJDn7c9b5Jd2bA6ws5YkRSXlSFZ5qAGaHlpwiOkyd1q3ia7GdnEKD/yT9QhqWbxcrYmaaKH2CHnk1QPmLfYGLVI0v7xNNSiMXZSQ==;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
Subject: [Buildroot] [PATCH v2 4/4] package/wilc-driver: new package
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
index fc0f52edf5..1e6b2d0f48 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1664,6 +1664,7 @@ F:	configs/octavo_osd32mp1_red_defconfig
 
 N:	Kris Bahnsen <kris@embeddedTS.com>
 F:	package/wilc-firmware/
+F:	package/wilc-driver/
 
 N:	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 F:	package/bcusdk/
diff --git a/package/Config.in b/package/Config.in
index 1ff7f4cc66..8d5ed427c4 100644
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
index 0000000000..b51591e8d8
--- /dev/null
+++ b/package/wilc-driver/wilc-driver.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  4796b1a53781f8702a335b0146d488a9422b71dab39f6f154f955b0ad1711199  wilc-driver-linux4microchip-2021.10-1.tar.gz
diff --git a/package/wilc-driver/wilc-driver.mk b/package/wilc-driver/wilc-driver.mk
new file mode 100644
index 0000000000..a89af30e29
--- /dev/null
+++ b/package/wilc-driver/wilc-driver.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# wilc-driver
+#
+################################################################################
+
+WILC_DRIVER_VERSION = linux4microchip-2021.10-1
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
