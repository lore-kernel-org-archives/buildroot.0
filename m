Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1204CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 14:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 595AB4097B;
	Sat, 10 Oct 2026 14:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRU418WJjyzX; Sat, 10 Oct 2026 14:29:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6282E40978
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791642568;
	b=aR/Dt90qGpkiaXo92PWiJBbo3ySZnryV6BDHq1Wv/n4Y04JQ5/EML+PgrA+GCksc/yoR
	 UHVGAlhfNPyPKUvzfhqJExi5HO6ukTweUYwQYkSxjVjN99qjAstIFsISvv6sy7BnDTe5Z
	 T87TFO0GFT6yPUlxhY3LTWX11/BPvKHQi3siQZFdpdOjJqHTmpABziGQR8k8mKuUD/naX
	 EVPoVds3YljfV33LJ6/cqSYgPBrwrqivfv6Ei+dyclZ+H4fJ6Ie/dSDih8yjbTdpUaW7s
	 3sP/s/LEjvn411B2bvRz45yxsUN0KNlEJkEbmoH8kDS74Qkkb75j99U9ZC1RYzoiRmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791642568;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=c98W0l1nDPDsgnLYv1axThUVpz8D1z4DxzxXGI9IET8=;
	b=BWq73OPywPsPmetvGozlZjU5etBZfsdYYJNPKDEo2diKO9r460YJmMKmr9347TpKYmo+
	 VOI5qZOBwK2lKjF3ZtYrCFevUex+2vUans7YOXEk9ohEqadbIVSk3/R/pF6yiYZ/msPw+
	 FTWHYYpHnaMTT6MUemljMx9H1cybrAndGtM3lqKjnGmaP0SVetRmedKSAdwpzyu7jqTgd
	 /l7IL/BmfFmL1dY76wsX2+1+atUBHhSIt7JkXY7fQZynqPTR2iqpbBOGaepo+L/17+BO7
	 /7spdJG2hHHs5HUF0ByNGKrNN5uxWM0GKfwNqRbo8PxIDY9tQfm/7aTxL9z8z2zCbCg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791642568;
	bh=c98W0l1nDPDsgnLYv1axThUVpz8D1z4DxzxXGI9IET8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JH/pz5ZTtaW6Sfhu1WOj/v3qr57AWLX/+VvGXc2OQt59DDHQVU9a79kaGiWFG+Xj4
	 QaXR70O4XXizovjCZFqaU7pxGNh2gruyJJUsTWJq84RMhvgdQOdWnJ0PcamI1z8+2g
	 KEbV3pJ/hL9Iv7ddU7BEuzTWOYlEjpQqHXIt7TOZuBhwxUdThJr65stUAUstpqm59m
	 1x2KKhlurlOUNfvL0eI3domXfOLqzSzAlJYs5wiSNJ2moOcYwdpxaf7/ldr5vDkIrX
	 RBZ/KjhW8BSJQhb9DAirRvEdRjHpPRSdXSIfxmosLEp7YCLApUO7J8sxmHPRQzvgVP
	 nddycrvTfvisw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6282E40978;
	Sat, 10 Oct 2026 14:29:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED0E79D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7740E40071
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ut60XkCzkFF1 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 14:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0433A40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791642559;
 b=kU/1xOpVSoi4nPuNBYUTSYaV++UOpvNsf/eAfvlYk8FmoWc8cfpit2fumPMlTAbUIRki
 K6dX2YxoJC6YRimwxdZt/3uOikSciQa1n85Qge9VGZbG7rTIbHC7B24GvzVJe4/9pwOve
 dGCzDHKFU19G//c72AwZwR3Po1J33YygW1H6MWMCHcbsGHBVKHyR+ePbe4IEZU2gfpSHe
 VZA5d2oQJ/nLtS+sj7B4qJ4c4XuU3F1LlMBdidxA22tkamWleExp0o81U0ajT6/eCHKqL
 AYKdE66z7Z0uy863Xu3Yn4hPki9mFNGEUF1hQnIIjZuHmSKY33/IoDEeuXFM+OS/l5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791642559;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jvFEfiI+c0A9LyIGs6Wdqq8DSICIAvxj3JOBSO6A/gU=;
 b=hfGeSlboWNUQ6Sfu4i6iuday9UgTyESFKIXf+5UWL7e3YHNLha1DEVmbdg+3L24PB1zq
 qCTSGbCWxQ+TDxWX7lqFeUwLxucuJf1gGNoav84afMVzorlEe6KmziPowmaXx9AMQeQmN
 8163KZ7huvyGFueFuCy7Rt3+cbn42XYTfrsvusNrJ5w36OkfY7tzUnBAHdhUo4xleu0Vo
 VMQuhvXq2Qfd0vbZjnmBR7BlhhpWws2Si10aLORvr5AT8hGyJJCtpAsUEDX1yuj9fn6ao
 5NZ5OoLeIAG73RSlxTUuxNCYsxgSSJNQyCQ6T9DX89ET4BgOiqKWVgbVkJs2ymUTJ2w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0433A40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6FF39208B; Sat, 10 Oct 2026 14:28:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 16:28:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c12e9327c7c0f6ff86557eee40e854d8034aac2
X-Git-Newrev: 290cafef07c7c9421608d4b6df2df5124c11127b
X-Patchwork-Hint: ignore
Message-Id: <20261010142800.B6FF39208B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlitecpp: bump to version 3.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/290cafef07c7c9421608d4b6df2df5124c11127b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- licenses hash changed due to updated year

changelog:
https://github.com/SRombauts/SQLiteCpp/releases/tag/3.4.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sqlitecpp/sqlitecpp.hash | 4 ++--
 package/sqlitecpp/sqlitecpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlitecpp/sqlitecpp.hash b/package/sqlitecpp/sqlitecpp.hash
index 960d9bfb21..c9de5048e5 100644
--- a/package/sqlitecpp/sqlitecpp.hash
+++ b/package/sqlitecpp/sqlitecpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  33bd4372d83bc43117928ee842be64d05e7807f511b5195f85d30015cad9cac6  sqlitecpp-3.3.3.tar.gz
-sha256  a16149966042207bfc968dd1081403d43a37a6264fe31c7b1a7960dbb0e716b9  LICENSE.txt
+sha256  9910ad8bc0a821856bd6d9fa7cb0b457883108f2b803700256b451077ed6dc05  sqlitecpp-3.4.0.tar.gz
+sha256  00f43691f376cc7abdab1f9d72ba9d1a92846b481d2df5ffa1c345108b28048c  LICENSE.txt
diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
index 418860fc6d..9c136ed69e 100644
--- a/package/sqlitecpp/sqlitecpp.mk
+++ b/package/sqlitecpp/sqlitecpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITECPP_VERSION = 3.3.3
+SQLITECPP_VERSION = 3.4.0
 SQLITECPP_SITE = $(call github,SRombauts,SQLiteCpp,$(SQLITECPP_VERSION))
 SQLITECPP_LICENSE = MIT
 SQLITECPP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
