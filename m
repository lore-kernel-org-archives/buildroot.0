Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFC7C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 10:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78E3F80B6A;
	Sun, 28 Jul 2024 10:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPmtFeQV2_pi; Sun, 28 Jul 2024 10:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87CF080AEA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87CF080AEA;
	Sun, 28 Jul 2024 10:25:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE0D51BF5F5
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABCF1812AE
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xs5QmiS6aXp3 for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 10:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0DC2812A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0DC2812A7
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 10:24:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB4BF82690; Sun, 28 Jul 2024 10:24:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 12:14:10 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2d1d07c662c2b8a751aeb4969d491f8e57f041b9
X-Git-Newrev: 29409c9d345a2536f6b72c605cda0d13f306200f
X-Patchwork-Hint: ignore
Message-Id: <20240728102452.EB4BF82690@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/systemd: fix
 build with recent kernels
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

commit: https://git.buildroot.net/buildroot/commit/?id=29409c9d345a2536f6b72c605cda0d13f306200f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Backport a patch from upstream that adds the magic number for the
bcachefs superblock. Otherwise, systemd 254.13 fails to compile with
the latest kernel versions.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f3c1f667dcc300eb7205aa3e1731ba3377a8e48d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../systemd/0002-basic-add-bcachefs-magic.patch    | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/systemd/0002-basic-add-bcachefs-magic.patch b/package/systemd/0002-basic-add-bcachefs-magic.patch
new file mode 100644
index 0000000000..e7f4b1cbb7
--- /dev/null
+++ b/package/systemd/0002-basic-add-bcachefs-magic.patch
@@ -0,0 +1,53 @@
+From e5ff9b585d7dc54f50085d518d7d588c250b0690 Mon Sep 17 00:00:00 2001
+From: Chris Packham <chris.packham@alliedtelesis.co.nz>
+Date: Fri, 31 May 2024 09:51:38 +1200
+Subject: [PATCH] basic: Add BCACHEFS magic
+
+Import magic.h from Linux 6.9 to get the definition of
+BCACHEFS_SUPER_MAGIC. Update filesystems-gperf.gperf to add knowledge of
+bcachefs.
+
+This fixes the following error building against a bleeding edge kernel.
+```
+src/basic/meson.build:234:8: ERROR: Problem encountered: Unknown filesystems defined in kernel headers:
+
+Filesystem found in kernel header but not in filesystems-gperf.gperf: BCACHEFS_SUPER_MAGIC
+```
+
+Upstream: https://github.com/systemd/systemd/commit/201148b08de65de004d10679a8c3d201cc08fb28
+Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
+---
+ src/basic/filesystems-gperf.gperf | 1 +
+ src/basic/missing_magic.h         | 7 +++++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/src/basic/filesystems-gperf.gperf b/src/basic/filesystems-gperf.gperf
+index 1cd66b5a5f..c82fe98227 100644
+--- a/src/basic/filesystems-gperf.gperf
++++ b/src/basic/filesystems-gperf.gperf
+@@ -28,6 +28,7 @@ afs,             {AFS_FS_MAGIC, AFS_SUPER_MAGIC}
+ anon_inodefs,    {ANON_INODE_FS_MAGIC}
+ autofs,          {AUTOFS_SUPER_MAGIC}
+ balloon-kvm,     {BALLOON_KVM_MAGIC}
++bcachefs,        {BCACHEFS_SUPER_MAGIC}
+ bdev,            {BDEVFS_MAGIC}
+ binder,          {BINDERFS_SUPER_MAGIC}
+ binfmt_misc,     {BINFMTFS_MAGIC}
+diff --git a/src/basic/missing_magic.h b/src/basic/missing_magic.h
+index 82d71c8ad1..b3d2ee9f57 100644
+--- a/src/basic/missing_magic.h
++++ b/src/basic/missing_magic.h
+@@ -197,3 +197,10 @@
+ #ifndef NTFS3_SUPER_MAGIC
+ #define NTFS3_SUPER_MAGIC 0x7366746e
+ #endif
++
++/* Added in Linux commit e2f48c48090dea172c0c571101041de64634dae5. Remove when next sync'd */
++#ifndef BCACHEFS_SUPER_MAGIC
++#  define BCACHEFS_SUPER_MAGIC 0xca451a4e
++#else
++assert_cc(BCACHEFS_SUPER_MAGIC == 0xca451a4e)
++#endif
+--
+2.45.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
