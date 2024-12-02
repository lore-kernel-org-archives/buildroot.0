Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F34E69EA0
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 23:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFC2040691;
	Mon,  2 Dec 2024 23:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9mH2POuSYdA; Mon,  2 Dec 2024 23:41:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F9B0406A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F9B0406A0;
	Mon,  2 Dec 2024 23:41:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 266522364
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 23:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2194540119
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 23:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOi0j5ZQzxRL for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 23:11:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 492E24011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 492E24011C
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 492E24011C
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 23:11:26 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IFZat86M82nwqIFZatnWle; Tue, 03 Dec 2024 00:11:22 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  3 Dec 2024 00:05:28 +0100
Message-Id: <20241202230529.228304-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEEAgoe/SflA8ECOPNaW2tS0ZLAvlZi9CVE3zX4Ip60JuSu+Nj51rlPxBCohAh9Lf2B3uuEZwGmFnMUK9RbzrvQPMiNYHRFKQbNZ8+A3U4Ba3/CkG2gz
 ikp2oOh20w/HTtWZzfdDuVehRM/S3aVsbu8XgeHJ4eFyUeQ4qMjchW1Vel8MOQGRX/26BltSVsZ2f2MJfDIOncFnt9gdT058rMCfFUVoRwNs8UCStdHUVp9T
 CPoqshhSgDRb7+AVUrMtNaDx7W8/PR3QPu/Sp3tYv84=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1733181082; bh=LxYhPPJmSN6zVWXO+hyVc2HVpRWJfVzFSW29Znh7f2o=;
 h=From:To:Subject:Date:MIME-Version;
 b=b972BFWO1liT8goKx01LIWW7ps0IAoMWIMTdi9njZW0CrMm8ZmKnYoNcKWhNvC0yF
 Kpob1HEM1yf/OUXWivZCV2HG3AOBMSphjtPXCLYLsYgQJVp02p9ffPB2WL7JbNJgZx
 qOPidkFmTjs9dzW5spBU1quq0YPZ5lU/vwyJT99IVtodtmX+KLEm/U31RlP4EsVIVo
 DDQWjhodZNqaCQiIfhjE/szI+lX2OouQSUfA/ZYZhqr00wt1ObQ/aduT4jwF7rt4MN
 zsfL15mZnM68gvEUqvN1CMRT1eDvu/84All6ar7vzHzPzT6lI5SWdstbcXN+rTP4Lj
 ULoVEDc3dtOXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=b972BFWO
Subject: [Buildroot] [PATCH] package/swugenerator: bump to version 0.4
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
 package/swugenerator/swugenerator.hash | 2 +-
 package/swugenerator/swugenerator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swugenerator/swugenerator.hash b/package/swugenerator/swugenerator.hash
index 301f168681..5c4878b400 100644
--- a/package/swugenerator/swugenerator.hash
+++ b/package/swugenerator/swugenerator.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  3f4885242bce9523d26567578793c828e2f07122c6b7e44cce8ede33e5618a01  swugenerator-0.3.tar.gz
+sha256  80351fc1c57a6162bc07c44765f2cfd76f3d984dbefca79c3d59844aacd2957f  swugenerator-0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
index 22ed799e99..b5f7796ebe 100644
--- a/package/swugenerator/swugenerator.mk
+++ b/package/swugenerator/swugenerator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUGENERATOR_VERSION = 0.3
+SWUGENERATOR_VERSION = 0.4
 SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,$(SWUGENERATOR_VERSION))
 SWUGENERATOR_LICENSE = GPL-3.0
 SWUGENERATOR_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
