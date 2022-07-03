Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8573C43334
	for <buildroot@archiver.kernel.org>; Sun,  3 Jul 2022 09:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 001D7404CA;
	Sun,  3 Jul 2022 09:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 001D7404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MkF5sLR_T2-Y; Sun,  3 Jul 2022 09:42:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E24E1404F7;
	Sun,  3 Jul 2022 09:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E24E1404F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3FCD1BF593
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 09:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E5AA82F50
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 09:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E5AA82F50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QEUkhZyHkNBJ for <buildroot@lists.busybox.net>;
 Sun,  3 Jul 2022 09:42:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4A8482B93
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4A8482B93
 for <buildroot@buildroot.org>; Sun,  3 Jul 2022 09:42:52 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e28so9319457wra.0
 for <buildroot@buildroot.org>; Sun, 03 Jul 2022 02:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NzlrZ8GDWeBfAkFhAQLxoxZ5iT3fksqUrAG/bzJ7Z1Y=;
 b=Jk1iyPlRwBXvXkd6zFNf5BdJUWIYFajImxfeAnRhJdXZpnYz6btY8Nm8BnlMJe7R4B
 LDrLTLJGTr/sOovlmIiUaYNwoZlMKAvkH82bGhMnq6hPHU5n/u58v5diEPBI4x2t5r+3
 GXg6TaSqWwuDMytK0iZbxY7+XMkYewnfVk3E3fv4Qzm6IVTbqgZTYJYEwlwoDkPa+fU9
 K73lDWBUqDk/jZVIDhWfXhenwc8e9pFt3nkl7G7XLiTg+K9b2NYuC72g7lrUmrmP064r
 D4RPm3xyrqad7oLi8qyjGLHKBJa0l+X4rrUHOsqZLCG921BG0gJ0rcBEiFNyVaBxXV4O
 U8hA==
X-Gm-Message-State: AJIora8bERd3Q+M2OwI0n55FvjXW4NTuB3aUHje4j5IHKLddWbC3C4Pp
 JCVi3CXA+KNbN3je62V866qy8DfQEOs=
X-Google-Smtp-Source: AGRyM1uWduRGTnynVORSkdnwcECQzYq/s7iOhw/NFdYNtYkMhksxwlZv5urg7x8TsoD8wVl/SHuCHg==
X-Received: by 2002:adf:fb10:0:b0:207:af88:1eb9 with SMTP id
 c16-20020adffb10000000b00207af881eb9mr21895010wrr.238.1656841370593; 
 Sun, 03 Jul 2022 02:42:50 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v192-20020a1cacc9000000b003975c7058bfsm16143155wme.12.2022.07.03.02.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 02:42:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Jul 2022 11:39:52 +0200
Message-Id: <20220703093952.1300768-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NzlrZ8GDWeBfAkFhAQLxoxZ5iT3fksqUrAG/bzJ7Z1Y=;
 b=WFSGensDd/RxI2jri81t5+8dBGInjmmaBzKTiZ8mVhBRUlYx/vchModKIIzpvhmrrg
 cs5EpAk4kmp9ZqGzVaFlqttGNuFSINmBXJX7iO7k7bXeXFaQncUobYp5D/jWlRuzxZ/0
 i6RVawW5JaCOFpRjlK5He+GST4xcD4vwsfxbHw3lMQtaQCmEBRJ3UCI8SXBYiFDeDgXc
 FkJJQ4d+MpzXB3GCX/uPx6uPIZxEdkOOCVfb3zZ5jT0s7v3DJHtqUoxiY9XIw+Imp3Mq
 +rvocZFpIchXGS/E3uvJ46AlkwF1EyO41wWFYd6KyHObmlGMGh2e17+xedfWYlEHDO42
 nAGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WFSGensD
Subject: [Buildroot] [PATCH 1/1] package/erofs-utils: bump to version 1.5
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
Cc: Gao Xiang <hsiangkao@aol.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version)
- liberofs is now released under GPL-2.0+ OR Apache-2.0 license:
  https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=49b344c5531a7819f282b0b1b6eb01682c0e41ae
- This bump will fix the following build failure on or1k thanks to
  https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=100cae2b98a70ac69ae7a09ed94f86ddf8c89fe2

  In file included from ../include/erofs/cache.h:11,
                   from cache.c:9:
  ../include/erofs/internal.h:34:2: error: #error incompatible PAGE_SIZE is already defined
     34 | #error incompatible PAGE_SIZE is already defined
        |  ^~~~~

https://lists.ozlabs.org/pipermail/linux-erofs/2022-June/006462.html

Fixes:
 - http://autobuild.buildroot.org/results/755f8d736b8ad96b213bb3975b26f1143e60e5b5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-erofs-utils-dump-fix-de-nid-issues.patch | 134 -----------------
 ...0002-fsck-main.c-add-missing-include.patch |  31 ----
 ...fix-blobdev-without-Eforce-chunk-ind.patch |  40 ------
 ...-fix-Makefile-for-fsck.erofs-manpage.patch |  29 ----
 .../erofs-utils/0005-Add-disable-werror.patch | 136 ------------------
 package/erofs-utils/erofs-utils.hash          |   6 +-
 package/erofs-utils/erofs-utils.mk            |   6 +-
 7 files changed, 7 insertions(+), 375 deletions(-)
 delete mode 100644 package/erofs-utils/0001-erofs-utils-dump-fix-de-nid-issues.patch
 delete mode 100644 package/erofs-utils/0002-fsck-main.c-add-missing-include.patch
 delete mode 100644 package/erofs-utils/0003-erofs-utils-lib-fix-blobdev-without-Eforce-chunk-ind.patch
 delete mode 100644 package/erofs-utils/0004-erofs-utils-fix-Makefile-for-fsck.erofs-manpage.patch
 delete mode 100644 package/erofs-utils/0005-Add-disable-werror.patch

diff --git a/package/erofs-utils/0001-erofs-utils-dump-fix-de-nid-issues.patch b/package/erofs-utils/0001-erofs-utils-dump-fix-de-nid-issues.patch
deleted file mode 100644
index 493ce59177..0000000000
--- a/package/erofs-utils/0001-erofs-utils-dump-fix-de-nid-issues.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 17eb5c417bd56be4b2f7627c2d6879fbad6a86d6 Mon Sep 17 00:00:00 2001
-From: Gao Xiang <xiang@kernel.org>
-Date: Mon, 22 Nov 2021 07:48:48 +0800
-Subject: [PATCH] erofs-utils: dump: fix de->nid issues
-
-As David Michael reported, "
-    In file included from main.c:11:
-    main.c: In function 'erofs_checkdirent':
-    ../include/erofs/print.h:68:25: error: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type '__le64' {aka 'long unsigned int'} [-Werror=format=]
-       68 |                         "<E> " PR_FMT_FUNC_LINE(fmt),   \
-          |                         ^~~~~~
-    main.c:264:17: note: in expansion of macro 'erofs_err'
-      264 |                 erofs_err("invalid file type %llu", de->nid);
-          |                 ^~~~~~~~~
-    main.c: In function 'erofs_read_dirent':
-    ../include/erofs/print.h:68:25: error: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type '__le64' {aka 'long unsigned int'} [-Werror=format=]
-       68 |                         "<E> " PR_FMT_FUNC_LINE(fmt),   \
-          |                         ^~~~~~
-    main.c:303:25: note: in expansion of macro 'erofs_err'
-      303 |                         erofs_err("parse dir nid %llu error occurred\n",
-          |                         ^~~~~~~~~
-    cc1: all warnings being treated as errors
-"
-
-Also there are many de->nid lacking of endianness handling.
-Should fix them together.
-
-Link: https://lore.kernel.org/r/20211121234848.12663-1-xiang@kernel.org
-Fixes: cf8be8a4352a ("erofs-utils: dump: add feature for collecting filesystem statistics")
-Cc: Wang Qi <mpiglet@outlook.com>
-Cc: Guo Xuenan <guoxuenan@huawei.com>
-Reported-by: David Michael <fedora.dm0@gmail.com>
-Signed-off-by: Gao Xiang <xiang@kernel.org>
----
- dump/main.c | 31 ++++++++++++++++---------------
- 1 file changed, 16 insertions(+), 15 deletions(-)
-
-diff --git a/dump/main.c b/dump/main.c
-index b7560eca1080..f85903b059d2 100644
---- a/dump/main.c
-+++ b/dump/main.c
-@@ -242,11 +242,12 @@ static inline int erofs_checkdirent(struct erofs_dirent *de,
- {
- 	int dname_len;
- 	unsigned int nameoff = le16_to_cpu(de->nameoff);
-+	erofs_nid_t nid = le64_to_cpu(de->nid);
- 
- 	if (nameoff < sizeof(struct erofs_dirent) ||
- 			nameoff >= PAGE_SIZE) {
- 		erofs_err("invalid de[0].nameoff %u @ nid %llu",
--				nameoff, de->nid | 0ULL);
-+				nameoff, nid | 0ULL);
- 		return -EFSCORRUPTED;
- 	}
- 
-@@ -255,13 +256,12 @@ static inline int erofs_checkdirent(struct erofs_dirent *de,
- 	/* a corrupted entry is found */
- 	if (nameoff + dname_len > maxsize ||
- 			dname_len > EROFS_NAME_LEN) {
--		erofs_err("bogus dirent @ nid %llu",
--				le64_to_cpu(de->nid) | 0ULL);
-+		erofs_err("bogus dirent @ nid %llu", nid | 0ULL);
- 		DBG_BUGON(1);
- 		return -EFSCORRUPTED;
- 	}
- 	if (de->file_type >= EROFS_FT_MAX) {
--		erofs_err("invalid file type %llu", de->nid);
-+		erofs_err("invalid file type %llu", nid | 0ULL);
- 		return -EFSCORRUPTED;
- 	}
- 	return dname_len;
-@@ -273,7 +273,7 @@ static int erofs_read_dirent(struct erofs_dirent *de,
- {
- 	int err;
- 	erofs_off_t occupied_size = 0;
--	struct erofs_inode inode = { .nid = de->nid };
-+	struct erofs_inode inode = { .nid = le64_to_cpu(de->nid) };
- 
- 	stats.files++;
- 	stats.file_category_stat[de->file_type]++;
-@@ -296,12 +296,12 @@ static int erofs_read_dirent(struct erofs_dirent *de,
- 		update_file_size_statatics(occupied_size, inode.i_size);
- 	}
- 
--	if ((de->file_type == EROFS_FT_DIR)
--			&& de->nid != nid && de->nid != parent_nid) {
--		err = erofs_read_dir(de->nid, nid);
-+	if (de->file_type == EROFS_FT_DIR && inode.nid != nid &&
-+	    inode.nid != parent_nid) {
-+		err = erofs_read_dir(inode.nid, nid);
- 		if (err) {
- 			erofs_err("parse dir nid %llu error occurred\n",
--					de->nid);
-+				  inode.nid | 0ULL);
- 			return err;
- 		}
- 	}
-@@ -338,7 +338,8 @@ static int erofs_read_dir(erofs_nid_t nid, erofs_nid_t parent_nid)
- 			int ret;
- 
- 			/* skip "." and ".." dentry */
--			if (de->nid == nid || de->nid == parent_nid) {
-+			if (le64_to_cpu(de->nid) == nid ||
-+			    le64_to_cpu(de->nid) == parent_nid) {
- 				de++;
- 				continue;
- 			}
-@@ -399,18 +400,18 @@ static int erofs_get_pathname(erofs_nid_t nid, erofs_nid_t parent_nid,
- 			if (len < 0)
- 				return len;
- 
--			if (de->nid == target) {
-+			if (le64_to_cpu(de->nid) == target) {
- 				memcpy(path + pos, dname, len);
- 				path[pos + len] = '\0';
- 				return 0;
- 			}
- 
- 			if (de->file_type == EROFS_FT_DIR &&
--					de->nid != parent_nid &&
--					de->nid != nid) {
-+			    le64_to_cpu(de->nid) != parent_nid &&
-+			    le64_to_cpu(de->nid) != nid) {
- 				memcpy(path + pos, dname, len);
--				err = erofs_get_pathname(de->nid, nid,
--						target, path, pos + len);
-+				err = erofs_get_pathname(le64_to_cpu(de->nid),
-+						nid, target, path, pos + len);
- 				if (!err)
- 					return 0;
- 				memset(path + pos, 0, len);
--- 
-2.30.2
-
diff --git a/package/erofs-utils/0002-fsck-main.c-add-missing-include.patch b/package/erofs-utils/0002-fsck-main.c-add-missing-include.patch
deleted file mode 100644
index c4fe71c9e6..0000000000
--- a/package/erofs-utils/0002-fsck-main.c-add-missing-include.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1ca453ee89894b1669ac78d7f216bda172783e8d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 6 Dec 2021 20:14:03 +0100
-Subject: [PATCH] fsck/main.c: add missing include
-
-Otherwise musl C library builds fail with missing S_IFMT/S_IFDIR
-definitions.
-
-Link: https://lore.kernel.org/r/20211206191403.1435229-1-alex@linutronix.de
-Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
----
- fsck/main.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/fsck/main.c b/fsck/main.c
-index aefa881f740a..ad48e35f587b 100644
---- a/fsck/main.c
-+++ b/fsck/main.c
-@@ -6,6 +6,7 @@
- #include <stdlib.h>
- #include <getopt.h>
- #include <time.h>
-+#include <sys/stat.h>
- #include "erofs/print.h"
- #include "erofs/io.h"
- #include "erofs/decompress.h"
--- 
-2.30.2
-
diff --git a/package/erofs-utils/0003-erofs-utils-lib-fix-blobdev-without-Eforce-chunk-ind.patch b/package/erofs-utils/0003-erofs-utils-lib-fix-blobdev-without-Eforce-chunk-ind.patch
deleted file mode 100644
index 88979eb28f..0000000000
--- a/package/erofs-utils/0003-erofs-utils-lib-fix-blobdev-without-Eforce-chunk-ind.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From eb255afa101b52096bd3e5e48f990576190f03bd Mon Sep 17 00:00:00 2001
-From: Gao Xiang <hsiangkao@linux.alibaba.com>
-Date: Thu, 23 Dec 2021 16:49:07 +0800
-Subject: [PATCH] erofs-utils: lib: fix --blobdev without -Eforce-chunk-indexes
-
-blockmap is used by default, chunk indexes should be switched
-instead if --blobdev is specified.
-
-Link: https://lore.kernel.org/r/20211223084907.93020-1-hsiangkao@linux.alibaba.com
-Fixes: 016bd812be1e ("erofs-utils: mkfs: enable block map chunk format")
-Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
----
- lib/blobchunk.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/lib/blobchunk.c b/lib/blobchunk.c
-index 5e9a88a30af3..a145be917b4a 100644
---- a/lib/blobchunk.c
-+++ b/lib/blobchunk.c
-@@ -113,7 +113,7 @@ int erofs_blob_write_chunk_indexes(struct erofs_inode *inode,
- 
- 	if (multidev) {
- 		idx.device_id = 1;
--		inode->u.chunkformat |= EROFS_CHUNK_FORMAT_INDEXES;
-+		DBG_BUGON(!(inode->u.chunkformat & EROFS_CHUNK_FORMAT_INDEXES));
- 	} else {
- 		base_blkaddr = remapped_base;
- 	}
-@@ -171,6 +171,8 @@ int erofs_blob_write_chunked_file(struct erofs_inode *inode)
- 	int fd, ret;
- 
- 	inode->u.chunkformat |= inode->u.chunkbits - LOG_BLOCK_SIZE;
-+	if (multidev)
-+		inode->u.chunkformat |= EROFS_CHUNK_FORMAT_INDEXES;
- 
- 	if (inode->u.chunkformat & EROFS_CHUNK_FORMAT_INDEXES)
- 		unit = sizeof(struct erofs_inode_chunk_index);
--- 
-2.30.2
-
diff --git a/package/erofs-utils/0004-erofs-utils-fix-Makefile-for-fsck.erofs-manpage.patch b/package/erofs-utils/0004-erofs-utils-fix-Makefile-for-fsck.erofs-manpage.patch
deleted file mode 100644
index 27832d1e32..0000000000
--- a/package/erofs-utils/0004-erofs-utils-fix-Makefile-for-fsck.erofs-manpage.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 534eda7f8678e5b8fc8ca0f5cf0d9d7a932e0d48 Mon Sep 17 00:00:00 2001
-From: Gao Xiang <xiang@kernel.org>
-Date: Mon, 22 Nov 2021 07:58:40 +0800
-Subject: [PATCH] erofs-utils: fix Makefile for fsck.erofs manpage
-
-Add the missing dependency for fsck.erofs manpage.
-
-Link: https://lore.kernel.org/r/20211121235840.17600-1-xiang@kernel.org
-Fixes: f44043561491 ("erofs-utils: introduce fsck.erofs")
-Signed-off-by: Gao Xiang <xiang@kernel.org>
----
- man/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/man/Makefile.am b/man/Makefile.am
-index 769b5578a175..4628b85df2ef 100644
---- a/man/Makefile.am
-+++ b/man/Makefile.am
-@@ -1,6 +1,6 @@
- # SPDX-License-Identifier: GPL-2.0+
- 
--dist_man_MANS = mkfs.erofs.1 dump.erofs.1
-+dist_man_MANS = mkfs.erofs.1 dump.erofs.1 fsck.erofs.1
- 
- EXTRA_DIST = erofsfuse.1
- if ENABLE_FUSE
--- 
-2.30.2
-
diff --git a/package/erofs-utils/0005-Add-disable-werror.patch b/package/erofs-utils/0005-Add-disable-werror.patch
deleted file mode 100644
index 8b286c3265..0000000000
--- a/package/erofs-utils/0005-Add-disable-werror.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-From eb79816f85db164af732a5bcbb42d09214845874 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 21 Apr 2022 00:10:18 +0200
-Subject: erofs-utils: add --disable-werror
-
-Add an option to disable -Werror to fix the following build failure [1] with
-gcc 4.8 raised since version 1.4 and [2]
-
-In file included from /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/string.h:636:0,
-                 from ../include/erofs/internal.h:242,
-                 from ../include/erofs/inode.h:11,
-                 from main.c:12:
-In function 'memset',
-    inlined from 'erofsdump_filetype_distribution.constprop.2' at main.c:583:9:
-/home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/bits/string3.h:81:30: error: call to '__warn_memset_zero_len' declared with attribute warning: memset used with constant zero length parameter; this could be due to transposed parameters [-Werror]
-       __warn_memset_zero_len ();
-
-[1] http://autobuild.buildroot.org/results/4c776ec935bbb016231b6701471887a7c9ea79e9
-[2] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=cf8be8a4352a
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Link: https://lore.kernel.org/r/20220420221018.1396105-1-fontaine.fabrice@gmail.com
-Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
-[Retrieved (and backported) from:
-https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?h=dev&id=eb79816f85db164af732a5bcbb42d09214845874]
----
- configure.ac     | 13 ++++++++++++-
- dump/Makefile.am |  2 +-
- fsck/Makefile.am |  2 +-
- fuse/Makefile.am |  2 +-
- lib/Makefile.am  |  2 +-
- mkfs/Makefile.am |  2 +-
- 6 files changed, 17 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index fa917e6..53bf882 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -11,7 +11,7 @@ AC_CONFIG_SRCDIR([config.h.in])
- AC_CONFIG_HEADERS([config.h])
- AC_CONFIG_MACRO_DIR([m4])
- AC_CONFIG_AUX_DIR(config)
--AM_INIT_AUTOMAKE([foreign -Wall -Werror])
-+AM_INIT_AUTOMAKE([foreign -Wall])
- 
- # Checks for programs.
- AM_PROG_AR
-@@ -65,6 +65,12 @@ AC_ARG_ENABLE([debug],
-     [enable_debug="$enableval"],
-     [enable_debug="no"])
- 
-+AC_ARG_ENABLE([werror],
-+    [AS_HELP_STRING([--enable-werror],
-+                    [enable -Werror @<:@default=no@:>@])],
-+    [enable_werror="$enableval"],
-+    [enable_werror="no"])
-+
- AC_ARG_ENABLE(lz4,
-    [AS_HELP_STRING([--disable-lz4], [disable LZ4 compression support @<:@default=enabled@:>@])],
-    [enable_lz4="$enableval"], [enable_lz4="yes"])
-@@ -197,6 +203,11 @@ AS_IF([test "x$enable_debug" != "xno"], [], [
-   CPPFLAGS="$CPPFLAGS -DNDEBUG"
- ])
- 
-+# Configure -Werror
-+AS_IF([test "x$enable_werror" != "xyes"], [], [
-+  CPPFLAGS="$CPPFLAGS -Werror"
-+])
-+
- # Configure libuuid
- AS_IF([test "x$with_uuid" != "xno"], [
-   PKG_CHECK_MODULES([libuuid], [uuid])
-diff --git a/dump/Makefile.am b/dump/Makefile.am
-index 9f0cd3f..c2bef6d 100644
---- a/dump/Makefile.am
-+++ b/dump/Makefile.am
-@@ -5,6 +5,6 @@ AUTOMAKE_OPTIONS = foreign
- bin_PROGRAMS     = dump.erofs
- AM_CPPFLAGS = ${libuuid_CFLAGS}
- dump_erofs_SOURCES = main.c
--dump_erofs_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
-+dump_erofs_CFLAGS = -Wall -I$(top_srcdir)/include
- dump_erofs_LDADD = $(top_builddir)/lib/liberofs.la ${libselinux_LIBS} \
- 	${libuuid_LIBS} ${liblz4_LIBS} ${liblzma_LIBS}
-diff --git a/fsck/Makefile.am b/fsck/Makefile.am
-index 55b31ea..e6a1fb6 100644
---- a/fsck/Makefile.am
-+++ b/fsck/Makefile.am
-@@ -5,6 +5,6 @@ AUTOMAKE_OPTIONS = foreign
- bin_PROGRAMS     = fsck.erofs
- AM_CPPFLAGS = ${libuuid_CFLAGS}
- fsck_erofs_SOURCES = main.c
--fsck_erofs_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
-+fsck_erofs_CFLAGS = -Wall -I$(top_srcdir)/include
- fsck_erofs_LDADD = $(top_builddir)/lib/liberofs.la ${libselinux_LIBS} \
- 	${libuuid_LIBS} ${liblz4_LIBS} ${liblzma_LIBS}
-diff --git a/fuse/Makefile.am b/fuse/Makefile.am
-index 5aa5ac0..3179a2b 100644
---- a/fuse/Makefile.am
-+++ b/fuse/Makefile.am
-@@ -4,7 +4,7 @@ AUTOMAKE_OPTIONS = foreign
- noinst_HEADERS = $(top_srcdir)/fuse/macosx.h
- bin_PROGRAMS     = erofsfuse
- erofsfuse_SOURCES = dir.c main.c
--erofsfuse_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
-+erofsfuse_CFLAGS = -Wall -I$(top_srcdir)/include
- erofsfuse_CFLAGS += -DFUSE_USE_VERSION=26 ${libfuse_CFLAGS} ${libselinux_CFLAGS}
- erofsfuse_LDADD = $(top_builddir)/lib/liberofs.la ${libfuse_LIBS} ${liblz4_LIBS} \
- 	${libselinux_LIBS} ${liblzma_LIBS}
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index 4a25013..3fad357 100644
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -28,7 +28,7 @@ noinst_HEADERS += compressor.h
- liberofs_la_SOURCES = config.c io.c cache.c super.c inode.c xattr.c exclude.c \
- 		      namei.c data.c compress.c compressor.c zmap.c decompress.c \
- 		      compress_hints.c hashmap.c sha256.c blobchunk.c
--liberofs_la_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
-+liberofs_la_CFLAGS = -Wall -I$(top_srcdir)/include
- if ENABLE_LZ4
- liberofs_la_CFLAGS += ${LZ4_CFLAGS}
- liberofs_la_SOURCES += compressor_lz4.c
-diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
-index 2a4bc1d..709d9bf 100644
---- a/mkfs/Makefile.am
-+++ b/mkfs/Makefile.am
-@@ -4,6 +4,6 @@ AUTOMAKE_OPTIONS = foreign
- bin_PROGRAMS     = mkfs.erofs
- AM_CPPFLAGS = ${libuuid_CFLAGS} ${libselinux_CFLAGS}
- mkfs_erofs_SOURCES = main.c
--mkfs_erofs_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
-+mkfs_erofs_CFLAGS = -Wall -I$(top_srcdir)/include
- mkfs_erofs_LDADD = ${libuuid_LIBS} $(top_builddir)/lib/liberofs.la ${libselinux_LIBS} \
- 	${liblz4_LIBS} ${liblzma_LIBS}
--- 
-cgit 
-
diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
index aca5677d17..a03a0d5a7d 100644
--- a/package/erofs-utils/erofs-utils.hash
+++ b/package/erofs-utils/erofs-utils.hash
@@ -1,3 +1,5 @@
 # Locally computed
-sha256  67702b1fc5da05719d95ddb7c107e334b04365f5161a9717479d2831fca85a98  erofs-utils-1.4.tar.gz
-sha256  feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  COPYING
+sha256  2310fa4377b566bf943e8eef992db3990f759528d5973e700efe3e4cb115ec23  erofs-utils-1.5.tar.gz
+sha256  0df042de29b44887355db86c79708a4489ce6e6666f6e33ad02040293f09e6a2  COPYING
+sha256  a400f85dd06d230f1b308cde4290a53f345b6e320a376b7904b31c51c2fd4b1a  LICENSES/Apache-2.0
+sha256  feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  LICENSES/GPL-2.0
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index 03df2be366..df4c652d30 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-EROFS_UTILS_VERSION = 1.4
+EROFS_UTILS_VERSION = 1.5
 EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
-EROFS_UTILS_LICENSE = GPL-2.0+
-EROFS_UTILS_LICENSE_FILES = COPYING
+EROFS_UTILS_LICENSE = GPL-2.0+, GPL-2.0+ or Apache-2.0 (liberofs)
+EROFS_UTILS_LICENSE_FILES = COPYING LICENSES/Apache-2.0 LICENSES/GPL-2.0
 
 # From a git tree: no generated autotools files
 EROFS_UTILS_AUTORECONF = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
