Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC77CAC583
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B5AB60747;
	Tue,  9 Sep 2025 17:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CIEN_V_a7YK; Tue,  9 Sep 2025 17:15:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 581B660721
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 581B660721;
	Tue,  9 Sep 2025 17:15:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E4921A9
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 17:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6805183B9F
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 17:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ly8Y1u9NfnA4 for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 17:15:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BB2083774
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BB2083774
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BB2083774
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 17:15:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b0bb.dip0.t-ipconnect.de [84.161.176.187])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7C284A4C2E6B
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 19:15:16 +0200 (CEST)
Received: from [192.168.1.144] (port=59460 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uw1w3-000000002yQ-3quk
 for buildroot@buildroot.org; Tue, 09 Sep 2025 17:15:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Sep 2025 19:15:16 +0200
Message-ID: <20250909171516.848091-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1757438116;
 bh=+OznlVr76cv4L5lC7oTkknekaPJPk+DPZFSWe10YxbI=;
 h=From:To:Subject:Date:From;
 b=JvEvbB3z2YOXs34d7RWUq29vF4sIAyXFdLokhw/x0A/7Tbiu0gaw1IAdPgHFA1cL4
 JZRO2auYJkAHlyAeokDMw5wi3itv5VNgvL4EQjVA5sD65qbsPGYWq93k2kt8TvSWDq
 1biXiUUh39Z/vsVvjIFezAXoBpegat0txIZBAtYvJn3UnMP7r03arfbjoTmTqiUMmh
 SZQWDoB1N+7dRHfKRWn8kYkWJU44FgARma09Jr27Btnj6XN7CC9U/py+8RnPYtqkN8
 sgrp6puCRwejudxy/FcACjt+sBBybzNeZrWb+8/3YR0egZCELT5vRsvCtOzHXTD/6A
 ijuSOyuUZWeBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=JvEvbB3z
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-hdhomerun: bump version to
 21.0.4-Omega
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
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash | 2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index 40eda0e280..88bd915f1d 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0030e1d8a82d6fd5906dab45e2f4817fcdf9abcc13b3ae2fe2031e557a8bee91  kodi-pvr-hdhomerun-21.0.2-Omega.tar.gz
+sha256  3033a3bdb8ac4cc5fdb1a85ec9ac8307a37dfa894472283ac589ae8c1f339dc7  kodi-pvr-hdhomerun-21.0.4-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index 190c5e3663..1d3338d5f7 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HDHOMERUN_VERSION = 21.0.2-Omega
+KODI_PVR_HDHOMERUN_VERSION = 21.0.4-Omega
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
