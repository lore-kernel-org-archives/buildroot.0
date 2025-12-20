Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B83E668B4
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 17:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8546B60DDA;
	Sat, 20 Dec 2025 17:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GN9GgJPHrm4S; Sat, 20 Dec 2025 17:10:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 651A060DCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766250608;
	bh=341kwRBUlYAstKPpbN4NPKnfLEts2mPRMgdLGXKJm/k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kz/82AFvYpqQ3geCWcrJN9auBzKxSPsOW+n75XWLa/frBnG4ziC14j7YAAAwbqUt3
	 PZdGiHv3+CiSQHgif4ipAED2O47SJdUIcWCXgeZTNdWe9xDhrXl0eUv4BJejAWFivP
	 9xpkgyVp+EAEJdvxSuBADDvBcq/WyvAACnMivv8v4qud8g2PHNNWXMKAAkZJ8hO5C8
	 4975kD37Kvl9cfJ3CQKLBSY51+mv4l4QdPSAyJCqRdAmEGD84fROGbW/v5sBoYSJ8H
	 Zvs8EK/VCc2AoSJVQBEiP3swkNHYkdYNYSO5JDypPlIAVoxzyEKuhpOsOJbsKlie4F
	 zOK4ZKaQBnh1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 651A060DCA;
	Sat, 20 Dec 2025 17:10:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92B11119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75AF74035D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6rsZsxrRPdY for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 17:10:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64BC24011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64BC24011D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64BC24011D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:10:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 87FA4A4C486F
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:10:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37698)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX0Sy-000000004yA-1sMP
 for buildroot@buildroot.org; Sat, 20 Dec 2025 17:10:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 18:10:04 +0100
Message-ID: <20251220171004.157963-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766250604;
 bh=dju/alpL3Px2vSrCYPfGAiPjS5EOxGquMp7kMbNyymE=;
 h=From:To:Subject:Date:From;
 b=OWeriRoEHE5noJgnn3px1FAomTOOUMZmzL62U0X7FGkQUJVCtjIuzrylKI+IVnUCu
 Y1bSJ7kU4Eo7QnNqMVKRaNVUsxH64us4XDHgLpq0nyXgRDrAgdtkwvdcJ4T7EnWI1q
 j3AY9R/8/2sP6SvfvB9Em7J+1jW8OIiHb0t0HxX+ytkhIoz7ybjIdzRC3H6Vsn37vG
 FMoXavGNsAIgrANEScxi5tz4fW/+yd/AsB2t3t2AKLvJPddZLHOb/RLoZLlYYeDEW2
 fXKLeFEaJuJvwAqSEtaYQy1ky8ikjot228FgaLTz35vtSUGWnV/U7cQC5DV/AAbzMy
 s954cEA+q2iqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=OWeriRoE
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version to
 21.2.3-Omega
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
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 7bc93a0345..dcb363a095 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ee1e2730a0491eb3b4b0b6245f9f7f26269fba215d083c84ba2682280ae2026d  kodi-pvr-mythtv-21.2.2-Omega.tar.gz
+sha256  8cec35fe171a388fa9eab4366d5e1f6fcca869a995bc3ea4e3566a38a2db75c4  kodi-pvr-mythtv-21.2.3-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 9f34d07f1d..d4c70013cc 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.2.2-Omega
+KODI_PVR_MYTHTV_VERSION = 21.2.3-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
