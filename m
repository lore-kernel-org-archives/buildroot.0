Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61204D5B845
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28E0C6002E;
	Mon, 28 Oct 2024 22:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQXcmDzd9ltq; Mon, 28 Oct 2024 22:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30ECE6059D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30ECE6059D;
	Mon, 28 Oct 2024 22:45:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1CBB112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92D37810EC
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZx2PGT3zO3R for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:45:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C697480C36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C697480C36
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C697480C36
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:45:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E6D19A4C113A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 23:45:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50090)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t5YUj-000000007rg-0vi1
 for buildroot@buildroot.org; Mon, 28 Oct 2024 22:45:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 23:45:53 +0100
Message-Id: <20241028224553.2468987-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730155553;
 bh=5P7wQfOdyxSG16y9axECOtIf7jXVp3i9VBvW3GsXof8=;
 h=From:To:Subject:Date:From;
 b=dlZvMX2PH6xsNhalHzhDQnQBb7pEldZBU+m5R5OxtIdBtLBTHOCNx8dE0c/6lsYXT
 QY06pwkdc55f7I/30okhzKXwM0XHZCa+V32TsuLion21KE9T/wnScL6X5en1nke9b8
 J7wGIVekcK7wCNc4F2JsTUtXVdzkSm6+EUQVRCAt7ofGT2c3VwRLXkYjnp5lbbEVUR
 rxLXQL9XqiDNl6dp3DqQlCHvtYj03O0CIq+RJhkWfl49G/aVxTVsk1NXegVkbZPMfX
 YF5K720f+2gmve3ydzyq385smqae93AbgRVcjQOjhTTgZNW2OzgQdCxEDmnJkzynCB
 c1xGqHB2y4axQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=dlZvMX2P
Subject: [Buildroot] [PATCH 1/1] package/kodi-screensaver-asteroids: bump
 version
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
 .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash  | 2 +-
 .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index a65f11402a..21e1617412 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7644f9ad16e0f2ae9b4796cdc5cdd92761e835b5edb4f114311d2578c0aeffe6  kodi-screensaver-asteroids-9f761cb7d5842e61da9c608c9f58067bcb986d89.tar.gz
+sha256  41c20f2fec17b60a3baa98edff80ba01053a80ada0ffd056459c2f4ae6588867  kodi-screensaver-asteroids-9cdcb84a4464fee5ae4b6ab3b300e6a3824ec084.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index f96eb4e830..53c71f73d2 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = 9f761cb7d5842e61da9c608c9f58067bcb986d89
+KODI_SCREENSAVER_ASTEROIDS_VERSION = 9cdcb84a4464fee5ae4b6ab3b300e6a3824ec084
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,xbmc,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
