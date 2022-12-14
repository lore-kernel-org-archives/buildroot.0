Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF76C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 19:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44A3040BBE;
	Wed, 14 Dec 2022 19:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44A3040BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id idy3LuSE0-Me; Wed, 14 Dec 2022 19:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 718E940BD5;
	Wed, 14 Dec 2022 19:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 718E940BD5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5405B1BF42C
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D14281F3E
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D14281F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XycbUi_CZI8b for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 19:30:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BF2B81F38
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 19:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF2B81F38
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4680C866CE; Wed, 14 Dec 2022 19:30:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 20:29:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be3a6bf2e7130b084ec4ed65274ff7c4bf67510c
X-Git-Newrev: 319d2735f99e95955c2a75c8fc6282ddf7de232a
X-Patchwork-Hint: ignore
Message-Id: <20221214193039.4680C866CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/ext2: generate Y2K38-resilient
 filesystems
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

commit: https://git.buildroot.net/buildroot/commit/?id=319d2735f99e95955c2a75c8fc6282ddf7de232a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When creating a filesystem, mkfs.ext will chose the inode size depending
on the size of the filesystem. Small filesystem get 128-bytes inodes,
while bigger filesystems use 256-byte inodes (inode must be a power of 2
larger or equal to 128, and smaller or equal to the blocksize).

However, 128-byte inodes can't store timestamps past the dreaded
2038-01-19 03:14:07Z deadline, while inodes larger than or equal to 256
do not have the issue.

It turns out that the tipping point to decide whether a filesystem is
small or big, is about around the size of the filesystems we generate
for our runtime tests. This causes the kernel to emit warning like:

    ext2 filesystem being remounted at / supports timestamps until 2038 (0x7fffffff)

We add a new option to our ext2 filesystem, so that user can specify the
size of the inode. That new option defaults to 256 to be resilient to
the Y2K38 problem.

Note: it was already possible for users to explicitly pass the -I
option, through BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS. We could have
chosen to extend the existing value with a -I 256, but that is not
satisfactory. Indeed, we do want to ensure that the default is now
Y2K38-OK, even for existing configurations that did not have explicit
setting.

We also pass that new option before the user-specified arbitrary ones,
so that BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS still wins (in case -I was
set there).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Peter: tweak help text]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/ext2/Config.in | 13 +++++++++++++
 fs/ext2/ext2.mk   |  1 +
 2 files changed, 14 insertions(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 705446df57..4451d0797f 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -60,6 +60,19 @@ config BR2_TARGET_ROOTFS_EXT2_INODES
 	int "exact number of inodes (leave at 0 for auto calculation)"
 	default 0
 
+config BR2_TARGET_ROOTFS_EXT2_INODE_SIZE
+	int "inode size"
+	default 256
+	help
+	  Set the size of inodes, in bytes, as a power of 2 larger or
+	  equal to 128.
+
+	  Set to 0 to let the filesystem generator decide based on the
+	  file system size. If unsure, keep the default, 256.
+
+	  Note: 128-byte inodes suffer of the Y2K38 problem, and can't
+	  store timestamps beyond 2038-01-19 03:14:07Z.
+
 config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	int "reserved blocks percentage"
 	default 5
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 5b5393f092..e69e79cd2e 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -22,6 +22,7 @@ ROOTFS_EXT2_OPTS = \
 	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \
 	-m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
 	-L "$(ROOTFS_EXT2_LABEL)" \
+	-I $(BR2_TARGET_ROOTFS_EXT2_INODE_SIZE) \
 	$(ROOTFS_EXT2_MKFS_OPTS)
 
 ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
