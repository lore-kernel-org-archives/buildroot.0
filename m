Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D6BD3B7CF
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 09:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8413B607D4;
	Sat,  6 Dec 2025 09:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gs0W7BueAbH6; Sat,  6 Dec 2025 09:44:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B004F607FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765014245;
	bh=xk7euM3Q3t5IzoaDfQL2M+DW57crpytyxGutbEvnxcs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fcrFkt36vaN3RhKlaP/TLeE7ZFokOEvkmfHEmFBNSxnr2sVYsHkFMMISpv/cS3lVe
	 5R1KbrtpizHS1p9X/0RbAh4XfRPoTvB3AB1hRE6pRQMWGiqmo16CPNlowxIfiHJm+k
	 waxcOMtkNz+aZm/19GeJn2dlSWopNuSBsS44pHzXKeh84N1D0dDEWclIrLl2o11ulY
	 LX63YDPnpcIJHKgIP/77CZ02ayxw+iT/NARTO/J4wVt/Iu02FRlFRcF8s72Ma0l1UQ
	 3U+8zhSEFWL9jml2BE77vn6WmVMhWUzxkZS1ScfJnnWY6x8yR/M1RF8NnnFEtAjhAl
	 wksbL5gyuEmHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B004F607FB;
	Sat,  6 Dec 2025 09:44:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A444FE7
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 09:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95CA4607FB
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 09:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ibsbk60iHt_Q for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 09:44:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 65F09607D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65F09607D4
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65F09607D4
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 09:44:00 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Ropavs38PlGpsRopavIUiP; Sat, 06 Dec 2025 10:43:59 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat,  6 Dec 2025 10:43:57 +0100
Message-ID: <20251206094357.532993-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCY6sFBNW4+ZPwL+GCRojiB/brmbr2wIbB+COK2qIO6u6i5iDyZAgEEHaagSG/izKZQgMNWyRZKfzzG+UTYqVZqHPgFLbF2uf3+yqlxRa1wt6bBOO08y
 wdxuIAcPvLvKEoncalBNJfN/PfQvUd9LsMGOvXcoJ07goZ91e01Y6QH6LvlgtP7gMt12aGhrT5zWpxjKxRkpRRbV2VlP9qP62Bu2iCuDCG/MVIWcKSblEoA/
 STE8jyDKXB5cYLjR4OuSQCXRvB4eddB04/YF73hrdsE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765014239; bh=CKxH8V0pIIIGOXpMd2Kd4eAGjIg/kY94VB9OpquRAc8=;
 h=From:To:Subject:Date:MIME-Version;
 b=YBY07UVzW0TBvRvowlqqau40YXiothW3CiQMTwPxkKIEbuYIWMlUeuDmB1XI8/9hk
 R4bqmMHRcM2obC5Lv4NU9lCRNczQzZ55BLejFXlmObhJW3kEvTAUOL1DedoHalhUZy
 oKkxMqA+JIsGC/Rfr97GkWcQ2TB+Et9KQX5AAgUoEnbxmU0sCNFvEr0GfQJAHnf9EP
 b1/fJ6C0tNMqFXP3LxB/SOHggn8iLYM8IhIxJObkp22U3JaFCZViGlEQG0hppHtAAU
 NRM+JTMqiySq5l/l6KAEwC41RUUu95bt3HtqmDz/m3YYNBq4siz24SPQ0X+sw8Lp4s
 NuEszNBLICbUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=YBY07UVz
Subject: [Buildroot] [PATCH] package/swugenerator: bump to version 0.6
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

For release note, see:
https://github.com/sbabic/swugenerator/releases/tag/0.6

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swugenerator/swugenerator.hash | 2 +-
 package/swugenerator/swugenerator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swugenerator/swugenerator.hash b/package/swugenerator/swugenerator.hash
index 184fd86e27..75a902f2c4 100644
--- a/package/swugenerator/swugenerator.hash
+++ b/package/swugenerator/swugenerator.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  bb816a77278a2d320e36cdd6fd1bb9b8318b4ef4ccd05e79bb1d5ee631a1d5c1  swugenerator-0.5.tar.gz
+sha256  06098c4b3a6c3e5946a11929f95f280baacb512fc4154e16af2262c60a36cbc6  swugenerator-0.6.tar.gz
 # Locally computed sha256 checksums
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
index 5acabc2036..a892002369 100644
--- a/package/swugenerator/swugenerator.mk
+++ b/package/swugenerator/swugenerator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUGENERATOR_VERSION = 0.5
+SWUGENERATOR_VERSION = 0.6
 SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,$(SWUGENERATOR_VERSION))
 SWUGENERATOR_LICENSE = GPL-3.0
 SWUGENERATOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
