Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15748C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6E2081400;
	Fri, 28 Feb 2025 17:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-UJvtq0d99v; Fri, 28 Feb 2025 17:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 957B781449
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 957B781449;
	Fri, 28 Feb 2025 17:24:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1227A1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B33BC4917A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFMRIzcC0dlj for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2157142DF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2157142DF5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BDDD81EB8; Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 26 Feb 2025 21:58:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c13239ca14b52a21e00458577a8657e317a60b0c
X-Git-Newrev: 1ec956130d6f721c0218ba7b806416c98c5df604
X-Patchwork-Hint: ignore
Message-Id: <20250228163050.1BDDD81EB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/freescale-imx: Allow
 firmware installation on i.MX93
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
