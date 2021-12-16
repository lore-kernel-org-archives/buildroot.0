Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BA3C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69D7761058;
	Thu, 16 Dec 2021 20:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjJ-G1ReFJir; Thu, 16 Dec 2021 20:17:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC9336105C;
	Thu, 16 Dec 2021 20:17:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33E801C1148
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20F1940B60
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:16:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f3R4CSBYK4D1 for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A44F40B61
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9BB828218A; Thu, 16 Dec 2021 20:11:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 21:08:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bb6ebea9918ace84bcc84c7c84e4b57354ef62e
X-Git-Newrev: e84bb6d29583726d59e4b48270ab354db784c409
X-Patchwork-Hint: ignore
Message-Id: <20211216201118.9BB828218A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
 Intel E800 Series Network Adapters
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

commit: https://git.buildroot.net/buildroot/commit/?id=e84bb6d29583726d59e4b48270ab354db784c409
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joe Schultz <jschultz@xes-inc.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 3609c3ec4e..622b1ee685 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -432,6 +432,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100
 	  Firmware files for Intel 825xx handled by driver e100
 	  (e100)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ICE
+	bool "Intel Ethernet 800 Series"
+	help
+	  Firmware files for Intel Ethernet 800 Series Network Adapters
+	  (ice)
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MICROCHIP_VSC85XX_PHY
 	bool "Microchip VSC85xx PHYs"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 79ee0316d3..281ed0189d 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -528,6 +528,11 @@ LINUX_FIRMWARE_FILES += e100/*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.e100
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ICE),y)
+LINUX_FIRMWARE_FILES += intel/ice/ddp/*.pkg
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.ice_enhanced
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MICROCHIP_VSC85XX_PHY),y)
 LINUX_FIRMWARE_FILES += microchip/mscc_vsc85*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.microchip
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
