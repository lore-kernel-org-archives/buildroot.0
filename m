Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A463C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D08160E5F;
	Sun, 18 May 2025 14:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lix2wELy3pJ1; Sun, 18 May 2025 14:47:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A929760E60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A929760E60;
	Sun, 18 May 2025 14:47:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06FFD1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F55E60ADD
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcrZEVaUZv25 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:47:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DC4F60BB7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DC4F60BB7
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BA2487142; Sun, 18 May 2025 14:47:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 15:02:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4c862b9a37d434e81c877e0e949c7dc9fd4b8c94
X-Git-Newrev: f9edaff297648cfd7577ce312cf666085cc1ae99
X-Patchwork-Hint: ignore
Message-Id: <20250518144710.8BA2487142@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] fs/erofs: unbreak custom
 compression handling
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f9edaff297648cfd7577ce312cf666085cc1ae99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes:
https://autobuild.buildroot.net/results/0f856def945b9a863f45f7a58553b62f6875720b/

Commit a02e43741719 ("fs/erofs: add custom compression option with optional
compress-hints file") added logic for custom compression, but in fact it did
not work.

BR2_TARGET_ROOTFS_EROFS_COMPRESSION_{ALGORITHMS,HINTS} are kconfig string
variables, so we need to use qstrip rather than strip.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 585eeb464018f2c5865b71251df83e10a02cb8b0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 fs/erofs/erofs.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
index 6543a364f1..881ecea053 100644
--- a/fs/erofs/erofs.mk
+++ b/fs/erofs/erofs.mk
@@ -11,9 +11,9 @@ ROOTFS_EROFS_ARGS += -zlz4hc,$(BR2_TARGET_ROOTFS_EROFS_LZ4HC_LEVEL)
 else ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZMA),y)
 ROOTFS_EROFS_ARGS += -zlzma,$(BR2_TARGET_ROOTFS_EROFS_LZMA_LEVEL)
 else ifeq ($(BR2_TARGET_ROOTFS_EROFS_CUSTOM_COMPRESSION),y)
-ROOTFS_EROFS_ARGS += -z$(strip $(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_ALGORITHMS))
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS)),)
-ROOTFS_EROFS_ARGS += --compress-hints $(strip $(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS))
+ROOTFS_EROFS_ARGS += -z$(call qstrip,$(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_ALGORITHMS))
+ifneq ($(call qstrip,$(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS)),)
+ROOTFS_EROFS_ARGS += --compress-hints $(call qstrip,$(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS))
 endif
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
