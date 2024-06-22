Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CC9C2BB85
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 08:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C1E04052B;
	Sat, 22 Jun 2024 08:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOzBz9Jd40hq; Sat, 22 Jun 2024 08:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15AA64055E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15AA64055E;
	Sat, 22 Jun 2024 08:40:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 468CE1BF616
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 347BF6067D
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqR6SV8NAXWV for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 08:40:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F1A16063D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F1A16063D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F1A16063D
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 08:40:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf60.dip0.t-ipconnect.de [79.214.207.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 36512A4C0D1B;
 Sat, 22 Jun 2024 10:39:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40940)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sKwHN-000000001A7-2Av3;
 Sat, 22 Jun 2024 08:39:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 10:39:22 +0200
Message-Id: <20240622083925.10149-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240622083925.10149-1-bernd@kuhls.net>
References: <20240622083925.10149-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719045566;
 bh=OPeVwzP9JDLCadY/cTUpOS54A0+BGZtIf/aBiDmSDXI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TWMdN7E7BQCe1mTYB9CrdQ0959hMdzZaLgK9ldScGZFR5TxYfn08Xgh0R7qBrbUtW
 qp6nFHxPaQODDE0o4i7tXp/p6FHIYmZxKVzANvzDxryZgqq40hdkoDQH0Hj8ifDaIl
 o+S7c3qLaWlRznUg93uPtP3PaYCQvKAoKMcmh3byyMkapSP9Il/31knCmI/a21Z6le
 nnnOX0TeW168s5a2ROMYn+tPbBwNtEYL5P3TDkodENJMMoSmy/T4OrYIJX4lf0Fm1B
 GjWdggTQwMfvjOlhA9Se50MBzqRTouuiwrAPmsuxKykaIuL9ZgAeVTdolzjY8jwXNY
 1MiYuWWQfDjkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=TWMdN7E7
Subject: [Buildroot] [PATCH 3/6] package/kodi-pvr-hts: bump version to
 21.2.4-Omega
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 27aa9a0729..3c9f7d87b3 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3bb04e48e9eca97fbd72b6285b110f3bebbd842ee7017423aa446259763e0d0b  kodi-pvr-hts-21.2.3-Omega.tar.gz
+sha256  5c8dd796735d5af7dddfc6fe56c8b2d8268fd43be50098f60b8fa537ff02956d  kodi-pvr-hts-21.2.4-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index e1531fa1df..7f73c0565e 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 21.2.3-Omega
+KODI_PVR_HTS_VERSION = 21.2.4-Omega
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
