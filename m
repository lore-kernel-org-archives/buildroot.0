Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E78C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53DE8819D1;
	Sun, 24 Mar 2024 14:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Jd5o83QsoRa; Sun, 24 Mar 2024 14:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61809819D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61809819D5;
	Sun, 24 Mar 2024 14:00:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 144C81BF5A2
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 010AE819D5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVmIEUbaPDT3 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:00:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBB84819D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBB84819D1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBB84819D1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:00:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 138CCA4C1123
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:00:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55096)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1roOP0-0000000054d-1mzX
 for buildroot@buildroot.org; Sun, 24 Mar 2024 14:00:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:00:46 +0100
Message-Id: <20240324140046.3289431-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1711288847;
 bh=w2ZcgoNnkn5OTrXVx9KSbQP4Z4frdoMOe8KBh2FKVqs=;
 h=From:To:Subject:Date:From;
 b=Un8QZJw5oDnM8jMYhEeKCfU5gqeNghZmtaVeryMORxK99/TLKf5wg7AQ6vnlCHFK2
 34uhPwLJH1N0Ve0aOaD2SOwBSk0pcAzSi4sN8lvotQRskjjFi9jd5kIJSmnsP0fmcR
 PvacPa/maL28hRBwwfW6NaBlxybIYpwxn0Ba66sBeXLwumBO5uijlypfjTzp6ff2Tq
 d7gpglqcWmPXPf8s54CrWua9LGx/cz7KBtLcwSF23o0nzfIiLP0KkaJlAaa0el9vzc
 95cZbcYPOzR2cH5n88GtGRNjcbT1h1pqnplQi1EVnlbu7cj6Qj30gccZLJ2j0utQTE
 L0+Lo3mT9WlWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=Un8QZJw5
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-plutotv: bump version
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
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
index 0c56c8b6b4..162905218c 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  11505556200029a48a293e97f94e0469a5f78580d0e56d5d0a1da05d61f0f5b5  kodi-pvr-plutotv-20.3.1a-Nexus.tar.gz
+sha256  7bccc0001acb796aa706f8a1bcce2661fcb67a7f346420c691ee0461ab5aace8  kodi-pvr-plutotv-20.3.2-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index fadb47efaf..8a47d8c265 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 20.3.1a-Nexus
+KODI_PVR_PLUTOTV_VERSION = 20.3.2-Nexus
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
