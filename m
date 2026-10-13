Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493ADCC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 138CF605DB;
	Tue, 13 Oct 2026 11:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZNQrz7VrJCz; Tue, 13 Oct 2026 11:57:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 275376061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892679;
	b=Sjj52Sw/4du+w0cXGOtatVCkvjkIILWUEu8FkHd5sAlC73x/XLpytZi4yeV4T0dtat9N
	 JDEFFit2vukjTXTypHkfu0kFg770k1uLdfR7d/AYw0yCssU0cXQT5Zm46o76+iYPo+EXw
	 WF33Dx5ZN9O2t3N99UpIGhjMsHC+X02K1S7KZLoqVqlYf2rjN0TV+Y52rIk/2Gz+S5Hk8
	 AbEpF2Dt0cBLvuRp13RTlkEPSpJd45xOFI/1rsDRyimCNPtOQuQp3Jz2JPuMQFEa7h9pS
	 JGURNotyJ4boNQEhMXTgia6EJzk3dPa4vbx13cW0meqfRvm5My5tRvbj/f5ajMqrAng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=j3dcob6Ld2HxBrh9xrp8E/azPcZUBAKOmfhPzy5aF6g=;
	b=Q8mVJTlmGWFO7RYgX4SuHnEm+ImTXLEFpjERyWMfmUgFKcslS1bO+Bv1upuglkxX1va3
	 qOOUx47H1BI3sUxRL+TyBYJxBCnQDkbNssE3mzugOvSpGbNWYiVwMVS2vQiww5G2/+Nbn
	 PZ7gdCBvh4FO6Ylqo0E8vwCRT7FhDnJimgxcglVVJ7e0UaQZeZYdGHmmqBfCmjLV3tkTv
	 JHW5e6xq8illhXO+a9Ad67DIcQAFQDYJTiSKlCqm5OfIFyr37OvFuduZif46a9rUhMcqn
	 yMVW7CRK83JQksdjAU/lbKPJqJDlxAVdUGAjyMUcNTad49iDMG9QuswiCdAbn4qCcEw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892679;
	bh=j3dcob6Ld2HxBrh9xrp8E/azPcZUBAKOmfhPzy5aF6g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B/XlRHgm9Fw6jmGGCIjjjOMuORZnOgcpsBZVm3yQbMWSTIi0uw+CWsRkJOahPeo40
	 oavxhs0SqHO3f2mzHACZfPt7BUxZx7+CxMBXMWxAfH1gBEOW/9BfZ5tPFNbU1UgDN0
	 U/6r75zSt7si0RrIh55nRCxmZxD3uUJumzlPKKUgOjEcVGrrww7fq9bt9zRoFFCsKZ
	 cYRAdClszbKDJPZDW9ixv5xOz+lOvGI6eig3AiSCcn2TLSt/S0r2oMHlyt7pth6GZd
	 wEJ/X3LPBxnbW5fJ/pAJHFNJGFFqqtlBG/KSoq7V/57W279MHOLsPCIG7pfzbmZuad
	 HdYad6btwH/sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 275376061B;
	Tue, 13 Oct 2026 11:57:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87751140F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76AB880564
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p87inE9DI3aJ for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C1975805EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892657;
 b=INLePYmS+x5letPIk2T0YW2Jxthy1g0VTBP6wRT/ZMWrtVSe0O5k8/DihZDSChi28woE
 d/Lm2UrUDMIX2ulcOJLYarbWeeAbMMwVemOdwJtwvliT4WPJNskQ6q1ygE5hJ7csL1wJp
 kM3JtYRTfxcy7OJVnHnl8ETk0uCNKlAR3sBATfPNXO/VW1wxEOhonA/fOfzWUCVbylwoq
 nJdYWaupkTbvReF3dGHf5dlL/laLPJjlo+BE+ci+9FpeDOGiEuTp8xkNpmwb4kniZR4O5
 tCs+WxIyeDuMn2YyoZHyOpN7JnWQ8zP6pRUM1A4SBlRoaIJ730qfHZVo/0xQFFvycaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PTPiTUqw8C96Z0mVAcD9ElpTXmCNOS8MR6Nv9XULydI=;
 b=oAvmTj7o341S2SoD3nEXHJYINsfUPw5ivzu4Jq6Zc81G/vzRC+EydrBqehtFXqCDuJUZ
 WNQCsg6XeHasLetHiR4Fv+NJsBQCxhH3joUZwQIKvDQPiNQNSie5asct/mX62Tr4H31uo
 1Jk6ObSbxUZQohxctRaDrmTy2s+o9jb0nIOgJfu98u0NhakbdaErRiu8nzI6edOxyOy3P
 N8kKn6oWnuPvrS9070eN6gu7OcE3/M1DPkB3bmJrakPrQS5GO93mMsMRVZ2nytqGxNJsT
 emxXsJ4sgp5O+2Uuo4suBYGYREEjDU9B51ZxsbwycmeWLgdUsv3jVaYkurSg+bzCPkA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1975805EC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31D4B9565F; Tue, 13 Oct 2026 11:56:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:56:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5494f43c5b9e108599ad961f9b7389188f00167
X-Git-Newrev: eaa880c80570abd43d03de5644d445ddb25a2912
X-Patchwork-Hint: ignore
Message-Id: <20261013115618.31D4B9565F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-time-parsedate: bump to
 version 2026.033
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eaa880c80570abd43d03de5644d445ddb25a2912
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the custom license to "same as Perl" for all
see https://metacpan.org/release/BPS/Time-ParseDate-2026.033/diff/MUIR/Time-ParseDate-2015.103#Changes

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-time-parsedate/Config.in                |  2 +-
 package/perl-time-parsedate/perl-time-parsedate.hash | 11 +++++------
 package/perl-time-parsedate/perl-time-parsedate.mk   |  8 ++++----
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/package/perl-time-parsedate/Config.in b/package/perl-time-parsedate/Config.in
index bd5957d919..02ad471455 100644
--- a/package/perl-time-parsedate/Config.in
+++ b/package/perl-time-parsedate/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_TIME_PARSEDATE
 	bool "perl-time-parsedate"
 	help
-	  Parse and format time values.
+	  date parsing both relative and absolute.
 
 	  https://metacpan.org/release/Time-ParseDate
diff --git a/package/perl-time-parsedate/perl-time-parsedate.hash b/package/perl-time-parsedate/perl-time-parsedate.hash
index 0e51998090..9aebd541e0 100644
--- a/package/perl-time-parsedate/perl-time-parsedate.hash
+++ b/package/perl-time-parsedate/perl-time-parsedate.hash
@@ -1,7 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  9143d075278857d21c77467d26f1603b  Time-ParseDate-2015.103.tar.gz
-sha256  2c1a06235bf811813caac9eaa9daa71af758667cdf7b082cb59863220fcaeed1  Time-ParseDate-2015.103.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  31e4fb54f3e047255285fc3f9d73d559  Time-ParseDate-2026.033.tar.gz
+sha256  8465c8146bd129d3be4a402b45e1b9f9c306f42b0f58a1e507bbdbd653f253b7  Time-ParseDate-2026.033.tar.gz
 
-# locally calculated
-sha256  6d8de888d0662f75cfa3bf21b261741d5634ac9cdd8604d6173850546a3d40a9  lib/Time/JulianDay.pm
-sha256  9ae411fbaf87add414e7357417032dfedce652c393643bc5cb5b7698041a1dca  lib/Time/Timezone.pm
+# computed by scancpan
+sha256  e8694831e3fcbba2e01b09f77f3e638cf98c7af57cd6d9498452aad1f6cb7f12  README
diff --git a/package/perl-time-parsedate/perl-time-parsedate.mk b/package/perl-time-parsedate/perl-time-parsedate.mk
index cba8c7b6b1..bc2cfe1f10 100644
--- a/package/perl-time-parsedate/perl-time-parsedate.mk
+++ b/package/perl-time-parsedate/perl-time-parsedate.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_TIME_PARSEDATE_VERSION = 2015.103
+PERL_TIME_PARSEDATE_VERSION = 2026.033
 PERL_TIME_PARSEDATE_SOURCE = Time-ParseDate-$(PERL_TIME_PARSEDATE_VERSION).tar.gz
-PERL_TIME_PARSEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MU/MUIR/modules
-PERL_TIME_PARSEDATE_LICENSE = Time Parse Date License, Public Domain
-PERL_TIME_PARSEDATE_LICENSE_FILES = lib/Time/JulianDay.pm lib/Time/Timezone.pm
+PERL_TIME_PARSEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BP/BPS
+PERL_TIME_PARSEDATE_LICENSE = Artistic or GPL-1.0+
+PERL_TIME_PARSEDATE_LICENSE_FILES = README
 PERL_TIME_PARSEDATE_DISTNAME = Time-ParseDate
 
 $(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
