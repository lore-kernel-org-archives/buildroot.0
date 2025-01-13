Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A7FC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBA0A404E6;
	Mon, 13 Jan 2025 20:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCcs-95q89PP; Mon, 13 Jan 2025 20:02:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEFA6404E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEFA6404E7;
	Mon, 13 Jan 2025 20:02:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE2E2940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C86D40586
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfOePyTouAZm for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:02:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C864401D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C864401D5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C864401D5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:02:35 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CAB17B0059B;
 Mon, 13 Jan 2025 21:02:31 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 13 Jan 2025 21:02:24 +0100
Message-ID: <20250113200224.64363-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736798553;
 bh=Vupulf7+ZghBg1HlJsqj/4JrRzUA10+mtHpawq15j98=;
 h=From:To:Cc:Subject:Date:From;
 b=L6aTa7CPR0vF1uj8oR6AXSeCjnsXhAuHXf2MCfn7J1Z3EQMpzwPFqITuDPE/7osnK
 tvPXGUOI7AT0tKQEnI2SGEP/1HhYRoRtD74DNrBrxpH2b138lrJQcu5GQRuNJBXMoV
 178/jFmb+1VcWFWcFx4dczlCFkGuLhZ5t8WpQMofPX60WV4x5xFhzZyXu0zg2tYT0C
 n9a1zhT5OeBGR8DViXc2WKqlVsfmkytnaPkNLsLPiuP++pzqDdLR+yImfDyU/cUZJE
 fFRPey4DZXDxLWyA8qxbdMZY2LolB3MHrbTIQQ7wCbBajmH/PjWq6otqJqaJg2JWgN
 VshJmaQTf2Hmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=L6aTa7CP
Subject: [Buildroot] [PATCH 1/1] fs/ext2: fixes for ext2r0 with
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1623295044
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
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
