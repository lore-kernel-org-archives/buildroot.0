Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C895DCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 918AF417F2;
	Wed,  3 Apr 2024 19:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IsGe8I-IL8T7; Wed,  3 Apr 2024 19:59:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47E18417FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47E18417FE;
	Wed,  3 Apr 2024 19:59:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B80CC1BF239
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A41CE417FE
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUcZAazNU4f0 for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83850417F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83850417F2
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:59:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75B238477B; Wed,  3 Apr 2024 19:59:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 21:58:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3807f906c9c6d370586ef65503b54cb1f21d7b74
X-Git-Newrev: 399deb6764d6c201547a54c5cad9fe54fbee995e
X-Patchwork-Hint: ignore
Message-Id: <20240403195922.75B238477B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: add support for
 u-boot-initial-env install
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

commit: https://git.buildroot.net/buildroot/commit/?id=399deb6764d6c201547a54c5cad9fe54fbee995e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This file is needed by libubootenv for fw_printenv/fw_setenv and
library API's to function when the environment is empty.

See details:
https://github.com/sbabic/libubootenv/tree/v0.3.4#replacement-old-tools

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andreas Naumann <anaumann@ultratronik.de>
Tested-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 7 +++++++
 boot/uboot/uboot.mk  | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index beafb38930..39b3f2c81b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -506,6 +506,13 @@ config BR2_TARGET_UBOOT_SPL_NAME
 	  and TPL name is tpl/u-boot-tpl.bin but not always. SPL name is
 	  MLO on OMAP and SPL on i.MX6 for example.
 
+config BR2_TARGET_UBOOT_INITIAL_ENV
+	bool "Install u-boot-initial-env"
+	help
+	  Install the U-Boot u-boot-initial-env on the target.
+
+	  This file is typically required by libubootenv.
+
 config BR2_TARGET_UBOOT_ZYNQMP
 	bool "Boot on the Xilinx ZynqMP SoCs"
 	depends on BR2_aarch64
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dda606a880..491f654cec 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -138,6 +138,14 @@ UBOOT_MAKE_TARGET += u-boot.stm32
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_INITIAL_ENV),y)
+UBOOT_MAKE_TARGET += u-boot-initial-env
+define UBOOT_INSTALL_UBOOT_INITIAL_ENV
+	$(INSTALL) -D -m 0644 $(@D)/u-boot-initial-env $(TARGET_DIR)/etc/u-boot-initial-env
+endef
+UBOOT_POST_INSTALL_TARGET_HOOKS += UBOOT_INSTALL_UBOOT_INITIAL_ENV
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
 UBOOT_BINS += $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
