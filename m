Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0428C71141
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 13:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F4E460B9E;
	Sat, 14 Jun 2025 13:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fg0Eoy9eriAJ; Sat, 14 Jun 2025 13:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7A5460AD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7A5460AD0;
	Sat, 14 Jun 2025 13:45:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ECADE1A4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D368040534
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QN2Ua5ArJiQz for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 13:45:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ECB1640443
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECB1640443
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECB1640443
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:45:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ea.dip0.t-ipconnect.de [91.58.8.234])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17C2AA4C0C64
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 15:45:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54250)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uQRCD-000000000qn-15zu
 for buildroot@buildroot.org; Sat, 14 Jun 2025 13:45:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Jun 2025 15:45:21 +0200
Message-Id: <20250614134521.683897-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749908722;
 bh=VeanvOxktOelGVQ08f04cgaqwNWGusUAEcK/z7vAx+s=;
 h=From:To:Subject:Date:From;
 b=AulvpNewlceDoGWhDwWffQ1F9FggTICkHkk0dsS9VrSvNmM07utrj20wCUGC8B1Or
 LYOJCYttGZFd9JXJkr5eZufXsvf6gHXlWcMM8FeN27IqCV0y5JAeZIZmCMvxHvzhhd
 oshZbXd6xuJCDmDeRM9Uj6400LEWZX3fWO6wws+iLJF8LKkhMNAaKzlqBL9vmupMfs
 Pgv0t8CwrFhrRST0+bgACzYxDheOD7to8zz5gK5LDg1IhXMp3g/SWBco0tc0lqYWw4
 hjOxbGuRkhOzY3kdyikrXw2VDHn9Yy0Cg0pQMuFh6/oexk/kgKNhQZBj/Id38gQmxb
 gmWsvr280RvTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=AulvpNew
Subject: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.22.3
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

Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index aa6676507a..8dc4e3c876 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  34759ca9c1b2486ecb7b6bc267c76a6f365d401b2b6de6d667e0a13ae30882a2  xmrig-6.22.2.tar.gz
+sha256  79bf51c11ad3670b8330ca1432c9cdaf84f82b96f94b636e33d253be2b916d20  xmrig-6.22.3.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index 75657407d7..97113ffe8b 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.22.2
+XMRIG_VERSION = 6.22.3
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
