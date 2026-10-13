Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A88CCC6B08
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 326D060681;
	Tue, 13 Oct 2026 11:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0xEqrwzTENQ; Tue, 13 Oct 2026 11:57:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 15DC160652
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892674;
	b=Q7+T8k5M2Ebo5Y1me+LCz5IccBWdYLeH7/pkiihkLS8FVoyiya2v3ky4yHvOKg3UKhBu
	 OJpBKy0bem9fXlC/BKpF41v8m6odWFjj0AQ3JBoCbye5BlMdLnbeaHayosAMlAlys6a4m
	 Mzqfc9LOGqwPzUd3o+jCojDX0ijTgpRPV0msxzh1rzrvJ4NSOEYOkft8IF/CUX3//ND/G
	 lr9OrtwoaacfErUExErpF6XIztC11/VuaXIrxOBKZbg03jdWl6wo1719cPInElXB91QhT
	 H0pGGCdZnzUfwzkEArQd+XC/cFGHPM7vu0OmsT7dX1HS+HpqhUULrLeirgcVzy7dY5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892674;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PXXYtRPmETJ5hbI0QVITexrUYooi+FMJEe5Q5aB/ojA=;
	b=BbHLtsDwov3dg3PRx5upE5mgQdz6ox+58hHXN491thlWRQhq3CVWmVVUflHensgYafnu
	 sB5SJSFuplP6oBS+Ebs6Q8nuN9dYmtHCb6upNCElfozo7mK54dwb0ceDSsxFnE37nZOtf
	 4pAULOiSxhQ5+B08IzCbDysT1S5rvzphNKfxVh+jNV+XlmLQGPRmh+KzRUEbQMSxEBJ8m
	 xJ0neMitw5tqdW92VxspjwQehUe+maCVdejJS2tMJyRMqlEfpI1mh4EqFrmvFsFxOyybe
	 d1TEYzMONDjXiOtGH83h1WZv3HH8qIic6ErAmhs1YrPGT4XcophGkZK9YhlBzQJVoGw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892674;
	bh=PXXYtRPmETJ5hbI0QVITexrUYooi+FMJEe5Q5aB/ojA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pJZqcaahCS5TRlqEpPkDTJ8Zz1z4ueB/96RDQRb7R7sTDuQqQCDe0p6DeDtQCenJb
	 HzL3Lp+Ku3k7y8F13uw3Ke6Q+X3bNTIc+N0Gk2SujUBBACC3we0P1dpEBmD3jj78n+
	 Cg86B2AEVaz4prVS6CvSG0WTArifBE/iEvycVe6PzeZE9HVo+QMpogSlwmiKOHnxFp
	 C+ClzjUo2H930r4sxvp9akMQcB+uJEb9CrnxHgcR/rhaF6HNExsZM17wQUAX30uWLI
	 zUPaalJtbrI10g1QQWB71BFpjIQU7q1efK3XRQx6jKpZhutq/deJrCWmQsIGIHpnhP
	 RdskDnyvBLVRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15DC160652;
	Tue, 13 Oct 2026 11:57:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 862474DD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7532B605CC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G1A847CTZXn1 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9CB9E605E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892657;
 b=ReE3tqW/lARz20fNh6o2coxfF8WdyqUZPouQ77frcREPi1Fy1Sr2TiQiQhWVm/pV4kZI
 +/PR3oBf+XyCXOFo5LTKPuSOPPooSqrxBuYGgkC00rC2p6xtRP7wbs3Bjc3srqpsaiXf8
 wlL4Gx/ICIP5Bl00Ir1t1YkaILGpvh6LW1MmyTpWQHGr/xmfoSZ7+lqkxpNOEu7MX5C27
 Cc92PsiwPYbVHZQgPkFnGAUvPchBOlALkkbypf3kc648ew6BBD3R6S2sh+pgOFyELstQZ
 wwPCIwpHIPOun4Kqi/TkraQ2KuLE5JOwVZdWak2K7ZpUCcSWUDNIIM7LjMwZP/EKfzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F5Q6X2zUnEeCC2jHtWzewgRKMJlLumYsEcBMc2dszig=;
 b=LN54vx3WXfSDDUSjlYTVoZs8FhjyVBGK46Mtq4bp3GpVQvK+kq85BdhUZ6zFAqsdn1CF
 IObNT+c+B4d4AMD5shCE/otdJaLVZpnNPkoxJDzRwsNxYgOwHWLBy2u+tpruVHjLi3hkO
 TiRxs5VKyb7BeQkLqXUAMcvbc7f4CcWzL5VzeRmSmDKpoXcsyWrGSPf1ylELws7VASxp5
 xce9KwTrHMhTOBaotWOdWWZwYqPQGD3c7p9WQRilVKK1G4kvrYiH0kuz4kXk0FCNv/bAV
 1Z9oLVpWimphBUbiyX/d5ilFPs9qFKOO/RnIlAV14Cpk5nHaiKCupGGlkCvvgiryfqw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CB9E605E7
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F246E9565F; Tue, 13 Oct 2026 11:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:56:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ceed25f8b6d1fe78bab9d3a5816b880517abba80
X-Git-Newrev: 48f8b4530fc5f72c464ef7e90abbdd4f6ffbe0bd
X-Patchwork-Hint: ignore
Message-Id: <20261013115617.F246E9565F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-math-prime-util: bump to
 version 0.75
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48f8b4530fc5f72c464ef7e90abbdd4f6ffbe0bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

diff LICENSE: update copyright years
see https://metacpan.org/release/DANAJ/Math-Prime-Util-0.75/diff/DANAJ/Math-Prime-Util-0.73#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-math-prime-util/perl-math-prime-util.hash | 8 ++++----
 package/perl-math-prime-util/perl-math-prime-util.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-math-prime-util/perl-math-prime-util.hash b/package/perl-math-prime-util/perl-math-prime-util.hash
index e28cfe542b..8e4317af10 100644
--- a/package/perl-math-prime-util/perl-math-prime-util.hash
+++ b/package/perl-math-prime-util/perl-math-prime-util.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  26496630990db586dfede6551de79cbe  Math-Prime-Util-0.73.tar.gz
-sha256  4afa6dd8cdb97499bd4eca6925861812c29d9f5a0f1ac27ad9d2d9c9b5602894  Math-Prime-Util-0.73.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  785a9d5f637212f9cd67d1ea5b8cac23  Math-Prime-Util-0.75.tar.gz
+sha256  85c17cbeb5927d71f024a2e1f197bff61e1ca6da249053e1683b62c894bb8881  Math-Prime-Util-0.75.tar.gz
 
 # computed by scancpan
-sha256  475b5f12062de0e197fb8cfa44eef3b032342d097752868e72c1239fe52a8942  LICENSE
+sha256  5d13a9e146c0103e53c1e23275cd181b03720a1d29006b0148dc4e6bfb9ba9ea  LICENSE
diff --git a/package/perl-math-prime-util/perl-math-prime-util.mk b/package/perl-math-prime-util/perl-math-prime-util.mk
index 5781fe75d6..4c8118c4c9 100644
--- a/package/perl-math-prime-util/perl-math-prime-util.mk
+++ b/package/perl-math-prime-util/perl-math-prime-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MATH_PRIME_UTIL_VERSION = 0.73
+PERL_MATH_PRIME_UTIL_VERSION = 0.75
 PERL_MATH_PRIME_UTIL_SOURCE = Math-Prime-Util-$(PERL_MATH_PRIME_UTIL_VERSION).tar.gz
 PERL_MATH_PRIME_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DANAJ
 PERL_MATH_PRIME_UTIL_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
