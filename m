Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF8CC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76DFF827AF;
	Wed, 27 Jul 2022 15:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76DFF827AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qLZBopB_VWun; Wed, 27 Jul 2022 15:45:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87C4382779;
	Wed, 27 Jul 2022 15:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87C4382779
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2A81BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DEE960E53
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DEE960E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMwhGOf-2Sbg for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:45:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5502260E33
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5502260E33
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 00AC8866F8; Wed, 27 Jul 2022 15:32:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 17:43:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb671037fbdd25de7df9af0ee860e93806005c25
X-Git-Newrev: 42646265d5dd23d65e96e85b0ec12d5de1ee0042
X-Patchwork-Hint: ignore
Message-Id: <20220727153209.00AC8866F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: add fw_printenv to
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=42646265d5dd23d65e96e85b0ec12d5de1ee0042
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is useful to be able to customize the default env images in post
build scripts.

Signed-off-by: Quentin Barbe <quentin@barbe.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uboot-tools/uboot-tools.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 26450b7adf..7cd527ad12 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
