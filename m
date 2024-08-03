Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C96C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 10:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B54EA40215;
	Sat,  3 Aug 2024 10:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPEDbX35CU9C; Sat,  3 Aug 2024 10:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DEA1404BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DEA1404BE;
	Sat,  3 Aug 2024 10:49:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EA411BF37A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98A9840528
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWoiTL0nmsUB for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 10:49:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4A91404BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4A91404BE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4A91404BE
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 10:49:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfa9.dip0.t-ipconnect.de [79.214.207.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 97A7CA4C032E
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 12:46:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48726)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1saCHp-000000003Oc-12ZD
 for buildroot@buildroot.org; Sat, 03 Aug 2024 10:46:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 12:46:54 +0200
Message-Id: <20240803104656.2574228-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240803104656.2574228-1-bernd@kuhls.net>
References: <20240803104656.2574228-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722682017;
 bh=d2WB0DGoxmZGecCeI6PX5mqY3/p2Z5csjxQeIPpnqjI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fwoO1aSzSD3TaYjNZMIb8ijnZTGvVj4TZaQBNg/u+KKFARU4taXVMxz1ty7cK8rma
 oCgvXIWDyFI18egSMRWMuZ0zJu6vQOjrvAslcgm+eyCuRnsAvFFqKS6sW0JQ3O8m28
 XyV64R27JvsQm07xp8xE+OVx50BWQD5/t/OYcA2/6UBNn+4vkUlaMtDvB46UEBrkjf
 G9qGph0WKKe2Ay2QPva3jzys2TIjbTjfSasMs5lSQDuJZPjpnaNbpm065aptspCOQO
 7avNDOjnMbYUBHWMaYe0Ucdh+z6WY3Em7XarzcuPGUojIfXW1cqQrMWM14EK6WxtwV
 UMfSj2dMzzWpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=fwoO1aSz
Subject: [Buildroot] [PATCH 13/15] package/kodi-pvr-wmc: bump version to
 21.0.2-Omega
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
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index fc04e44b2a..f274aa92c2 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5008adcd9ce35e965bc172ac98306c0ec4b639182a7026e6ee9b36581516c8a8  kodi-pvr-wmc-21.0.1-Omega.tar.gz
+sha256  690de222455f4ec02480e3cc0eb524e64448ca95486394f562c48492a614e17c  kodi-pvr-wmc-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index 81829d5eb4..04097ba151 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WMC_VERSION = 21.0.1-Omega
+KODI_PVR_WMC_VERSION = 21.0.2-Omega
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
