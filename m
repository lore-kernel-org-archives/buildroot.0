Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC3CC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC25B42643;
	Fri, 28 Feb 2025 16:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVAF0_4qR5lU; Fri, 28 Feb 2025 16:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F4404FE23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F4404FE23;
	Fri, 28 Feb 2025 16:48:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20D0F1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC4FF42E57
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJFx83ewljKP for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C3464199A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C3464199A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5560D8769C; Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Dec 2024 22:42:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8c9c1222b79a83c753527203ee5e5ee58738e83a
X-Git-Newrev: 1d5b36bfa4b998a3e213fc45166b76d2dbb5c709
X-Patchwork-Hint: ignore
Message-Id: <20250228162955.5560D8769C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] fs/squashfs: allow to disable
 compression of the filesystem
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1d5b36bfa4b998a3e213fc45166b76d2dbb5c709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Devices with large amounts of flash but operating in connectivity-
constrained areas can benefit from using uncompressed images as this
allows delta updates using binary diff algorithms.

Connectivity-constrained areas in this context are defined as areas
where the connection is very slow, unstable, etcetera, where it is
difficult to transfer data in large scale.

Add a "none" option to the compression menu and map it to the mksquashfs
-no-compression flag to enable this feature.
Disable the ability to select extreme compression in this case as that
makes absolutely no sense combined with no compression.

Signed-off-by: John Ernberg <john.ernberg@actia.se>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/squashfs/Config.in   | 6 ++++++
 fs/squashfs/squashfs.mk | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 21322a2246..4f898bfdd4 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -69,6 +69,8 @@ choice
 	  Select the squashfs compression algorithm to use when
 	  generating the filesystem.
 
+	  Select "none" to disable compression.
+
 config BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
 	bool "gzip"
 
@@ -87,11 +89,15 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_XZ
 config BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
 	bool "zstd"
 
+config BR2_TARGET_ROOTFS_SQUASHFS4_NONE
+	bool "none"
+
 endchoice
 
 config BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP
 	bool "extreme compression when available"
 	default y if BR2_TARGET_ROOTFS_SQUASHFS4_LZ4  # legacy
+	depends on !BR2_TARGET_ROOTFS_SQUASHFS4_NONE
 	help
 	  Use options to increase compression ration as much as
 	  possible, like using architecture-specific options, at
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index cf083663c1..3b9d0efbbe 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -26,6 +26,8 @@ else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_XZ),y)
 ROOTFS_SQUASHFS_ARGS += -comp xz
 else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD),y)
 ROOTFS_SQUASHFS_ARGS += -comp zstd
+else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_NONE),y)
+ROOTFS_SQUASHFS_ARGS += -no-compression
 else
 ROOTFS_SQUASHFS_ARGS += -comp gzip
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
