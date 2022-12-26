Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FC8C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 22:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60C3960BBD;
	Mon, 26 Dec 2022 22:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60C3960BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uXX6SZBB15QD; Mon, 26 Dec 2022 22:58:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B195260BBA;
	Mon, 26 Dec 2022 22:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B195260BBA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B69361BF28E
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 22:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B845404C1
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 22:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B845404C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqWXT7CnsrKZ for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 22:58:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82A3B403AA
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82A3B403AA
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 22:58:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id co23so11060963wrb.4
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 14:58:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n9yoQdNtzFznWTCEulTr2Tzs3Sq1JugjNFXO0SrqM20=;
 b=f4eAPP/7RKZ1c9dlmVqGETK1mwEq7TAlE5URwQkTNdrpflb6WR7NpWKT1MAs9tu2no
 ZJzn580oUrzbU68UX0on9Zd5Ls35wdp98NDabY/tuQj9A19ZiOWQhJIpNxBLARv8PTRt
 p++tCeNgKTR7fJAfIGLF5vUuT6CmP48HfNtvvEms9XW27k0chmvPuss5Pa1lZ973oT3G
 yz4RS9JlB5CD3tWMdzkSXw3uwtwH1qUIQk9JKMrYENI6Hq5tMgH49gu6DUZQwYA9HIqT
 PX3TlS8zFl8Kmj+GyKFH0FD3nUWXwCrTdP7Vf9S4khJy0n5/hJ6fV4d2+p7eAB5AArZ9
 CsNQ==
X-Gm-Message-State: AFqh2krzIwQ/sC/15mJ7pop68DDTXmAkHAqAJpU2qmteywZMhiqYke1f
 WD/MIBGwWaRjdGG2K2tU/s7Sn7lyASw=
X-Google-Smtp-Source: AMrXdXuHxRkUKJ9oxN0im+jEIBL8nGTlIQM2uJAYcPWvgGhAqqJoSiMDeoF4U3WeidcFXULb4eT4MQ==
X-Received: by 2002:a5d:5487:0:b0:27d:859e:2c9b with SMTP id
 h7-20020a5d5487000000b0027d859e2c9bmr3079245wrv.10.1672095525164; 
 Mon, 26 Dec 2022 14:58:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 a18-20020adfed12000000b0027cfd9463d7sm4248511wro.110.2022.12.26.14.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 14:58:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 23:58:41 +0100
Message-Id: <20221226225841.832306-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n9yoQdNtzFznWTCEulTr2Tzs3Sq1JugjNFXO0SrqM20=;
 b=KN66QsHy5qp8/4B78fMyJa0Y9N+RqSsyg9KWy+1Bxii5jTsDMySoUUCB0OYvvjSRZP
 VriI3579a4/HT39uEWgX2LHPBbvSdi1F7pgqa0BZa/Ac4vVHodFrfpJCD7H4+nCER0T4
 SbZ2PoIR5HGWsJdhIy68jmvz3UXBUgPIqKUWwjj4wB5iNORv0nuYszbOUTbYnz6rLsee
 2VLG6sA6dWRiKiDcJSEHqPHcNIQDa+wmtdmc3KZ2COVDiF78PBw1VWJusd/bIHN1miC3
 YGI1GHe26/2j3Ywk3UCMrTS+NLB8q8NOxNuPWx2mSAUYK8aqm3j6dCYnu3OCRig4ELhZ
 HyUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KN66QsHy
Subject: [Buildroot] [PATCH 1/1] package/haveged: bump to version 1.9.18
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/jirka-h/haveged/blob/v1.9.18/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haveged/haveged.hash | 2 +-
 package/haveged/haveged.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index 8c62ead7c3..9455e0b89d 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f882919ccead07ad6687a4784c0c501e617321e96dd0118403464969359cf6ad  haveged-1.9.15.tar.gz
+sha256  f882919ccead07ad6687a4784c0c501e617321e96dd0118403464969359cf6ad  haveged-1.9.18.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 7035142aee..fbf72a96ad 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.15
+HAVEGED_VERSION = 1.9.18
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
