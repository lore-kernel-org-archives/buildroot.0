Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B369C021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 21:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4963960858;
	Tue, 18 Feb 2025 21:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bkY4B5AYAYb; Tue, 18 Feb 2025 21:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D66D608BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D66D608BB;
	Tue, 18 Feb 2025 21:22:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61495968
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 21:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F4D1405C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 21:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d38w4fq0gLbT for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 21:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2CA140132
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2CA140132
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 21:22:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF9D0878A3; Tue, 18 Feb 2025 21:22:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 21:48:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01b45ef87db4e9af5ee912052fe8276bff4a9745
X-Git-Newrev: 39aec97630e63559af2b84832da91e074582445d
X-Patchwork-Hint: ignore
Message-Id: <20250218212227.CF9D0878A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/erofs: add config options for dedupe,
 fragments and ztailpacking
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0073809489690358431=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0073809489690358431==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=39aec97630e63559af2b84832da91e074582445d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Kconfig toggles for a few more extended options that are useful for
reducing size and improving performance of EROFS images. Descriptions of the
config options were taken from the erofs-utils manpage.

Signed-off-by: Jan Čermák <sairon@sairon.cz>
[Arnout: fix Config.in help text and indentation]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 fs/erofs/Config.in | 27 +++++++++++++++++++++++++++
 fs/erofs/erofs.mk  | 16 ++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/fs/erofs/Config.in b/fs/erofs/Config.in
index 2041a0034e..91f51b76d7 100644
--- a/fs/erofs/Config.in
+++ b/fs/erofs/Config.in
@@ -58,6 +58,33 @@ config BR2_TARGET_ROOTFS_EROFS_LZMA_LEVEL
 
 endif # BR2_TARGET_ROOTFS_EROFS_LZMA
 
+config BR2_TARGET_ROOTFS_EROFS_DEDUPE
+	bool "enable data deduplication"
+	depends on !BR2_TARGET_ROOTFS_EROFS_NONE
+	help
+	  Enable global compressed data deduplication to reduce FS image
+	  size. Introduced in Linux 6.1.
+
+config BR2_TARGET_ROOTFS_EROFS_FRAGMENTS
+	bool "enable fragments packing"
+	help
+	  Pack the tail part (pcluster) of compressed files, or entire
+	  files, into a special inode for smaller image size.
+	  Introduced in Linux 6.1.
+
+config BR2_TARGET_ROOTFS_EROFS_ALL_FRAGMENTS
+	bool "enable fragments packing"
+	help
+	  Forcely record the whole files into a special inode for better
+	  compression. Introduced in Linux 6.1.
+
+config BR2_TARGET_ROOTFS_EROFS_ZTAILPACKING
+	bool "enable ztailpacking"
+	help
+	  Pack the tail part (pcluster) of compressed files into its
+	  metadata to save more space and the tail part I/O. Introduced
+	  in Linux 5.17.
+
 config BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE
 	int "pcluster size"
 	default 0
diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
index e8d30bace8..3b64cb1c6e 100644
--- a/fs/erofs/erofs.mk
+++ b/fs/erofs/erofs.mk
@@ -22,6 +22,22 @@ ifneq ($(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE),0)
 ROOTFS_EROFS_ARGS += -C$(strip $(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE))
 endif
 
+ifeq ($(BR2_TARGET_ROOTFS_EROFS_DEDUPE),y)
+ROOTFS_EROFS_ARGS += -Ededupe
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_EROFS_FRAGMENTS),y)
+ROOTFS_EROFS_ARGS += -Efragments
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_EROFS_ALL_FRAGMENTS),y)
+ROOTFS_EROFS_ARGS += -Eall-fragments
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_EROFS_ZTAILPACKING),y)
+ROOTFS_EROFS_ARGS += -Eztailpacking
+endif
+
 define ROOTFS_EROFS_CMD
 	$(HOST_DIR)/bin/mkfs.erofs $(ROOTFS_EROFS_ARGS) $@ $(TARGET_DIR)
 endef

--===============0073809489690358431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0073809489690358431==--
