Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9040C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9179B408A6;
	Mon,  6 Feb 2023 21:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9179B408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3uc5mt6TkV6z; Mon,  6 Feb 2023 21:46:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6014A4038C;
	Mon,  6 Feb 2023 21:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6014A4038C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CC5E1BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4739B60C29
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4739B60C29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oRowL20LJ5aK for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:46:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E1D660C25
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E1D660C25
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 576DE83DAC; Mon,  6 Feb 2023 21:46:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 22:46:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 488a87514e21877d25d4f0a31bbb9f71bd839aab
X-Git-Newrev: eb6e466c102306cfcb1b459d91aa5440f6b8a621
X-Patchwork-Hint: ignore
Message-Id: <20230206214646.576DE83DAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/cpio: allow users to provide their own
 dracut modules
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb6e466c102306cfcb1b459d91aa5440f6b8a621
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dracut modules can only be looked for in HOST_DIR/lib/dracut/modules.d/
as dracut does not offer the possibility to look elsewhere.

Installing files in HOST_DIR/ can do done either from a host-package, or
via a post-built script; there is no overlay like there is for target/.
This is a bit cumbersome.

Additional modules are most probably developped in a relatively tight
loop with the configuration files, so it makes sense to expose both
close together.

Add an option to the fs/cpio filesystem, so users can point to a list
of modules to install.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/cpio/Config.in |  5 +++++
 fs/cpio/cpio.mk   | 12 +++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index bec2d9dca2..4d38276c88 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -29,6 +29,11 @@ endchoice
 
 if BR2_TARGET_ROOTFS_CPIO_DRACUT
 
+config BR2_TARGET_ROOTFS_CPIO_DRACUT_MODULES
+	string "extra dracut modules"
+	help
+	  Space-separated list of directories containing dracut modules.
+
 config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES
 	string "dracut configuration files"
 	default "fs/cpio/dracut.conf"
diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 061f4a18f1..00ab6a8f82 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -50,6 +50,13 @@ else ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
 
 ROOTFS_CPIO_DEPENDENCIES += host-dracut
 
+ROOTFS_CPIO_DRACUT_MODULES = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_MODULES))
+ifeq ($(BR_BUILDING),y)
+ifneq ($(words $(ROOTFS_CPIO_DRACUT_MODULES)),$(words $(sort $(notdir $(ROOTFS_CPIO_DRACUT_MODULES)))))
+$(error No two dracut modules can have the same basename, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_MODULES setting)
+endif
+endif
+
 ROOTFS_CPIO_DRACUT_CONF_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES))
 ifeq ($(BR_BUILDING),y)
 ifeq ($(ROOTFS_CPIO_DRACUT_CONF_FILES),)
@@ -68,11 +75,14 @@ ROOTFS_CPIO_OPTS += --no-kernel
 endif
 
 define ROOTFS_CPIO_CMD
-	mkdir -p $(ROOTFS_CPIO_DIR)/tmp $(ROOTFS_CPIO_DIR)/confdir
+	mkdir -p $(ROOTFS_CPIO_DIR)/tmp $(ROOTFS_CPIO_DIR)/confdir $(HOST_DIR)/lib/dracut/modules.d
 	touch $(ROOTFS_CPIO_DIR)/empty-config
 	$(foreach cfg,$(ROOTFS_CPIO_DRACUT_CONF_FILES), \
 		cp $(cfg) $(ROOTFS_CPIO_DIR)/confdir/$(notdir $(cfg))
 	)
+	$(foreach m,$(ROOTFS_CPIO_DRACUT_MODULES), \
+		cp -a $(m)/* $(HOST_DIR)/lib/dracut/modules.d/
+	)
 	$(HOST_DIR)/bin/dracut \
 		$(ROOTFS_CPIO_OPTS) \
 		-c $(ROOTFS_CPIO_DIR)/empty-config \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
