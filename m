Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A782CAC58F
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 18:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 214276E73A;
	Thu, 11 Sep 2025 18:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-i9ANPP65Xu; Thu, 11 Sep 2025 18:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EC576F479
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EC576F479;
	Thu, 11 Sep 2025 18:55:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4614C443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98D0061C78
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8djPPUsaIZc for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1343061CB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1343061CB1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0137A8410B; Thu, 11 Sep 2025 18:54:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 17:13:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ea2dad9c9d247029ec4a3a70abaa3b01731e3a9f
X-Git-Newrev: 3327d37a979c004af37a0e176f57e301d5685946
X-Patchwork-Hint: ignore
Message-Id: <20250911185454.0137A8410B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sqlite: add patch
 for CVE-2025-6965
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3327d37a979c004af37a0e176f57e301d5685946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This fixes the following vulnerability:
- CVE-2025-6965:
    There exists a vulnerability in SQLite versions before 3.50.2 where
    the number of aggregate terms could exceed the number of columns
    available. This could lead to a memory corruption issue. We recommend
    upgrading to version 3.50.2 or above.
    https://www.cve.org/CVERecord?id=CVE-2025-6965

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c4c282f8ec2bec752ca41f4cfebe3c34f45ffade)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...3-Raise-error-if-too-many-aggregate-terms.patch | 123 +++++++++++++++++++++
 package/sqlite/sqlite.mk                           |   2 +
 2 files changed, 125 insertions(+)

diff --git a/package/sqlite/0003-Raise-error-if-too-many-aggregate-terms.patch b/package/sqlite/0003-Raise-error-if-too-many-aggregate-terms.patch
new file mode 100644
index 0000000000..43be545b83
--- /dev/null
+++ b/package/sqlite/0003-Raise-error-if-too-many-aggregate-terms.patch
@@ -0,0 +1,123 @@
+From 1cbb088f4be95e7a02627f64de60653ef2b13ab5 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sun, 16 Feb 2025 10:57:25 +0000
+Subject: [PATCH] Raise an error right away if the number of aggregate terms in a query exceeds the maximum number of columns. 
+
+CVE: CVE-2025-6965
+
+For more info see https://nvd.nist.gov/vuln/detail/CVE-2025-6965
+
+Upstream: https://www.sqlite.org/src/vinfo/5508b56fd24016c13981ec280ecdd833007c9d8dd595edb295b984c2b487b5c8
+
+[Titouan: adapt to sqlite3 "amalgamation" source code]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ sqlite3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 80433f6..8a43734 100644
+--- a/sqlite3.c	2025-09-03 13:04:29.799853238 +0200
++++ b/sqlite3.c	2025-09-03 13:47:54.274155427 +0200
+@@ -20,7 +20,7 @@
+ ** The content in this amalgamation comes from Fossil check-in
+ ** d2fe6b05f38d9d7cd78c5d252e99ac59f1ae with changes in files:
+ **
+-**    
++**
+ */
+ #ifndef SQLITE_AMALGAMATION
+ #define SQLITE_CORE 1
+@@ -15258,6 +15258,14 @@
+ #define SMALLEST_INT64 (((i64)-1) - LARGEST_INT64)
+ 
+ /*
++** Macro SMXV(n) return the maximum value that can be held in variable n,
++** assuming n is a signed integer type.  UMXV(n) is similar for unsigned
++** integer types.
++*/
++#define SMXV(n) ((((i64)1)<<(sizeof(n)*8-1))-1)
++#define UMXV(n) ((((i64)1)<<(sizeof(n)*8))-1)
++
++/*
+ ** Round up a number to the next larger multiple of 8.  This is used
+ ** to force 8-byte alignment on 64-bit architectures.
+ **
+@@ -19046,7 +19054,7 @@
+                           ** from source tables rather than from accumulators */
+   u8 useSortingIdx;       /* In direct mode, reference the sorting index rather
+                           ** than the source table */
+-  u16 nSortingColumn;     /* Number of columns in the sorting index */
++  u32 nSortingColumn;     /* Number of columns in the sorting index */
+   int sortingIdx;         /* Cursor number of the sorting index */
+   int sortingIdxPTab;     /* Cursor number of pseudo-table */
+   int iFirstReg;          /* First register in range for aCol[] and aFunc[] */
+@@ -19055,8 +19063,8 @@
+     Table *pTab;             /* Source table */
+     Expr *pCExpr;            /* The original expression */
+     int iTable;              /* Cursor number of the source table */
+-    i16 iColumn;             /* Column number within the source table */
+-    i16 iSorterColumn;       /* Column number in the sorting index */
++    int iColumn;             /* Column number within the source table */
++    int iSorterColumn;       /* Column number in the sorting index */
+   } *aCol;
+   int nColumn;            /* Number of used entries in aCol[] */
+   int nAccumulator;       /* Number of columns that show through to the output.
+@@ -116445,7 +116453,9 @@
+ ){
+   struct AggInfo_col *pCol;
+   int k;
++  int mxTerm = pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
+ 
++  assert( mxTerm <= SMXV(i16) );
+   assert( pAggInfo->iFirstReg==0 );
+   pCol = pAggInfo->aCol;
+   for(k=0; k<pAggInfo->nColumn; k++, pCol++){
+@@ -116463,6 +116473,10 @@
+     assert( pParse->db->mallocFailed );
+     return;
+   }
++  if( k>mxTerm ){
++    sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTerm);
++    k = mxTerm;
++  }
+   pCol = &pAggInfo->aCol[k];
+   assert( ExprUseYTab(pExpr) );
+   pCol->pTab = pExpr->y.pTab;
+@@ -116496,6 +116510,7 @@
+   if( pExpr->op==TK_COLUMN ){
+     pExpr->op = TK_AGG_COLUMN;
+   }
++  assert( k <= SMXV(pExpr->iAgg) );
+   pExpr->iAgg = (i16)k;
+ }
+ 
+@@ -116580,13 +116595,19 @@
+         ** function that is already in the pAggInfo structure
+         */
+         struct AggInfo_func *pItem = pAggInfo->aFunc;
++        int mxTerm = pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
++        assert( mxTerm <= SMXV(i16) );
+         for(i=0; i<pAggInfo->nFunc; i++, pItem++){
+           if( NEVER(pItem->pFExpr==pExpr) ) break;
+           if( sqlite3ExprCompare(0, pItem->pFExpr, pExpr, -1)==0 ){
+             break;
+           }
+         }
+-        if( i>=pAggInfo->nFunc ){
++        if( i>mxTerm ){
++          sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTerm);
++          i = mxTerm;
++          assert( i<pAggInfo->nFunc );
++        }else if( i>=pAggInfo->nFunc ){
+           /* pExpr is original.  Make a new entry in pAggInfo->aFunc[]
+           */
+           u8 enc = ENC(pParse->db);
+@@ -116640,6 +116661,7 @@
+         */
+         assert( !ExprHasProperty(pExpr, EP_TokenOnly|EP_Reduced) );
+         ExprSetVVAProperty(pExpr, EP_NoReduce);
++        assert( i <= SMXV(pExpr->iAgg) );
+         pExpr->iAgg = (i16)i;
+         pExpr->pAggInfo = pAggInfo;
+         return WRC_Prune;
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 4f4bc9d3af..29ebb0365d 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -15,6 +15,8 @@ SQLITE_INSTALL_STAGING = YES
 
 # 0002-Add-a-typecast-to-avoid-32-bit-integer-overflow-in-t.patch
 SQLITE_IGNORE_CVES = CVE-2025-29087 CVE-2025-3277
+# 0003-Raise-error-if-too-many-aggregate-terms.patch
+SQLITE_IGNORE_CVES += CVE-2025-6965
 
 ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
