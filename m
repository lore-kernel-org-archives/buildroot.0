Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567BCC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA9864F218;
	Tue, 21 Feb 2023 00:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA9864F218
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZGwSslfyEsM; Tue, 21 Feb 2023 00:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 843404F28A;
	Tue, 21 Feb 2023 00:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 843404F28A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5ED651BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6D01417C5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6D01417C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gph7R1XO4C8H for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF176417C6
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF176417C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC17386495; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 22:46:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 488a87514e21877d25d4f0a31bbb9f71bd839aab
X-Git-Newrev: eb6e466c102306cfcb1b459d91aa5440f6b8a621
X-Patchwork-Hint: ignore
Message-Id: <20230220205250.DC17386495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] fs/cpio: allow users to
 provide their own dracut modules
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
