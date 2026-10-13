Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227E2CA9ED2
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB09D404EC;
	Tue, 13 Oct 2026 11:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbVTRvdF_ztH; Tue, 13 Oct 2026 11:58:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E3FE54050A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892682;
	b=pzxeFYL7cjAXvgt5XVT3fnKYXNtXcyEgOeIdshfnKu5T+onUu9w2FH85dTIDwQOW099/
	 cI/+IH6e5laxHrPLzGRBUcoWyX8nNaC8lijoD/sXveJjTu30UgKM4zRgLoOv+i1/8EPbf
	 Z9TS4SEuiIDwfXWESQArxv3sUO46G6WJiH+dYUwA2rLC9T/29iCLFmRdthPp73ldWs4oD
	 EAnJ6YTNyGXf5d8svBKwcidWe/fb8TCb3TquRXQKG0Q9sxfMIw5ZFxtaEfqHf6wbPms49
	 /Gqo8Ys9vht+5HOSGFxrA+G6dCoq6n2p/2zYDx8w6cULGNy93JW2uynqfu+4skDpv6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892682;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ItrmOaGpeB6AIxfJW1NCOnYClhWOkPij+UrHJLsnRXo=;
	b=Lo1fjw2dNnRV6La2WFC3X9Oc/3O9cQmaQ/x2L2yoyFdQ75O8ya8Ngc13Si3rR+NY0Sdm
	 Qt6iK9DxyOXLUAJbZYpoocobineKWziSRf7rhO0ZCs4sJA15s8XWNl+OV6iTkZZS40fEH
	 m3Kuk+lrWfVAOE7UAifGZN69MNiLp5xg5WJS5NSzsvtgfrQb0so9PzuDmbaMYrAJsRfgE
	 qTQvbsKMvi4jTvORXIZiomzqIlYaDhYWYQvFUVIXmTCYye5Y0bjd0AsPxloOymsPEVLFE
	 JJ3OWcnHi18gYrONfpXpnK7c6+1H1u04YKnmfqg3R2zGCNICy8Xfpoaan6iwNNVwO7Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892682;
	bh=ItrmOaGpeB6AIxfJW1NCOnYClhWOkPij+UrHJLsnRXo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MG0qW5fjjE9WicSTUgsj3MUBpqMpWNNE07zcqOLvsy6qHXV3LTbMwO8l51795YcFh
	 T00LHJhMfk1L+nJ6vKY3OmGR4HIVnvrj9CGvHMcEeTn/4V6piHD2/tyGDeGkTylM11
	 060rKpVAgyqGNqJSarBI93MNbiV34fCVnJYJKLzealMkz6UG8p75lNtN7jyIFvGjxT
	 7Zj6ik/jowpblnI+TBWyp46gvQL5y0YHMAhsBhyrXjUP5NRyjstNUzF6lY9BiM2yxB
	 e8tRrnQ0y6gI7TpR8uHq6q+TK7JhQR9mNIiAPJ4GfRAQdscwAcXoVeTtAB2qPS/V28
	 1AQL0TWP8UMEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3FE54050A;
	Tue, 13 Oct 2026 11:58:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3D011399
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2C69605CC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1aQn0KBqBZx for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E421C60653
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892657;
 b=sE0pHKQ+VI8yJ7Uyylu1wEac8pGJZj7S9Heg2TxFmpSe5WxIY0fjFoZv4LmbNFIn8uwk
 QaLvkjMHU5buBybdq8TnbVXtiJ9OXLlibqmUugqB9xguADXqUy2H6DBXZjPgUxqKBMkIX
 jFbjDB7sulb9QuxqV5WPxxM6vLBiVxlsdBvn0dzBJ93Mbuak50ySNe2E5Fh22lTPkNhMh
 J2QHnaiYiiO2JKu6EgPZmPYQLQOifUHQ57a8ZemKIspRJGMerMT54MgW4X7f8x4WyXr39
 qS8kysk+MoQynKakpxuKslKSTvdY1cWbWMGIO4xnnQuxQ0ejKYZ5Pbi/eEruX77iqxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5wnrFPLgwBol/pxN8Eq/Jx15u5MT83WnUAEG/vH40yg=;
 b=BkrjlBGtblbs/iBPh/16FJ82uXOUqIkCXi61Q3J4bUYfAM0irpBl0+UrMlW1YiuiXq0Q
 ZeE4kS8za7qJDy7TPmRX9IrZegILYw61OYfg7JltmDqzdiZ1t5ZnhTPr+oGMgwMT5lXjU
 ptkRHAsq5Lf3TFiUEUrxqTzV77ywAN4xQOyIRqYMhnnmSyJWwGX27z9QYGSsQMuHpj+sL
 Mhl+rmclypWkZrDJqy26Clxdx5GR4dziO8MB0Zqn/1BPLOpMHcCBsWruHOFzW5mylJMbJ
 AABZiG5eRGJu2TMyi1LwWhdOkdHsCjqEQFGhFOC46SfJhMXN1X+vzyDAJWR0XZd+3Yg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E421C60653
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54F439565F; Tue, 13 Oct 2026 11:56:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:56:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55e41a38e7173884981e86aaed4b911c8afff623
X-Git-Newrev: dfaacfcdf7ff3d0de6099305d03b4f53ad4393a2
X-Patchwork-Hint: ignore
Message-Id: <20261013115618.54F439565F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-timedate: bump to version 2.35
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dfaacfcdf7ff3d0de6099305d03b4f53ad4393a2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

now, it has its own LICENSE file

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-timedate/Config.in          | 2 +-
 package/perl-timedate/perl-timedate.hash | 8 ++++----
 package/perl-timedate/perl-timedate.mk   | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/perl-timedate/Config.in b/package/perl-timedate/Config.in
index 84ba8ff6fe..b1b9196139 100644
--- a/package/perl-timedate/Config.in
+++ b/package/perl-timedate/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_TIMEDATE
 	bool "perl-timedate"
 	help
-	  miscellaneous timezone manipulations routines.
+	  Date and time formatting subroutines.
 
 	  https://metacpan.org/release/TimeDate
diff --git a/package/perl-timedate/perl-timedate.hash b/package/perl-timedate/perl-timedate.hash
index 5ea4d49cb8..6748883bc5 100644
--- a/package/perl-timedate/perl-timedate.hash
+++ b/package/perl-timedate/perl-timedate.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  5e5afe22c8d417417283d1f7f4572a57  TimeDate-2.33.tar.gz
-sha256  c0b69c4b039de6f501b0d9f13ec58c86b040c1f7e9b27ef249651c143d605eb2  TimeDate-2.33.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  a06d7f6ec7b24581f0564f0f70da1a86  TimeDate-2.35.tar.gz
+sha256  baddd0306ae2e86e9ec28d3de5439e514643e80b3735e43bd0fbb426d73304de  TimeDate-2.35.tar.gz
 
 # computed by scancpan
-sha256  e72e67533eb3ddd705ae718898945e2f3bf3702e91e85bb67824575706bd5bf9  README
+sha256  76f019211fce0b5cb773d602f9a9be9a6f8534991f251cee760a65ace1c97408  LICENSE
diff --git a/package/perl-timedate/perl-timedate.mk b/package/perl-timedate/perl-timedate.mk
index 89a82c042b..7d708cb823 100644
--- a/package/perl-timedate/perl-timedate.mk
+++ b/package/perl-timedate/perl-timedate.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_TIMEDATE_VERSION = 2.33
+PERL_TIMEDATE_VERSION = 2.35
 PERL_TIMEDATE_SOURCE = TimeDate-$(PERL_TIMEDATE_VERSION).tar.gz
 PERL_TIMEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AT/ATOOMIC
 PERL_TIMEDATE_LICENSE = Artistic or GPL-1.0+
-PERL_TIMEDATE_LICENSE_FILES = README
+PERL_TIMEDATE_LICENSE_FILES = LICENSE
 PERL_TIMEDATE_DISTNAME = TimeDate
 
 $(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
