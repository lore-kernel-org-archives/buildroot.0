Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2696FC41513
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C470A81469;
	Fri, 12 Jul 2024 08:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jqej04JFgMg5; Fri, 12 Jul 2024 08:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF57D845F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF57D845F3;
	Fri, 12 Jul 2024 08:45:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11CD51BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F7B2845EF
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KOLcAXW06Re for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AE4881354
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AE4881354
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 652CC85CC8; Fri, 12 Jul 2024 08:44:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 10:44:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb19ffeaab5ba4be0a1033ca326b25d4d4e8203f
X-Git-Newrev: 94d4ab11fea1b964991ba64e3b2964de467ec9fc
X-Patchwork-Hint: ignore
Message-Id: <20240712084455.652CC85CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add option to
 install ARM Mali CSF firmwares
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

commit: https://git.buildroot.net/buildroot/commit/?id=94d4ab11fea1b964991ba64e3b2964de467ec9fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Arm Mali GPUs that belong to the 10th generation of the hardware
architecture need a binary firmware to implement the full
specification.

For the panthor kernel driver to be able to execute jobs on the GPU it
needs this firmware.

Signed-off-by: Andy Yan <andyshrk@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 1f00afe4e8..265b72e562 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -691,4 +691,14 @@ config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ATOMISP
 
 endmenu
 
+menu "GPU Firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF
+	bool "Arm Mali CSF firmware"
+	help
+	  Firmware files for Arm Mali 10th generation GPU
+	  needed by the linux panthor kernel driver.
+
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index beab374965..895f3952f4 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -897,6 +897,11 @@ LINUX_FIRMWARE_FILES += intel/ipu/shisp_2401a0_v21.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.ivsc
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF),y)
+LINUX_FIRMWARE_FILES += arm/mali/arch*/mali_csffw.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mali_csffw
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 define LINUX_FIRMWARE_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
