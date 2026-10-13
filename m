Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1D2CC6B08
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 852324030A;
	Tue, 13 Oct 2026 11:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYBDCLtrn2tn; Tue, 13 Oct 2026 11:58:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 776194050A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892680;
	b=fdmN5gvUr6BVOtdvRJiqfQTfxaMbRmjHKIBaUGN//05OIHyTl5jiGH5Td9dDQ+Utg/DG
	 JopHedEDFb+rlse8K3RDTleN7o3JsHQBjUO/O39b+aA5/ZpZuJM7BxPXDPaLs4RkYo594
	 EVYak0+vYGW7aV6vxt2WIUGjRDyOn1+Pg747DQnd7ZF+fZ2yhD0JegzFefZ2kgfcW3sfi
	 6mYYdPE6Vg9+EC6D0/LIaRCrrA8+wK0XUbVQf3QtxeXz6HATLs652F3VO21rN4zZAZiUm
	 3B3tM/3rgUfC0AvfgqqrCS0DWX4xQCKl4SayFptz/kxMbhbr9t9rXnBvof7YHPtYO9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892680;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=33PXmuV3oHsHK5WJMEi3LNUYKsgYZXnZX8p2a8Zc/gc=;
	b=rRdxk4cYemWhW2swumY6fBdsho+bTZnG0wrfymtXav5m6GU6vYAOjZuQQEftbvtsRc38
	 VHpOq1rMak8sUX27lblIvXrjLNxz44YPCivqIujyubEvecstRuOKhi+EhrkMffhwzXquk
	 Ak2Y0x/bhPb/IN+LdKIobQUPR7xmbct6ReKTvUjngbQO1vqjdyMnWcvGZilWVIhi4rBJW
	 8rswX5HZbG2btbfexByqd55WQ2xd8T0WBYu9fzZJSwGVkRZ8cAnsvIHHuO6FFoFbzDQLl
	 hij5I+NbpR5oebhirYc8dJRrCYNSBCy7ZkylnBIImf73t1BSRZU6HdmP6B7W2FJewtQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892680;
	bh=33PXmuV3oHsHK5WJMEi3LNUYKsgYZXnZX8p2a8Zc/gc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OdpUNb1ol+pmLsFMhvcl7wEE6jT372vLiAIHxpbagXZBds+idaHZpKC/t8MhwA5QN
	 itsGPwtSWrIQIASxHEjNBMEbXqZ3GS+AVY5uVAA9p4K5j5Ui5+/whzTTgennfsIYZI
	 HdygL/dYgF8Y4HXpXVVqwWFJpXXtVfs4UWHQuV/Uv5VVS6+D5fnk764B0+DA3MTjk1
	 a3Va9NpzXbu3t+YEt2MJHPmEEEYCV3LHXgimv/qxQehXb5pH/sxfCePPT1hDb/KgUh
	 6gyMopLvmrZUei9xvvwq27zpG6fELldgqLYc5My8B9kla1JedXJZYbCvX/wWoC00RC
	 kLq/RUMVSe0bA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 776194050A;
	Tue, 13 Oct 2026 11:58:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF55C129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABE1380564
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmqR-JkD-9Fd for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D9AC08065B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892657;
 b=W5OCRqz/S5cotsvCN3XWUVuUo8zxDZltcAUIdiB+22Q4AN7pveOgPAeCcRb2qYx9WA7k
 HX1HhAVd6ijq1QgMV+IerkgGW0xrpMSVHdzZjnkDvl8tinwyGVGUR7B0pEn6jx5g01yaC
 PnH4ar+B3/MxRWXmXPn3hcTrs0dCqgDiqrhv8eDJc6Orn8kLW4G+HEcGriD5mwW9j2JRu
 /PsTzPK9z1I/NU/2gK+1rd+tIlqJVJWJv713aVNBCkemQbiCsrwL+2HJ5MiZMTfgMEfIB
 uwPbw5iBX6iOYA9E+bWNVysZG8pIEuFUpZQoBH1LO9jteP2yIqAS/b5hlq1aXeTOi2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jhGIs9ncRt0Xmwgp38SH0u3QIR7kYyjYb/mqybHtgfY=;
 b=cgFTjT7pyFqN1tXpNs247r6uNl6S+kDZuE7ki9k6ZM/+/FZHItvQ+FSSnQQgdhJ4N5YR
 98C+cgsh/cmVCrSdxAdvJL/lWK14crgMvIfrlzKaPHa/i/ftFUo/f0cnmqF94g3bjENc1
 3capEmQ4QPlrrcpEPV5s5cIw1nAZ4K5oXKgRuLUdnmWhiL9cNPOiEyRG03aXARZF3d6OH
 Xj0rVGCVgCFByOnq+3sOYUW//xDU9Kw+Qjm+joMjOehHfaVSEyk4+gVPCK8WhLET/JO3s
 3ZIJHpXjWNA7BjE7Cu8kvzAuAy3bFUWxXtf9Srw54gyHaffGJIPekGFgKEq0vceqSxQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9AC08065B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49E6095465; Tue, 13 Oct 2026 11:56:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:56:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92754e04e30cad24c1c19dd63fb9e34459424b35
X-Git-Newrev: 55e41a38e7173884981e86aaed4b911c8afff623
X-Patchwork-Hint: ignore
Message-Id: <20261013115618.49E6095465@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-www-robotrules: bump to
 version 6.03
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/55e41a38e7173884981e86aaed4b911c8afff623
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

now, it has its own LICENSE file

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-www-robotrules/perl-www-robotrules.hash | 8 ++++----
 package/perl-www-robotrules/perl-www-robotrules.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/perl-www-robotrules/perl-www-robotrules.hash b/package/perl-www-robotrules/perl-www-robotrules.hash
index 38fd062093..037b7f9121 100644
--- a/package/perl-www-robotrules/perl-www-robotrules.hash
+++ b/package/perl-www-robotrules/perl-www-robotrules.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  b7186e8b8b3701e70c22abf430742403  WWW-RobotRules-6.02.tar.gz
-sha256  46b502e7a288d559429891eeb5d979461dd3ecc6a5c491ead85d165b6e03a51e  WWW-RobotRules-6.02.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  9c821b8f6eb0f5ddb86f1d338b493879  WWW-RobotRules-6.03.tar.gz
+sha256  8522b532935a11bfa688c2e113bac66729df4851be50c2c26d4b06f45fade472  WWW-RobotRules-6.03.tar.gz
 
 # computed by scancpan
-sha256  fa375c4f771b92fc076b6c66e19440a0fff51dacf489fecd94bf560091279e05  README
+sha256  994ab45a4f8ef43f47b7baabc48d100838c42d226d8d161d6ac1f49c5f9d7c84  LICENSE
diff --git a/package/perl-www-robotrules/perl-www-robotrules.mk b/package/perl-www-robotrules/perl-www-robotrules.mk
index 052d9a6743..1b6df6b53f 100644
--- a/package/perl-www-robotrules/perl-www-robotrules.mk
+++ b/package/perl-www-robotrules/perl-www-robotrules.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_WWW_ROBOTRULES_VERSION = 6.02
+PERL_WWW_ROBOTRULES_VERSION = 6.03
 PERL_WWW_ROBOTRULES_SOURCE = WWW-RobotRules-$(PERL_WWW_ROBOTRULES_VERSION).tar.gz
-PERL_WWW_ROBOTRULES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_WWW_ROBOTRULES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_WWW_ROBOTRULES_LICENSE = Artistic or GPL-1.0+
-PERL_WWW_ROBOTRULES_LICENSE_FILES = README
+PERL_WWW_ROBOTRULES_LICENSE_FILES = LICENSE
 PERL_WWW_ROBOTRULES_DISTNAME = WWW-RobotRules
 
 $(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
