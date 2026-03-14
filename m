Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA16E10706F1
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 18:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E57460C18;
	Sat, 14 Mar 2026 18:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oClOlQdQLyZq; Sat, 14 Mar 2026 18:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05CF8608C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773512177;
	bh=0UFndZFVvOfB5IDRc9REKUMbL5fscLpUwrLdAsWsDCY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mICtWr74Agcn47GNQDHXI3Xa97D0aKbG/wa2UTum+p1y5mlz8vjrXirtrceBlK4vc
	 REVstsJptg8JJL1iIWEnsdqZM1mgEXxzkAAtCiarMU129DoLHeHksEF98D37kHDAiM
	 1/ZVNLFLttbXEpy2RgconGm7Le7noUcF5WjpY57uNa5dCYJXTV0XZYp+wHWAXPtZ0B
	 0N3vEzeli6N6HyDPvZh2EwisirKB5w1GmvHqRJsuSq+8wytVmWHvw5GXzCDsIXJ/dG
	 45y6aieVLf4CWjpU4dikKKS0/EYeF2RpIHinTARkoQmHkKWyKVyA3iW8nSah0AtL3H
	 CKnSoY5qkEY2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05CF8608C5;
	Sat, 14 Mar 2026 18:16:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F5601B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B97C413C8
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7bdnMVgJPrN for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 18:16:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9CD92413B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CD92413B1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CD92413B1
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:16:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7AB37A4C1081;
 Sat, 14 Mar 2026 19:16:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38404)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1TX1-000000006eH-0Rms;
 Sat, 14 Mar 2026 18:16:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 14 Mar 2026 19:16:11 +0100
Message-ID: <20260314181611.3076096-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773512171;
 bh=57MsO0QNw1ntCFs79McOESCFsDR2AHi5ZOkPZTD2JxE=;
 h=From:To:Cc:Subject:Date:From;
 b=tmcsQRz0ClLbAjXBbKFpr+1Atg5LMhteiwZHMBWwBw3f50NnfLDcAp1BBexz7ngoG
 N4Vq/9LAn5VdBbkoqPbPDqbwGicBk3Mzg6vKipwv/rBKq+U38+vuUa/c+mYBvm9/f1
 o+GrM0meunG0Sw39VbsTBkbe4OO3hoPbjPPZP+g45tFRXQ98kr1/ktlGyYi7DJLuAh
 AIK/KE+HiaR3rGLWe1kJYQ3lue/HxoaOs9HyGZDtP7cJdFVT5b6rpNGmkZ6CVTFC/Y
 +l6qtpQBTXNhiX13E982Ac9/xSs09bYKVqvrswQr6mkoXzDiJ2bvE4OpCgO3nN1PIl
 Am6cbddL0tXSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tmcsQRz0
Subject: [Buildroot] [PATCH 1/1] package/cutekeyboard: bump version to 1.6.0
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

https://github.com/amarula/cutekeyboard/releases/tag/v1.6.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
index 5800865230..acd2017056 100644
--- a/package/cutekeyboard/cutekeyboard.hash
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5ac0521f89ee9b7a2793150f09a77693b797301d12b8a65fe214387d8e8c0845  cutekeyboard-1.5.0.tar.gz
+sha256  5e00ab346038e41e11662016b56c4e95fa08e7efeb7ca61aeab5b863a0bb7300  cutekeyboard-1.6.0.tar.gz
 sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 9a29f5df02..12a6573d52 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = 1.5.0
+CUTEKEYBOARD_VERSION = 1.6.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
