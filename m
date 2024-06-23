Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A73C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 16:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A529B60781;
	Sun, 23 Jun 2024 16:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7tY2zggMveq; Sun, 23 Jun 2024 16:59:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2628607A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2628607A4;
	Sun, 23 Jun 2024 16:59:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A15F1BF20F
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 16:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47FDE812CE
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 16:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ES3xQo-yDWo2 for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 16:59:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C486812C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C486812C3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C486812C3
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 16:59:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb81.dip0.t-ipconnect.de [84.161.187.129])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3FAC4A4C0D1B
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 18:59:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57974)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sLQYg-000000003pI-2bbc
 for buildroot@buildroot.org; Sun, 23 Jun 2024 16:59:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Jun 2024 18:59:18 +0200
Message-Id: <20240623165918.1727410-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719161959;
 bh=iip7D7kV2PhGmRdang4k6QouyMLjlTC5t/cmS4zwanI=;
 h=From:To:Subject:Date:From;
 b=bihmuo8Ettvxg4F7RHsYFyBwZSbGwkrPTN8uFA6sktY3zxUewkYeMIey0c3lAmaKT
 aL7xJjDP8MJx/v1z6p2oCNfISX58QvhJ/jWes7lvxvNCRk0VqlQE9d0XOvFaHVPmPZ
 U1BCZcY+oHVAVTov2YCFzZ7yPLwLUS2SKKbW2Mp3W3GIfybysXQUHaUe2Ftx9xSZWb
 OKsCNuCHhmkeHz5mo1ZzMRxFubx4h7gjfQdgnLgjRMEGm31oK100lNg4Q50UGqGJjx
 j+VYOYiyCjBAj3okdZB8lnTLwd6Hc3jhzMh0dlfgCDq81x9v4Di7yFCtrHkYx+6hiv
 S7wWerLBwTg1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=bihmuo8E
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-stalker: bump version to
 21.1.0-Omega
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
index 568a2b3824..fe5af447df 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d90b6b5595a820197d097da8ee6698bea786359cfe0bfaeabf4985dbc2af3064  kodi-pvr-stalker-21.0.1-Omega.tar.gz
+sha256  9e6fdf2d3654d267135bff45c94d72b4c82b10483dbb46600a8e0df4b0676746  kodi-pvr-stalker-21.1.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index ed04eefe9d..0714dd8d78 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_STALKER_VERSION = 21.0.1-Omega
+KODI_PVR_STALKER_VERSION = 21.1.0-Omega
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPL-2.0+
 KODI_PVR_STALKER_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
