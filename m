Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117FFC27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3B9D41807;
	Thu,  6 Jun 2024 19:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Q24Y0Q4UySA; Thu,  6 Jun 2024 19:24:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7152D4191C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7152D4191C;
	Thu,  6 Jun 2024 19:24:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 400D11BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F70841782
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0ISGDVEDKq8 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:24:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8947B41720
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8947B41720
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:24:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82A7187D5C; Thu,  6 Jun 2024 19:24:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Jun 2024 21:23:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3f47c2486069fa6ee843f39a790d9bbde5de6f6
X-Git-Newrev: 4f8167b5cac41cc78e124236f41c0289fca6ee6c
X-Patchwork-Hint: ignore
Message-Id: <20240606192439.82A7187D5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unixodbc: fix build with gcc 14.x
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4f8167b5cac41cc78e124236f41c0289fca6ee6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...driver-Fix-incompatible-pointer-to-intege.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/unixodbc/0001-PostgreSQL-driver-Fix-incompatible-pointer-to-intege.patch b/package/unixodbc/0001-PostgreSQL-driver-Fix-incompatible-pointer-to-intege.patch
new file mode 100644
index 0000000000..8efe6dae4e
--- /dev/null
+++ b/package/unixodbc/0001-PostgreSQL-driver-Fix-incompatible-pointer-to-intege.patch
@@ -0,0 +1,49 @@
+From 45f501e1be2db6b017cc242c79bfb9de32b332a1 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 29 Jan 2024 08:27:29 +0100
+Subject: [PATCH] PostgreSQL driver: Fix incompatible pointer-to-integer types
+
+These result in out-of-bounds stack writes on 64-bit architectures
+(caller has 4 bytes, callee writes 8 bytes), and seem to have gone
+unnoticed on little-endian architectures (although big-endian
+architectures must be broken).
+
+This change is required to avoid a build failure with GCC 14.
+
+Upstream: https://github.com/lurcher/unixODBC/commit/45f501e1be2db6b017cc242c79bfb9de32b332a1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Drivers/Postgre7.1/info.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Drivers/Postgre7.1/info.c b/Drivers/Postgre7.1/info.c
+index 63ac91f..2216ecd 100644
+--- a/Drivers/Postgre7.1/info.c
++++ b/Drivers/Postgre7.1/info.c
+@@ -1779,14 +1779,14 @@ char *table_name;
+ char index_name[MAX_INFO_STRING];
+ short fields_vector[8];
+ char isunique[10], isclustered[10];
+-SDWORD index_name_len, fields_vector_len;
++SQLLEN index_name_len, fields_vector_len;
+ TupleNode *row;
+ int i;
+ HSTMT hcol_stmt;
+ StatementClass *col_stmt, *indx_stmt;
+ char column_name[MAX_INFO_STRING], relhasrules[MAX_INFO_STRING];
+ char **column_names = 0;
+-Int4 column_name_len;
++SQLLEN column_name_len;
+ int total_columns = 0;
+ char error = TRUE;
+ ConnInfo *ci;
+@@ -2136,7 +2136,7 @@ HSTMT htbl_stmt;
+ StatementClass *tbl_stmt;
+ char tables_query[STD_STATEMENT_LEN];
+ char attname[MAX_INFO_STRING];
+-SDWORD attname_len;
++SQLLEN attname_len;
+ char pktab[MAX_TABLE_LEN + 1];
+ Int2 result_cols;
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
