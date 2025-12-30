Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBAAEE57C2
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 626DF6080C;
	Tue, 30 Dec 2025 22:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTOlf1qwVI6X; Tue, 30 Dec 2025 22:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFE48606CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133238;
	bh=ROfnV+jRRDWov0Grmzu9wodJrDrXDKLuITBwFYTJcFM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GdKo8huisSQu8Z+ZTECgRsI0fqjPiQoXLN/I2nev9AwhQieAy/E6Pt60RuRl6fB9T
	 B6MKfURJQ1mKKqkcMkgqVJJMlvPwoJ7RfadzBju58sNuEkB0a0JHHbLq8ZTvNBQC9U
	 AWkzqBYkjVJajfQafkuh/9Vh0H9dBUD6VOEMaBfrvG+hje4CkWTmSrtkD57X1qtF8o
	 yP/W508z2eCADzLkqkslu2SjkAful2UQgFVz+//JJ4XcF44bWO1ag5AA1sSg3aKF/B
	 0cafADiUBSzk1rMXqR3KcQULoP00pwyIIFdv/ap4FLOaDK1+7JLMwZFT2eFwlKVlg6
	 ayU6jYM9i+Lvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFE48606CE;
	Tue, 30 Dec 2025 22:20:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C270277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72845606CE
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtCgd_eDov9B for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D6C196065F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6C196065F
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6C196065F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:20:35 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ai4tvG2bxgRm2ai4uvccFE; Tue, 30 Dec 2025 23:20:32 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Alexander Dahl <post@lespocky.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 30 Dec 2025 23:20:31 +0100
Message-ID: <20251230222031.3626500-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230222031.3626500-1-giulio.benetti@benettiengineering.com>
References: <20251230222031.3626500-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAZEQdJQCp2qSMHu14cIqbhcYPQ6YmURAokkD68sSNHTd4cbcfbobUF7RYGdpt+8pIH6vxHNXbaOCQvweysKw/fL4f+pKaxZKmB8P0SwKrZKU4hlK3MG
 OKG+6rIAH+dLUWVOGrjhck0TeYDc4R1VX1CTt2sWWLDJY9BllKuKsJSejCtWpV11mRm8ZB6JkmM+bfgVS3Ea/a/pPIWIBebtp8V75xjkyvQl+i9UH9SLSW4y
 IgawseGXpEZ+cXIL8A/0adkNYpMEOzB6Lh0kYWxjfT6nIpIIzqJMBgLKLr4DwB0R1sSq4EQxD+S9nlkncyD5Dg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767133232; bh=OqQY+XDcAxbThTcs7VwZNngpdTEg0E6v9e+/kudLpas=;
 h=From:To:Subject:Date:MIME-Version;
 b=kZCpxInKCsvCUrcVrE9jbJbc4Vo8bIJmCJYTrSRa+jpErIP05j7QP0lnY2267I+/E
 o+LzfkxQfv4/YF5dB+Qwkqs/LC9uHIIH9r0vF82wuW9yCQT6vXaHQ99IERuAkTOTjF
 cTeOVyuROZkmn7oW56uPR5VgozkiDf1kCYh9UocZwffMUEKLK4IVK173Gy8urDBVA/
 MAqqAnFoYieRjCZSNA+cft8dGCEUt2xDEJr5lrr3ah7GnfCpkspkSaJKj7WGn7jFPo
 H+cZ51HyZJY+yThGmCM96Mt6uOxmng3pHF4MF0D4+qgreDXmqpKvhvn411b/GqYGaz
 bX/2FlRc64/SA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=kZCpxInK
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to Putty package
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
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 97a2701df8..73ece0231c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1318,6 +1318,7 @@ F:	package/minicom/
 F:	package/mongoose/
 F:	package/mmc-utils/
 F:	package/nfs-utils/
+F:	package/putty/
 F:	package/python-libconf/
 F:	package/python-uvloop/
 F:	package/qt5/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
