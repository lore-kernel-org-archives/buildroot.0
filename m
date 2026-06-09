Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92F7CD8CAA
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 11:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44AA061C15;
	Tue,  9 Jun 2026 11:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f71Mh91XxiBe; Tue,  9 Jun 2026 11:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72F2561C70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781005406;
	bh=xSkGjI5kTceXALfKhx8dEBUWFnzwU9iXtUgV5RvvYgo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fi5NesqcJvQ64eDVKDrGREw0VNrCl0AVsFYMxZOdrm4cb6Phnm7yhS7U46Klhfmpo
	 B7rpjF/51nWUNY7pv0tbSAI18dTrlZzyNv79ixOiW9TH4xowPIhEqL9mcraCaNXjd6
	 aqN54zq10r56iUHArUtTGjHZJjX0+MsyLLc/kmdyfbUNvw9RIBeJV0aTfAlWq9SWkZ
	 vb264a7OohNmhmhZ1V4/07yr0oJqVyWK9bIbe6gvPhkD/4J1Cg74v9nBoG1aO2sVbL
	 jKq+gPwHv/Z+XSsxyqSg58zhFaIYrbGMOKXtlXw609U9uOZ/VEbxhEPfGwqZuUrNwQ
	 NjvYppHuy7prA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72F2561C70;
	Tue,  9 Jun 2026 11:43:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0D342C1
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 11:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6195424CD
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 11:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAdnmKOfu8yr for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 11:43:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B18784245F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B18784245F
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B18784245F
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 11:43:23 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 14829E00207;
 Tue,  9 Jun 2026 13:43:19 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Tue,  9 Jun 2026 13:42:40 +0200
Message-ID: <20260609114315.14060-1-fl@n621.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1781005399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2Yt92QMNN2Qz/1fBe7aJ9eySpnXMS6fHJLk+tmgQ9Ho=;
 b=NDcuROAfLm4bVQuRehBRjF3KP+bquR6Mi8XA0qhQSdy6kAHoj3af+DIr13p9hW9gUKedfo
 R9DPldsiEJiBPpKVTcngg+P15/sprrfB53o1Kj8GOJ7vwgcBG1xV1ep+LzNyBxMJi53/1h
 mUOsbr8AAVtd6hClksPCea7KlqHeUYQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=NDcuROAf
Subject: [Buildroot] [PATCH 1/1] package/sigsum-go: bump version to v0.14.1
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

Changelog:
https://git.glasklar.is/sigsum/core/sigsum-go/-/blob/v0.14.1/NEWS#L1-30

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/sigsum-go/sigsum-go.hash | 2 +-
 package/sigsum-go/sigsum-go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sigsum-go/sigsum-go.hash b/package/sigsum-go/sigsum-go.hash
index b032e1839d..4e3cbeb2d2 100644
--- a/package/sigsum-go/sigsum-go.hash
+++ b/package/sigsum-go/sigsum-go.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9056406413868fe68a3fcc6415dff5a0045b35baa2242a17fea7a697b1c68e3d  sigsum-go-v0.13.1-git4-go2.tar.gz
+sha256  01ff9b579012bd36715de96f5474c8bfe7778daf4cb04d3049004797fa6cb5e3  sigsum-go-v0.14.1-git4-go2.tar.gz
 sha256  6a1e3378dcd18baade08ac30ec4ba33b72d1b1697c00226ef85b9c9cefdb4e65  LICENSE
diff --git a/package/sigsum-go/sigsum-go.mk b/package/sigsum-go/sigsum-go.mk
index 4f01be56a5..cd99e786b7 100644
--- a/package/sigsum-go/sigsum-go.mk
+++ b/package/sigsum-go/sigsum-go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIGSUM_GO_VERSION = v0.13.1
+SIGSUM_GO_VERSION = v0.14.1
 SIGSUM_GO_SITE = https://git.glasklar.is/sigsum/core/sigsum-go
 SIGSUM_GO_SITE_METHOD = git
 SIGSUM_GO_LICENSE = BSD-2-Clause
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
