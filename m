Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1453710706EA
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 17:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD8986084C;
	Sat, 14 Mar 2026 17:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMtaLUACZGkH; Sat, 14 Mar 2026 17:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AD3060842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773507886;
	bh=UUE5DOmtEG+/84XZjmlqgPyA0w4igdcj/okV1texXag=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EOdfryF30X+rqEDyTT5LAFZtNLtK9B7yMubU2xtkAMmtyJPTswNYf33oN9TYfMevV
	 V3jbqNg9i1pG/3XhETYleSJfaYij4noSnnyPUacioef2RHQQo7DX5Gm+vB1abyHjvN
	 NnFOyBHUu6esWggAlZzD6mxK6MXkq1GKXZhjFL4qzG1OIhPrE7WJuAct0Gf8XPdp8C
	 xYOxYp60Jt/NF3GGl+vF/96gkPsIX3dln7YOl+uCoYry86tV3Tmn/GJr4LIhM/kD1M
	 NJNcdLBjHePvE9nRUh3gAGGvBH8f6Rork+Fqi/bwhBTxL5XXBSWAp+/MXQQFT9IhOx
	 bRQAt9QgTqzLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AD3060842;
	Sat, 14 Mar 2026 17:04:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC0CD201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 17:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E350A40CBA
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 17:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z38pOpJ6ppOx for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 17:04:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8977440CAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8977440CAD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8977440CAD
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 17:04:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4ED4A4C0E21;
 Sat, 14 Mar 2026 18:04:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48522)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1SPp-000000001m7-1kGN;
 Sat, 14 Mar 2026 17:04:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>
Date: Sat, 14 Mar 2026 18:04:41 +0100
Message-ID: <20260314170441.3059259-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773507881;
 bh=Z6LrhXa9z8+/y7WgRoruvR6L1aC4O3pDt5mGGGqu0XE=;
 h=From:To:Cc:Subject:Date:From;
 b=Cq0iTtjrZfoeiHxBALLy9OqDpiczStQGhGDLoMQy9mCNO6YwghlS5RziR7h+r3BhY
 qz8/V1Q+LtKVh7H6qIZ7n22s7vETXbtt65Owh6fRf7TnIAeg52+8zoV/H4m9QYAa79
 W0OovboJ45WdnVjHEH//YskGKr+wZTzjtPJnmNxFBv+NEQvPpdmjOJYaga+P2WEe57
 5kuXWzfyoWUfVcRGAvqcUAMoUIVXlPOqUPtpsxEIlD3Y3TPqqx9GGqKziGCeI5jx7/
 YbC+nu9guQ3RCbpab8dHOYNFDhM9dEKe8/xxmGP24RngGjqWuYbhW/tJdTd7xKnGFY
 6zIPN8HK4xN8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Cq0iTtjr
Subject: [Buildroot] [PATCH 1/1] package/dtbocfg: bump version to 0.1.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/ikwzm/dtbocfg/compare/v0.1.0...v0.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dtbocfg/dtbocfg.hash | 2 +-
 package/dtbocfg/dtbocfg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtbocfg/dtbocfg.hash b/package/dtbocfg/dtbocfg.hash
index df1817f7aa..dd943c9e3c 100644
--- a/package/dtbocfg/dtbocfg.hash
+++ b/package/dtbocfg/dtbocfg.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f1667de4250b744bb4a11dfc5f85d8b1f960da7d396c9f230f5b4d12224f524f  dtbocfg-0.1.0.tar.gz
+sha256  74624c17a37f3178623bafb476339d357ae517c1fd4cbfe9175540c8b2638ac8  dtbocfg-0.1.1.tar.gz
 sha256  e57cb9f2ed607cd95bf1b64371325c505c1ac8fe640a8c9933e7fe7637a38567  LICENSE
diff --git a/package/dtbocfg/dtbocfg.mk b/package/dtbocfg/dtbocfg.mk
index df5f692bc1..6231e850c7 100644
--- a/package/dtbocfg/dtbocfg.mk
+++ b/package/dtbocfg/dtbocfg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTBOCFG_VERSION = 0.1.0
+DTBOCFG_VERSION = 0.1.1
 DTBOCFG_SITE = $(call github,ikwzm,dtbocfg,v$(DTBOCFG_VERSION))
 DTBOCFG_LICENSE = BSD-2-Clause
 DTBOCFG_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
