Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E4DC27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 16:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27C4F60034;
	Tue, 11 Jun 2024 16:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jiXHa5gAbLi; Tue, 11 Jun 2024 16:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33C2E608EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33C2E608EB;
	Tue, 11 Jun 2024 16:55:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B58F1BF391
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 16:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15CF881FF7
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 16:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-CCH8uSNh6m for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 16:55:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1355E81FF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1355E81FF6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1355E81FF6
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 16:55:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 841D560F2A;
 Tue, 11 Jun 2024 16:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D85C2BD10;
 Tue, 11 Jun 2024 16:55:44 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 19:55:39 +0300
Message-ID: <20240611165539.658551-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1718124945;
 bh=qOmi/iIOJhx3o3yASm2AdgN5BEygmEvlEISFzqx5TdU=;
 h=From:To:Cc:Subject:Date:From;
 b=A69IbuNIwVDcpYBU/qsW8kuvjzdX30y7mJR6sCh4XsrMctRK77lSansrln6VHoAon
 iNrd+4aMN/Nt2gOpsT9dUXi08lGb1VGFPmu1313/l3L8oiZu4ZFvWjlp7XqbRvxxbY
 sqI6lgZNTdp2QlLv61vVIh5GuHM2wnXNFXrggmTe4Ofo++IvSNePIQMeReIjj6yiiw
 V44z6xmU6u5603Xs37AmUfRaKKTqYADucQ1BWVq4waD1xqCtup5LLajYk61bk8PFWH
 Gf57XvO/NOJsJB7Ur10WJbquMRlkf7qEye/bMplkkp1NUrrcp3eqPYa4tGeiAnkriP
 4IUS6qYdRhqwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A69IbuNI
Subject: [Buildroot] [PATCH] package/systemd: Add BCACHEFS superblock magic
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@hastings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the magic number for the bcachefs superblock. Otherwise, systemd
254.13 fails to compile with the latest kernel versions.

Upstream commit ID:  201148b08de6 ("basic: Add BCACHEFS magic")

Cc: Norbert Lange <nolange79@gmail.com>
Cc: Sen Hastings <sen@hastings.org>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Link: https://social.kernel.org/notice/Aie4Z8s4zYztoFTWUq
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
Cc-list picked from DEVELOPERS with the associated package mentioned.
 .../0001-basic-add-bcachefs-magic.patch       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/systemd/0001-basic-add-bcachefs-magic.patch

diff --git a/package/systemd/0001-basic-add-bcachefs-magic.patch b/package/systemd/0001-basic-add-bcachefs-magic.patch
new file mode 100644
index 0000000000..ca13067f6a
--- /dev/null
+++ b/package/systemd/0001-basic-add-bcachefs-magic.patch
@@ -0,0 +1,50 @@
+From e5ff9b585d7dc54f50085d518d7d588c250b0690 Mon Sep 17 00:00:00 2001
+From: Chris Packham <chris.packham@alliedtelesis.co.nz>
+Date: Fri, 31 May 2024 09:51:38 +1200
+Subject: [PATCH 2/2] basic: Add BCACHEFS magic
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
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
