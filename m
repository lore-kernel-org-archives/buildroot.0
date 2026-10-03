Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324EBCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F03D5412DA;
	Sat,  3 Oct 2026 10:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTznSrOtPx_T; Sat,  3 Oct 2026 10:16:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DC103412CC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022600;
	b=KWkU4urHVl4NobrdmBDMkWZvY4PeIiyZ+7IVbMhwRCBARnqEYs8Vtp9hTt1UXBms75WS
	 /jsdFg5XcDxDUxwBFXjIa7WJiTlvkRL2XwF0YWbkxO9Xx6jDc2x0VbFVTa5b2GFbgAEzb
	 QyqY1R3Mr3Eu6oXxGYcd29g9kLdbilucdGq9hkaHnEccfp3gfs7CkpC0O6vDiIUofHdIM
	 8CX9Vf7JlTFlHe4rXqs2lwDa2lwkyCrETjqlBR7Fgs6SSvgzGOXBHOiaUAii5h+l9oOro
	 g+Dtb8XXoN/+MML1VB8l/t9GcDvJqpr2kYWU8sLThKEQIHGBqg8HepyXuhyrpY1TQUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022600;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+EJrULQpm9LQBChb166zXvLHLQx/sKUtlD+NJinyfbY=;
	b=MTrJX/oQcc0wqLu8dM5OuWtaLG6ALMDJYnvIZbk35t/sFVmeDno7HQq7OiQX3l96G7Fp
	 CQDVVjJ+x8A4ryWJrnw2bLjdwnr2lCjntNlw9jrSyGq9j9kkNe/o5IyOlAKlITpk4zwfc
	 ID0TUhsIALCjohS5IKwCS1AH+CouLYds5YCcrndORhHG4ZAxxD8P8YN9cpQsDsNSeP2MU
	 HRAVJtAimkESx5ESHQk5xHs6weIQCoVRCdiWJPd4RcirikPfPp4/nSOrnvTlF1VjLa8FG
	 Dso0dicTgz26fvITxGneWHG+/Kqsf3DBpYWqkh+Hj+cjsS4JKdCLM2UQEuj7LpNfeAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Q4MYAmHB;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022599;
	bh=+EJrULQpm9LQBChb166zXvLHLQx/sKUtlD+NJinyfbY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OP6GKKGbM/MIRrEdF2IEn0vT2UZV+4BdgxTR4HnQACYHrluljjsXWylqh5n5a0O9y
	 LF2nUXNp3fUXKlgvIw6M6NNvk77u9GV+6SMy6V5QKbQhr4wcVhUwxsPIun9lRz59Wt
	 fM6Pix0L89y77iY/KplozRyzGeqmXRsH6CzzjMki7RsRd1XXKEkw+8eaynux4+9Khk
	 vcaMuZ8/9R+0wWOcmz8kztK43XJhBsXq+KkuoKGD+CHNE6F7Xx9xo9PjMZepTbn9Jg
	 Bs2xZfcw7lKPMczTxuEbPbjeIYF0AvMLR4t6XcICWPo8+FOsfwuMfsqepnu1xEodYe
	 TCWgfEoQTDZ0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC103412CC;
	Sat,  3 Oct 2026 10:16:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 859E234E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77A67412CC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0KUqNDnX0vUR for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:16:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BC5B641291
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022597;
 b=dazYOlVghMG7YCz1V/DauIPes5WiaAagK0oDZqGiFM+GVpQhkXjdADHdgy/z54IoU9K8
 1/EOQoZsZ2kNsk5s1/jkVndaA+rdctVEAwNAimdbMLF7D1yPcP1jp1VA3Yy3J7daHTF6y
 xo+nzh/wPRakOijeoszmmcegxXf4dII1zZTLP2XnSZb/MTjcOYXXRZwRe99m4RDv4fOAz
 GYPbio4Ww00YuVvlK2LBsAsS5vuFp9OnwwLTzpLQhD4fafZyzkLv8G1J+NAtJEmHVP0TL
 TFxDoqQR5gctkQ8bmL4nyNG4qOeEB5+vapXxN0lOvoS75M5iULlLn1vy2+oro61OEpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022597;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UZYdTrgPJmTnB+8gmHFq3LnMP7wCrCifNBt4e9NzHCc=;
 b=NKVO6QbbFTqJlWDHAiieGY0uV+kkyfJQ8tlFCDDn+WockZckncWkJrZ2jM+Df1JwTvhb
 +zWiB2iOf6aeQmh2AAfs0msaO0Zw+fbsix+RjlLcfbaXoTg+fZwWFt9ZZWva0cyAj9onZ
 uJQWaTMXBG4bX0Vj5D6gX6oikGr7zjzGxofjPK8ftRmgLTvyJoGFIcGyQygAct4veqfoe
 NrFSqB/UNL9LRGh+d4B1c39tEZEC8vQsscyGS80UTg380eiIBxmQZ0vHrj7Px6GtW+NEF
 QaY/KpykdbJzWoxx9w/+rSmCDCjPux30YpI2AXZz6cD5eH07yKFo7k2KxII8pUmKP3Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Q4MYAmHB; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Q4MYAmHB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC5B641291
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791022593;
 bh=UZYdTrgPJmTnB+8gmHFq3LnMP7wCrCifNBt4e9NzHCc=;
 h=From:To:Subject:Date:From;
 b=Q4MYAmHBxsFu1VaoCoBHdsOP6HMy/pis0iMjmUwxnrivhtLbWY5nks4+Onp9OMG6o
 mqwFikUZsgi09Gl1hw0i9JGSmeuJxK4dVsFX2PKRLfttG+XdoydG/yyOd4ERfZH0Og
 r+BfyKa9uZeLaygzllOvNHbxPni6n7WjQMaVRjXVHK3jZnMWCS3rp7m6ZOSrrP6k8N
 i3GQpTbmN7MrCqcAcONjpfPu4GE+lL+F/EnouyM2kCCuHDn7+bWrBSI8Br6ueLiDBR
 HmDvbs2Pyz3B8XiIeSmw9dL3EvD+Dn3dwNpo1CtFeFDBCvS/jqldQB7YzN6+kxrqtz
 Hcm5eDySERnTA==
X-KAS-Sym: v3:f51bdf72230551df:sLYkkvm29tnVcVPZ2B7WXWaAkWxEdrMZb4HvrCvW9SIpl
 3Rr5FDHloLQz/4KntbiKcD1fDTQKqSOe0duN3IJY6RQdAdeSeBALMBDK9PnOLowPNWbOqems2En
 avb1HOvxUkuShcTDOjaBAK/hbsxMscPs5gCv5ELLqRk9xYLx23eB6rE/Z6fCXPMrX7mAaGQyZIX
 dskaYoEeEKgLFFPA0GXrJ0CIiJysXCRT+9TF8KmQaLzUjLbYVcWrKRUa4ibZtWXpYshb5dclfDT
 yCmHwRA+kL/kpHPGM5pTEM5SXWUjM7kZJLAiDmwrWhGD+BpEhFM0LBOIs08G/8aCIeF/KSaw==:
 woVncN9DJzLAoDNIp6XqTQIx03LbzPRibLpFFFxCU6R27IV8JYNy8eA5Au3vVMXeoa1NNkijnYe
 9C5WzpH/VHKU0LnCL7cOuq7BSP8wBG6yKvyXTeqjkhDu5LJ4fTxcPlLbbr0hABiPdABqAyhzRy8
 hmWBcpq5QBG9UF1ietMubxb3zuBqMWH11DHX2uQ4cay87AXEUL8+fjMu22NP2O6R8dHVm6qBIaN
 /qp88ucfnnll4xvbsQB6DLfenOEupFgTtUUiH6RntLaF+HxNNn33j2UI2Pw3eh//it+7bF4wV6j
 W/uYuEISJJSDPbY0t5VfB03MGBnjULhxf580AJx32TsX/EM70aZD+kDOHDaSEA7MhPiInUFu4uV
 o3cJPSmZAO7hRwEX+bRl3dHoU8gFJmGikwfK8CZOfI7FX2PZy0uZzV3rQcMDzZPbqPOuX1OoQ0T
 xpUmjqTesBKm774dckcuMar+rgUn65WodLQcxdkNXnjI2oAbeio8NBGMNW04Y4Neo2bvjM0KHBl
 xFwrO4xGh3FHtoPWHnaijyPDfxvOn1pJY0hALq9sWClWdB6SykH8DgEhE0pGwt1xxx5qX2AjFKm
 ay8+
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 38502A4C53AE
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:16:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48924)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCwnB-000000008JN-0dhT
 for buildroot@buildroot.org; Sat, 03 Oct 2026 10:16:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 12:16:32 +0200
Message-ID: <20261003101632.819950-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v2 1/1] package/gawk: Add upstream fix for
 systems without MPFR and GMP
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

Fixes build error with host-gcc-final:

options.cc:27216:2: error: #error 0Wabsolute-value does not have a Var() flag
27216 | #error 0Wabsolute-value does not have a Var() flag

$ head -n1 output/build/host-gcc-final-16.2.0/build/gcc/options.cc
  /* This file is auto-generated by optc-gen.awk.  */

introduced by the bump of gawk to 5.4.1 with buildroot commit
aa3db5b4e15c8dd67914d58c8d03ae2df3c92cab.

Fixes:
https://autobuild.buildroot.net/results/672/6727e71716af3df8e2175a50740388bc669e5462/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed patch

 ...fix-for-systems-without-MPFR-and-GMP.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/gawk/0001-Workaround-fix-for-systems-without-MPFR-and-GMP.patch

diff --git a/package/gawk/0001-Workaround-fix-for-systems-without-MPFR-and-GMP.patch b/package/gawk/0001-Workaround-fix-for-systems-without-MPFR-and-GMP.patch
new file mode 100644
index 0000000000..f2377592c5
--- /dev/null
+++ b/package/gawk/0001-Workaround-fix-for-systems-without-MPFR-and-GMP.patch
@@ -0,0 +1,63 @@
+From 3cfe33f90aa3899dac3d4e933e3c1ee9ee21491d Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Tue, 14 Jul 2026 10:14:50 +0300
+Subject: [PATCH] Workaround fix for systems without MPFR and GMP.
+
+Upstream: https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=bf85f8a3175af703597082d4c7e0abc2066a44d3
+https://lists.gnu.org/archive/html/bug-gawk/2026-10/msg00003.html
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ awk.h | 23 ++++++++++++++---------
+ 1 file changed, 14 insertions(+), 9 deletions(-)
+
+diff --git a/awk.h b/awk.h
+index dbad0d810..f4a84300f 100644
+--- a/awk.h
++++ b/awk.h
+@@ -406,17 +406,24 @@ typedef struct exp_node {
+ 		} nodep;
+ 
+ 		struct {
+-#ifdef HAVE_MPFR
+ 			union {
+ 				AWKNUM fltnum;
++#ifdef HAVE_MPFR
+ 				mpfr_t mpnum;
+ 				mpz_t mpi;
+-			} nm;
+-			int rndmode;
+ #else
+-			AWKNUM fltnum;
+-			int for_alignment_only;	// especially on 32-bit
+-#endif
++				// 7/2026:
++				// This is a workaround for systems that build
++				// gawk without MPFR and GMP.  The NODE struct
++				// desperately needs to be refactored.
++#if SIZEOF_VOID_P == 4
++				char alignment[28];
++#else	// SIZEOF_VOID_P != 4
++				char alignment[48];
++#endif	// SIZEOF_VOID_P != 4
++#endif	// HAVE_MPFR
++			} nm;
++			int rndmode;	// only used for MPFR.
+ 			char *sp;
+ 			size_t slen;
+ 			int idx;
+@@ -561,10 +568,8 @@ typedef struct exp_node {
+ #ifdef HAVE_MPFR
+ #define mpg_numbr	sub.val.nm.mpnum
+ #define mpg_i		sub.val.nm.mpi
+-#define numbr		sub.val.nm.fltnum
+-#else
+-#define numbr		sub.val.fltnum
+ #endif
++#define numbr		sub.val.nm.fltnum
+ #define typed_re	sub.val.typre
+ 
+ /*
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
