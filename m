Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42479CC6B08
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01A07605DB;
	Tue, 13 Oct 2026 11:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olSEbnizmyXN; Tue, 13 Oct 2026 11:57:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 857416061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892668;
	b=XYbZilKiGAAM0C6kJWOY0KL6tdnCQGd51HYKcZOTMjed+5OucyE0ExbTVzbQbIhWCQQI
	 FJJSi347mWWliUjZFkJImsjq8ur3O7Z60U+RbdGC+7g1vWWg2VMsS8aVtOtmKzo6/x8Oy
	 wOgk2TAUPYMmWOgJyQ7Jx3fDOtcwoN23gGY32NVcwTT5tYASQEQvXlemwo2p/51frQMCM
	 PYP+RA1uCwK08y+HncFsR2udMQY/PNqVd1dlnJZzjjbdDDIewRSlJaZ+ozUuhsKgtFs4Y
	 G0x2854nzLb3VJdCvr7bLzs1aA3Hk243/46BKYrm2mThkAs6NRQJhur/FGzV25zgkaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892668;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NHCnT3fOAf5U2/fS43CKdIm0Ce7A0Bv4GJrHwktG23I=;
	b=G23FFcn6/Mh9ukfOUPYTm4BSLPVvH+oDhjH0mP8TTtWmoaxY1ZLu8+0VCNOV1K8gtOD8
	 iuqbslTTEeHFvUzqy3GA9LY1SdY5I081TPsAt5ctuSqj0LR9s4P8mgXqfKz2GWlzAKJJO
	 7wpVchYgko/qaRrF5hhAogd5EllA40rAmZV03KnsLMzemSWkDWh+m/a7WfRofx6g5dBVL
	 mOBDHpLrBpf7k73P8gzUrj8UjCBFJ7ZZcejNnRWHgWSaFmfOfti+SABH1QHdHC57FY7KJ
	 2RLwOwJUFeKqHx3XOeT1+KiCGw7a00lZ2zeDvq4jdEWcH8a8WND6xXXFzvfkzRhh5Jg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892668;
	bh=NHCnT3fOAf5U2/fS43CKdIm0Ce7A0Bv4GJrHwktG23I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MkTC3Q3v7pQE6/374Mhe6+7ZC+v+NdBYQ/BOnRrmha/tDv2HLGzis47l7xkcqcXFa
	 EnNujVWZJDYlgMFNbt+PzbMapchXEAGavc4d/j/ZMt/SdCS/Hvkb7y2v0r7ttctA5t
	 5l9UaEzGgeZoX48IzmlSRZPkV8HKGcMSOF+rhbUCAtwQY9njFCZZEZrMZxjhvwQtR3
	 y+0Acu3qEu+8nZRXnvGYTL2zpt+2FrumGgk84tkQDIKXIuWLo68gXQ354kCHUGwxUQ
	 qHMmepQ3UTO34Bp42wip6JdOdMsTp2AHiIcTU0TAk6tF9ND4HGOH78mSoQRdwNFNAx
	 r4DWKTwyQSHqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 857416061B;
	Tue, 13 Oct 2026 11:57:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E7344DD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C8018065C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BgmFtE7jEW1V for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A8B0F805E6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892657;
 b=AamK5G4WKlWaMEx43Cho/V/VTRJ8seUbvl3cPcwlGiHvHh0AmXZfxhIhd6/gYNK1ExQY
 hL5Ocz7VSoUr+1YOEW64Y833ABPbKAXJfd6P+EX24Qbr5P5MyF++Dn1d7+23Wz214eSmH
 7sxKP9sMTSkAAp1fuf446vNVizyQ8rNwX55E0XlDepSwDa+vyqKeYqi2EFSGtyZ6sy+hg
 27W+unE3W5iAnoPWBufK+neLa/5quLfbcWyav+HrSDPq8Wg/goxTcVa7BAPOPrWSUYbxb
 rVJ7zJmTpui0f/hQ8P5mfcNLOTK3vxh27O0yk+6VzMg3P8wjlaRtkebkpc/YEb8uJWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jFCNVekCQKePVdiKbO+Q6VyIqMPR+eXuqhZBsYhChOs=;
 b=svwdyfG2YgSw46gpVfDh04ryN0BbMilpRpNjQ0+c/zdfeAZ5ZsPx7F9UcWVxQL79V39V
 qWo03vfiIx6azY5HP05hw2A7ht3cqvP0yy5jUZeT3k0FCvhp9oArGema7YVTgu3cN0Ril
 TfYF/OVZf32OzZ6Gp0emzBHDAbTIWPcoEZ8nWBnToH0SddEyE3r3KJmuViwGVGVZjiQ0y
 2aNy3E+wyOSnOvKcM8NjKESycnIxnzrdeW2XL+IdWTUQCjA2k2H/E4BQNmAsflJxvcLTt
 CsEUlOG6FyLviZanzMj3TkILGe0SWW3xAtFj9Qeb1Ta5YvUXqIqlAXgcIeO/t0RDGCg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8B0F805E6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18EAB956A1; Tue, 13 Oct 2026 11:56:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:56:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1d0f5b398370396c8eb818389e105dd40d03fc9
X-Git-Newrev: d893bb58ae585acd55b8a23870e93ca90bccfa67
X-Patchwork-Hint: ignore
Message-Id: <20261013115618.18EAB956A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-module-build-tiny: bump to
 version 0.053
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d893bb58ae585acd55b8a23870e93ca90bccfa67
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

diff LICENSE:
see https://metacpan.org/release/LEONT/Module-Build-Tiny-0.053/diff/LEONT/Module-Build-Tiny-0.052#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-module-build-tiny/perl-module-build-tiny.hash | 6 +++---
 package/perl-module-build-tiny/perl-module-build-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.hash b/package/perl-module-build-tiny/perl-module-build-tiny.hash
index 9f173d3f12..cf97f34a5c 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.hash
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  91e56a426d82dbf33761984e26ed8acb  Module-Build-Tiny-0.052.tar.gz
-sha256  bd10452c9f24d4b4fe594126e3ad231bab6cebf16acda40a4e8dc784907eb87f  Module-Build-Tiny-0.052.tar.gz
+md5  606d1f830f0475b6de53b82aa3e5d36a  Module-Build-Tiny-0.053.tar.gz
+sha256  3726d622da6f655e88fdf89e4fd597709c44970b47de65082003e8d86b5e193a  Module-Build-Tiny-0.053.tar.gz
 
 # computed by scancpan
-sha256  1ce3282467869416f29b0c5f7773d1b80181fb9e08bef64e3829e8c53e19b64e  LICENSE
+sha256  1ecf8014e44c8dbf80b40dfa4bcca946f681301d01805983913d19e10cd25532  LICENSE
diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.mk b/package/perl-module-build-tiny/perl-module-build-tiny.mk
index cbb2dfc54b..27f95328e2 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.mk
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_TINY_VERSION = 0.052
+PERL_MODULE_BUILD_TINY_VERSION = 0.053
 PERL_MODULE_BUILD_TINY_SOURCE = Module-Build-Tiny-$(PERL_MODULE_BUILD_TINY_VERSION).tar.gz
 PERL_MODULE_BUILD_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_MODULE_BUILD_TINY_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
