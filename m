Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCC9CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 425E6422F4;
	Thu, 11 Sep 2025 19:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhKW-XWb2zhe; Thu, 11 Sep 2025 19:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C2CF422F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C2CF422F8;
	Thu, 11 Sep 2025 19:24:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EAA3234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 709A76F49C
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_YOlcIrU3Z2 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:24:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 386B16E56C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 386B16E56C
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 386B16E56C
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:24:42 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b0473327e70so185217466b.3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618680; x=1758223480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J6jI50P54gk/FsKdV8WdZcf/VGUbW+nrDqgtL9KzdC8=;
 b=vXzYcFXhV0qtu3fgE7qTSa6Bw/TlGqolySC3U82jsK9C4QoPbHp6mX1pRxSuuASzO4
 d0bNA5+JW4SIE1G2vmQkX38JhY1qCiy6xlesc44orbRzJldbg1OXTGfYPuOvkQjdRO9g
 9AFV/XlSo6FRFRobItFPZGCbOzQnrfDeJ3n/G7hHO/swxcuRpZBMRz+r1ddAVJdED2uu
 rKdwTFIB9RrZqAkrhgVOa5u6ADxRFWIBEVIEP7r3Q/f2NXpN4p4kBch5g2DbtaGzrdcB
 TqvUOuZ0bXv5Y7TlxhmAxa7mn/BBbx1JdUtmzIY4wxk4nCrfmTtEE2SVZ2L+LeVsOc01
 +SiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgsxjY+7U8YEt3t7gZG4k/DzU2CgC5/R6QZiBLQ8ljmzbjOtSh9xCuyedviiiH2lV9INLzooAibzw=@buildroot.org
X-Gm-Message-State: AOJu0Ywqh6J9Eaow8cLVWQNrAJu8mY/+MZisu3t/Fx9pV6orD7a8lHIm
 GDXE0+TpgCrs5WAVCcEEcpDgPCXoFU58SIVTiNyJZZUwKjbGiZZnOMGgLZjQ1wztiBk=
X-Gm-Gg: ASbGncvsT1DC9s8vNzTf74knhpIn1GzjbO5ZipxkjFoxuft1R3l6GuSBxKnUK0qGVEb
 s4n0S91ZCruBgbhq2yMiT/I8KcdWooO1FzidLRrcLb3P4OE+/ZO7v/pAETQp3ydQ54zimGTpyQk
 HQ4IGRgneJa7VDz2bG9NGS6euZYu4tXU2tfPloVsMMTNhrgE/PDxe0u22C8PpYaTwDO3Iuq7Zz9
 MkeRPWR19oBg/wqfVTDaVY7AqRvo8K3m6/8a1qY6iov0/qPFdrT1lTNwo98cg8J5aRnYBcTh1bU
 ghkV5z/yX3ZZoxgMEaCe0uv7KT4ooukeI4tswIvqw1MFMCoJApMFTA937/bcLrLbZ37B6yRxJbu
 UZ0CqDgbU/XuZSk7HToP87wEi2I1d6FNssgNx
X-Google-Smtp-Source: AGHT+IGbufKercl9o4EeN2o79n8pNoaB/KR/YFztCWeqkt82bJlzBVL4QI9WzvgyNrq1nNAglDaFnA==
X-Received: by 2002:a17:907:1b08:b0:b04:21c9:adac with SMTP id
 a640c23a62f3a-b07c382937fmr23999166b.39.1757618680144; 
 Thu, 11 Sep 2025 12:24:40 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da33dsm193946566b.1.2025.09.11.12.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:24:39 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:24:16 +0200
Message-Id: <20250911192416.2672347-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250903124229.6708-1-titouan.christophe@mind.be>
References: <20250903124229.6708-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618680; x=1758223480; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J6jI50P54gk/FsKdV8WdZcf/VGUbW+nrDqgtL9KzdC8=;
 b=dceiiJbmR6m2drJopn+YpoTjVBfKdIDQv2B325tmTfwFW8YRXDEbjJQAGSl0YSbQH1
 Rcw+HDXyTVb4zObsWGEf8fxUyqJFYX/XUXM0nTkU8rZXC0im7pnCrRDJmafAWuG4t4kN
 fp49VcXZReBPevKnoLntYZOsHoht8S6FkSx0ENOW6rJ2FkzwNRW8vkXz6mUGZUCv240q
 vRemeVCI0PJg4gpjnF2irXxHfA6UrGimWUO+erM+jyWhg+eQTIDkljxCvhtHUMC5hUMg
 Ua5kbbPpVZjZnaIHsOtR78x6/Er+KCSjjU3fHQZgUcAnl+jy1AHobH0mpWSHcwd8WVXQ
 FVaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dceiiJbm
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: add patch for
 CVE-2025-6965
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This fixes the following vulnerability:
> - CVE-2025-6965:
>     There exists a vulnerability in SQLite versions before 3.50.2 where
>     the number of aggregate terms could exceed the number of columns
>     available. This could lead to a memory corruption issue. We recommend
>     upgrading to version 3.50.2 or above.
>     https://www.cve.org/CVERecord?id=CVE-2025-6965
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...se-error-if-too-many-aggregate-terms.patch | 123 ++++++++++++++++++
>  package/sqlite/sqlite.mk                      |   2 +
>  2 files changed, 125 insertions(+)
>  create mode 100644 package/sqlite/0003-Raise-error-if-too-many-aggregate-terms.patch
> 
> diff --git a/package/sqlite/0003-Raise-error-if-too-many-aggregate-terms.patch b/package/sqlite/0003-Raise-error-if-too-many-aggregate-terms.patch
> new file mode 100644
> index 0000000000..43be545b83
> --- /dev/null
> +++ b/package/sqlite/0003-Raise-error-if-too-many-aggregate-terms.patch
> @@ -0,0 +1,123 @@
> +From 1cbb088f4be95e7a02627f64de60653ef2b13ab5 Mon Sep 17 00:00:00 2001
> +From: drh <>
> +Date: Sun, 16 Feb 2025 10:57:25 +0000
> +Subject: [PATCH] Raise an error right away if the number of aggregate terms in a query exceeds the maximum number of columns. 
> +
> +CVE: CVE-2025-6965
> +
> +For more info see https://nvd.nist.gov/vuln/detail/CVE-2025-6965
> +
> +Upstream: https://www.sqlite.org/src/vinfo/5508b56fd24016c13981ec280ecdd833007c9d8dd595edb295b984c2b487b5c8
> +
> +[Titouan: adapt to sqlite3 "amalgamation" source code]
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + sqlite3.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index 80433f6..8a43734 100644
> +--- a/sqlite3.c	2025-09-03 13:04:29.799853238 +0200
> ++++ b/sqlite3.c	2025-09-03 13:47:54.274155427 +0200
> +@@ -20,7 +20,7 @@
> + ** The content in this amalgamation comes from Fossil check-in
> + ** d2fe6b05f38d9d7cd78c5d252e99ac59f1ae with changes in files:
> + **
> +-**    
> ++**
> + */
> + #ifndef SQLITE_AMALGAMATION
> + #define SQLITE_CORE 1
> +@@ -15258,6 +15258,14 @@
> + #define SMALLEST_INT64 (((i64)-1) - LARGEST_INT64)
> + 
> + /*
> ++** Macro SMXV(n) return the maximum value that can be held in variable n,
> ++** assuming n is a signed integer type.  UMXV(n) is similar for unsigned
> ++** integer types.
> ++*/
> ++#define SMXV(n) ((((i64)1)<<(sizeof(n)*8-1))-1)
> ++#define UMXV(n) ((((i64)1)<<(sizeof(n)*8))-1)
> ++
> ++/*
> + ** Round up a number to the next larger multiple of 8.  This is used
> + ** to force 8-byte alignment on 64-bit architectures.
> + **
> +@@ -19046,7 +19054,7 @@
> +                           ** from source tables rather than from accumulators */
> +   u8 useSortingIdx;       /* In direct mode, reference the sorting index rather
> +                           ** than the source table */
> +-  u16 nSortingColumn;     /* Number of columns in the sorting index */
> ++  u32 nSortingColumn;     /* Number of columns in the sorting index */
> +   int sortingIdx;         /* Cursor number of the sorting index */
> +   int sortingIdxPTab;     /* Cursor number of pseudo-table */
> +   int iFirstReg;          /* First register in range for aCol[] and aFunc[] */
> +@@ -19055,8 +19063,8 @@
> +     Table *pTab;             /* Source table */
> +     Expr *pCExpr;            /* The original expression */
> +     int iTable;              /* Cursor number of the source table */
> +-    i16 iColumn;             /* Column number within the source table */
> +-    i16 iSorterColumn;       /* Column number in the sorting index */
> ++    int iColumn;             /* Column number within the source table */
> ++    int iSorterColumn;       /* Column number in the sorting index */
> +   } *aCol;
> +   int nColumn;            /* Number of used entries in aCol[] */
> +   int nAccumulator;       /* Number of columns that show through to the output.
> +@@ -116445,7 +116453,9 @@
> + ){
> +   struct AggInfo_col *pCol;
> +   int k;
> ++  int mxTerm = pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
> + 
> ++  assert( mxTerm <= SMXV(i16) );
> +   assert( pAggInfo->iFirstReg==0 );
> +   pCol = pAggInfo->aCol;
> +   for(k=0; k<pAggInfo->nColumn; k++, pCol++){
> +@@ -116463,6 +116473,10 @@
> +     assert( pParse->db->mallocFailed );
> +     return;
> +   }
> ++  if( k>mxTerm ){
> ++    sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTerm);
> ++    k = mxTerm;
> ++  }
> +   pCol = &pAggInfo->aCol[k];
> +   assert( ExprUseYTab(pExpr) );
> +   pCol->pTab = pExpr->y.pTab;
> +@@ -116496,6 +116510,7 @@
> +   if( pExpr->op==TK_COLUMN ){
> +     pExpr->op = TK_AGG_COLUMN;
> +   }
> ++  assert( k <= SMXV(pExpr->iAgg) );
> +   pExpr->iAgg = (i16)k;
> + }
> + 
> +@@ -116580,13 +116595,19 @@
> +         ** function that is already in the pAggInfo structure
> +         */
> +         struct AggInfo_func *pItem = pAggInfo->aFunc;
> ++        int mxTerm = pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
> ++        assert( mxTerm <= SMXV(i16) );
> +         for(i=0; i<pAggInfo->nFunc; i++, pItem++){
> +           if( NEVER(pItem->pFExpr==pExpr) ) break;
> +           if( sqlite3ExprCompare(0, pItem->pFExpr, pExpr, -1)==0 ){
> +             break;
> +           }
> +         }
> +-        if( i>=pAggInfo->nFunc ){
> ++        if( i>mxTerm ){
> ++          sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTerm);
> ++          i = mxTerm;
> ++          assert( i<pAggInfo->nFunc );
> ++        }else if( i>=pAggInfo->nFunc ){
> +           /* pExpr is original.  Make a new entry in pAggInfo->aFunc[]
> +           */
> +           u8 enc = ENC(pParse->db);
> +@@ -116640,6 +116661,7 @@
> +         */
> +         assert( !ExprHasProperty(pExpr, EP_TokenOnly|EP_Reduced) );
> +         ExprSetVVAProperty(pExpr, EP_NoReduce);
> ++        assert( i <= SMXV(pExpr->iAgg) );
> +         pExpr->iAgg = (i16)i;
> +         pExpr->pAggInfo = pAggInfo;
> +         return WRC_Prune;
> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> index 4f4bc9d3af..29ebb0365d 100644
> --- a/package/sqlite/sqlite.mk
> +++ b/package/sqlite/sqlite.mk
> @@ -15,6 +15,8 @@ SQLITE_INSTALL_STAGING = YES
>  
>  # 0002-Add-a-typecast-to-avoid-32-bit-integer-overflow-in-t.patch
>  SQLITE_IGNORE_CVES = CVE-2025-29087 CVE-2025-3277
> +# 0003-Raise-error-if-too-many-aggregate-terms.patch
> +SQLITE_IGNORE_CVES += CVE-2025-6965
>  
>  ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
>  SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
