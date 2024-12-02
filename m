Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DB0E69EA0
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 23:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEF20606A2;
	Mon,  2 Dec 2024 23:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bxn2_8Qb3QaK; Mon,  2 Dec 2024 23:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD59F60729
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD59F60729;
	Mon,  2 Dec 2024 23:41:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A97E1531
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 23:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 153164022A
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 23:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUerrd9Alcic for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 23:11:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 494B9401BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 494B9401BB
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 494B9401BB
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 23:11:26 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IFZat86M82nwqIFZatnWlm; Tue, 03 Dec 2024 00:11:23 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  3 Dec 2024 00:05:29 +0100
Message-Id: <20241202230529.228304-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202230529.228304-1-giulio.benetti@benettiengineering.com>
References: <20241202230529.228304-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHO1iTyROn+E/c6U/46jlbaHzeKG8sePZxGyFcmr3wMihqfL6y3oKUCWJFdJAt/EUHEKOjFlDyvKvV9GdnYDaFnhhFTJI2zyvh55KaralJdQAVBzpkMi
 C4oWezxEPG/wYifwvGgU1W7ejLDOgx6pLS11Wb9A1XcXUpxvDXK0klBeZmhLcqK8Rxye3K9+wr9zGXf6qkBTRwbmxDmD5UX9zvFTDo24RtrjNzm70EH6wyqe
 MuVAQxM+GxbKu9AM8pIZ94cn3k9Z+2XxG1q4kQSDLZA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1733181083; bh=aiNl06iIqxdb0rxtDtgQQOJUFkcYKtTD2i80QzLyCew=;
 h=From:To:Subject:Date:MIME-Version;
 b=YW/5QYcRrkhDQXt/QLr5cB0zOf/0Rv9zmEgqHNWh/Z70+GWiPJ2GM3/hCZIVy9Vd2
 o8KOAlzWmuUpCUrqo//m+NkkQWXxU6NCdvTK9FWLPjkVQXuB+9M9B1+lPNNjkc7rRu
 UDM7PF9arqBkOtfZ2HO52ATHLXmADkm4jFIhmDhkmJO+vprkAf1VU8+8fil9QDdJBU
 6pcKsIhuzHINdSyiLHH0JvabzBgsQ2Ap8g/rzZqFIcftiPlDv/0xz/hTIP6o9jN0yE
 TYIQC1oSaD2xCCQVPGCw3EcqOwViIjwgN8bkBSCT1GeJjIoThtAvkXTSVZ4ZiJOmpq
 A8p3e8jE9iE/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=YW/5QYcR
Subject: [Buildroot] [PATCH] package/swupdate: bump to version 2024.12
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index ac28acb1f4..847c5a1098 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2736045e885ad6c5dcba8dcc6c7582d0b76ef29a3d6ab7c4080908356e35e3b2  swupdate-2024.05.2.tar.gz
+sha256  528c61769456d7740a9ba1d045f25f7587203e2a2e71a9a67998f0e13e2db149  swupdate-2024.12.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 75e4af5db4..fe6ef2dd6d 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2024.05.2
+SWUPDATE_VERSION = 2024.12
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
