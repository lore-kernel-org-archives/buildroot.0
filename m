Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6181CA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A946040B78;
	Fri,  2 Oct 2026 19:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oM4J01-b5xON; Fri,  2 Oct 2026 19:35:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CB0FF40DC6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969721;
	b=oGn4Yoo5boB1AwVWfsVqysHS3X7QN/g8lIo2QQ3frxEuRT14imF5EgPn2dviv9NKj6Ln
	 nfpq2f7Oz84jsPSnkjYK5kInEtn/EIDm/ArghP2A2zk+BtuWzIDrurYQw7WYxBAPxClqb
	 m+GqcDim//c4ZAGHQJUiLWPxc2KbrIhw/JDcRA9JFn9mIks1C5IeGNxHUlKD41sPIq14l
	 Z0P6JmujiyvCFnt6w7GYcZHSBlm9M0bSGZxt1sk7EdWAQ6QNy6bnd2Aet6WPzKQXs8RD3
	 6I2A3fk1qEjLJZ88dtwxDYOOVzIlfL4kGPJsojyeEm7U4bhfAI0tF/k1a930XXA6s/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969721;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=L55njQhnFLQSz4HSONTI22NaDlngfDxN7/8s2d90chk=;
	b=IfLc2gFyx8594NS3B5qPkn+FC0UIKgyvkwjNlq05DkKEET226fmOxOTN+wN84Ph4dpIu
	 GTFPuzmX5PeAjdOlRatDN/8MCrX9O3fFZCqkIZu67hwnH9Wk/sGdK1rlvsJDoLVchvZUI
	 3bKF+gIT1y66d8tRod6zty4yN/OB/KoBmvz7gFsSGnFDjYDXmKSlYyMrx4FPYuWQsXmNh
	 TZrJoBXyE7M359tlPqcFQ+XoQ12d2QQ2zlv8oBpBzWe9EAYuML9bVZiiHoCLUaPvYxx1m
	 E9L37YzHbBDR1vkNljEFqgG9+brHoMjrRXdDNHNtFddppNmGQnDV8hDPg/pgH6vkrug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969721;
	bh=L55njQhnFLQSz4HSONTI22NaDlngfDxN7/8s2d90chk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ih6ytb4jWdebfe3iP4er4JvayY8CGqyn4vvskWuMF0ZqcNq491jm8n8Rxai2FTlW4
	 dmHNBzEjeVLUZk1c8BWVv9FOdr+pw5exwYJfOabbVWiizuwID/d6P9VJT6QjV9HPCl
	 SGlsDctiWdboek40UP4Y24qHMMz0qJ8w6tr9UUdtvVGFtVpFlPwACLC8F/1FTwYg9w
	 N2phNVbgvHsjKE2CWdUojNZ7J5rWCMu4XFR/QOcIcbE4AqxFVLSlrgxPhOFf5dc8OP
	 GY42fmz1xtglRH0e8NP3X3h2ZSj7yfY8ZktIFhOX2HFSiir6mbMqKQWooVttLHnFU4
	 2V26rKaooL/IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB0FF40DC6;
	Fri,  2 Oct 2026 19:35:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 241BB1D2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15D098133E
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEMovjLT8I1l for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:35:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4D3FF810DD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969718;
 b=aW3KA++KWxrR8swHhFLI94hCTgNxK8FKhgmHOAO6QMMkTwrc0SmEo9OLGX80NZ0RcjCg
 5aactj8b0H6a9FoEtBXtNMqbIr5flp6Lw5wuj8QRnKaCX9LkCpUzIhvOmid1ZEL19JUwu
 pciM/7l0P/NuClRuAMgmr0HWJeGD7U8MxExAVEW88EVTAYNA2noNDTQfZJd2oTEn7GFtt
 DALYcj062yRPRSgdrIdKSg+bID9nC2cYzNHR03rh0A+AKDs9iKxupjt3lC01P8lkCanZt
 yoOOMER5mikz9kEIEozym2IW7GALMWwSRRk60GzWi+MWOqBDuF1WbbFRbiSNsSyxIGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969718;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3iJ8NQ775FFaXf7DFKoFp5X9GpNTN4USJz8TLukdT6Y=;
 b=in0slL355cNZbx/2Zi65eayZwbDmT0JlBTEluIIsWBDjjer+UHmhXYl4tz3i73wfrCd/
 MI/odUWcDsUynFEtRDvmHMXKQtZZoSpqwnhYsF2f6RN35G6wPDSFJrRuXeeqfGLlWo0nv
 a+lFXpi3WDkcfBMNauNABlm2Z8GIUtJWaHNd2OboBsu7ohqbqyCxphEsOhPxvpr4Oseu3
 MTk21CelbZ550IptuzDV3tWggsnahMojSRW+3shy1jjvUPLOCWJ99kr17l+U542BHASTt
 duRqoooCwOFruEy38uSkEYRRVap/RjmptDFkgienEovKGD0PSxGe1OGHAWuq7FA9yGQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D3FF810DD
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:35:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E679C886C2; Fri,  2 Oct 2026 19:34:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 21:33:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a5c80cd9ac03f050e818babe28a250793574327
X-Git-Newrev: fe21a5fe307239c842f5a095fe4f8e53c5c3e352
X-Patchwork-Hint: ignore
Message-Id: <20261002193403.E679C886C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gzip: bump version to 1.15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fe21a5fe307239c842f5a095fe4f8e53c5c3e352
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- bump version to 1.15 (for details see [1] and [2])

[1] https://cgit.git.savannah.gnu.org/cgit/gzip.git/tree/NEWS?id=e6263160768c73f6117f3c1de78291a60f2cb796
[2] https://lists.gnu.org/r/bug-gzip/2026-09/msg00030.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gzip/gzip.hash | 4 ++--
 package/gzip/gzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
index 90c9be4e6e..ddf5e38f0f 100644
--- a/package/gzip/gzip.hash
+++ b/package/gzip/gzip.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gzip/gzip-1.14.tar.xz.sig
+# https://ftp.gnu.org/gnu/gzip/gzip-1.15.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  01a7b881bd220bfdf615f97b8718f80bdfd3f6add385b993dcf6efd14e8c0ac6  gzip-1.14.tar.xz
+sha256  9aa0cc780dec156b8282844833b342ab7cb08c25d2cd9a1869cdd0df31deff48  gzip-1.15.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index e79de4c99e..1c74089147 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.14
+GZIP_VERSION = 1.15
 GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 # Some other tools expect it to be in /bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
