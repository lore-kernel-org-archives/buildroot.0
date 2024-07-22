Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062EEC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 17:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCE29401C8;
	Mon, 22 Jul 2024 17:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKbfGSauF8Gp; Mon, 22 Jul 2024 17:49:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 847CC401D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 847CC401D1;
	Mon, 22 Jul 2024 17:49:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80E251BF2F7
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 17:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EA78810E2
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 17:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dcFboVUv459F for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 17:49:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8AA4A810EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AA4A810EA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AA4A810EA
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 17:49:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b57c.dip0.t-ipconnect.de [84.161.181.124])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C7837A4C0E49
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 19:48:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41534)
 by fli4l.lan.fli4l with esmtp (Exim 4.98-RC3)
 (envelope-from <bernd@kuhls.net>) id 1sVx9T-000000003oy-2lYn
 for buildroot@buildroot.org; Mon, 22 Jul 2024 17:48:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 19:48:46 +0200
Message-Id: <20240722174847.24596-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1721670528;
 bh=lsJaagnSCsm9JLoxUhrk1VUhSC26r4Jg6zQPXBVBbzw=;
 h=From:To:Subject:Date:From;
 b=vHgFERWWw0szCM7rG+P1vFFEyCmllY0IIupcwj7ibfaP7xbAb/cBvBZN6YjdUa1IK
 L4yUpMaVeBtQUqWRu6uu66nUY/jOUKU3Z9AtfeVqFWHJ0W8rpYrPK5X/AMeasdzk6o
 sXbGa2WuKq1gewaux7JVuGbkEMXclGmPI5pdgOhYI62SX8foH2XcYSipo/XXPKDlSx
 jNFoOeCQ1vPjz6E9HAsCsYJxdXrqJpQ7NfcSW1nhokT4f9VbZv+gvGrt1VTSRjxBrK
 6jMLM0V+yp9n6gjyPkl5xXHqhzhqnsXLTlZdQkJesKnccesPD8oTYGB59ZmNMVNbTV
 uVUyRLKZxtqYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=vHgFERWW
Subject: [Buildroot] [PATCH 1/2] package/kodi-pvr-stalker: bump version to
 21.1.1-Omega
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index fe5af447df..2bed6159ff 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9e6fdf2d3654d267135bff45c94d72b4c82b10483dbb46600a8e0df4b0676746  kodi-pvr-stalker-21.1.0-Omega.tar.gz
+sha256  61b76dd9917577fdf63078c552ae96b497167fd78e5524e056c77bbf3699634d  kodi-pvr-stalker-21.1.1-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index 0714dd8d78..9ae5ee9fe0 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_STALKER_VERSION = 21.1.0-Omega
+KODI_PVR_STALKER_VERSION = 21.1.1-Omega
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPL-2.0+
 KODI_PVR_STALKER_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
