Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231F6CD98F2
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 19:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEA186FA5B;
	Sat, 20 Jun 2026 19:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSyprcKzJOok; Sat, 20 Jun 2026 19:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71A6B6FA58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781985472;
	bh=4gBMurWillNtYta92JMYCZy6hOczZgaL1nU4yczq8Po=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dRi63w4PCqb9fu0Y/XC0+A+lq5gTyC2blB+67b75vYfeBQv+V5wpYmOl0yYGNOnvn
	 stz4mMhmUnYulyaNvxw33ki4CuK0xubLZ+fzVt8g/KJgIAV0YF36BxbznCf+1buu0Z
	 mQ3rGtEtgJBbD0mD7pxBvaM4ZYBh7dbAjlxoc9VlJBIx1x3tUYIUsiX4trbiY/x/GX
	 Rl8sLZitNWcEdI3mOmx7I9kJz4XK/kxuRGbp2B8QcCntka2qZyZ6ZcbI1o+ELIv9aY
	 QGA/WwtKuOGmpx1roiRMseVBhtYYel3HBRtOI1GS7TNF/5pYNhD6gXFgobQbp3jXID
	 x1iIyLQgLflcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71A6B6FA58;
	Sat, 20 Jun 2026 19:57:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CD7224D
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 19:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EF9D4EBDA
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 19:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hU0Pb4h66HsP for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 19:57:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA0B84EBD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA0B84EBD4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA0B84EBD4
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 19:57:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 64957A4C16D7;
 Sat, 20 Jun 2026 21:57:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33406)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wb1p3-000000002A1-3VKC;
 Sat, 20 Jun 2026 19:57:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 20 Jun 2026 21:57:45 +0200
Message-ID: <20260620195745.3841147-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781985466;
 bh=N6Dwe25f8AJKTiOt6hw/p1ekFNfyRa8kPRzBh9X3qaw=;
 h=From:To:Cc:Subject:Date:From;
 b=i9AoANO82OorI/65eN1PSPpvNcoUVqXxVtP9sXZoVfwR0E2Ogs117cCV8J8C+vbjZ
 aSTSQmXC8wm1vMJ9Cv/1WVdXLt51ZEatnW0n2wpPMswiMwAW2CZyo2KqcuaQ55qb3x
 rVRWjtQJo9ypTGmIa2c7l6SUunybNhOp3Lui+Ig7v7pmEJgaZ0XQ5vVS7vIGzpODCh
 ilXp2fU5MhOa4WYAmLP5ZYhKZM9B3xiFT1qNXxuOpVae+n1DKkdRfZc0Rets/zg/g9
 5ZXj9dpzgxgd0sZv+Fo/nKKbeamEojpKmd0AV7LgEkuXYWkqTPOv7k4skwiiX+eycj
 /Hg1flqH8pY+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=i9AoANO8
Subject: [Buildroot] [PATCH 1/1] package/util-linux: bump version to 2.42.2
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

https://www.kernel.org/pub/linux/utils/util-linux/v2.42/v2.42.2-ReleaseNotes
https://www.kernel.org/pub/linux/utils/util-linux/v2.42/v2.42.1-ReleaseNotes
https://www.kernel.org/pub/linux/utils/util-linux/v2.42/v2.42-ReleaseNotes

Removed patches which were applied upstream, also remove autoreconf.

Patch 0001 was applied as
https://github.com/util-linux/util-linux/commit/57dab03caf941bf01544cc4548e36cc0c3357d2c
after the rename of the original header with commit
https://github.com/util-linux/util-linux/commit/f419d67de67610180fb04e64d21323ce8927d31d

Added Config.in options for new commands copyfilerange & getino.

copyfilerange is broken according to the Gitlab pipelines only with the
br-arm-full-static defconfig:

  configure: WARNING: Unable to detect syscall copy_file_range.
  configure: error: copyfilerange selected but copy_file_range syscall
    not found

so we disable copyfilerange for uClibc for now.

getino builds when current uClibc is built from source but fails on the
Gitlab pipelines with all uClibc-based toolchains:

  configure: error: getino selected, but required statx function not
    available

so we disable getino for uClibc for now.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Various Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a30b9957573521f2a92ce6e0d9a8f1c12ca373d1

 ...api-utils.h-fix-LSMT_ROOT-definition.patch | 44 -------------------
 ...optionally-add-libpthread-to-uuid.pc.patch | 42 ------------------
 package/util-linux/Config.in                  | 25 +++++++++++
 ...api-utils.h-fix-LSMT_ROOT-definition.patch | 44 -------------------
 ...optionally-add-libpthread-to-uuid.pc.patch | 42 ------------------
 .../util-linux-libs/util-linux-libs.mk        |  3 --
 package/util-linux/util-linux.hash            |  4 +-
 package/util-linux/util-linux.mk              |  9 ++--
 8 files changed, 31 insertions(+), 182 deletions(-)
 delete mode 100644 package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
 delete mode 100644 package/util-linux/0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
 delete mode 100644 package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
 delete mode 100644 package/util-linux/util-linux-libs/0002-autotools-optionally-add-libpthread-to-uuid.pc.patch

diff --git a/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch b/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
deleted file mode 100644
index d98c225500..0000000000
--- a/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 72ff3b8998a675900fcb7c18c0e03f1552b13a8b Mon Sep 17 00:00:00 2001
-From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
-Date: Tue, 14 Apr 2026 11:04:08 +0530
-Subject: [PATCH] include/mount-api-utils.h: fix LSMT_ROOT definition
-
-Commit
-ded434a63f3eee7fd7805b18d6c9bb912016c3c8 ("include/mount-api-utils:
-add statmount and listmount") introduce a fallback definition for the
-LSMT_ROOT defined, but a small typo makes this fallback definition
-ineffective:
-
- #ifdef LSMT_ROOT
- # define LSMT_ROOT ...
- #endif
-
-Should obviously have been:
-
- #ifndef LSMT_ROOT
- # define LSMT_ROOT ...
- #endif
-
-Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
-Upstream: https://lore.kernel.org/util-linux/20260530094932.2351791-1-thomas.petazzoni@bootlin.com/T/#u
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- include/mount-api-utils.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/mount-api-utils.h b/include/mount-api-utils.h
-index a916f99..87e173e 100644
---- a/include/mount-api-utils.h
-+++ b/include/mount-api-utils.h
-@@ -339,7 +339,7 @@ struct ul_statmount {
- /*
-  * Special @mnt_id values that can be passed to listmount
-  */
--#ifdef LSMT_ROOT
-+#ifndef LSMT_ROOT
- # define LSMT_ROOT              0xffffffffffffffff    /* root mount */
- #endif
- 
--- 
-2.53.0
-
diff --git a/package/util-linux/0002-autotools-optionally-add-libpthread-to-uuid.pc.patch b/package/util-linux/0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
deleted file mode 100644
index ef59e458e1..0000000000
--- a/package/util-linux/0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From a06adacd1009174b7ca35f529a2db165f6c1f3aa Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Fri, 16 Jan 2026 23:33:34 +0100
-Subject: [PATCH] autotools: optionally add libpthread to uuid.pc
-
-Fixes https://github.com/util-linux/util-linux/issues/3210#issuecomment-3477915953
-
-Upstream: https://github.com/util-linux/util-linux/commit/d88a62e4cd385e07b3cb8fb309bbb03981ea2970
-
-[Bernd: backported to 2.41.3]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Makefile.am        | 1 +
- libuuid/uuid.pc.in | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 01e99701d..cd1d157ce 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -189,6 +189,7 @@ edit_cmd = sed \
- 	 -e 's|@usrbin_execdir[@]|$(usrbin_execdir)|g' \
- 	 -e 's|@usrsbin_execdir[@]|$(usrsbin_execdir)|g' \
- 	 -e 's|@SOCKET_LIBS[@]|$(SOCKET_LIBS)|g' \
-+	 -e 's|@PTHREAD_LIBS[@]|$(PTHREAD_LIBS)|g' \
- 	 -e 's|@VERSION[@]|$(VERSION)|g' \
- 	 -e 's|@ADJTIME_PATH[@]|$(ADJTIME_PATH)|g' \
- 	 -e 's|@LIBUUID_VERSION[@]|$(LIBUUID_VERSION)|g' \
-diff --git a/libuuid/uuid.pc.in b/libuuid/uuid.pc.in
-index 51929fe80..a40dc6644 100644
---- a/libuuid/uuid.pc.in
-+++ b/libuuid/uuid.pc.in
-@@ -7,5 +7,5 @@ Name: uuid
- Description: Universally unique id library
- Version: @LIBUUID_VERSION@
- Cflags: -I${includedir}/uuid
--Libs.private: @SOCKET_LIBS@ -lpthread
-+Libs.private: @SOCKET_LIBS@ @PTHREAD_LIBS@
- Libs: -L${libdir} -luuid
--- 
-2.47.3
-
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index df7435e71a..590a0607e8 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -106,6 +106,17 @@ config BR2_PACKAGE_UTIL_LINUX_CHMEM
 	help
 	  Sets a particular size or range of memory online or offline
 
+config BR2_PACKAGE_UTIL_LINUX_COPYFILERANGE
+	bool "copyfilerange"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # copy_file_range
+	help
+	  Copy file ranges using the copy_file_range() syscall
+
+comment "copyfilerange needs a musl or glibc toolchain"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
+
 config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "cramfs utilities"
 	depends on BR2_USE_MMU # fork()
@@ -144,6 +155,20 @@ config BR2_PACKAGE_UTIL_LINUX_FSCK
 	help
 	  Check and repair a linux filesystem
 
+config BR2_PACKAGE_UTIL_LINUX_GETINO
+	bool "getino"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3 # pidfd_open
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # statx
+	help
+	  Print the unique inode number associated with a process
+	  file descriptor or namespace for a given PID.
+
+comment "getino needs a musl or glibc toolchain w/ headers >= 5.3"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3 \
+		|| BR2_TOOLCHAIN_USES_UCLIBC
+
 config BR2_PACKAGE_UTIL_LINUX_HARDLINK
 	bool "hardlink"
 	depends on BR2_USE_MMU # fork()
diff --git a/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch b/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
deleted file mode 100644
index d98c225500..0000000000
--- a/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 72ff3b8998a675900fcb7c18c0e03f1552b13a8b Mon Sep 17 00:00:00 2001
-From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
-Date: Tue, 14 Apr 2026 11:04:08 +0530
-Subject: [PATCH] include/mount-api-utils.h: fix LSMT_ROOT definition
-
-Commit
-ded434a63f3eee7fd7805b18d6c9bb912016c3c8 ("include/mount-api-utils:
-add statmount and listmount") introduce a fallback definition for the
-LSMT_ROOT defined, but a small typo makes this fallback definition
-ineffective:
-
- #ifdef LSMT_ROOT
- # define LSMT_ROOT ...
- #endif
-
-Should obviously have been:
-
- #ifndef LSMT_ROOT
- # define LSMT_ROOT ...
- #endif
-
-Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
-Upstream: https://lore.kernel.org/util-linux/20260530094932.2351791-1-thomas.petazzoni@bootlin.com/T/#u
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- include/mount-api-utils.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/mount-api-utils.h b/include/mount-api-utils.h
-index a916f99..87e173e 100644
---- a/include/mount-api-utils.h
-+++ b/include/mount-api-utils.h
-@@ -339,7 +339,7 @@ struct ul_statmount {
- /*
-  * Special @mnt_id values that can be passed to listmount
-  */
--#ifdef LSMT_ROOT
-+#ifndef LSMT_ROOT
- # define LSMT_ROOT              0xffffffffffffffff    /* root mount */
- #endif
- 
--- 
-2.53.0
-
diff --git a/package/util-linux/util-linux-libs/0002-autotools-optionally-add-libpthread-to-uuid.pc.patch b/package/util-linux/util-linux-libs/0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
deleted file mode 100644
index ef59e458e1..0000000000
--- a/package/util-linux/util-linux-libs/0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From a06adacd1009174b7ca35f529a2db165f6c1f3aa Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Fri, 16 Jan 2026 23:33:34 +0100
-Subject: [PATCH] autotools: optionally add libpthread to uuid.pc
-
-Fixes https://github.com/util-linux/util-linux/issues/3210#issuecomment-3477915953
-
-Upstream: https://github.com/util-linux/util-linux/commit/d88a62e4cd385e07b3cb8fb309bbb03981ea2970
-
-[Bernd: backported to 2.41.3]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Makefile.am        | 1 +
- libuuid/uuid.pc.in | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 01e99701d..cd1d157ce 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -189,6 +189,7 @@ edit_cmd = sed \
- 	 -e 's|@usrbin_execdir[@]|$(usrbin_execdir)|g' \
- 	 -e 's|@usrsbin_execdir[@]|$(usrsbin_execdir)|g' \
- 	 -e 's|@SOCKET_LIBS[@]|$(SOCKET_LIBS)|g' \
-+	 -e 's|@PTHREAD_LIBS[@]|$(PTHREAD_LIBS)|g' \
- 	 -e 's|@VERSION[@]|$(VERSION)|g' \
- 	 -e 's|@ADJTIME_PATH[@]|$(ADJTIME_PATH)|g' \
- 	 -e 's|@LIBUUID_VERSION[@]|$(LIBUUID_VERSION)|g' \
-diff --git a/libuuid/uuid.pc.in b/libuuid/uuid.pc.in
-index 51929fe80..a40dc6644 100644
---- a/libuuid/uuid.pc.in
-+++ b/libuuid/uuid.pc.in
-@@ -7,5 +7,5 @@ Name: uuid
- Description: Universally unique id library
- Version: @LIBUUID_VERSION@
- Cflags: -I${includedir}/uuid
--Libs.private: @SOCKET_LIBS@ -lpthread
-+Libs.private: @SOCKET_LIBS@ @PTHREAD_LIBS@
- Libs: -L${libdir} -luuid
--- 
-2.47.3
-
diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 6716a656d2..9340d5ae4f 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -21,9 +21,6 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-3-Clause \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later
 
-# 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
-UTIL_LINUX_LIBS_AUTORECONF = YES
-
 UTIL_LINUX_LIBS_INSTALL_STAGING = YES
 UTIL_LINUX_LIBS_DEPENDENCIES = \
 	host-pkgconf \
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index b6393d6ec0..b65527408b 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
-# From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
-sha256  f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db4429a414d8aa6a728  util-linux-2.41.5.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.42/sha256sums.asc
+sha256  03a05d3adf9602ef128f2da05b84b3205ce60c351e5737c0370f74000679ce8a  util-linux-2.42.2.tar.xz
 # License files, locally calculated
 sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
 sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 20bdcc5c3f..b8567b6992 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -7,8 +7,8 @@
 # When making changes to this file, please check if
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
-UTIL_LINUX_VERSION_MAJOR = 2.41
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).5
+UTIL_LINUX_VERSION_MAJOR = 2.42
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
@@ -37,9 +37,6 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 
-# 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
-UTIL_LINUX_AUTORECONF = YES
-
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
@@ -166,11 +163,13 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CAL),--enable-cal,--disable-cal) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH),--enable-chfn-chsh,--disable-chfn-chsh) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CHMEM),--enable-chmem,--disable-chmem) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_COPYFILERANGE),--enable-copyfilerange,--disable-copyfilerange) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CRAMFS),--enable-cramfs,--disable-cramfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_EJECT),--enable-eject,--disable-eject) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FDFORMAT),--enable-fdformat,--disable-fdformat) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_GETINO),--enable-getino,--disable-getino) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_HARDLINK),--enable-hardlink,--disable-hardlink) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_HWCLOCK),--enable-hwclock --disable-hwclock-gplv3,--disable-hwclock) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCMK),--enable-ipcmk,--disable-ipcmk) \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
