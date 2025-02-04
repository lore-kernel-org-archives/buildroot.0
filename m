Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28F8C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95BBC6F7F8;
	Fri, 28 Feb 2025 17:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9hrLXFw9jEX; Fri, 28 Feb 2025 17:12:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C40770AD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C40770AD9;
	Fri, 28 Feb 2025 17:12:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EE8A1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05D4442531
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBFMAGtu2GfB for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA64642CFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA64642CFA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4F4786A4C; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 14:18:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 00039d7059faa3489e91ddb692b703aedb8f9b13
X-Git-Newrev: 9f52cc8c0a7d285a4c6e34c5daa40719d3266e5b
X-Patchwork-Hint: ignore
Message-Id: <20250228163029.D4F4786A4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/uboot: add qspi.bin file
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f52cc8c0a7d285a4c6e34c5daa40719d3266e5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

u-boot has introduced a new file called qspi.bin for users who boot from a
qspi flash device.  It combines the spl/boot.bin and u-boot.itb files into a
single binary that can be written to the qspi flash.

Here is an example of how binman generates the qspi.bin:
https://source.denx.de/u-boot/u-boot/-/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

At the moment, the qspi.bin is only used for the zynqmp platform, but other
platforms may adopt it, so the buildroot support has been made in a generic
way.

This patch adds the necessary support for buildroot to install this binary.

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 13d45140eb..f17f932c9e 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -470,6 +470,14 @@ config BR2_TARGET_UBOOT_FORMAT_SD
 
 	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
 
+config BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
+	bool "qspi.bin"
+	depends on BR2_TARGET_UBOOT_ZYNQMP
+	help
+	  When booting from qspi flash, u-boot can generate a single
+	  file for flashing by combining the spl/boot.bin and
+	  u-boot.itb files into a unified binary.
+
 config BR2_TARGET_UBOOT_FORMAT_STM32
 	bool "u-boot.stm32"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index efecf2ca47..2796b0a310 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -108,6 +108,10 @@ UBOOT_MAKE_TARGET += u-boot.itb
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_QSPI_BIN),y)
+UBOOT_BINS += qspi.bin
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
 UBOOT_BINS += u-boot.imx
 UBOOT_MAKE_TARGET += u-boot.imx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
