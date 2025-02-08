Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F798C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5410A427C9;
	Sat,  8 Feb 2025 14:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7wAkL1o1jFYg; Sat,  8 Feb 2025 14:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 488EC427CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 488EC427CE;
	Sat,  8 Feb 2025 14:44:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8420FCF
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67B65606CA
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bERJ8wzFNGN2 for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1B9260704
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1B9260704
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:44:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 923E68716D; Sat,  8 Feb 2025 14:44:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Feb 2025 08:31:12 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 373e2c22e2e1b0abde19de0a0642a128ea6d67fe
X-Git-Newrev: c482333df082bab427fd1bcfcff2dd8e3935f5e6
X-Patchwork-Hint: ignore
Message-Id: <20250208144446.923E68716D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x]
 configs/ti_am62ax_sk_defconfig: Fix kernel configuration
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

commit: https://git.buildroot.net/buildroot/commit/?id=c482333df082bab427fd1bcfcff2dd8e3935f5e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

The k3-am62a7-sk.dts describes an I2C PMIC TPS659312 which features a
number of regulators. One of them, ldo1, is used as power supply for the
SD card host controller regulator. When the rootfs is on the SD
card (like with this configuration), we need support for these three
components (Regulator driver, I2C PMIC glue and PMIC MFD driver) to be
built-in in order to avoid boot failures.

Tested on an AM62A LP SK.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 8ba6459ac1413afa72124bc6387a4f3ac4306914)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/ti/am62ax-sk/linux.config | 3 +++
 configs/ti_am62ax_sk_defconfig  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/board/ti/am62ax-sk/linux.config b/board/ti/am62ax-sk/linux.config
new file mode 100644
index 0000000000..b0f9d1b737
--- /dev/null
+++ b/board/ti/am62ax-sk/linux.config
@@ -0,0 +1,3 @@
+CONFIG_MFD_TPS6594=y
+CONFIG_MFD_TPS6594_I2C=y
+CONFIG_REGULATOR_TPS6594=y
diff --git a/configs/ti_am62ax_sk_defconfig b/configs/ti_am62ax_sk_defconfig
index 1144577942..68a0e0fb9d 100644
--- a/configs/ti_am62ax_sk_defconfig
+++ b/configs/ti_am62ax_sk_defconfig
@@ -10,6 +10,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/ti/am62ax-sk/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am62a7-sk"
 BR2_TARGET_ROOTFS_EXT2=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
