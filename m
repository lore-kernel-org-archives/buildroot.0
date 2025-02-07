Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78371C02199
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 16:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4323D84A09;
	Fri,  7 Feb 2025 16:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxFO5maPIHx5; Fri,  7 Feb 2025 16:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9DD9849D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9DD9849D7;
	Fri,  7 Feb 2025 16:02:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C9B0CF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 16:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CDDB849D7
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 16:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NaIQDbqMDFgh for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 16:02:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 794CD80BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 794CD80BB3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 794CD80BB3
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 16:02:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C2D8DA4C3DB2
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:02:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54846)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tgQoS-000000003zp-4BFM
 for buildroot@buildroot.org; Fri, 07 Feb 2025 16:02:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  7 Feb 2025 17:02:40 +0100
Message-Id: <20250207160241.10112-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738944166;
 bh=2H4gfE3xKni+yY6izpVleUmUi3rT18dWfkB19XyDz5o=;
 h=From:To:Subject:Date:From;
 b=kLOgxlZu71chDizqbkjBfAUHPxMdlHhAiHaDyADSPYVE4O9wCJavzdL5/aVbJy+q9
 2Vj7v5OVgqtCLoAbQz2buCYvD99CMbrhL+4bWYZdzFBpGp/fwdwFKIbcvgx8hgYS8D
 8W0Ka21Re7emtk/ATkoviGYQveeZNSPOiYlstgrEszQkNPq5+Zjtwr8r3TdXJy6W4p
 TJ0BgM3G2eH4TuBrrDDEr7/1AsrODH0EELxIKVpZtLa6tPv09ByhLEfCP7gas5CQ1S
 viD0Usr8DtEZxyxaOhGDrsSDViWsRHWdEy5ZlW3WCkeEQNJIqsPjb77hliAWKxmvic
 WSJSv2h9dnA4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=kLOgxlZu
Subject: [Buildroot] [PATCH 1/2] package/kodi-pvr-nextpvr: bump version to
 21.3.2-Omega
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
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index e01551fab6..95d487bdab 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6524671757b58d9eea3c9e7c56896cf7f0a0719236795a6cc3f59278e4d3d7c3  kodi-pvr-nextpvr-21.3.1-Omega.tar.gz
+sha256  6315a7bfe038b02c80efe4fe3ee33f92ee2454af8668ce3847e9bcaca38d2147  kodi-pvr-nextpvr-21.3.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index f9e9d4b9cd..56c8830606 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 21.3.1-Omega
+KODI_PVR_NEXTPVR_VERSION = 21.3.2-Omega
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
