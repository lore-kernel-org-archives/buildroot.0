Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79605CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 17:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A52760611;
	Mon,  1 Jun 2026 17:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4smj-lNtJm95; Mon,  1 Jun 2026 17:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 671B660604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780333507;
	bh=pD7TvixxhyfXg7oxjavGHk0wNEO6/yGWjMWJSpCUZ4c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nzDu/YBveVIptv5mqQrmqqCNWm8j+FSllHf2gtb+kjI7ndYsdy9goWYDbpf0qaS/U
	 USrFe2SxzlmaYpkhIWjmWSw14iGvMP6HbXynEW5hgVR30SWk3RvgGRcwfDKWv8FdNz
	 mtRnZ8whVO39VMF71dRdVzXgXgUO7Z+qv2oq1AEbpkfKJzaucqU+uBzbr8x7oB24a8
	 TreUJsfWxEbmGeGQmHPSZMT2UHxmG1AEucdcHBEQDNHw0BdbK7UOPhriNAHuiWbsGU
	 0QAjYwomE7kzEPwux+oJ3p8eQ6k53ECouGYo4qhKm5OpzJT+62FACs6tZobbQqAw3n
	 +DLSvWOhf/ZzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 671B660604;
	Mon,  1 Jun 2026 17:05:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09C0C49D
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 17:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEA334043C
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 17:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3b113H7NXGx for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 17:05:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.15;
 helo=sender4-op-o15.zoho.com; envelope-from=dev@matt-silva.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 85CF3404C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85CF3404C8
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85CF3404C8
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 17:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1780333488; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SMVoNWy67T+7Q2G2ntcFA4N2kfS3/98p3MuEvVc8Mt3rxyWGqU2KIPwFuSJ69SMLHr6P7utGgnHs27DX+iZeexMdwnv+Vtwyp4yi3X1rVj2rVOJtOnFkwEmUoSJ77puufcEjmxjAgnLPUedXAg5dTz1jHoKVf9icn5H+PDNrnpU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1780333488;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=aMtCUgP8icNz1bP/t8ZAJovvkOb0vSxNZbpDeWQv7iI=; 
 b=TB3EJ+0ChfCCmlKvAHJx3maBCeszZe5B0wakQLmD4cc5lcnX49tHBlKdjubGPdQlQkYolDRHfcnZXY+utjhNoEhK3uHYB0IzjCD+GV/0KWWB7Eb6i2iUIGwpKFSjG51POhFjWKjeL0h0VRykd+n1seEK520MV5mEgy6Plo4CRJQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=matt-silva.com;
 spf=pass  smtp.mailfrom=dev@matt-silva.com;
 dmarc=pass header.from=<dev@matt-silva.com>
Received: by mx.zohomail.com with SMTPS id 1780333485063692.543986022691;
 Mon, 1 Jun 2026 10:04:45 -0700 (PDT)
From: Matt Silva <dev@matt-silva.com>
To: buildroot@buildroot.org
Cc: Matt Silva <dev@matt-silva.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dowan GULLIENT <dowan.gullient@smile.fr>
Date: Mon,  1 Jun 2026 13:02:53 -0400
Message-ID: <d231482370e963ca52510901d3c2029753efd834.1780332939.git.dev@matt-silva.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20250712153032.14697-1-dev@matt-silva.com>
References: <20250712153032.14697-1-dev@matt-silva.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1780333488; 
 s=zoho; d=matt-silva.com; i=dev@matt-silva.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=aMtCUgP8icNz1bP/t8ZAJovvkOb0vSxNZbpDeWQv7iI=;
 b=bMLL6/Kwm8eK6zK4E/hMSGyTCpAR5cZBi8KbD1RP510ol7Sqjdb/fLqSE8Oa8vpn
 M6ouWnb/kd6X1c2gV4fJqgfysf/675b1dVK7ecsOUbAHobl3zUCZqxUQkNTfLKnnpeE
 zceS5KE/+BctAVSt8badNcdSB6dJfuT+adNvZ2B8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=matt-silva.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=matt-silva.com header.i=dev@matt-silva.com
 header.a=rsa-sha256 header.s=zoho header.b=bMLL6/Kw
Subject: [Buildroot] [PATCH v2 1/1] package/partclone: new package
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

The following features are not supported as they have dependencies that
aren't in buildroot:
- enable-isal
- enable-reiserf
- enable-reiser4
- enable-ufs (there is an existing "ufs-utils" package in buildroot;
  however, that package is for "Universal Flash Storage" devices, and
  the package partclone requires is for "Unix File System")
- enable-vmfs
- enable-jfs

Signed-off-by: Matt Silva <dev@matt-silva.com>
---

v1 -> v2:
  - Addressed feedback of improper dependency handling.
  - Between submitting v1 and this v2, Partclone had several releases
    with new features. Uprev'd Partclone and added support for new
    features.

 DEVELOPERS                       |   1 +
 package/Config.in                |   1 +
 package/partclone/Config.in      | 140 +++++++++++++++++++++++++++++++
 package/partclone/partclone.hash |   6 ++
 package/partclone/partclone.mk   | 105 +++++++++++++++++++++++
 5 files changed, 253 insertions(+)
 create mode 100644 package/partclone/Config.in
 create mode 100644 package/partclone/partclone.hash
 create mode 100644 package/partclone/partclone.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9aaffa29a9..6f42566aec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2359,6 +2359,7 @@ N:	Matt Flax <flatmax@flatmax.org>
 F:	package/gtkiostream/
 
 N:	Matt Silva <dev@matt-silva.com>
+F:	package/partclone/
 F:	package/rlwrap/
 
 N:	Maksim Kiselev <bigunclemax@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 7e69d025e0..a91729ea39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -240,6 +240,7 @@ menu "Filesystem and flash utilities"
 	source "package/nfs-utils/Config.in"
 	source "package/nilfs-utils/Config.in"
 	source "package/ntfs-3g/Config.in"
+	source "package/partclone/Config.in"
 	source "package/sp-oops-extract/Config.in"
 	source "package/squashfs/Config.in"
 	source "package/sshfs/Config.in"
diff --git a/package/partclone/Config.in b/package/partclone/Config.in
new file mode 100644
index 0000000000..8bbc88246b
--- /dev/null
+++ b/package/partclone/Config.in
@@ -0,0 +1,140 @@
+config BR2_PACKAGE_PARTCLONE
+	bool "partclone"
+	depends on BR2_USE_MMU # util-linux/libuuid
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_ZSTD
+	select BR2_PACKAGE_ZLIB
+	help
+	  Partclone provides utilities to backup a partition smartly and
+	  it is designed for higher compatibility of the file system by
+	  using existing library.
+
+	  https://github.com/Thomas-Tsai/partclone
+
+if BR2_PACKAGE_PARTCLONE
+
+config BR2_PACKAGE_PARTCLONE_XXHASH
+	bool "xxhash crc support"
+	select BR2_PACKAGE_XXHASH
+	help
+	  Include support for using xxhash for checksums
+
+config BR2_PACKAGE_PARTCLONE_FAT
+	bool "fat"
+	help
+	  Include support for the FAT filesystem
+
+config BR2_PACKAGE_PARTCLONE_EXFAT
+	bool "exfat"
+	depends on BR2_USE_WCHAR # exfatprogs
+	select BR2_PACKAGE_EXFATPROGS
+	help
+	  Include support for the exFAT filesystem
+
+comment "exfat support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
+config BR2_PACKAGE_PARTCLONE_EXT
+	bool "ext"
+	depends on BR2_USE_MMU # e2fsprogs
+	select BR2_PACKAGE_E2FSPROGS
+	help
+	  Include support for the ext2/3/4 filesystems
+
+config BR2_PACKAGE_PARTCLONE_NTFS
+	bool "ntfs"
+	depends on BR2_USE_MMU # ntfs-3g
+	depends on BR2_USE_WCHAR # ntfs-3g
+	depends on BR2_TOOLCHAIN_HAS_THREADS # ntfs-3g
+	depends on !BR2_STATIC_LIBS # ntfs-3g
+	select BR2_PACKAGE_NTFS_3G
+	help
+	  Include support for the NTFS filesystem
+
+comment "ntfs support needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_PARTCLONE_XFS
+	bool "xfs"
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS # xfsprogs
+	depends on BR2_USE_MMU # xfsprogs
+	depends on BR2_INSTALL_LIBSTDCPP # xfsprogs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # xfsprogs
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9 # xfsprogs
+	select BR2_PACKAGE_XFSPROGS
+	help
+	  Include support for the XFS filesystem
+
+comment "xfs support needs a toolchain w/ C++, threads, headers >= 5.9"
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
+
+config BR2_PACKAGE_PARTCLONE_BTRFS
+	bool "btrfs"
+	depends on BR2_USE_MMU # btrfs-progs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
+	select BR2_PACKAGE_BTRFS_PROGS
+	help
+	  Include support for the BTRFS filesystem
+
+comment "btrfs support needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_PARTCLONE_F2FS
+	bool "f2fs"
+	depends on BR2_USE_WCHAR # f2fs-tools
+	select BR2_PACKAGE_F2FS_TOOLS
+	help
+	  Include support for the F2FS filesystem
+
+comment "f2fs support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
+config BR2_PACKAGE_PARTCLONE_HFSP
+	bool "hfsp"
+	help
+	  Include support for the HFS Plus filesystem
+
+config BR2_PACKAGE_PARTCLONE_FUSE
+	bool "fuse"
+	depends on BR2_USE_MMU # libfuse
+	depends on !BR2_STATIC_LIBS # libfuse
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+	select BR2_PACKAGE_LIBFUSE3
+	help
+	  Include FUSE support
+
+comment "fuse support needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
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
+	depends on BR2_USE_MMU # nilfs-utils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # nilfs-utils
+	select BR2_PACKAGE_NILFS_UTILS
+	help
+	  Include support for the NILFS2 filesystem
+
+comment "nilfs2 support needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+endif
diff --git a/package/partclone/partclone.hash b/package/partclone/partclone.hash
new file mode 100644
index 0000000000..63944784a3
--- /dev/null
+++ b/package/partclone/partclone.hash
@@ -0,0 +1,6 @@
+# locally caluclated
+sha256  8215844d14737d8fbb09fe1b1eafe688a8c790eafc8413a26c08e5795ac9ccd3  partclone-0.3.47.tar.gz
+
+# license files, locally calculated
+sha256  8b52533e235461c7b7d7ea5a5aea277173cc3e921d23a696cac14fbdf5f02698  AUTHORS
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/partclone/partclone.mk b/package/partclone/partclone.mk
new file mode 100644
index 0000000000..be24be816b
--- /dev/null
+++ b/package/partclone/partclone.mk
@@ -0,0 +1,105 @@
+################################################################################
+#
+# partclone
+#
+################################################################################
+
+PARTCLONE_VERSION = 0.3.47
+PARTCLONE_SITE = $(call github,Thomas-Tsai,partclone,$(PARTCLONE_VERSION))
+PARTCLONE_LICENSE = GPL-2.0
+PARTCLONE_LICENSE_FILES = AUTHORS COPYING
+
+PARTCLONE_DEPENDENCIES = openssl util-linux host-pkgconf
+
+ifeq ($(BR2_PACKAGE_PARTCLONE_XXHASH),y)
+PARTCLONE_DEPENDENCIES += xxhash
+PARTCLONE_CONF_OPTS += --enable-xxhash
+else
+PARTCLONE_CONF_OPTS += --disable-xxhash
+endif
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
+PARTCLONE_CONF_OPTS += --disable-btrfs
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
+PARTCLONE_DEPENDENCIES += libfuse3
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
+# from git, configure not shipped
+PARTCLONE_AUTORECONF = YES
+PARTCLONE_AUTOPOINT = YES
+
+$(eval $(autotools-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
