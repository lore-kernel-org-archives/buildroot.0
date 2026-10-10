Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0913CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C6AF60632;
	Sat, 10 Oct 2026 16:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CDbzWKo7H_y; Sat, 10 Oct 2026 16:28:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 717EC60638
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791649689;
	b=Mp8pXwr5Au4OwIkztMP9Uh5Fz5NadPHAiBQ6EleFQYLQCHmCEy3MxjL9E+YTcfo7y55F
	 PIo8YdUryaimK3ppgMv3jzynAm+bVY3IP1PreF2fplF0K/1yq1UlvufBbhyZ4IHhcOxY5
	 sZNAhjVKXK5VbsKWkb7FGCK463/HA2N3whtXY2zGz3lWkpjdCYDaFf27+y+tPrp02Gj7L
	 8Pelju+gT1pX5z++2p2Szzb7CLLdKuD8G5AzYwKBqTxBnpnVjDUnu1E+u92L1qfY/+eW8
	 sI0Vi3nrdNuVeR/mbZ8eMCDTasjrsdwubNwzGlTtsr3LuZXWXOCnUVBSKQvTd8Mnv0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791649689;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=LmFXMXh0SFiIZr3wbw5zveBdHJ9KMm4uxoBWZdWcMEQ=;
	b=W+wjcVf4AsezEtCPHX5ZcOcStWm/NM4ya11aglWcqP9fjvtKZk59M0SSs1UdxxI9NGlv
	 GWRgBA4YebZBlmBWvvQefAIizlSrrjN0f21pv98WIYyucD1uQ/DmU2XTJ0zfeFUZBdAj7
	 LwftxGLVPTDNaqW5euAZyKQjOH6wY0CcM//SMSOJ4fKrhISpICIfmnpdvkcFL9QWe1PEY
	 cGQljNKfXNgomSWPN/oaPDmp4KHsNZbzSDphCxThba4vl/kRS7fdiuiqBrlFhsWBm/fWI
	 24devyBN+AXxnJN55gqxn/P+AmCDk/u7W9T7Aqy/GncMgksec7/aTgbLU2iEeaEn1Yg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791649689;
	bh=LmFXMXh0SFiIZr3wbw5zveBdHJ9KMm4uxoBWZdWcMEQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ASeCM2VUvD8MKAerImCDh/xaJtx1udDfgXrSO5buptSwk0c/66djCwokiuOXbLQYl
	 HaNnNPA5p39YKuzNCNVqVw88Wxk2iTrdemnuRGqx/tCNaGFL9rdygKY2txiNPkguBD
	 ZnsNBwNCZIAFo64wrTL1S0RmSTVAENY2rd6w6W/dtlcecmBOvZIw9tBJDISh3N1vA4
	 /Z5NaLLGDo7tII5or3JQGeHIHwHfP53D54wn+4IlcKxJVlIhLEtrDGe70CBAcSk1jJ
	 E+2O8tGuEN9/mAe7LL/57vb/LoXaDS8yryDD2vlGBs0DK1mfmQKLyDVJ6n6ApngGYm
	 YuRsQsPWqj5JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 717EC60638;
	Sat, 10 Oct 2026 16:28:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BE8F156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D13D60638
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ym_E1ElK7Vbh for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:28:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 59F8B60632
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791649685;
 b=SFbdFONeHg7ruiWkMRdQ7ZD0UY7pZ9HbZI+WJLAWopCbjEWkIKuB9DIJJt0sfJo93lA1
 2AY3/aYWtnt+Aun9MWWzBbspn10T8FBhvshes1vtgp+Op8xSqxj90roSho96Fb9pfB8Rf
 9vR62v9MKeBhYVAe3S6ujKHJC67u39n14ubEERk3iP6f78ThUzqIyplujECbLGnU9G4Hi
 ARzgZ+zh2vdStFCIhPgF/Dm13haLBEaFQJb+aLGyccqb/SK3FwkkPV2/KUBTUsEakvjOd
 eQc/6Ofw5skSfsB1NAMVMNEiaGc/Ja5CXN+U8/el1gMyMjTSSEhGQkSa38yl2Qn5N2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791649685;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dVL6eB8S8EFNtGEvyJRmE9qDHNMadYWHGOy7xoHKYFc=;
 b=YhV3TbjoVdG860ZBHV7jJfESUw4AN/BXVJ0i0KEPsTHcGE6g9ivy5TSCyGt2KNNLjHUG
 soo7MXEJGWxLyT43PPFMrWCqEz12YquHb9hqgYGuN87GzwcemdhoXN1JljVyGxfJzerqe
 als6IGlA4J/W2ySU8uh5UhtYQtcHQIdNyUYgJerYb1VYa+fZYB2DPg13H5d6IhEyrmEsM
 6dlA5kcTH1gh8RQndZVY6xsvSXWF8RJ4wFZS/ItWPxTwK8obTp6wjBTfmyopr7Ji3MCgI
 yGRuux1pH+tj6nwx55FjVwV2+HKsTYWF9G4ieIadR3JYqK4t1NeV6yeM4YbBLLGqxIw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59F8B60632
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:28:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C4BB92406; Sat, 10 Oct 2026 16:26:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 18:27:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99909a8a955dc6ba89aaa72e488e8c262ad2f469
X-Git-Newrev: bde76bfe85f4c0ed7e838c08d001c27a27469d9a
X-Patchwork-Hint: ignore
Message-Id: <20261010162647.1C4BB92406@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gumbo-parser: switch to Git
 download
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
Content-Type: multipart/mixed; boundary="===============6301318417788940449=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6301318417788940449==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bde76bfe85f4c0ed7e838c08d001c27a27469d9a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Codeberg has changed the way it generate hashes for at least some of
the generated tarballs (see [1]). Since we cannot update the hash
without changing the file name, we switch to Git download in order to
have a different file name.

[1]: https://codeberg.org/Codeberg/Community/issues/2861

Fixes:

  https://autobuild.buildroot.net/results/7e4e5d6f1ba4222306cd88944b39a75c730db771/

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gumbo-parser/gumbo-parser.hash | 2 +-
 package/gumbo-parser/gumbo-parser.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gumbo-parser/gumbo-parser.hash b/package/gumbo-parser/gumbo-parser.hash
index b8809d4db9..805cf01787 100644
--- a/package/gumbo-parser/gumbo-parser.hash
+++ b/package/gumbo-parser/gumbo-parser.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  dbdc159dc8e5c6f3f254e50bce689dd9e439064ff06c165d5653410a5714ab66  0.13.2.tar.gz
+sha256  bc17a7505d57e386df60ffc37208abbec1dcd6fc494040b75c6e0342b0bc75eb  gumbo-parser-0.13.2-git4.tar.gz
 
 # Hash for license files:
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  doc/COPYING
diff --git a/package/gumbo-parser/gumbo-parser.mk b/package/gumbo-parser/gumbo-parser.mk
index 6abd24415a..7e663fca8a 100644
--- a/package/gumbo-parser/gumbo-parser.mk
+++ b/package/gumbo-parser/gumbo-parser.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 GUMBO_PARSER_VERSION = 0.13.2
-GUMBO_PARSER_SITE = https://codeberg.org/gumbo-parser/gumbo-parser/archive
-GUMBO_PARSER_SOURCE = $(GUMBO_PARSER_VERSION).tar.gz
+GUMBO_PARSER_SITE = https://codeberg.org/gumbo-parser/gumbo-parser.git
+GUMBO_PARSER_SITE_METHOD = git
 GUMBO_PARSER_LICENSE = Apache-2.0
 GUMBO_PARSER_LICENSE_FILES = doc/COPYING
 GUMBO_PARSER_INSTALL_STAGING = YES

--===============6301318417788940449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6301318417788940449==--
