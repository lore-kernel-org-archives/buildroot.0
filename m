Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE8A107BCEA
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 22:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8593A40F45;
	Fri, 13 Mar 2026 22:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23Q7vpEKJofm; Fri, 13 Mar 2026 22:50:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F141540F3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773442255;
	bh=RR/1Iv7B19A84wPKGt1gYKkQYgLluTU//CA/HmdaZ9I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QEQwZK1BBleMDWhRKd4UONFmHy1dE7zAVDiC28zQYHHfwul4s7iZlACprsGlPH71D
	 ESzTo/ZNok/n9VnOR4CqmrYhgm49nKZGXBozmTgsdCn1dW0Oo9wmHKm8eJLRxrAhxi
	 1pqSRyzfcuTKozmNHZBK+rcLX92sGmZE+58yn3DM5KEeoZ5tXUEk+b0e80gOsn39wm
	 iF5FGtH+d61GCcRV5+iNvfvCd3RMOf1pwQZEBFf8QQEcmHW3pqfC9hMRADLVKhFzdR
	 aHKHwOHyAKerypLWZeC7uVjrMiKs9f5jORRVq/CuyslszZgFagMc6F5LquivZGjXMW
	 fPW5Z5Q8cAplg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F141540F3E;
	Fri, 13 Mar 2026 22:50:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB8B21B4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CD8C60E61
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kr57KMEdbtjt for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A51B360E60
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A51B360E60
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD4938739B; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 23:30:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45a74068df22bd88db10bf2296cca9e995c4d097
X-Git-Newrev: ffaccc4cccb57ee7a34a5c1288e2ca76da944aaa
X-Patchwork-Hint: ignore
Message-Id: <20260313225044.CD4938739B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/xfs: add support for generating a xfs
 image
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ffaccc4cccb57ee7a34a5c1288e2ca76da944aaa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

mkfs.xfs is able to populate a filesystem from a directory since
upstream commit [1], included since v6.17.

With this option, it is now possible to create XFS rootfs in
Buildroot. This commit adds this new feature.

[1] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=8a4ea72724930cfe262ccda03028264e1a81b145

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 fs/Config.in     |  1 +
 fs/xfs/Config.in | 34 ++++++++++++++++++++++++++++++++++
 fs/xfs/xfs.mk    | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/fs/Config.in b/fs/Config.in
index 42b0e608ac..be2a47b855 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -15,6 +15,7 @@ source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
 source "fs/ubi/Config.in"
 source "fs/ubifs/Config.in"
+source "fs/xfs/Config.in"
 source "fs/yaffs2/Config.in"
 
 endmenu
diff --git a/fs/xfs/Config.in b/fs/xfs/Config.in
new file mode 100644
index 0000000000..49dd5ed4aa
--- /dev/null
+++ b/fs/xfs/Config.in
@@ -0,0 +1,34 @@
+config BR2_TARGET_ROOTFS_XFS
+	bool "xfs root filesystem"
+	select BR2_PACKAGE_HOST_XFSPROGS
+	help
+	  Build a xfs root filesystem. If you enable this option, you
+	  probably want to enable the xfsprogs package too.
+
+if BR2_TARGET_ROOTFS_XFS
+
+config BR2_TARGET_ROOTFS_XFS_LABEL
+	string "filesystem label"
+	default "rootfs"
+
+config BR2_TARGET_ROOTFS_XFS_SIZE
+	string "exact size"
+	default "300M"
+	help
+	  The size of the filesystem image. This size is passed to the
+	  "truncate -s", so this option recognizes unit suffixes such
+	  as K,M,G (see the manual page truncate(1)). Note the XFS
+	  minimal filesystem size is 300M.
+
+config BR2_TARGET_ROOTFS_XFS_MKFS_OPTIONS
+	string "additional mkfs.xfs options"
+	help
+	  Specify a space-separated list of mkfs.xfs options.
+
+	  For more information about the mke2fs options, see the
+	  manual page mkfs.xfs(8).
+
+	  For more information about the XFS features which can be
+	  set, see also the manual page xfs(5).
+
+endif # BR2_TARGET_ROOTFS_XFS
diff --git a/fs/xfs/xfs.mk b/fs/xfs/xfs.mk
new file mode 100644
index 0000000000..2706822550
--- /dev/null
+++ b/fs/xfs/xfs.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# Build the xfs root filesystem image
+#
+################################################################################
+
+ROOTFS_XFS_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_XFS_SIZE))
+ifeq ($(BR2_TARGET_ROOTFS_XFS)-$(ROOTFS_XFS_SIZE),y-)
+$(error BR2_TARGET_ROOTFS_XFS_SIZE cannot be empty)
+endif
+
+ROOTFS_XFS_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_XFS_MKFS_OPTIONS))
+
+# qstrip results in stripping consecutive spaces into a single one. So the
+# variable is not qstrip-ed to preserve the integrity of the string value.
+ROOTFS_XFS_LABEL = $(subst ",,$(BR2_TARGET_ROOTFS_XFS_LABEL))
+#" comment to balance quotes/parenthesis for syntax highlighting)
+
+ROOTFS_XFS_OPTS = \
+	-f \
+	-p '$(TARGET_DIR)' \
+	-L '$(ROOTFS_XFS_LABEL)' \
+	$(ROOTFS_XFS_MKFS_OPTS)
+
+ROOTFS_XFS_DEPENDENCIES = host-xfsprogs
+
+define ROOTFS_XFS_CMD
+	$(RM) -f $@
+	truncate -s $(ROOTFS_XFS_SIZE) $@
+	$(HOST_DIR)/sbin/mkfs.xfs $(ROOTFS_XFS_OPTS) $@
+endef
+
+$(eval $(rootfs))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
