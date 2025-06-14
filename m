Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DB2C71135
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 13:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB9F160BC7;
	Sat, 14 Jun 2025 13:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tM6Q7esgq35G; Sat, 14 Jun 2025 13:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28F2760AFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28F2760AFF;
	Sat, 14 Jun 2025 13:41:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C28311A4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B426040572
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFKOIc__74D5 for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 13:41:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EED274059C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EED274059C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EED274059C
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:41:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ea.dip0.t-ipconnect.de [91.58.8.234])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C4445A4C0C64
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 15:41:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45492)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uQR8J-0000000008Z-0AHk
 for buildroot@buildroot.org; Sat, 14 Jun 2025 13:41:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Jun 2025 15:41:19 +0200
Message-Id: <20250614134119.678747-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749908479;
 bh=8LK/foPg5HaaTtw7BBcYF81SIJt+P+VA28DAI3HsoCw=;
 h=From:To:Subject:Date:From;
 b=dt4xPeMrXyLwo2O5AcvXCfOwG56dQ6o5gqtSDQmtR8rsSayngdzEtIDmNp5WEgrL0
 Zco/HsB5/k0i34W7eV0sBtDwYJCmKLO5F8IkeGu/nr1t9rVWEhF7+oyHv/EhBki0bm
 cOB6qsyoi+wf8QPTNbGjna1QsMJbCrXbfl/odxkZdiNi89thwFTDM1w6FgOuWtyDDw
 SwNnR8DZ16GDewYD9MLZ3zaaDOCkuKcVGuU2FXZPsdXSl9U48DhmsLYyFWn/oG0bUC
 ZgNFS2lFmg1E3dH2dx8rL2hhwsx4P9fXEXdsMrjMS6kfidKXBfPydTA4imN0IEnXUP
 fnXIb0BMZoIhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=dt4xPeMr
Subject: [Buildroot] [PATCH 1/1] package/dtv-scan-tables: bump version
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dtv-scan-tables/dtv-scan-tables.hash | 2 +-
 package/dtv-scan-tables/dtv-scan-tables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
index f110bb6dee..4c5d2b787e 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  a6ffaeec227c35d8afe79b9d7b7a2dd9d3367c33dc1c3d5d5729cebd4973ef48  dtv-scan-tables-7098bdd27548eaf3e5d9485fc68575f88e362daf-git4.tar.gz
+sha256  39d883bb4b1ae1397977903ef4d18edb083daa2202389bb62499cd8339c21b19  dtv-scan-tables-15661aabc342b72f539d4600ad87df6663e23aa4-git4.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index d9e6910abd..5ee12e8bfa 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTV_SCAN_TABLES_VERSION = 7098bdd27548eaf3e5d9485fc68575f88e362daf
+DTV_SCAN_TABLES_VERSION = 15661aabc342b72f539d4600ad87df6663e23aa4
 DTV_SCAN_TABLES_SITE = https://git.linuxtv.org/dtv-scan-tables.git
 DTV_SCAN_TABLES_SITE_METHOD = git
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
