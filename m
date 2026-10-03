Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0E2CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 09:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E849560E7A;
	Sat,  3 Oct 2026 09:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdRszEerTZwY; Sat,  3 Oct 2026 09:56:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7483560E74
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791021367;
	b=lOjuZ+SZsXt2QObOsReTcB00uW1sio+c6fGkP6CNHtkRykqYHCJchKdjWHOs3Uetc73F
	 HikJTWtt3HmAwF0xaxznDAkdZk2Xqv4Z9RpCrsv3g1uaqAtnc3rQSzpe2p9mhPq//Enlw
	 NPfoQIJ+CUZ2Lq+yA181OdezAh0bXn2El+880KUDYbqOaDpPvWiFvu5a/vzTHaZlKrUOa
	 /cBNxSi/5bN8oMSKah85skfuwd9Bt/cHLdF8t7X/C35F/SQ9G1vDg9+5RO1HdZpxPM+Bd
	 rMMSfxyYMdPlPZANgE1tzc4CcAiPhnUC+3e82PlUeBRnLKsibY0tAk8oNnAxqCVnxIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791021367;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rBFybjKndQ4t0YWh9xccBYnRYYV2JXXGy9a9mozWAGc=;
	b=XUaqKWyLs8nE5bj7z2ShGUQu/ZmvJnXrGRc95j4ZNbJDSJ7YQ4hZg0SEcr/oDbsKsKiW
	 3fbs6FZsb6cna6Op1hoCFwm1RjVMq/sr8uXrvP5ltW+/1hdhHOIj7wfD6klPzk2+GwqyT
	 hdUGzj7G0F/1kMnGgpOqnUEYL9+PraCfEaRk71xOdoRv6efJHTgkBw8xQp/E232BCsV1L
	 svl3uko2fw3G4EbO7q1DisvUegtR7gyL4xp3EZEjgsFQ8C5YhoiVtDhT3aY0xCTtttsFQ
	 OsrMHc01k0GbHT+u/8ZBZrlvfYCU1sAs9bOfAkK6vE+p5U4oXmPMjnw25dT7j8qvvYQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=KuWJSafm;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791021367;
	bh=rBFybjKndQ4t0YWh9xccBYnRYYV2JXXGy9a9mozWAGc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fSW7o+8W83BYQoyN+p/ZNWnDWMgYMxD55YmH3g5+F1ECdyIPD10ohfz4moUhFugqU
	 CX0NMjwR7UF2vOEtpMXGeif4XUroitlimSHzmHlwwWWB7s80yGxNFMYzjLYrLMA/6X
	 dcHvXF/TjxLX7YrKSOj+5SpppJSxG8YC9xvJqJDc2k7kXAeZEbLSPsYfM5/0lV6b2v
	 WmsCakBzwmagm276inGCfCBEUp028za7UlsW9pwIsMTh9rXKta0Soi81fi3zmqJUPA
	 gROE9gN2kHPiSwCetz+kkuM2oCv/heZMz0Hz4VnKa3uQpttWb0VnP7cvPAkDh4F2QF
	 VXNUQ2BUSJJ5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7483560E74;
	Sat,  3 Oct 2026 09:56:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E95A263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7446B6064E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8lYN8BMRXL3 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 09:56:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3A7E260E71
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791021365;
 b=mKGyesBv0iAOhdJFsFJ/dmnsL6HHrOKkDRJj/liv4xMxR1TjIeRX5FR56vG6bhejL5Bg
 aIOe6AOcUlVyuXbqxyxW/6I5/bjT4TkUy7Z1fRLq1ADjvNepEy54e0Cbex24GOwEWJPMK
 vyX+/afHNSp7e03/A/x7ynxKB7xdvcw605ESWkCQ78GptJ2k3KVF9UtfJDaaAK/iM9FyN
 sHvrAP5XvkD4oUK3usWQ3P9ijSihIUzoNCFWpAzgEfAJX2NnYQe6V1FMXDazAfEUFoSWU
 x9cyPqoUGPUFJqcwJRVWI1EouxIbY74ZHjfvMDNGBEFjMa95G9tenha/jbmESacJhpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791021365;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=jt4GbE3fxgj/sGDB3ESe2XE1rIlAM7OEwfwlGF+Q6JE=;
 b=J364F/ZDt9y/1HXzxF+RBY2dKh++3k/Ac/PLTz395QP+w5kaf/j869Ffd5kBkGVyDG+A
 aAO6WxFm1mUOv+OsTgd41alVPelDGAjwUiCCw1iayDHuqNQoNIZ663doJHyS+oeRa1Aeb
 Ufnef733elAWrYgBn8k2QReC8/3TsfTY3LTUKRwa2DVhsH8on2nfGUQTx0zcaiwuNF3d7
 8M4Qjq3BHtoGY7FPDWfuid3K000sPcFUT8T/4DQ7jnB9dIkBrNZ1hIi3ujKv377zDwtNh
 tousHboj8vqOph74QwHxW6BifQOBVIxJ3AWEUkh6+JETGpuB7X99RPF8oHMAWWrJrDA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KuWJSafm; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KuWJSafm
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A7E260E71
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 09:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791021359;
 bh=jt4GbE3fxgj/sGDB3ESe2XE1rIlAM7OEwfwlGF+Q6JE=;
 h=From:To:Subject:Date:From;
 b=KuWJSafmBz+wr2fXQulXD7XbCiyA+SFyrYVp8wmBJEHq4uhXKMck/GWRdgaAs1Izv
 yffLkNMEoUlNUq5sEhn8aEaFYPRHo3nNu9OkD7g+WedfQhrhvG7/fFqJwcaLFDHaaR
 8eKNAyn5fOrZABo+CH8lDVJ8gAUK/s6UWpAUeC2VKz2TyCFKqnV5bd2WLE1d1eVvui
 CwCO5uJpZN8c3DN34dm5mjTlYmMfRRmMjLmb/N7d1DMIeN08pxZ68U90vmckED4FK4
 b1Pzy9gmkcn4Sb4JYDLp5o/X4y36m+fon5n+38kmHO9/605IzEk3SylFeJJmFpNhig
 VNwS9WefxmcEA==
X-KAS-Sym: v3:f51bdf72230551df:CmVwmnfOi5EZ5/YERJ8W1pgdBeNKuqzmzUJiTo5/G+qPo
 qt6nduuzpuNCwCFiPzvOGNyh18A1VGdwE8T5WONIV8WAHaIj5V5AgY/Hy7dG+NcE/Qw9NLshQnR
 Sq3A/Idt0x+KWo9iHVyN8Cm8I0OIyzW1plL9/+lYp6lZnBStILyrtwuqcVvebELxwuGt8IWixC1
 39MJ8gUo7PTMFCpaMQi7JbNqtnzOi1q/ugUqdWQNiZPy8KeoJrxntDxFUkfJbnTMWe1h9Gk7RiD
 z59syW3IHEdjssVJA4pDKJtq49SEeMOa7o7zSwFWPqX7Qq/cqLhdWe6ptjs9zX0HNDL+pw6g==:
 UDGbKOV0lj0xa2z0Xle0wHAZazz3dnOuI225O8IVNKUxW+yqv2MrRs0uk3O6fPTesYptlOBydX7
 P4xN1n7czbDE/e/7WvabEFZHf5y/C0iNQd3OFx/zkuIZFoD88TWJP+yCx4+L0zjW1LjTPvJvuK/
 KgwrvrQYNUCvhbAAEzJqE+yscJuZqG0lg6J+1wlIEgby8yRCBWECLXELjkbNQKXYI+DTLAvxCe0
 920huDJyyWko/0qnoDo+WpHwbj8HLC1mFjbgCLcQCcdONOK1veH2iZl1yjNKsDhfpACxqqRVBx/
 3vuC6+Qsh5R50BhVjLuhJeO4dt3TgApklsZYXRzdiv5JS7dshjUjqWbeAyBXi0/28LaW2h1WY7M
 mZWDosds285t8FD+JVYrZ3pgT5fEyUddqmmqba78uAU14MnUk2op9IIn8vdbPu/vmLWApdPp/L3
 b3+eBpxu3ObQIUp8aruRHYaR49WIM1lvFLU12SReg0Qwa6tddFXkGwjzaO5d9bzRkTot3UU6nWy
 gRWOvu5FH+iKMXXs1aUxQbN24fqA2cMeWBFq5bMx7nx6wUwT4/vG/fVEhOE47+Mw0Wd//153xpq
 kSgZ
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1B3D6A4C432D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:55:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47558)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCwTG-000000004dB-49IC
 for buildroot@buildroot.org; Sat, 03 Oct 2026 09:55:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 11:55:58 +0200
Message-ID: <20261003095558.106708-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/gawk: Add upstream fix for systems
 without MPFR and GMP
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

Fixes build error with host-gcc-final-16.2.0:

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
 ...fix-for-systems-without-MPFR-and-GMP.patch | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 package/gawk/0001-Workaround-fix-for-systems-without-MPFR-and-GMP.patch

diff --git a/package/gawk/0001-Workaround-fix-for-systems-without-MPFR-and-GMP.patch b/package/gawk/0001-Workaround-fix-for-systems-without-MPFR-and-GMP.patch
new file mode 100644
index 0000000000..52a3f5d962
--- /dev/null
+++ b/package/gawk/0001-Workaround-fix-for-systems-without-MPFR-and-GMP.patch
@@ -0,0 +1,83 @@
+From bf85f8a3175af703597082d4c7e0abc2066a44d3 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Tue, 14 Jul 2026 10:14:50 +0300
+Subject: [PATCH] Workaround fix for systems without MPFR and GMP.
+
+Upstream: https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=bf85f8a3175af703597082d4c7e0abc2066a44d3
+https://lists.gnu.org/archive/html/bug-gawk/2026-10/msg00003.html
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ChangeLog |  8 ++++++++
+ awk.h     | 23 ++++++++++++++---------
+ 2 files changed, 22 insertions(+), 9 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 6a955eedb..42bd2c487 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -3,6 +3,14 @@
+ 	* builtin.c (do_dump_node): Add the size of each object to
+ 	the printout.
+ 
++	Unrelated: Make things works when built on systems without
++	the GMP and MPFR libraries.  Thanks to Thomas Trepl <ttrepl@yahoo.de>
++	and Bruce Dubbs <bdubbs@linuxfromscratch.org> for the reports.
++
++	* awk.h (struct exp_node): Add alignment padding when we don't
++	have MPFR. This is a hack, pending a total refactoring of
++	the NODE structure.
++
+ 2026-07-08         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* 5.4.1: Release tar ball made.
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
