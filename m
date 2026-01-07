Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74242CFD65A
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 15:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2E48812BC;
	Wed,  7 Jan 2026 15:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4yS3EG50BJ3; Wed,  7 Jan 2026 15:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0181080A60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767801172;
	bh=g4tt7Cmf7jL0Uy+5gYGGWbZurK8eSVIDsiHGBUPPPnU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q2mmTiq9zdWZCeoTJVSOUSfF8Ocou55loA3oz7kOGof84vllMyhQO4t1iQXEsld/b
	 leCMC0Ex7/BsaYZvYQ7QFALS06KHDFLJtKp+5rIyV8OIw5DqKufEXp6U/PSgWrC3Nv
	 6SyWf5wfhyM0GWkqMQQfmKifdX0HvJNBIvvxSSKDjtWPWJEjZWqvXkx6flkx6p4bur
	 NZ7bzvC2H9ZHsIeJZjauRMc5eoA5sbQlJCDT80Hypu95xS94436zbrd50FZuDmNR7h
	 /pAZaSddxUOP0DAkF3sPk75ScAzcEp14iYk1kctyyPY7lBUMtPzo7ghi+tgrvEyKuI
	 P7/9SyoLDXCKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0181080A60;
	Wed,  7 Jan 2026 15:52:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E67BC2A3
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 15:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDC6940653
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 15:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2F6EHai-D25G for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 15:52:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F2069403E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2069403E0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2069403E0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 15:52:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A280D1814B9; Wed,  7 Jan 2026 16:52:46 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  7 Jan 2026 16:52:39 +0100
Message-ID: <20260107155242.143698-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1767801166; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=zRd3q1MXlmmkE3lC+ZPrptlFuWFR3X2jk/9xrHK0lQg=;
 b=O1eRz6EolU239TIlFoT7aRuZFUrEFX6kEnmOFyz6bwb8W/z2xR04CMoDcZ7VT4fUtmeZVH
 v30jycMiNbEGfbrsEufjFy3/AsTIQ6SxqmBg31RUHLgdpypy9s7P5c7kutWmcCIPPvN3Et
 ZIV4EaRCKPp9eauU33DG0ujkaQEGvtc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=O1eRz6Eo
Subject: [Buildroot] [PATCH] package/catch2: bump to version 3.12.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/catchorg/Catch2/releases

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index 291f9deeb0..1cf29821c9 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  82fa1cb59dc28bab220935923f7469b997b259eb192fb9355db62da03c2a3137  catch2-3.11.0.tar.gz
+sha256  e077079f214afc99fee940d91c14cf1a8c1d378212226bb9f50efff75fe07b23  catch2-3.12.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index 6118fd86bd..d3da027d2b 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.11.0
+CATCH2_VERSION = 3.12.0
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
