Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82EBCA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 12:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9695E4167C;
	Wed,  3 Sep 2025 12:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yvAd1uGBHOut; Wed,  3 Sep 2025 12:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91CC742040
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91CC742040;
	Wed,  3 Sep 2025 12:42:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EA4910E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 12:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6047341533
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 12:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VyOCQekrXA8p for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 12:42:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EF1441542
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EF1441542
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EF1441542
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 12:42:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-3df35a67434so326535f8f.3
 for <buildroot@buildroot.org>; Wed, 03 Sep 2025 05:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756903361; x=1757508161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4v+6f+pUNbwg5kczH4kyhIccJbAbqYlvzISb9uIFcVo=;
 b=ZpU8HKWGUZLh4c1+u+Uux++GU0fw4/jh3PEBy3HoOp5GDulUF1OE6PLoPPp8GPLj/H
 tHmGQeHyzwkCylzT68X+586Bc1q1D8zq8iTRsG4NtLCD6eGszD9F3VyzfleQo3+OHGkT
 WvSe4edkZ32YkWp7DR9idLBXnufACDiNCPGIZskgSDLqPCqTgE5foegun0BXzqfRBgQN
 0IRKF9JCtZL0G08Z+te5q9EYRec3K+L/xZ9VM3mTIBxMf1c+HUzcqt9Qlk/gXd6DdMz9
 lNVt53xAWWFZFSPTtqno28ZbWzPcGbfwFkyPp7cToEJC0hDTnlb9oKsA87CVxuYUHVjW
 p/ZA==
X-Gm-Message-State: AOJu0YwmTorgSc+2dongyPdX9GW3/V9hP9B7uCEK43CXLV1DQb0vIp6B
 vckjhgj81nnuxUk0ljtGz/1sb51rsfFuI3NV2ZF7HnvL9hMxOAGvOeGiCLUiRXHJzluYJYHD/r8
 nTnTYu/8GDem0
X-Gm-Gg: ASbGncvSIvC4s3HPeT7ugB2CRCSaW21S8vNmsnNOw+oGZjZQWAPPcfMMqL8GtBS/+4R
 T2HsuU4hTrIq76Zefqnp2jW07ki07enlviw+6Aj0tBwsgR3buLUQe/wEuikXS9TyopVk/CUpJ2d
 avg4+dUfzD3VtrFnbJlOCRQJSDoh0e3iEp9LDwUrdziHHUZ+cL01Cm/V4CLLdYaYa3SwTVLAuSH
 VzAEgBWILQjp/S0V+LvnC+G8aJD+LPJQzPrqS8j08xHD+UC3Gi54HNS6T74oDRWTkFmhZSKOe17
 QatKtCPlazLKEVFagPsno3X6dUvgoFLn9dCS9d6z1UnaLhoiohOdjS3orze1+p4NtgLvo8urrTM
 KyQNI3bL4YBa1wvIgVzLLf4o5WHGeFcpk3Gn3S3V+nIWVqWM=
X-Google-Smtp-Source: AGHT+IE8CtjyT2sDEsw+G2XdGLcNpWyJgXSHqEGVFZpRfEOScvs7iHv7yHc5eJAB3zqaHvJ4b/NXOA==
X-Received: by 2002:a05:6000:1883:b0:3cb:3490:6ba5 with SMTP id
 ffacd0b85a97d-3d1dd81d999mr8533118f8f.9.1756903360604; 
 Wed, 03 Sep 2025 05:42:40 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:49b1:76d4:3e52:5347])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3dcc19a386dsm3137949f8f.4.2025.09.03.05.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 05:42:40 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Wed,  3 Sep 2025 14:42:29 +0200
Message-ID: <20250903124229.6708-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756903361; x=1757508161; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4v+6f+pUNbwg5kczH4kyhIccJbAbqYlvzISb9uIFcVo=;
 b=F9bhZpati5xBmtgRxAB+WnLkBANF2KlZwK/u4D6s9pH1WUUtfQy6vm7JbEUI77d8oc
 1JWMsMm4KI5qxjhF22Ue6nlH6XYPAJcNrI9PKeGbQU5+eohMZD0sGLTTPDHnsNVRqsne
 WcezAO83Wsgu1aRFi/spNF6lvcX9W7zJFL9F+b6KqOTkGn+qFgpm8cDAdKGhi6twacRX
 2alN29UKjn2Vpv+3Y2ZIaO1pukLphuKSscQopkacgl+/9gofUtQMpwRHVz4DITOdA7m3
 KdOb00Ps6ZBpTNuY3kyhLUyLXnPc/wHZWB3cCf3+h5pKipKg0uljm9rAGz1Ls3k50UF1
 LDLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=F9bhZpat
Subject: [Buildroot] [PATCH 1/1] package/sqlite: add patch for CVE-2025-6965
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:
- CVE-2025-6965:
    There exists a vulnerability in SQLite versions before 3.50.2 where
    the number of aggregate terms could exceed the number of columns
    available. This could lead to a memory corruption issue. We recommend
    upgrading to version 3.50.2 or above.
    https://www.cve.org/CVERecord?id=CVE-2025-6965

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...se-error-if-too-many-aggregate-terms.patch | 123 ++++++++++++++++++
 package/sqlite/sqlite.mk                      |   2 +
 2 files changed, 125 insertions(+)
 create mode 100644 package/sqlite/0003-Raise-error-if-too-many-aggregate-terms.patch

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
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
