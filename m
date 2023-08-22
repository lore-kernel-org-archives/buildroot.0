Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7939DEE49AB
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BDC40942;
	Tue, 22 Aug 2023 20:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24BDC40942
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 104Daj3NX_2A; Tue, 22 Aug 2023 20:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32C2340959;
	Tue, 22 Aug 2023 20:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32C2340959
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 72E9C1BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CC0E40227
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CC0E40227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VHSPROivdrgy for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:10:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 970F1400D2
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 970F1400D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86BB986189; Tue, 22 Aug 2023 20:10:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 22:10:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b3d0c5adb9a2d213b6e4dee2c412c2994649e60
X-Git-Newrev: 49a37916a8e1d60cfa763057927387d6f8d23998
X-Patchwork-Hint: ignore
Message-Id: <20230822201020.86BB986189@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: fix build failure with
 missing CONFIG_SPI/MMC
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

commit: https://git.buildroot.net/buildroot/commit/?id=49a37916a8e1d60cfa763057927387d6f8d23998
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Depending on the interface chosen we need to enable Linux CONFIG_SPI or
CONFIG_MMC, so let's do that according to BR2_PACKAGE_ESP_HOSTED_SPI.

Fixes:
http://autobuild.buildroot.net/results/cdf65ad07aba1d86f195576a2317c83aeb3dfce2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/esp-hosted/esp-hosted.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index dcb0b3bd70..7491c46512 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -17,6 +17,9 @@ define ESP_HOSTED_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_BT)
+	$(if $(BR2_PACKAGE_ESP_HOSTED_SPI),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SPI),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_MMC))
 endef
 
 ifeq ($(BR2_PACKAGE_ESP_HOSTED_SPI),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
