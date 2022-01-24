Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4433FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 22:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3452415CE;
	Mon, 24 Jan 2022 22:36:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e4jvZwpj3GUs; Mon, 24 Jan 2022 22:36:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12D1B409C1;
	Mon, 24 Jan 2022 22:36:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C282B1BF3EC
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 22:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B164184B82
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 22:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q9g6XI5KynXy for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 22:36:04 +0000 (UTC)
X-Greylist: delayed 00:18:26 by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9226A84B76
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 22:36:04 +0000 (UTC)
Received: (Authenticated sender: quentin@barbe.me)
 by mail.gandi.net (Postfix) with ESMTPSA id 04139100003;
 Mon, 24 Jan 2022 22:36:01 +0000 (UTC)
From: Quentin Barbe <quentin@barbe.me>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 23:35:55 +0100
Message-Id: <20220124223555.8595-1-quentin@barbe.me>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: add fw_printenv to
 host uboot tools
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
Cc: Quentin Barbe <quentin@barbe.me>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is useful to be able to customize the default env images in post
build scripts.

Signed-off-by: Quentin Barbe <quentin@barbe.me>
---
 package/uboot-tools/uboot-tools.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 37e329a2af..961e123fc5 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -203,6 +203,7 @@ endif #BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT
 
 define HOST_UBOOT_TOOLS_BUILD_CMDS
 	$(BR2_MAKE1) -C $(@D) $(HOST_UBOOT_TOOLS_MAKE_OPTS) tools-only
+	$(BR2_MAKE1) -C $(@D) $(HOST_UBOOT_TOOLS_MAKE_OPTS) envtools no-dot-config-targets=envtools
 	$(HOST_UBOOT_TOOLS_GENERATE_ENVIMAGE)
 	$(HOST_UBOOT_TOOLS_GENERATE_BOOT_SCRIPT)
 endef
@@ -212,6 +213,8 @@ define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkeficapsule $(HOST_DIR)/bin/mkeficapsule
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/bin/mkenvimage
 	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/bin/dumpimage
+	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv $(HOST_DIR)/bin/fw_printenv
+	ln -sf $(HOST_DIR)/bin/fw_printenv $(HOST_DIR)/bin/fw_setenv
 	$(HOST_UBOOT_TOOLS_INSTALL_ENVIMAGE)
 	$(HOST_UBOOT_TOOLS_INSTALL_BOOT_SCRIPT)
 endef
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
