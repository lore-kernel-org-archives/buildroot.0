Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C343C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A45A80D9C;
	Thu, 22 Aug 2024 18:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBAjhOqBdwYm; Thu, 22 Aug 2024 18:18:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7773481992
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7773481992;
	Thu, 22 Aug 2024 18:18:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A20241BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CEAE60E0A
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21wYJaQanJDN for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:18:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D07CC60DE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D07CC60DE5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D07CC60DE5
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:18:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a54.dip0.t-ipconnect.de [91.58.10.84])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F2785A4C2613
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 20:18:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55196)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1shCOE-000000005cF-1R3P
 for buildroot@buildroot.org; Thu, 22 Aug 2024 18:18:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:18:26 +0200
Message-Id: <20240822181830.65052-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822181830.65052-1-bernd@kuhls.net>
References: <20240822181830.65052-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724350711;
 bh=L/C2Y2evLdkW6yCwPzKk22H6zdEPd/0WcXmjRanQSzY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cUgUHx50Exg0M14fW/SF3s3qBCnTunh9qJhSA/pQvE5rdO4pstIwdmaCCuFHVs625
 WI07pjs9RFLMhFOYH+EZqUzhktAg52kEzu/agq3R2eebdlilDayazB+Dab8FVUkY3w
 EMLviIM+CSr54srlt5P4NCP7CujhlV8FcZ20TdsCQG3GwwYWixP7ERq8y6jN4zm7PL
 pPIGzg4rrx+68zulUF3VgPdw1iMtnC9v3bPjOMnu4DIzvngzUKHMZSRTkadGxoEXcd
 wwVHyqT8NdNsOHdpGpFySOa5YhNL06tF7QK6lHItXzytn18eNvnL0/BX+n2MtkWQkt
 39oJasI7/YKxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=cUgUHx50
Subject: [Buildroot] [PATCH/next 3/7] package/kodi-pvr-plutotv: bump version
 to 21.3.2-Omega
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
index 75f9ed0398..871d64c191 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  468d5ad4703c36d73dc8d08008d19c0e9b44474b86b4d5e618b97c3003214b6e  kodi-pvr-plutotv-21.3.1-Omega.tar.gz
+sha256  cacdae70fa5b35f2913b036bf6e1915c7aff45c6bfae782f27e184a5b9a77d5f  kodi-pvr-plutotv-21.3.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index d363f206d7..1227e5910c 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 21.3.1-Omega
+KODI_PVR_PLUTOTV_VERSION = 21.3.2-Omega
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
