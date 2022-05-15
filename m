Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C27EC433FE
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 14:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A610C81CA7;
	Sun, 15 May 2022 14:54:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vo_lfCFUJt2x; Sun, 15 May 2022 14:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ACB381C81;
	Sun, 15 May 2022 14:54:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 964441BF46A
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 14:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 856D181C81
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 14:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6WSlOZZrImQP for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 14:54:50 +0000 (UTC)
X-Greylist: delayed 00:36:42 by SQLgrey-1.8.0
Received: from mail.cosmos-ink.net (mail.cosmos-ink.net [95.217.104.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C791B81C6F
 for <buildroot@buildroot.org>; Sun, 15 May 2022 14:54:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 034B81C5740B; Sun, 15 May 2022 16:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cosmos-ink.net;
 s=dkim; t=1652626487; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=7LEIqY77Yh8rVghIOtvgBPmbN9v/ngxfNol+HhwJfSo=;
 b=4Zu7iw+qNLUc5XOyqGtiC8VDNcN12GV4bop8TrzgBzwwaG+zTkJ45ZpWhUXyrIh3zmBzrI
 /icqW3lARlkNTCk/7XxczY+stnWx1+I0M6VTLbgZbBewph+n4XW1jrTSpCN7xUyHbGtyMV
 1rukm8FHRw1tcjHIWvutCkSOH2V9kAgL2rQ8z4L3A3erZE4AQ7AIiJXJCcMbxfYg5DtkyE
 5eH+P114qKWpaTcy0v18ZUgcsc42EE/ZGnj/Wp5F+UxpHj/q0nKEq9I32694uB0+w9m8rN
 isrhfqVilAlLe1qCJBPP1CuiAv181Iz/XuDFIkhTZ9Oi+z31rg9UvilYXfJD7w==
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 14:54:41 +0000
Message-Id: <20220515145441.3682-1-linus@cosmos-ink.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/1] fs/squashfs: add more options to customize
 creation
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
From: Linus Kaschulla via buildroot <buildroot@buildroot.org>
Reply-To: Linus Kaschulla <linus@cosmos-ink.net>
Cc: Linus Kaschulla <linus@cosmos-ink.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Squashfs seems to be the best way to shipping a highly compressed
rootfs that can easily be mounted without any extraction overhead.
While trying to get the squashfs as small as possible, I found out
that buildroot only allows rather basic customizations and many
options to improve the compression ratio are not available.

Notably, squashfs doesn't use the maximum available blocksize by
default and compression options offered by `mksquashfs` are not
changable from buildroot without patching the source code.

This patch adds 2 new options to fs/squashfs:

 - Changing the blocksize (e.g. to improve compression ratio)
 - Appending any custom arguments (e.g. for adding compression options)

Using these options, specifying the max blocksize of 1M and adding
the arguments `-Xbcj arm` allows for a notably smaller rootfs when
using xz compression and building for an arm target.

Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
---
 fs/squashfs/Config.in   | 20 ++++++++++++++++++++
 fs/squashfs/squashfs.mk |  8 ++++++++
 2 files changed, 28 insertions(+)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 70d4a20cf0..7ae2743961 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -12,6 +12,16 @@ config BR2_TARGET_ROOTFS_SQUASHFS_PAD
 	  Say 'y' here (the default) to pad the the filesystem image
 	  to a 4K boundary. Say 'n' to disable padding.
 
+config BR2_TARGET_ROOTFS_SQUASHFS4_BLOCKSIZE
+	string "block size"
+	help
+	  Define a specific block size to use when creating the
+	  squashfs. Higher values can improve compression ratios.
+	  The suffixes K and M are supported. The value should not
+	  be above 1 MiB.
+
+	  If unsure, leave this empty to use the default blocksize.
+
 choice
 	prompt "Compression algorithm"
 	default BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
@@ -39,4 +49,14 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
 
 endchoice
 
+config BR2_TARGET_ROOTFS_SQUASHFS4_CUSTOM_ARGS
+	string "additional arguments to pass to the squashfs creation"
+	help
+	  Append extra commandline arguments to the mksquashfs command.
+	  This can be useful for finetuning a selected compression or
+	  enable/disable other features of squashfs.
+	  See "$HOST_DIR/bin/mksquashfs -h" for available arguments.
+
+	  If unsure, leave empty.
+
 endif
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 7a5e3e313e..42343b1b40 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -12,6 +12,10 @@ ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_PAD),)
 ROOTFS_SQUASHFS_ARGS += -nopad
 endif
 
+ifneq ($(BR2_TARGET_ROOTFS_SQUASHFS4_BLOCKSIZE),"")
+ROOTFS_SQUASHFS_ARGS += -b "$(BR2_TARGET_ROOTFS_SQUASHFS4_BLOCKSIZE)"
+endif
+
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4),y)
 ROOTFS_SQUASHFS_ARGS += -comp lz4 -Xhc
 else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
@@ -26,6 +30,10 @@ else
 ROOTFS_SQUASHFS_ARGS += -comp gzip
 endif
 
+ifneq ($(BR2_TARGET_ROOTFS_SQUASHFS4_CUSTOM_ARGS),"")
+ROOTFS_SQUASHFS_ARGS += $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS4_CUSTOM_ARGS))
+endif
+
 define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ $(ROOTFS_SQUASHFS_ARGS)
 endef
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
