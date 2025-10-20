Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F72CCD1A2
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 20:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BD2D41886;
	Mon, 20 Oct 2025 20:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTKi12bkTWGI; Mon, 20 Oct 2025 20:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E1B3418B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E1B3418B6;
	Mon, 20 Oct 2025 20:38:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2B89277
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B95174177A
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Co7AtI5y4kuP for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 20:38:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B8F77415C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8F77415C3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8F77415C3
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:38:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB510A4C1ECE
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 22:38:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51206)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vAwe3-0000000071B-3mta
 for buildroot@buildroot.org; Mon, 20 Oct 2025 20:38:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 20 Oct 2025 22:38:19 +0200
Message-ID: <20251020203819.2778541-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760992699;
 bh=6N3gpda0wyB75m2p/yJLRl/P7uFgoj/rfK+poet6PCc=;
 h=From:To:Subject:Date:From;
 b=Z2POR6Mb0+zR5D9gjdB6ilSz/0x9+o19p+9dXDfa4kLdbaRu/2xLQ0Gc2kqo7Hspq
 YFrff4Nf1Oy8OusIWh+bsAbXcS5tGxNNZ+0WWclmoRgjpZG39LSLYwky7Zf3Q2eGJB
 VAAuy3NOzGC868ALTDcE6L1jVUQ6l7dU21X3RZvbnLxBe1U6DYLyc33FnfEAPQihG9
 rPbxwXQrQ06EGW79954/fFqOz6rvosS3qaVDajJMqydIhBS+FkXDIGcoFABmJNj+Cw
 ljQtbDXmOQEnkKVBSlSd234jGBRo/UzpjQFaqHENc9vhApVJeKaMIbbt4Oyuxx+AoU
 8W+4O/RLKXQyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=Z2POR6Mb
Subject: [Buildroot] [PATCH 1/1] package/unixodbc: bump version to 2.3.14
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

Release notes:
https://github.com/lurcher/unixODBC/releases/tag/v2.3.13
https://github.com/lurcher/unixODBC/releases/tag/v2.3.14

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...r-Fix-incompatible-pointer-to-intege.patch | 49 -------------------
 package/unixodbc/unixodbc.hash                |  2 +-
 package/unixodbc/unixodbc.mk                  |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/unixodbc/0001-PostgreSQL-driver-Fix-incompatible-pointer-to-intege.patch

diff --git a/package/unixodbc/0001-PostgreSQL-driver-Fix-incompatible-pointer-to-intege.patch b/package/unixodbc/0001-PostgreSQL-driver-Fix-incompatible-pointer-to-intege.patch
deleted file mode 100644
index 8efe6dae4e..0000000000
--- a/package/unixodbc/0001-PostgreSQL-driver-Fix-incompatible-pointer-to-intege.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 45f501e1be2db6b017cc242c79bfb9de32b332a1 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 29 Jan 2024 08:27:29 +0100
-Subject: [PATCH] PostgreSQL driver: Fix incompatible pointer-to-integer types
-
-These result in out-of-bounds stack writes on 64-bit architectures
-(caller has 4 bytes, callee writes 8 bytes), and seem to have gone
-unnoticed on little-endian architectures (although big-endian
-architectures must be broken).
-
-This change is required to avoid a build failure with GCC 14.
-
-Upstream: https://github.com/lurcher/unixODBC/commit/45f501e1be2db6b017cc242c79bfb9de32b332a1
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Drivers/Postgre7.1/info.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Drivers/Postgre7.1/info.c b/Drivers/Postgre7.1/info.c
-index 63ac91f..2216ecd 100644
---- a/Drivers/Postgre7.1/info.c
-+++ b/Drivers/Postgre7.1/info.c
-@@ -1779,14 +1779,14 @@ char *table_name;
- char index_name[MAX_INFO_STRING];
- short fields_vector[8];
- char isunique[10], isclustered[10];
--SDWORD index_name_len, fields_vector_len;
-+SQLLEN index_name_len, fields_vector_len;
- TupleNode *row;
- int i;
- HSTMT hcol_stmt;
- StatementClass *col_stmt, *indx_stmt;
- char column_name[MAX_INFO_STRING], relhasrules[MAX_INFO_STRING];
- char **column_names = 0;
--Int4 column_name_len;
-+SQLLEN column_name_len;
- int total_columns = 0;
- char error = TRUE;
- ConnInfo *ci;
-@@ -2136,7 +2136,7 @@ HSTMT htbl_stmt;
- StatementClass *tbl_stmt;
- char tables_query[STD_STATEMENT_LEN];
- char attname[MAX_INFO_STRING];
--SDWORD attname_len;
-+SQLLEN attname_len;
- char pktab[MAX_TABLE_LEN + 1];
- Int2 result_cols;
- 
diff --git a/package/unixodbc/unixodbc.hash b/package/unixodbc/unixodbc.hash
index 6262dab5ae..e81448adbd 100644
--- a/package/unixodbc/unixodbc.hash
+++ b/package/unixodbc/unixodbc.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  f210501445ce21bf607ba51ef8c125e10e22dffdffec377646462df5f01915ec  unixODBC-2.3.12.tar.gz
+sha256  4e2814de3e01fc30b0b9f75e83bb5aba91ab0384ee951286504bb70205524771  unixODBC-2.3.14.tar.gz
 sha256  a6b9aa1e9bfade121164c06fd975e9b913a8e38bf33d25ff967dfa3ed07d12f8  COPYING
 sha256  1e594f4c7fd6d099eca4bd1340b39d871ce0298331d8ebd4b68935548ee45cf4  exe/COPYING
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index 302b964a44..47c08a39eb 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNIXODBC_VERSION = 2.3.12
+UNIXODBC_VERSION = 2.3.14
 UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
 UNIXODBC_SITE = http://www.unixodbc.org
 UNIXODBC_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
