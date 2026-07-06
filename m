Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A362FC43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 07:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A52C1608A3;
	Mon,  6 Jul 2026 07:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBZ_zp29VveN; Mon,  6 Jul 2026 07:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 314B860892
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783324096;
	bh=PYRrh7Q/mO8nakpP+K7PbOihSAeRtBJTlOht5gabtH8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LUx/yIW06Smuixr4aXPxeXWUC8C4m8g9c7Q8cTKnmwOB1YS8IUhnNdZUTZgKteQ+t
	 A+a2OIiVrvKLkM+yQPh8RHVp8+NuL4RaBmiz8nQmbZtSlJ6GagZyMFBPt/OhHyQxBH
	 Sf9RvE764O9qWX46NZslwkA7oUUzrYEvLm9a4Y804+LEz2+Apo7tw4QRLm7GvONIDf
	 HdHDS5GTyZAfThZJxMpTOzBCpsC1N2G3RValGL7304Sjb6DH3aPF7zcSaq0tAK782j
	 jEWyMNEuGuLMMhKUP1CXIe2FNGJJN84lrLQ9tTdmSl1tCFSkialrezyG+ZoIByZ0uC
	 T6IbcI6xG0dDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 314B860892;
	Mon,  6 Jul 2026 07:48:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BBD62A8
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 07:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DC0D812E2
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 07:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LS0Oy3eLYHHZ for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 07:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.117;
 helo=smtpdh17-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 44150811B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44150811B7
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44150811B7
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 07:48:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ge3lwwv7NBhI9ge3lwbp3m; Mon, 06 Jul 2026 09:48:09 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  6 Jul 2026 09:48:05 +0200
Message-ID: <20260706074805.2641362-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCKyWBRsrcbtqdqp83Xdl1F5/GxFUufi72RGn+WvHaZYOOTCMaVXSaYbrwhEgtUvfxN0bwOm5mk2KyJaVc1FthNbFuKeUXItspVB8ikbZ8t9S2qw7pw5
 IN34CCoLthT8Raq6a6Bv9DZ2hxWsk/j6+FZmdznUCvNcsvD8BupFH0cDFILvwxX5enb4uS6W5TSik5Ksp2LGgBkYKtSt0iRKxRLjgeWyrh4Tgke+Z0ZDuw5D
 FUufYckesD4M+zDJrkRlFq5qzkC17wRxs7i5f77JJQY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1783324089; bh=E02ljYiFxeKsQzRyBVNSqYRfw0mC99lhM6VrF0jDrzE=;
 h=From:To:Subject:Date:MIME-Version;
 b=c1iGMWFKChhelX6urIoTSC4EXsfkeNIxuE57onjAAEknG8l2QvWWXW1N6Nz/bjLy+
 oEii+StyxE9dKV3sFgxd63vAwKvZ2BN55zj9P0IOZBl7Oy2E3282b8uRyxSwOG3I5w
 LW1hhPL3I4pzYEcCQKXTLKhzS24DN7fUlNwAdlICJTh9yDdETIoq9mCj2XHsNM1AJC
 s5InSzclYfkmRWXrVpYS8ozMNjBr7iEDruo9cZJFtMoCfhIdKSqne76S9al1/SB6u+
 yPt2KvsE7+BNVH/Jm0XB2PNOSM9m1zdn6yhEQ5sHpP22wunJh8vd3pDH3kgfe+cSPj
 Hsi1Tj3wxJVbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=c1iGMWFK
Subject: [Buildroot] [PATCH] package/swupdate: bump to version 2026.05.1
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
https://github.com/sbabic/swupdate/releases/tag/2026.05.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 06583ade35..6a32b38c95 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  fd70cdfc7224b4209f5f657c3d6052688412325ea5d4e9e792575fa22eb65cef  swupdate-2026.05.tar.gz
+sha256  26236a354e8cf21806d20a76728b3805ae49c23cfb2eb794fe91d1f0b280298e  swupdate-2026.05.1.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 983cd6eccc..2384dea33a 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2026.05
+SWUPDATE_VERSION = 2026.05.1
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
