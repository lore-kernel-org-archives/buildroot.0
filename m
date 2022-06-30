Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A520C43334
	for <buildroot@archiver.kernel.org>; Thu, 30 Jun 2022 22:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A47A283FF5;
	Thu, 30 Jun 2022 22:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A47A283FF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id la-0N2BU26NQ; Thu, 30 Jun 2022 22:13:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A893683F4B;
	Thu, 30 Jun 2022 22:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A893683F4B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F0D41BF27C
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 22:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDB6760F80
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 22:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDB6760F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dk984gotIoHO for <buildroot@lists.busybox.net>;
 Thu, 30 Jun 2022 22:13:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD9B360B68
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD9B360B68
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 22:13:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id cl1so549817wrb.4
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 15:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2VfS76xro09VwA7sS2f0wVdpZi3nSLCeCz9X9Ibg8lc=;
 b=DxcnDqdP/BdqmhQ5LnoJrddPpcQSra5Re+fHRMjw+mBxvxsy41QRmI8kFZe3XWQ782
 V92NQ2J6WbyZxLzguPREcIvnV+BdwztfSSvxZGJwCs2Fizi1dPhdVEyympGAsjk2qcsI
 j3LdEVAd6aFafuoSZBMY/xmWQoH26i1DFolC7/Eqg9PevNZBZGkRiWf74W0REOW0SJhR
 mDdhkO/sPzWD/m5GaGFTXzYbLh1gDT+OHCJSPQZbQSl4PjZdEntcaNX/NjfWtyAsgVlb
 OuCUOjld4xkPt53t0HtCB4xXKjoFlvbznXnueIFDRKOWvVe5ssMht/+Baa0NnY1vs0YQ
 szzw==
X-Gm-Message-State: AJIora9gAzPEMEazIXvgxCJ8DHxR5QlYKnCnMThZukFhZvSrJuFlzXlc
 SXWRDsNQy/pjFX8vqSQGNqTxLnV9t5U=
X-Google-Smtp-Source: AGRyM1u1sRPkW+ChFUUSlW8C/ra1aQFZ+puzwhbSv29topzi4BDGJywB9qgVB5TGzATN9giMj9nffA==
X-Received: by 2002:a05:6000:154c:b0:21c:65c8:2ef with SMTP id
 12-20020a056000154c00b0021c65c802efmr10581273wry.473.1656627205887; 
 Thu, 30 Jun 2022 15:13:25 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b003a04b248896sm4014678wmo.35.2022.06.30.15.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 15:13:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Jul 2022 00:10:35 +0200
Message-Id: <20220630221035.799567-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2VfS76xro09VwA7sS2f0wVdpZi3nSLCeCz9X9Ibg8lc=;
 b=cOlQdj4/lV8GGvMu4YQSuMJTBLcPhJH+/Afs+P7ZIhq2gYG6CDVMwD4FqGDzX5USTe
 QPR65tGogwwZVWuRD6UE54tomemaqb4nYf3N4xqIVlxzfvKwKWMRIloaCNMsv8CuJZJ9
 M2TEXlgaASLdS2oZFZ4Y2tnof2ux79TLFq8kGRgswJYKRgZlWR1QS1/dHHM9gFy9JLeM
 wSj5RDcACko5XasVOaAc6yY3Mu/XadA6EiVHIPl6iaZedoYy33+OndLe55/cR1S8QMQa
 6Bhh0LiM+diCQpt7tev1BiPQr0sAlV+m57/3//MtyU4MUysLXiZ+shyFcfq7qLvdF82X
 gBdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cOlQdj4/
Subject: [Buildroot] [PATCH 1/1] package/memtester: bump to version 4.5.1
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://pyropus.ca./software/memtester/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/memtester/memtester.hash | 2 +-
 package/memtester/memtester.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/memtester/memtester.hash b/package/memtester/memtester.hash
index 7d7820e746..6e5d156ffd 100644
--- a/package/memtester/memtester.hash
+++ b/package/memtester/memtester.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8ed52b0d06d4aeb61954994146e2a5b2d20448a8f3ce3ee995120e6dbde2ae37  memtester-4.5.0.tar.gz
+sha256  1c5fc2382576c084b314cfd334d127a66c20bd63892cac9f445bc1d8b4ca5a47  memtester-4.5.1.tar.gz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index ec515f6392..347a158b74 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMTESTER_VERSION = 4.5.0
+MEMTESTER_VERSION = 4.5.1
 MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions
 MEMTESTER_LICENSE = GPL-2.0
 MEMTESTER_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
