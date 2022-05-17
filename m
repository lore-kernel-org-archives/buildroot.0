Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A95C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 05:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 902C883DF0;
	Tue, 17 May 2022 05:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQ8izzfw1um2; Tue, 17 May 2022 05:53:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AE5D836E1;
	Tue, 17 May 2022 05:53:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E42451BF33C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 05:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFCD6836E1
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 05:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FlknvW_bEuTL for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 05:53:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EA8283498
 for <buildroot@buildroot.org>; Tue, 17 May 2022 05:53:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5B20685F03; Tue, 17 May 2022 05:42:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 07:51:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1386336fc82f841fc1b57b5448477d5b1b4302fd
X-Git-Newrev: 555f8dfd6ef893463ce19d5ee242afd6b83cb450
X-Patchwork-Hint: ignore
Message-Id: <20220517054238.5B20685F03@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/squashfs: Add block size option
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

commit: https://git.buildroot.net/buildroot/commit/?id=555f8dfd6ef893463ce19d5ee242afd6b83cb450
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

One advantage of squashfs over similar technologies is the support for
bigger block sizes. However the default size is not a lot bigger
(typically 128k if no `-b` flag specified).

This patch adds the ability to select from common block sizes
which for example can aid in improving compression ratio.

Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
[yann.morin.1998@free.fr:
  - drop spurious boolean-based setting in .mk
  - split into multi-line
  - qstrip variable expansion
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/squashfs/Config.in   | 50 +++++++++++++++++++++++++++++++++++++++++++++++++
 fs/squashfs/squashfs.mk |  5 ++++-
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 70d4a20cf0..341e50a08c 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -5,6 +5,56 @@ config BR2_TARGET_ROOTFS_SQUASHFS
 
 if BR2_TARGET_ROOTFS_SQUASHFS
 
+choice
+	prompt "block size"
+	default BR2_TARGET_ROOTFS_SQUASHFS_BS_128K
+	help
+	  Data block size. Bigger values can improve
+	  compression ratio.
+
+	  If unsure, leave at 128k (default).
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_4K
+	bool "4k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_8K
+	bool "8k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_16K
+	bool "16k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_32K
+	bool "32k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_64K
+	bool "64k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_128K
+	bool "128k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_256K
+	bool "256k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_512K
+	bool "512k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_1024K
+	bool "1024k"
+
+endchoice
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS
+	string
+	default "4K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_4K
+	default "8K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_84K
+	default "16K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_16K
+	default "32K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_32K
+	default "64K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_64K
+	default "128K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_128K
+	default "256K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_256K
+	default "512K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_512K
+	default "1024K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_1024K
+
 config BR2_TARGET_ROOTFS_SQUASHFS_PAD
 	bool "pad to a 4K boundary"
 	default y # legacy was always ON
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 7a5e3e313e..2148bb4494 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -6,7 +6,10 @@
 
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
 
-ROOTFS_SQUASHFS_ARGS = -noappend -processors $(PARALLEL_JOBS)
+ROOTFS_SQUASHFS_ARGS = \
+	-noappend \
+	-processors $(PARALLEL_JOBS) \
+	-b $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_BS))
 
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_PAD),)
 ROOTFS_SQUASHFS_ARGS += -nopad
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
