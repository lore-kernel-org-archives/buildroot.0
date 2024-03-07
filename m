Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD75C54798
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 20:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE98981FDF;
	Thu,  7 Mar 2024 20:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbQxy3UhEEeh; Thu,  7 Mar 2024 20:10:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFDAA82031
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFDAA82031;
	Thu,  7 Mar 2024 20:10:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F3AF1BF4E5
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 20:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4808E41A04
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 20:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hH1BUdU7X5d6 for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 20:10:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 49ADB41999
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49ADB41999
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49ADB41999
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 20:10:45 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id iK4grKjekHsqHiK4hr6NHf; Thu, 07 Mar 2024 21:10:43 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 21:10:42 +0100
Message-Id: <20240307201042.2415494-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOQlVPZPEEivgoYGhgwQhwN74DG+8rC3mnEVQzryzpU49mhc1t9WTUJ/N0NfcfTu+W6lcP6NRjnuH6GrgZTRKUz8RzgP+gktpEcbpLde72Qayl8EuBqA
 HoFhj3rzalSOUaFhZUipVJb4VTxN44gWKYhqvwjz1QgQx+KGyPByOtPjGzdmlvrRCao6GmGgk6lkPRKK9+KgPXzEHD8OZFGrAaAlqp6YDflYXtkiIhh081v2
 m7ho6W4AY5zir7nwNLaexOSKg6vnanHoo1yQMVLUUCo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1709842243; bh=mqksLsDeoh7WcEpMZCnFf1op1wGh9kjYxdDVjQ4ycTk=;
 h=From:To:Subject:Date:MIME-Version;
 b=IfPTdYh1ToFA7rhSWxfS4Db0DzkbyNJlr0qzKMsDRwaJL48gvSZ/aopVivKuXEdac
 yfQOH9HK36C1LxMdpJB0nLOJwEyGAI0rlWcSqVe4v33NbWPIu4wYeILTD4dTShIxUP
 P003+BgmdSOIYd4MVtmXOQ+iiffw3A65YqhxEeOm/EHkMSDyo/JyLdf8KODCBF/g+e
 2jxJYschlDCgqqWHLTRAs3arSnWAca4//6xyGY7MMbZ+bkCk7/Vv7mqGAKSUkOmnK9
 oP2epypAZenwEamQHYzWAIomoDWapjUe8TyYVFe9/Vn5/ZyNEtCj6biFp0lPVIPxaL
 RvICopgW0nudQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=IfPTdYh1
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.7.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index df92ff36b8..531432aaaf 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.7/sha256sums.asc
-sha256  94003a00cd5a81944f45e8dc529e0cfd2a6ff629bd2cd21cf5e574e465daf795  cryptsetup-2.7.0.tar.xz
+sha256  da5d1419e2a86e01aa32fd79582cd54d208857cb541bca2fd426a5ff1aaabbc3  cryptsetup-2.7.1.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index d17de96143..b15f458576 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.7
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).1
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
