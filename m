Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8210C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A8B24F1C4;
	Fri, 28 Feb 2025 16:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2xQnVefsPph; Fri, 28 Feb 2025 16:35:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 226234F1CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 226234F1CF;
	Fri, 28 Feb 2025 16:35:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0281D1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3E6040AED
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CT6QAqKRHjw7 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAF2340413
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAF2340413
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A907D8100D; Fri, 28 Feb 2025 16:30:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 15:49:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b2ae9d0acd4f3f9dae1baf31c1d1cd00fe3daf11
X-Git-Newrev: 51e6e87053c9b5192069bfe9d6ff18f5282d3b27
X-Patchwork-Hint: ignore
Message-Id: <20250228163025.A907D8100D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] fs/ext2: fixes for ext2r0 with
 host-e2fsprogs >= 1.47.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=51e6e87053c9b5192069bfe9d6ff18f5282d3b27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since Buildroot commit [1] "package/e2fsprogs: bump version to
1.47.2", running the runtime test tests.fs.test_ext.TestExt2 with the
command:

    utils/docker-run support/testing/run-tests \
        -d dl -o output_folder \
        tests.fs.test_ext.TestExt2
    tail output_folder/TestExt2-build.log

Fails with error in the log:

    mkfs.ext2: the -r option has been removed.

    If you really need compatibility with pre-1995 Linux systems, use the
    command-line option "-E revision=0".

Upstream commit [2] "tune2fs: replace the -r option with -E
revision=<fs-rev>" removed this option.

This commit fixes the issue by using the new form with -E. Also,
BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS has a default value to "-O
^64bit". Passing a "-O ..." option now generates an error when a
ext2r0 filesystem is created (because this revision does not support
ext2 filesystem feature options). This commit sets this default value
only if BR2_TARGET_ROOTFS_EXT2_2r0 is not set.

Fixes: [3]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/db459859fa3c8fb7a2c0c8b8616637644d9c12bf
[2] https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=3fffe9dd6be5a5ed77755cf23c267b4afd1e7651
[3] https://gitlab.com/buildroot.org/buildroot/-/jobs/8830670170

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/ext2/Config.in | 6 ++++--
 fs/ext2/ext2.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 4451d0797f..7d42621202 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -85,7 +85,8 @@ config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 
 config BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS
 	string "additional mke2fs options"
-	default "-O ^64bit"
+	# Note: ext2 rev0 does not support filesystem options.
+	default "-O ^64bit" if !BR2_TARGET_ROOTFS_EXT2_2r0
 	help
 	  Specify a space-separated list of mke2fs options, including
 	  any ext2/3/4 filesystem features.
@@ -100,7 +101,8 @@ config BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS
 	  support. This default value has been chosen because U-Boot
 	  versions before 2017.02 don't support this filesystem
 	  option: using it may make the filesystem unreadable by
-	  U-Boot.
+	  U-Boot. Note: this default does not apply to the old ext2
+	  (rev0) which does not support filesystem options.
 
 choice
 	prompt "Compression method"
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index e69e79cd2e..b49a8456f4 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -18,7 +18,7 @@ ROOTFS_EXT2_LABEL = $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
 
 ROOTFS_EXT2_OPTS = \
 	-d $(TARGET_DIR) \
-	-r $(BR2_TARGET_ROOTFS_EXT2_REV) \
+	-E revision=$(BR2_TARGET_ROOTFS_EXT2_REV) \
 	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \
 	-m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
 	-L "$(ROOTFS_EXT2_LABEL)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
