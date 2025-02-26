Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71964C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 21:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 231734098B;
	Wed, 26 Feb 2025 21:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmIkcZASCjwJ; Wed, 26 Feb 2025 21:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD1D04127E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD1D04127E;
	Wed, 26 Feb 2025 21:28:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C02FE68
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 982774019E
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5Hm6N-N8jcz for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 21:28:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EBE640144
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EBE640144
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:28:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 028CA87BE8; Wed, 26 Feb 2025 21:28:25 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 26 Feb 2025 21:58:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c13239ca14b52a21e00458577a8657e317a60b0c
X-Git-Newrev: 1ec956130d6f721c0218ba7b806416c98c5df604
X-Patchwork-Hint: ignore
Message-Id: <20250226212826.028CA87BE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx: Allow firmware
 installation on i.MX93
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ec956130d6f721c0218ba7b806416c98c5df604
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the LPDDR firmware binaries do not get installed into the
U-Boot mainline directory, causing U-Boot build to fail for i.MX93.

Fix this problem by expanding the BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
checks to also take BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9 into account.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/uboot/Config.in                         | 1 +
 package/freescale-imx/firmware-imx/Config.in | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f17f932c9e..10098ed227 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -314,6 +314,7 @@ config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
 	bool "U-Boot needs firmware-imx"
 	depends on BR2_PACKAGE_FIRMWARE_IMX
 	depends on BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || \
+		BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9 || \
 		BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
 	help
 	  Some i.MX8 platforms (such as i.MX8 M, i.MX 8M Mini, i.MX 8M
diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 4a9986448f..17c10039b2 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -62,7 +62,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 
-if BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
+if BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
 
 choice
 	bool "DDR training binaries"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
