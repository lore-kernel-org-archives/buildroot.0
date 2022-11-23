Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515E0C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC17940893;
	Mon,  5 Dec 2022 12:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC17940893
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybNSZwQkI-_N; Mon,  5 Dec 2022 12:05:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F034C40272;
	Mon,  5 Dec 2022 12:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F034C40272
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14C6C1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4291D415DE
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4291D415DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7gWkhdj7thSm for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B5A5416AF
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B5A5416AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B72085BA3; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 23:26:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9ef3fbed57add6491e26e1c40f7c500f8c02aeb
X-Git-Newrev: d8c63011e2b0c54e0a17171b668bfcb253954481
X-Patchwork-Hint: ignore
Message-Id: <20221205112611.6B72085BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot/uboot.mk: allow installing
 u-boot.elf
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8c63011e2b0c54e0a17171b668bfcb253954481
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds an option that allows to install the u-boot.elf file
produced when CONFIG_REMAKE_ELF=y in the U-Boot configuration.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 12 ++++++++++++
 boot/uboot/uboot.mk  |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 557472b58b..a729280060 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -277,7 +277,19 @@ config BR2_TARGET_UBOOT_FORMAT_NAND_BIN
 	bool "u-boot-nand.bin"
 
 config BR2_TARGET_UBOOT_FORMAT_ELF
+	bool "u-boot"
+	help
+	  Install the u-boot image, which is directly the ELF binary
+	  for the main U-Boot, potentially with debugging symbols.
+
+config BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF
 	bool "u-boot.elf"
+	help
+	  Install the u-boot.elf image, which is produced when
+	  CONFIG_REMAKE_ELF=y. It is an ELF image (u-boot.elf)
+	  produced from the raw U-Boot binary (u-boot.bin), which may
+	  already have been statically relocated and may already have
+	  a device-tree appended to it.
 
 config BR2_TARGET_UBOOT_FORMAT_IMG
 	bool "u-boot.img"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 0439ec5e4b..697adb4d8f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -60,6 +60,10 @@ UBOOT_MAKE_TARGET += mdbtrick
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF),y)
+UBOOT_BINS += u-boot.elf
+endif
+
 # Call 'make all' unconditionally
 UBOOT_MAKE_TARGET += all
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
