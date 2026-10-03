Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4058CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6927C41457;
	Sat,  3 Oct 2026 13:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fc-Bh798vjXr; Sat,  3 Oct 2026 13:19:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 70F8D41402
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791033557;
	b=MeyTUNhx32L2yOdCuoLo0m6kyLMcHocsEwDR6FMclEtMo+iTbWPScJ/dWc8OpGCjKJKl
	 9Z9FCApVJvipS37jXtYh7F9txELFc9mER2QYaLPIpp/flyuTpHKqz2IryTtH1zjJAlW8c
	 Fy1G1FzwgP5r9VAfqRk35rGHJ7XhzpYWtOJqyWaiiWijUEbgBFRyZu8flKWojBvhLGn/Q
	 EN//pejOPRwZRmIqbQzGVmHXlNKe1E8URkT5lCDcuGxJxJkJqrxyaJ430q1WlpPge33y3
	 nCuQQ2JmNV732Jt8nz/6tZbPdk9hAx7fLao5qFKk2dKfsVvXYaR53RQwrMnE9R2g0WA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791033557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tbnyiIG6YTNjmvpny4CIKSJKQJAbAZWj39ZpXZoBpTA=;
	b=VTy2VZ2tM+Wuq2J0ix78TSzYoK17IvIAOfUOgzhNlinen7PJkgjnlCPLzeKHiHfvfuiD
	 G0ZJYRpLRZm+FWnr8dVElrnyKbdiD21LsQX7hiVISpA1a8px0hmbYktMGfRDkk9tGAPoR
	 cZvDCk71VxO+cH7Y8/KijS9Yn7PUv6MFQM41gW1eOtbdqNonnw1b83nDaNvl2eR2aXnUE
	 nHSP7II+96bqFzwPbfbyux4XlOsxVAJZuKzcSS5DqyCLsZrJcNJN3koHF+rIFAFFqqSOa
	 vkHdnaqIfdsfzsiBwA1xwLBFuZYMcCVSFvFIx54+noy/C7LzLYUYpiJ47aRudlqaKcw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791033557;
	bh=tbnyiIG6YTNjmvpny4CIKSJKQJAbAZWj39ZpXZoBpTA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sl3pUeIKLto55Iixok5g6vaIkt+W3IqySV3vsYArqdauRt2CTteddOD/HuK80Lkn1
	 pR6aN68OMomTFceyhWsPX+rA973xTa94RFfG7BAZRsKc4zrKhSq4i2tPNWhmFvTuKv
	 gor/YIINlL+ZrKMnfJQqrlGljoL7C5Be+1dVMGcs8c/c4mplYrU0mIj/PJvpXp3ljT
	 a/BWZ8F9YdbLFlbtomFOG5iM3D+xN3GzdeoVn3UekBqojq5LVFq0IWxRApG8yFq8TC
	 fmfCykU+JJeoS3KI6lQx0AmRPocMllgIWyS4IJ9mYvkXptLGX0502uDniEJ6YT5jYq
	 ocb+txdiCCKfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70F8D41402;
	Sat,  3 Oct 2026 13:19:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F2FA2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 652CF6067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Gj0Yc1kj-iq for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:19:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 902BD6067D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791033555;
 b=MsLQ5/YS5pUjDzmcsXP8fhetUJzYqS5LlOS8s71hQ1f1eLyoDsXXGgJrMhlYF+7Fcxxw
 2VcDXBYB4a0FRjwqBqMPRDdFsqZId0p3pNQETRuYriwVgBjLDI2dNVjnCEpOTT2xUoDrK
 yXFMLx1kqxWWb5cLrmMgRqnAX/lY8kyD3J2Sd3TKAd26arVj2rhhvsR5uoMcfbvnH0+nr
 Su4vC00ggyKRfb/XG9+iZ8n+o2GnQJOKaAq6F/9aHO74JtVcBnwxROUT38RFMJQsUzvxX
 WTA0Lpkp5yRcSsVb6wSXhfoy2U3jLQhwfZxCrhMk9QNC9DkVLghI0tVlFZOLXZ+55jA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791033555;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=w87FAlavfwZOrkWl6Nr1k46cyrmj4qedl3nUnpYQnJU=;
 b=NOKqcA6SP8v+Wl9b4CfY2WSmA+PAAf2nWiRq8OCByUhVtxtrW6YSVT1Vrxg0dpiPoS8L
 RKc0Wz5LrtKo3WWqWJ40DRrPloQcx6wWiJ+8f3qalBUeS52mAYtlj0zlIRisJf3d5JP3U
 y/AdfOpJP3vF9FcRaJo1+xiiLVKldX9NH7ImM+s2ZVatwjikAz7EwHhWFnSDfurSl3pW9
 qbzGD1d26+aP6qtesKnnu3i51MgVU7s2r+vvqPLZvNHhc3xXAw6BP2yvJ7fW8stUFB9cs
 F7oLayI1JDehZpoLxbasiw11fEuZ0dK8Hbi15SqJg2Tn7DuCR5ZITfMVdhSfnc5LslQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 902BD6067D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D627488758; Sat,  3 Oct 2026 13:18:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:18:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 894cbeddafddf9322411fcb5257861c1d0df3ea7
X-Git-Newrev: 8a01c8eba9935dfc8f487bed50b5b695aca6077f
X-Patchwork-Hint: ignore
Message-Id: <20261003131800.D627488758@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gawk: add upstream fix for systems
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8a01c8eba9935dfc8f487bed50b5b695aca6077f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ound-fix-for-systems-without-MPFR-and-GMP.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
