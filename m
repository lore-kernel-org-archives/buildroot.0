Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BA6CC6B10
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECA5E4052F;
	Tue, 13 Oct 2026 11:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ag8vpl-CpuqN; Tue, 13 Oct 2026 11:57:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E48014052B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892670;
	b=KtYRIoVuGZcMAJDHiPr2i7891LbMeskCKo9TKpRYKd9G59TwogU+RZFgASWgxo46D3oa
	 f55FzXk4kb8XGB/E4RoqgnttQ1jMeaVvMli5GIJa6hDgnx0PjJKroLxIbz+8bw/ldoZoL
	 cuKoFa6z0TR2SjFzBPyK9Bb6/f1llH2whTfeSpx1Mwa3vvChfi5JX0MR9FgFY7yU6FONi
	 k1FLmJX0wXVIEAzIzdPUhO1WTtZa/kBvD/XDvIM2egIJagYzfojJfVX3TpizDIITcYd0P
	 12sqtFr7jphUD+b5QzUR2PHmoWTTCLyznLiNe79TjWX4e+G7V1LZ+j5mKC60ca97C+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892670;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ByoerbdKXvh7ZpQAQHRPxDiZbi0VFYCt6zBVhCd98U4=;
	b=EQWoxPM2Dekl5z0vRgPiFv4j3TnlljL085WHRfDBswKF31+JESbSTDSq+sXEFYa4r55j
	 fggwOt7uh1S45knNFMKAze2OzW5AvapCzCOE04B9c5sA2LFSv6lNMWSb1JKfML5UEPwa+
	 ZMDm3NivkeOJOPJQeNL8RLhZd/rN7YIzIBvN8JDtVbLin+eC2zQRe86Ei+Q7GpPU8ObyK
	 y6JqeCplR3SGc4I0pKjBd9sFKwxeHiYsjD26Yl1fxocad8tsdPgUcgp9IzevYO0LdfAFn
	 GqwDbrag53p+kOHu31+jowb4oqKF3iQ3afUOIaMGMW71/Yo/3XEr3z758P9fouCe31A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892670;
	bh=ByoerbdKXvh7ZpQAQHRPxDiZbi0VFYCt6zBVhCd98U4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m1UEJmKEfjrhkbIsuu2eKHjscg0lhLqKquk2m1Oy/PW6YLpkK8+t4DPvNiodDn3zv
	 3pCOsuGfJpnNZA0sTVZOhU0wz2v89SrNDY+GnqHr5/ttTbtisGcdWb4EIiWzAwHbov
	 I3hj9tTF6JoYybWSv0V55b4njDqlu7Pnhor2aMqoCtdwbc/Y8y8u6j+UNmhZ/QuSil
	 emMEJWfq5u7bLz6e2iXEPRu/F2ULZJfO63Rv85nNaX44daQlNP8JW78bzpqD7KEG0P
	 uL+mY14Ebocd4kpzagN2vCmE313njHSrsBCg6PGqMxITvEw4vOd56k/1FkF5U8z393
	 MpeIbFvXovl4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E48014052B;
	Tue, 13 Oct 2026 11:57:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71348139B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 604DA40282
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syL2uyKV0P_Q for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9D0EB4029B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892657;
 b=rSxIsm8kS3l5gGZKbW3f3KlMKIIiQvClir7+trfUrOxKqN5/jBzO84xduf96GD4g7R4w
 hWNa1teYzBoh3RnWSIZ0rzp/KxO6dyqrkxkGkVEcd2RYZNTyFFqfOdjjJpGQG/kH4Xtp1
 GMa45TsxnlxH6sBbXackqYcU/2xqjfNLEEZmIvs7bdqo4IiJmhxgaHZXzM6CQuX2jwW6I
 N4D3svffjS2qikWl9vtlYXnja5SH64zMZKp4aGWX6rnQ/d4C2OmxzVkEOOI47SMol9RKB
 p04YRQgkjvRpv90ek3pJo1HySUNDixRFpa/+W8H4paHUfqFsE+cslevHbkGZd1owong==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OD77ZlRX4qzeqQmUmaqaFU35ANPNq9PonHSP8tN4kkA=;
 b=JwfaSmYpCiXc7ob8Nz/0n5pkQiDfycURB872GeHzyPooYzoxXJizse7C4i9a5xPVteEZ
 3jy0vGzc7VEQr+Ug8W7o2ETx3JM5ruv2PmemMFnucOQAX5pKfc62XwH4wGTphB6+ECd0r
 08ZRwPBwrs4miViC4cytw4azEE4ILl1vsLUbiz9Vpk7+6LuSp+XB0p+WMPDZk/VoNebwC
 bJxV8K6K9j9IOuP+A9VHt7wqafSDFo6Vx/wueRRxUuwwPFhmwVHRC8gzYHJ+5HkiTdwIQ
 gPxcsJlN9EzJwo4DHwJ2CU/zrkzd4deMt5HhzxnOIp4zcnhsCFM3hx6fsuu8ufpsr4Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D0EB4029B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8D87956A6; Tue, 13 Oct 2026 11:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:55:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c54043a9020ca5f6e71d6c4e3be271aa9a99d7b
X-Git-Newrev: ef93184f20f63fdc71b94e90b046a7b31c35fd33
X-Patchwork-Hint: ignore
Message-Id: <20261013115617.D8D87956A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-lwp-mediatypes: bump to
 version 6.05
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef93184f20f63fdc71b94e90b046a7b31c35fd33
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

diff LICENSE:
see https://metacpan.org/release/OALDERS/LWP-MediaTypes-6.05/diff/OALDERS/LWP-MediaTypes-6.04#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-lwp-mediatypes/Config.in                | 2 +-
 package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash | 8 ++++----
 package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-lwp-mediatypes/Config.in b/package/perl-lwp-mediatypes/Config.in
index c1f58a6f31..6586042f23 100644
--- a/package/perl-lwp-mediatypes/Config.in
+++ b/package/perl-lwp-mediatypes/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PERL_LWP_MEDIATYPES
 	help
 	  guess media type for a file or a URL.
 
-	  https://github.com/libwww-perl/lwp-mediatypes
+	  https://github.com/libwww-perl/LWP-MediaTypes
diff --git a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
index 0a09f22ad7..6d0fd334e6 100644
--- a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
+++ b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  84b799a90c0d2ce52897a7cb4c0478d0  LWP-MediaTypes-6.04.tar.gz
-sha256  8f1bca12dab16a1c2a7c03a49c5e58cce41a6fec9519f0aadfba8dad997919d9  LWP-MediaTypes-6.04.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  61257954fffa7a48f507b058f27efeb8  LWP-MediaTypes-6.05.tar.gz
+sha256  abb2dcfbf069317fe65b098e3b2ad58c5eb33e9a839b9190cce6d371f8966cc1  LWP-MediaTypes-6.05.tar.gz
 
 # computed by scancpan
-sha256  e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENSE
+sha256  994ab45a4f8ef43f47b7baabc48d100838c42d226d8d161d6ac1f49c5f9d7c84  LICENSE
diff --git a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
index 687a844271..16f86b038c 100644
--- a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
+++ b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LWP_MEDIATYPES_VERSION = 6.04
+PERL_LWP_MEDIATYPES_VERSION = 6.05
 PERL_LWP_MEDIATYPES_SOURCE = LWP-MediaTypes-$(PERL_LWP_MEDIATYPES_VERSION).tar.gz
 PERL_LWP_MEDIATYPES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LWP_MEDIATYPES_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
