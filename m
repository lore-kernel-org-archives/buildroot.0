Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBCAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 06:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 714B561034;
	Tue, 17 May 2022 06:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9kMmOXosIa5J; Tue, 17 May 2022 06:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6967C60D65;
	Tue, 17 May 2022 06:07:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA47E1BF309
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 06:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6BED60D65
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 06:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jvh1rHLyoIGE for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 06:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAE7560C0F
 for <buildroot@buildroot.org>; Tue, 17 May 2022 06:07:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1270985F10; Tue, 17 May 2022 05:56:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 08:01:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 555f8dfd6ef893463ce19d5ee242afd6b83cb450
X-Git-Newrev: d9c144d5f5ba270af9510ffd0c74a37c06b9aab9
X-Patchwork-Hint: ignore
Message-Id: <20220517055637.1270985F10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/squashfs: Add option to compress with
 extreme options
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9c144d5f5ba270af9510ffd0c74a37c06b9aab9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mksquashfs allows to tweak many compressions parameters. Currently they
can't be changed from kmenu. Leaving out potential space savings.

This adds the option to enable a set of predetermined compression
options. This option is enabled by default for lz4 since lz4 currently
implicitly added the extreme to it in the makefile. So this aids in
keeping backward compatibility.

Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
[yann.morin.1998@free.fr:
  - fix check-package
  - change the default code-style, add the legacy comment
  - always add the qstriped string, as it's empty when not used
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/squashfs/Config.in   | 26 ++++++++++++++++++++++++++
 fs/squashfs/squashfs.mk |  5 +++--
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 341e50a08c..0e8de2fd3a 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -89,4 +89,30 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
 
 endchoice
 
+config BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP
+	bool "extreme compression when available"
+	default y if BR2_TARGET_ROOTFS_SQUASHFS4_LZ4  # legacy
+	help
+	  Use options to increase compression ration as much as
+	  possible, like using architecture-specific options, at
+	  the cost of time when assembling the filesystem image.
+
+	  For example:
+	   - with gzip and lzo, use -Xcompression-level 9
+	   - with xz use arch-specific bcj (branch-call-jump) filters
+	   - with zstd use -Xcompression-level 22
+	   - and more
+
+config BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS
+	string
+	default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
+	default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_LZO
+	default "-Xhc" if BR2_TARGET_ROOTFS_SQUASHFS4_LZ4
+	default "-Xbcj arm,armthumb" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_arm || BR_aarch64)
+	default "-Xbcj powerpc" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_powerpc || BR2_powerpc64)
+	default "-Xbcj sparc" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_sparc || BR2_sparc64)
+	default "-Xbcj x86" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_i386 || BR2_x86_64)
+	default "-Xcompression-level 22" if BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
+	depends on BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP
+
 endif
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 2148bb4494..cf083663c1 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -9,14 +9,15 @@ ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
 ROOTFS_SQUASHFS_ARGS = \
 	-noappend \
 	-processors $(PARALLEL_JOBS) \
-	-b $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_BS))
+	-b $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_BS)) \
+	$(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS))
 
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_PAD),)
 ROOTFS_SQUASHFS_ARGS += -nopad
 endif
 
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4),y)
-ROOTFS_SQUASHFS_ARGS += -comp lz4 -Xhc
+ROOTFS_SQUASHFS_ARGS += -comp lz4
 else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
 ROOTFS_SQUASHFS_ARGS += -comp lzo
 else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZMA),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
