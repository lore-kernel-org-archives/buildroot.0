Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36562E6E7F9
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 10:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0006B80EA3;
	Tue,  3 Feb 2026 10:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J52H1Vo-cD99; Tue,  3 Feb 2026 10:44:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA34180EB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770115472;
	bh=iWCtcSgC7XBCdAgoMc89w1RfVXqT8HOMM7Knk6yGQTA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M5Jj7y702cn8Qh+GRSYuRqMxqaAQKY3lbaJtxXWWXK2vY4XZQlVpfP+TtCC7SHlG6
	 ave9VHrH9jIFJ2N7l8voC9Y3TUz2G0Bivj9BYTbkdSWqVeCbjbnaXH2oMTKPUDv9H+
	 3fx7oUW3NLheMv/BKrmhOudvLYfBszu61LOB3YSSslaki6PUg/80m8Wnh99FiHP38w
	 sQwOpnaJtfXB21R42sfhnn1EqNdD2aO8t+2pGr3WAqclfXrtatmRUvu+QQBcu1Ivlo
	 HjfHIU/dn3b5u65pfjejBpdo85Kki38zv3bOYE5CoQmrsmLt0f3JCilqfPcla1GYS6
	 8OkyBUMOkWvaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA34180EB8;
	Tue,  3 Feb 2026 10:44:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C37AEF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EF2D40432
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEfAwfMJLGNV for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 10:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB1B7403BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB1B7403BE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:44:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBBF08661A; Tue,  3 Feb 2026 10:44:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 11:36:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38e0521a795ef5ec1a9264f44931f0fc37035d77
X-Git-Newrev: 8e4c663529d135088c78a9c7f4b59354f19d6580
X-Patchwork-Hint: ignore
Message-Id: <20260203104423.BBBF08661A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: optional Linux
 as BL33
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8e4c663529d135088c78a9c7f4b59354f19d6580
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Arm Trusted Firmware (TF-A) can be used to load U-Boot or another
bootloader, which in turn loads the Linux kernel. However, TF-A is
capable of loading the kernel directly. To this end, we need to define
the BL33 and BL33_CFG compile options containing, respectively, the
zImage and the DTB.

This config introduces a new config option,
BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33, which sets the BL33 and
BL33_CFG parameters, and ensures that the kernel is built before the
TF-A by having linux as a _DEPENDENCY of the TF-A.

Signed-off-by: Jakob Kastelic <kastelic.jakob@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in               | 13 +++++++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  8 ++++++++
 2 files changed, 21 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 5eee2362ea..70fdec5c2a 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -196,6 +196,19 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
 	  for the 'qemu_sbsa' platform. In this case, due to the EDK2
 	  build system, the dependency between ATF and EDK is reversed.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33
+	bool "Linux kernel"
+	depends on BR2_LINUX_KERNEL
+	depends on (BR2_arm || BR2_armeb)
+	depends on (BR2_LINUX_KERNEL_ZIMAGE || BR2_LINUX_KERNEL_APPENDED_ZIMAGE)
+	help
+	  This option allows to embed the Linux kernel as the BL33
+	  part of the ARM Trusted Firmware.
+
+	  Do not choose this option if you intend to use U-Boot or
+	  another second-stage bootloader. With this option, TF-A
+	  starts Linux directly.
+
 endchoice
 
 if BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index bb113741d6..b81ce0d827 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -129,6 +129,14 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UB
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/zImage
+ifeq ($(ARM_TRUSTED_FIRMWARE_PLATFORM),stm32mp1)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33_CFG=$(BINARIES_DIR)/$(LINUX_DTBS)
+endif
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += linux
+endif
+
 ifeq ($(BR2_TARGET_VEXPRESS_FIRMWARE),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
