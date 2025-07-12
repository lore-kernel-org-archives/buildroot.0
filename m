Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5588C83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 15:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A77AB40D22;
	Sat, 12 Jul 2025 15:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDI0PJmZqBPm; Sat, 12 Jul 2025 15:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A51B340D15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A51B340D15;
	Sat, 12 Jul 2025 15:30:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5346D68
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3979840D15
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNRu2I3yCC7Y for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 15:30:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.15;
 helo=sender4-op-o15.zoho.com; envelope-from=dev@matt-silva.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 415BD409A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 415BD409A5
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 415BD409A5
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:30:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752334247; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eRPENpjT9/5rxxJUkio9EdZfgjc9+n7g3wZoFMFpL1h4yNGcewzkcFryEQTqQjyW7/VdWYaUYCA3qmYkWf5BKPWqcO+pZtFZIeye5sjBa4iu0Q6hpWOIjZuoS/BUonNdKUbHVKttTSmsUWhaYrOZ+C9m+PqEfJIjn/YXrppCj2w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752334247;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Svpvhgu/iv8kPOzDDXOYbdRtl+2ExAFHTeLl/HaGFWo=; 
 b=hyhKCQY98lSzaqxCxo3hEGnLBDX1KhyhcmLJ/RdYYizky+iGmoRgVDDnqnQ+6OMEsX2ZVCoiBxNUw1ExjbVE/koOy8joPamcvOXddbkEnHhMxVmVDUPwrArHWp+zATEWnCJlRmHKno84zG98dpVvaYhOzsGebi0Hqw0JZ2XSrc0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=matt-silva.com;
 spf=pass  smtp.mailfrom=dev@matt-silva.com;
 dmarc=pass header.from=<dev@matt-silva.com>
Received: by mx.zohomail.com with SMTPS id 1752334245747640.5293044086947;
 Sat, 12 Jul 2025 08:30:45 -0700 (PDT)
From: Matt Silva <dev@matt-silva.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Silva <dev@matt-silva.com>
Date: Sat, 12 Jul 2025 11:30:32 -0400
Message-ID: <20250712153032.14697-1-dev@matt-silva.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1752334247; 
 s=zoho; d=matt-silva.com; i=dev@matt-silva.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Svpvhgu/iv8kPOzDDXOYbdRtl+2ExAFHTeLl/HaGFWo=;
 b=BIFaqz/r5hS7rzaeGPFNc6SEBKbNga5272as13BdDZC8CgJIjtE6FNuzd1hiZZDh
 mIculQ1QEuxRdG7J6V96IRKoiMTsyiq7OG/hEtkZ2psQnLQKgws/+kpoN1mTdXl7iH1
 fLMRnyY554JPrIqMFSUz2KoDe4ig1o6EM8Waji14=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=matt-silva.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=matt-silva.com header.i=dev@matt-silva.com
 header.a=rsa-sha256 header.s=zoho header.b=BIFaqz/r
Subject: [Buildroot] [PATCH 1/1] package/partclone: new package
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

Partclone provides utilities to back up and restore used blocks of a
partition and it is designed for higher compatibility of the file system
by using existing libraries.

Signed-off-by: Matt Silva <dev@matt-silva.com>
---
 package/Config.in                |   1 +
 package/partclone/Config.in      |  84 ++++++++++++++++++++++++
 package/partclone/partclone.hash |   6 ++
 package/partclone/partclone.mk   | 106 +++++++++++++++++++++++++++++++
 4 files changed, 197 insertions(+)
 create mode 100644 package/partclone/Config.in
 create mode 100644 package/partclone/partclone.hash
 create mode 100644 package/partclone/partclone.mk

diff --git a/package/Config.in b/package/Config.in
index 9a841082c6..23436e751f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -244,6 +244,7 @@ menu "Filesystem and flash utilities"
 	source "package/nfs-utils/Config.in"
 	source "package/nilfs-utils/Config.in"
 	source "package/ntfs-3g/Config.in"
+	source "package/partclone/Config.in"
 	source "package/sp-oops-extract/Config.in"
 	source "package/squashfs/Config.in"
 	source "package/sshfs/Config.in"
diff --git a/package/partclone/Config.in b/package/partclone/Config.in
new file mode 100644
index 0000000000..83ebfa1213
--- /dev/null
+++ b/package/partclone/Config.in
@@ -0,0 +1,84 @@
+config BR2_PACKAGE_PARTCLONE
+	bool "partclone"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Partclone provides utilities to backup a partition smartly and
+	  it is designed for higher compatibility of the file system by
+	  using existing library.
+
+	  https://github.com/Thomas-Tsai/partclone
+
+if BR2_PACKAGE_PARTCLONE
+
+config BR2_PACKAGE_PARTCLONE_FAT
+	bool "fat"
+	help
+	  Include support for the FAT filesystem
+
+config BR2_PACKAGE_PARTCLONE_EXFAT
+	bool "exfat"
+	select BR2_PACKAGE_EXFATPROGS
+	help
+	  Include support for the exFAT filesystem
+
+config BR2_PACKAGE_PARTCLONE_EXT
+	bool "ext"
+	select BR2_PACKAGE_E2FSPROGS
+	help
+	  Include support for the ext2/3/4 filesystems
+
+config BR2_PACKAGE_PARTCLONE_NTFS
+	bool "ntfs"
+	select BR2_PACKAGE_NTFS_3G
+	help
+	  Include support for the NTFS filesystem
+
+config BR2_PACKAGE_PARTCLONE_XFS
+	bool "xfs"
+	depends on BR2_PACKAGE_XFSPROGS
+	help
+	  Include support for the XFS filesystem
+
+comment "xfs support depends on xfsprogs"
+	depends on !BR2_PACKAGE_XFSPROGS
+
+config BR2_PACKAGE_PARTCLONE_BTRFS
+	bool "btrfs"
+	select BR2_PACKAGE_BTRFS_PROGS
+	help
+	  Include support for the BTRFS filesystem
+
+config BR2_PACKAGE_PARTCLONE_F2FS
+	bool "f2fs"
+	select BR2_PACKAGE_F2FS_TOOLS
+	help
+	  Include support for the F2FS filesystem
+
+config BR2_PACKAGE_PARTCLONE_HFSP
+	bool "hfsp"
+	help
+	  Include support for the HFS Plus filesystem
+
+config BR2_PACKAGE_PARTCLONE_FUSE
+	bool "fuse"
+	select BR2_PACKAGE_LIBFUSE
+	help
+	  Include FUSE support
+
+config BR2_PACKAGE_PARTCLONE_MINIX
+	bool "minix"
+	help
+	  Include support for the Minix filesystem
+
+config BR2_PACKAGE_PARTCLONE_APFS
+	bool "apfs"
+	help
+	  Include support for the APFS filesystem
+
+config BR2_PACKAGE_PARTCLONE_NILFS2
+	bool "nilfs2"
+	select BR2_PACKAGE_NILFS_UTILS
+	help
+	  Include support for the NILFS2 filesystem
+
+endif
diff --git a/package/partclone/partclone.hash b/package/partclone/partclone.hash
new file mode 100644
index 0000000000..b73883d3fd
--- /dev/null
+++ b/package/partclone/partclone.hash
@@ -0,0 +1,6 @@
+# locally caluclated
+sha256  b7e35a01331a05ec44133f2ec4a097ffb3c005653c0b601279b18dea55ef3b0f  partclone-0.3.37.tar.gz
+
+# license files, locally calculated
+sha256  5380427a1d822444a47a742cf47f5fffbe89519da037c1b150a897c968ed355e  AUTHORS
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/partclone/partclone.mk b/package/partclone/partclone.mk
new file mode 100644
index 0000000000..15d3c7b1fb
--- /dev/null
+++ b/package/partclone/partclone.mk
@@ -0,0 +1,106 @@
+################################################################################
+#
+# partclone
+#
+################################################################################
+
+PARTCLONE_VERSION = 0.3.37
+PARTCLONE_SITE = $(call github,Thomas-Tsai,partclone,$(PARTCLONE_VERSION))
+PARTCLONE_LICENSE = GPL-2.0+
+PARTCLONE_LICENSE_FILES = AUTHORS COPYING
+
+PARTCLONE_DEPENDENCIES = openssl
+
+# The following features are not supported as they have dependencies that aren't
+# in buildroot:
+#  --enable_reiserfs
+#  --enable_reiser4
+#  --enable_ufs: there is an existing "ufs-utils" package in buildroot; however,
+#                that package is for "Universal Flash Storage" devices, and the
+#                package partclone requires is for "Unix File System"
+#  --enable_vmfs
+#  --enable_jfs
+
+ifeq ($(BR2_PACKAGE_PARTCLONE_FAT),y)
+PARTCLONE_CONF_OPTS += --enable-fat
+else
+PARTCLONE_CONF_OPTS += --disable-fat
+endif
+
+ifeq ($(BR2_PACKAGE_PARTCLONE_EXFAT),y)
+PARTCLONE_DEPENDENCIES += exfatprogs
+PARTCLONE_CONF_OPTS += --enable-exfat
+else
+PARTCLONE_CONF_OPTS += --disable-exfat
+endif
+
+ifeq ($(BR2_PACKAGE_PARTCLONE_EXT),y)
+PARTCLONE_DEPENDENCIES += e2fsprogs
+PARTCLONE_CONF_OPTS += --enable-extfs
+else
+PARTCLONE_CONF_OPTS += --disable-extfs
+endif
+
+ifeq ($(BR2_PACKAGE_PARTCLONE_NTFS),y)
+PARTCLONE_DEPENDENCIES += ntfs-3g
+PARTCLONE_CONF_OPTS += --enable-ntfs
+else
+PARTCLONE_CONF_OPTS += --disable-ntfs
+endif
+
+ifeq ($(BR2_PACKAGE_PARTCLONE_XFS),y)
+PARTCLONE_DEPENDENCIES += xfsprogs
+PARTCLONE_CONF_OPTS += --enable-xfs
+else
+PARTCLONE_CONF_OPTS += --disable-xfs
+endif
+
+ifeq ($(BR2_PACKAGE_PARTCLONE_BTRFS),y)
+PARTCLONE_DEPENDENCIES += btrfs-progs
+PARTCLONE_CONF_OPTS += --enable-btrfs
+else
+PARTCLONE_CONF_OPTS += --disable-brtfs
+endif
+
+ifeq ($(BR2_PACKAGE_PARTCLONE_F2FS),y)
+PARTCLONE_DEPENDENCIES += f2fs-tools
+PARTCLONE_CONF_OPTS += --enable-f2fs
+else
+PARTCLONE_CONF_OPTS += --disable-f2fs
+endif
+
+ifeq ($(BR2_PACKAGE_PARTCLONE_HFSP),y)
+PARTCLONE_CONF_OPTS += --enable-hfsp
+else
+PARTCLONE_CONF_OPTS += --disable-hfsp
+endif
+
+ifeq ($(BR2_PACKAGE_PARTCLONE_FUSE),y)
+PARTCLONE_DEPENDENCIES += libfuse
+PARTCLONE_CONF_OPTS += --enable-fuse
+else
+PARTCLONE_CONF_OPTS += --disable-fuse
+endif
+
+ifeq ($(BR2_PACKAGE_PARTCLONE_MINIX),y)
+PARTCLONE_CONF_OPTS += --enable-minix
+else
+PARTCLONE_CONF_OPTS += --disable-minix
+endif
+
+ifeq ($(BR2_PACKAGE_PARTCLONE_APFS),y)
+PARTCLONE_CONF_OPTS += --enable-apfs
+else
+PARTCLONE_CONF_OPTS += --disable-apfs
+endif
+
+ifeq ($(BR2_PACKAGE_PARTCLONE_NILFS2),y)
+PARTCLONE_DEPENDENCIES += nilfs-utils
+PARTCLONE_CONF_OPTS += --enable-nilfs2
+else
+PARTCLONE_CONF_OPTS += --disable-nilfs2
+endif
+
+PARTCLONE_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
