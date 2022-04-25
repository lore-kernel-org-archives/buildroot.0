Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A03AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D27D14014E;
	Mon, 25 Apr 2022 20:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hes3xn8UNmg4; Mon, 25 Apr 2022 20:09:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C46C1404F9;
	Mon, 25 Apr 2022 20:09:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36BC31BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 221B660AEF
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s6ODlYPVe6ep for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:09:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EF2160BAD
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:09:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 16AA3843C9; Mon, 25 Apr 2022 19:58:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 22:08:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93a80ea44609cde6dc51ca3ca93d0dd095734d90
X-Git-Newrev: f2832d0dfccc931f75c37bb9017749d2e411c872
X-Patchwork-Hint: ignore
Message-Id: <20220425195847.16AA3843C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wilc-driver: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f2832d0dfccc931f75c37bb9017749d2e411c872
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

WILC1000/3000 driver pulled from at91-linux tree set-up to be built
as an external module. Upstream Linux kernel does not support
WILC3000 features at this time. This package is intended to bridge
that gap until WILC1000/3000 is fully supported in kernel.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/wilc-driver/Config.in        | 58 ++++++++++++++++++++++++++++++++++++
 package/wilc-driver/wilc-driver.hash |  3 ++
 package/wilc-driver/wilc-driver.mk   | 29 ++++++++++++++++++
 5 files changed, 92 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ff9f787e9c..2a400fd679 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1664,6 +1664,7 @@ F:	configs/octavo_osd32mp1_red_defconfig
 
 N:	Kris Bahnsen <kris@embeddedTS.com>
 F:	package/wilc-firmware/
+F:	package/wilc-driver/
 
 N:	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 F:	package/bcusdk/
diff --git a/package/Config.in b/package/Config.in
index 7d03bc51d7..1bf458348b 100644
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
index 0000000000..4ada813ed8
--- /dev/null
+++ b/package/wilc-driver/wilc-driver.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  4796b1a53781f8702a335b0146d488a9422b71dab39f6f154f955b0ad1711199  wilc-driver-linux4microchip-2021.10-1.tar.gz
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSE
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
