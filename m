Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD9BECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAFEE41658;
	Sat, 17 Sep 2022 20:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAFEE41658
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4rrpDkoABr2k; Sat, 17 Sep 2022 20:18:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDFB240528;
	Sat, 17 Sep 2022 20:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDFB240528
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 041281BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DBEB41A4B
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DBEB41A4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DYH-d3kx8H9j for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:18:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B631341850
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B631341850
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C9408468E; Sat, 17 Sep 2022 20:18:18 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 22:13:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8a618cff715c4cc96f01a516f39107b059e25f1
X-Git-Newrev: 4fd5d80e9dc0d9f2c281d2d955e4d6c1220440cf
X-Patchwork-Hint: ignore
Message-Id: <20220917201818.8C9408468E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/cpio: accept a list of dracut.conf files
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4fd5d80e9dc0d9f2c281d2d955e4d6c1220440cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is not unusual that projects can target multiple boards, and in
such cases, a lot is shared between boards and only the low-level
stuff differ.

Allow users to specify more than one dracut config file to cover
tose cases.

dracut does not accept more than one config file with the -c option,
but it can load more than one from a directory with --confdir. So,
we copy all the config files to a temporary directory and se that as
--confdir. However, we can't drop passing -c, or dracut would read
the system-wide /etc/dracut.conf (not sure if ${prefix} is even used),
which we do not want. So, we use an empty file as -c; /dev/null comes
in handy as an empty file.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 fs/cpio/Config.in | 12 +++++++-----
 fs/cpio/cpio.mk   | 19 ++++++++++++++-----
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 861e9a929e..94a826f9e4 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -29,13 +29,15 @@ endchoice
 
 if BR2_TARGET_ROOTFS_CPIO_DRACUT
 
-config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
-	string "dracut configuration file"
+config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES
+	string "dracut configuration files"
 	default "fs/cpio/dracut.conf"
 	help
-	  Dracut configuration file. It determines which parts of the
-	  rootfs get included in the cpio image. See dracut.conf(5) or
-	  https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
+	  Space-separated list of Dracut configuration files. They
+	  determine which parts of the rootfs get included in the
+	  cpio image. See:
+	    dracut.conf(5)
+	    https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
 
 	  The default configuration file is suitable for busybox init.
 	  It doesn't, however, pivot_root into a full rootfs.
diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index fa66b1c710..d671c337df 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -50,9 +50,14 @@ else ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
 
 ROOTFS_CPIO_DEPENDENCIES += host-dracut
 
-ROOTFS_CPIO_DRACUT_CONF_FILE = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE))
-ifeq ($(BR_BUILDING):$(ROOTFS_CPIO_DRACUT_CONF_FILE),y:)
-$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE setting)
+ROOTFS_CPIO_DRACUT_CONF_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES))
+ifeq ($(BR_BUILDING),y)
+ifeq ($(ROOTFS_CPIO_DRACUT_CONF_FILES),)
+$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES setting)
+endif
+ifneq ($(words $(ROOTFS_CPIO_DRACUT_CONF_FILES)),$(words $(sort $(notdir $(ROOTFS_CPIO_DRACUT_CONF_FILES)))))
+$(error No two dracut config files can have the same basename, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES setting)
+endif
 endif
 
 ifeq ($(BR2_LINUX_KERNEL),y)
@@ -63,10 +68,14 @@ ROOTFS_CPIO_OPTS += --no-kernel
 endif
 
 define ROOTFS_CPIO_CMD
-	mkdir -p $(ROOTFS_CPIO_DIR)/tmp
+	mkdir -p $(ROOTFS_CPIO_DIR)/tmp $(ROOTFS_CPIO_DIR)/confdir
+	$(foreach cfg,$(ROOTFS_CPIO_DRACUT_CONF_FILES), \
+		cp $(cfg) $(ROOTFS_CPIO_DIR)/confdir/$(notdir $(cfg))
+	)
 	$(HOST_DIR)/bin/dracut \
 		$(ROOTFS_CPIO_OPTS) \
-		-c $(ROOTFS_CPIO_DRACUT_CONF_FILE) \
+		-c /dev/null \
+		--confdir $(ROOTFS_CPIO_DIR)/confdir \
 		--sysroot $(TARGET_DIR) \
 		--tmpdir $(ROOTFS_CPIO_DIR)/tmp \
 		-M \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
