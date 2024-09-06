Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BECE6FE49
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 21:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACC1E40513;
	Fri,  6 Sep 2024 21:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgRR4ISuPYsm; Fri,  6 Sep 2024 21:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74629404BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74629404BE;
	Fri,  6 Sep 2024 21:57:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 154F11BF37A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 21:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0319960646
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 21:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qk40rN2BgTZX for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 21:56:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 44F6D60638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44F6D60638
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44F6D60638
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 21:56:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc3e.dip0.t-ipconnect.de [79.214.204.62])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 240CAA4C0319
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 23:56:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37300)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1smgwR-000000005uG-3QvK
 for buildroot@buildroot.org; Fri, 06 Sep 2024 21:56:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 23:56:29 +0200
Message-Id: <20240906215631.1737953-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1725659792;
 bh=UaNzU6sIRyUG+9bgomONyPtu7K3na7AzN9tYPvJxnvQ=;
 h=From:To:Subject:Date:From;
 b=a0Zne4j1W6bAOKQI+VW9oqh25dpA3Wspt/onglAGv6j6CsJGOuWaTwAtTitfuifF2
 yWr1SIkvT/kCMu9GnE+jIxKH1GDggC9DGvYaiHYuarmQUHKPZcU2AyiihfbfaKMFH6
 YF2X6zp+lhUx/BYV7llCYp3TWp+MAYNpgT5x6QoQSYbtOzR/IcPtA69sJ5cj48hW0A
 Ce2VMTE0nLDnu5A8I5wnBdZPAIbdEi8plt2sRx2Nq5+ZBAZXG1idsp/QY1xmsGtSFA
 bhE9P3Q9TKHFyfPfIrl9HsxOBhzXlMVPzV0Ly3cKyYXEjzvhrX/SDAEGnyOk1XS1ut
 u5Pj0GcczwNZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=a0Zne4j1
Subject: [Buildroot] [PATCH 1/3] package/kodi-peripheral-xarcade: bump
 version to 21.0.1-Omega
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
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index 5e960f2f46..3ead10c479 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  56f5e976c53f6911ce4179126807da82d8fec1ead092c2add1d97e48e3468d8a  kodi-peripheral-xarcade-21.0.0-Omega.tar.gz
+sha256  50e363e3bc02a1e0585294b08f920e077af5290203cd76aae02ac363ee98f3e5  kodi-peripheral-xarcade-21.0.1-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
index 3c89f0bb79..f3364e3520 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_XARCADE_VERSION = 21.0.0-Omega
+KODI_PERIPHERAL_XARCADE_VERSION = 21.0.1-Omega
 KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
 KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_XARCADE_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
