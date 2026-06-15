Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B99CD98DE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 08:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8282582BE5;
	Mon, 15 Jun 2026 08:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGRDFeu1HT78; Mon, 15 Jun 2026 08:37:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E4CB82BF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781512643;
	bh=zkO3xPkUMptHY4VpHAB350OZmk+D4CH5KBXMlvqdIhU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XVK+p1SrLQeVW41viXO12qwXNGRwdGrFRyp50+OgZRachzMq5fz73CWB1sVNRhi+T
	 VXX84mxt+ujkZQhqEcpTg8FqQfAd/AL5zmttQ7jViTW0+pJ4GRSBIGVWGA+uUhDanf
	 anBaXkg4l4ZFWmEb+q6z0WZSEZOKYKQPeNEV3/PcmifWrP8H6nKszJ79neq555lND0
	 BxGpSeyokreLWXND9QOof2LMotgMWFGFPJXcIpIzdZaD7iQgBT00chleuBJcEAggaE
	 OEj07DLrFfaN1H0TsGytsqYyzIK7kgB8I6m9cU/WMFfM6C6GnJtyFR19dt1VWg7hHR
	 K+D221M3CVfhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E4CB82BF4;
	Mon, 15 Jun 2026 08:37:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54EA6DE
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 08:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4641740E30
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 08:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkd7C98gHNmd for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 08:37:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CB4840C8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB4840C8A
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CB4840C8A
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 08:37:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 130841814BE; Mon, 15 Jun 2026 10:37:15 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 10:37:07 +0200
Message-ID: <20260615083710.865467-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1781512637; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=vrvudAX7Y/mhDyceZL122+zjstiJn4BCx5r/DToP/Aw=;
 b=cwfu+S6F0X+anFMHVFnCoKo0k5cwru5XZf/jG46JuKY+QSHAjFC9fIxEOwKMJX5zPuFryA
 tyGREG4PU374BHoyQEoQCIFQ6DBJQCisUsNilkioU6Bl7XvPJDKNhYckwVsw2G5dXAVWZK
 k/f7HVIhTLNLbC5s7NTx7TFC8w8Ua7g=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=cwfu+S6F
Subject: [Buildroot] [PATCH] package/catch2: bump to version 3.15.1
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

Changelog:
https://github.com/catchorg/Catch2/releases/tag/v3.15.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index 31f83a140e..0c205fa30b 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9650c55e497759cc39b977e45524bc8acb15256061c112080916ab6cb0b1ea66  catch2-3.15.0.tar.gz
+sha256  be23a52b85cf04cd9587612147a10b023d59ed9757fa1843cc99e615d6c0893c  catch2-3.15.1.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index 4c08cb4192..f62eda71f6 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.15.0
+CATCH2_VERSION = 3.15.1
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
