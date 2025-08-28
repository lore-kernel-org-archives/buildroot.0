Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A993AC8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 16:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E9E683D72;
	Thu, 28 Aug 2025 16:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sWzLKKciixU; Thu, 28 Aug 2025 16:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDE1483D58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDE1483D58;
	Thu, 28 Aug 2025 16:47:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2EE0B8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 16:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C51F641117
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 16:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYK-RmTDCm5Q for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 16:47:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8AD0940CB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AD0940CB8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AD0940CB8
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 16:47:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1749079853; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 Aug 2025 16:47:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1urfmG-0089hC-3D;
 Thu, 28 Aug 2025 18:47:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 18:47:06 +0200
Message-Id: <20250828164708.1943876-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=j76fbDhktZ0J3xz1UZ/N6IGhpu9chi/IBBiye+I5Kap6QzL8Il7y9GnzBsYb1MeDK6x/mUG23F0f8LRWTwC6RylXK9MvchYjunIfknH6UaIvKt04GcjFjBtjbimEmDkplZA7WFLZlf0UY7Ov539kENKdrjM7zEuE+Oya0YlvyWQmCsYR5iVrY6eXoU94KtvDVFTIeU6rP+zF0gAY8LgNwlA7TVaXMmd1fqx9uJ0CPj3pQLbwrAKC6JmU6tvHBe/72XWqz8hwp/BsTkplCb4Fnp1ZWJbN8SL3C25mEmWAbn4zoLtBeDxFU6+XCeIL9h36HhbBPD3ZLCvdxIQDWruhIQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=zhhp2qkcAef7oMmdoSD9i7W7TLzN9kraf7v1IQhpYtM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=j76fbDhk
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH-NEXT 1/2] fs/axfs: drop support
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

The file system support is not mainline and hasn't been updated since 2019,
so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy  |  8 ++++++++
 fs/Config.in      |  1 -
 fs/axfs/Config.in | 17 -----------------
 fs/axfs/axfs.mk   | 13 -------------
 4 files changed, 8 insertions(+), 31 deletions(-)
 delete mode 100644 fs/axfs/Config.in
 delete mode 100644 fs/axfs/axfs.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index efb59dc535..da05a3f141 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.11"
+
+config BR2_TARGET_ROOTFS_AXFS
+	bool "AXFS root filesystem has been removed"
+	select BR2_LEGACY
+	help
+	  AXFS root filesystem support has been removed.
+
 comment "Legacy options removed in 2025.08"
 
 config BR2_PACKAGE_LIBCURL_BEARSSL
diff --git a/fs/Config.in b/fs/Config.in
index 6b338f8ec8..42b0e608ac 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -1,6 +1,5 @@
 menu "Filesystem images"
 
-source "fs/axfs/Config.in"
 source "fs/btrfs/Config.in"
 source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
diff --git a/fs/axfs/Config.in b/fs/axfs/Config.in
deleted file mode 100644
index 8dfaffab74..0000000000
--- a/fs/axfs/Config.in
+++ /dev/null
@@ -1,17 +0,0 @@
-config BR2_TARGET_ROOTFS_AXFS
-	bool "axfs root filesystem"
-	help
-	  The Advanced XIP File System is a Linux kernel filesystem
-	  driver that enables files to be executed directly from flash
-	  or ROM memory rather than being copied into RAM. It has the
-	  ability to store individual *pages* in a file
-	  uncompressed/XIP or compressed/Demand Paged.
-
-	  So far, the only supported mode is 'XIP all', so all the
-	  files that have the execute attribute set will be XIP'ed.
-
-	  At the moment, the FS is not supported in Linux mainline
-	  (v4.3-rc5), so the kernel has to be built with the axfs
-	  patches to be able to read it. Patches can be found at:
-
-	  https://github.com/jaredeh/axfs
diff --git a/fs/axfs/axfs.mk b/fs/axfs/axfs.mk
deleted file mode 100644
index 4b93df55c0..0000000000
--- a/fs/axfs/axfs.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# Build the axfs root filesystem image
-#
-################################################################################
-
-ROOTFS_AXFS_DEPENDENCIES = host-axfsutils
-
-define ROOTFS_AXFS_CMD
-	$(HOST_DIR)/bin/mkfs.axfs -s -a $(TARGET_DIR) $@
-endef
-
-$(eval $(rootfs))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
