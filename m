Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FFFC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 22:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CACBB60A89;
	Sat, 10 Dec 2022 22:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CACBB60A89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5pyduTfZVM4; Sat, 10 Dec 2022 22:19:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2575B60596;
	Sat, 10 Dec 2022 22:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2575B60596
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2825E1BF575
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 22:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0339880B1B
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 22:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0339880B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSoxuZvF0quA for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 22:19:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D932681344
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D932681344
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 22:19:12 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id bg10so2364449wmb.1
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 14:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iPZyY+G4TcDaUncPKiJjLXYaNfPA2g7kE9S++/3wbRY=;
 b=L3ZRWosrXdmGW4RvkRSEo3qAVUHCNohUEJweksnihmia4G0KEP8NuV7BZpXrAgqN5B
 TxAth4KNTg/u8WZY36XQMO+Y1Y1Vhg1oCYhj0YgGcmLQF+1qBa3+RDHQW3l9hS5FFSek
 dJJLueoHtzIeOIrqz/NLbZSYtkE2az6XsqmXk18DMVXHdKmKXYksJBfy/jX4UsAFRISt
 jY3k0sdammfC0vobaD/R2Ng4Gbkft5cHzqynXrPYAOLIy9rWPXsOikmuHuqmBTlYereU
 uvM/KzbkIxEA6xAidNooUqDCK0M2eVIEZ/zliVLWwz6CZQhuWUMZgOK55O1JFRLdUkMB
 O0BQ==
X-Gm-Message-State: ANoB5plDdlDU4Xj2Q7vCfl68Y4Tls4aMWaQSreU6kTyPtZ04EqT/YILb
 OzOwjd8rzOi6gb3PHEP5mTdJrN6HUU0=
X-Google-Smtp-Source: AA0mqf6vpigT4ouAc9i/hxgrb+Zo1kZn8BPm1aJpvn/u6CwDUKDQLEtLA9+4TO961k8N1DzfSGOokw==
X-Received: by 2002:a05:600c:28b:b0:3d2:1ecd:de42 with SMTP id
 11-20020a05600c028b00b003d21ecdde42mr1569642wmk.6.1670710750509; 
 Sat, 10 Dec 2022 14:19:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 c66-20020a1c3545000000b003d09150b339sm4050493wma.20.2022.12.10.14.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 14:19:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 23:19:06 +0100
Message-Id: <20221210221906.123306-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iPZyY+G4TcDaUncPKiJjLXYaNfPA2g7kE9S++/3wbRY=;
 b=I30vBOk6yme/2XTYXwNxVqbnYePI1+JJ0Ksyn693hn1pWMZqUMdKrWBLZAoyaptWY2
 2ilsoaq96qOboY6fdCFihnRSz20qAkOV1cSOvrJoCrG7R865ykebkhY58FL9Cr4yD+p6
 BH2x5k6iwv9eY9gWxap67uxJPjvg74It4+NBWOEos+T6MauTAzBnSeD4fn4aWs49lIvf
 gIGsY518bX7MavaZSSVekP2+oBcdEysW+qDFN51GBmfN+rn8jqp29y+pcn0pHlsobKIZ
 l1vkemNzEJ4mJey9qB4dKMWgpN8BD0SS88PFJ1Us9Lf+v7ZCLSZwiGm2rrwB00f6e3hT
 I2Jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=I30vBOk6
Subject: [Buildroot] [PATCH 1/1] package/davfs2: bump to version 1.7.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://savannah.nongnu.org/forum/forum.php?forum_id=10244
https://git.savannah.nongnu.org/cgit/davfs2.git/tree/ChangeLog?h=rel-1-7-0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/davfs2/davfs2.hash | 2 +-
 package/davfs2/davfs2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/davfs2/davfs2.hash b/package/davfs2/davfs2.hash
index a555779dbc..1cbacc388f 100644
--- a/package/davfs2/davfs2.hash
+++ b/package/davfs2/davfs2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ce3eb948ece582a51c934ccb0cc70e659839172717caff173f69a5e2af90c5c0  davfs2-1.6.1.tar.gz
+sha256  251db75a27380cca1330b1b971700c5e5dcc0c90e5a47622285f0140edfe3a2f  davfs2-1.7.0.tar.gz
 # License file, locally calculated
 sha256  0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING
diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index 42192faa59..a67c506250 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAVFS2_VERSION = 1.6.1
+DAVFS2_VERSION = 1.7.0
 DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
 DAVFS2_LICENSE = GPL-3.0+
 DAVFS2_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
