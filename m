Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5671DC25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 10:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F8026077E;
	Thu,  6 Jun 2024 10:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OWzahuB0Gny; Thu,  6 Jun 2024 10:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0669607D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0669607D5;
	Thu,  6 Jun 2024 10:48:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B5AA91BF5E0
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 10:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E696600C6
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 10:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXp53k_ogbfp for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 10:48:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D0170611D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0170611D6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0170611D6
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 10:48:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EE73461D24;
 Thu,  6 Jun 2024 10:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFACC4AF0C;
 Thu,  6 Jun 2024 10:48:34 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 13:48:13 +0300
Message-ID: <20240606104813.1514-4-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240606104813.1514-1-jarkko@kernel.org>
References: <20240606104813.1514-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1717670914;
 bh=6MlU5P4bqJYas8UeRzW68EMHl714Uc39/JV4fN3HbIA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K3Pbh9QYWgR0QGnLKUccP3kAWEzycLnFec3RM6KreHERI8Hnf5WfGx9XvN5YAto8a
 QdcrDtgpfBbTrUA5d8j/WlRPuSnaJ3FagQM1S49nxo7SClScNgBx5MMGvd8JPnekSo
 IURfmbwUCWcs/y/Hj+YTR9XAvj/sNkSrpIUHuGmBZTaeLqNM3UTUXrqBupFn/aVyZj
 fPk2QiPF+KcnF4hw4iKRxwYjqrpoGd0zAcw1nqL98Q36zvv/OARMomUUA3w6ICVJ2c
 H5BrTmz9YZcP9eEALrVHYieKSk6a9kdzPvwqASBSKz2QB3kDZOkdFevaGer47A1+FW
 59Mf6KxxFeu3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=K3Pbh9QY
Subject: [Buildroot] [PATCH v2 3/3] package/systemd: add the missing
 superblock identifiers
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following superblock identifiers are missing:

1. BCACHEFS_SUPER_MAGIC
2. PID_FS_MAGIC

In my testing at least Linux 6.{9,10} have failed to compile because of
this.

Cherry-pick upstream fixes, which address them.

Link: https://social.kernel.org/notice/Aie4Z8s4zYztoFTWUq
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 .../0001-basic-add-pidfs-magic-31709.patch    | 50 +++++++++++++++++++
 .../0002-basic-add-bcachefs-magic.patch       | 50 +++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 package/systemd/0001-basic-add-pidfs-magic-31709.patch
 create mode 100644 package/systemd/0002-basic-add-bcachefs-magic.patch

diff --git a/package/systemd/0001-basic-add-pidfs-magic-31709.patch b/package/systemd/0001-basic-add-pidfs-magic-31709.patch
new file mode 100644
index 0000000000..683f91dbb7
--- /dev/null
+++ b/package/systemd/0001-basic-add-pidfs-magic-31709.patch
@@ -0,0 +1,50 @@
+From 5cffe2484bbc6ec4b5b721094936f510a81c5167 Mon Sep 17 00:00:00 2001
+From: cpackham-atlnz <85916201+cpackham-atlnz@users.noreply.github.com>
+Date: Tue, 12 Mar 2024 00:55:36 +1300
+Subject: [PATCH 1/2] basic: add PIDFS magic (#31709)
+
+Kernel commit cb12fd8e0dabb9a1c8aef55a6a41e2c255fcdf4b added pidfs.
+Update filesystems-gperf.gperf and missing_magic.h accordingly.
+
+This fixes the following error building against a bleeding edge kernel.
+```
+../src/basic/meson.build:234:8: ERROR: Problem encountered: Unknown filesystems defined in kernel headers:
+
+Filesystem found in kernel header but not in filesystems-gperf.gperf: PID_FS_MAGIC
+```
+---
+ src/basic/filesystems-gperf.gperf | 1 +
+ src/basic/missing_magic.h         | 5 +++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/basic/filesystems-gperf.gperf b/src/basic/filesystems-gperf.gperf
+index e8c5357f91..1cd66b5a5f 100644
+--- a/src/basic/filesystems-gperf.gperf
++++ b/src/basic/filesystems-gperf.gperf
+@@ -91,6 +91,7 @@ ocfs2,           {OCFS2_SUPER_MAGIC}
+ openpromfs,      {OPENPROM_SUPER_MAGIC}
+ orangefs,        {ORANGEFS_DEVREQ_MAGIC}
+ overlay,         {OVERLAYFS_SUPER_MAGIC}
++pidfs,           {PID_FS_MAGIC}
+ pipefs,          {PIPEFS_MAGIC}
+ ppc-cmm,         {PPC_CMM_MAGIC}
+ proc,            {PROC_SUPER_MAGIC}
+diff --git a/src/basic/missing_magic.h b/src/basic/missing_magic.h
+index 27a33adecb..82d71c8ad1 100644
+--- a/src/basic/missing_magic.h
++++ b/src/basic/missing_magic.h
+@@ -128,6 +128,11 @@
+ #define DEVMEM_MAGIC 0x454d444d
+ #endif
+ 
++/* cb12fd8e0dabb9a1c8aef55a6a41e2c255fcdf4b (6.8) */
++#ifndef PID_FS_MAGIC
++#define PID_FS_MAGIC 0x50494446
++#endif
++
+ /* Not in mainline but included in Ubuntu */
+ #ifndef SHIFTFS_MAGIC
+ #define SHIFTFS_MAGIC 0x6a656a62
+-- 
+2.45.1
+
diff --git a/package/systemd/0002-basic-add-bcachefs-magic.patch b/package/systemd/0002-basic-add-bcachefs-magic.patch
new file mode 100644
index 0000000000..ca13067f6a
--- /dev/null
+++ b/package/systemd/0002-basic-add-bcachefs-magic.patch
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
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
