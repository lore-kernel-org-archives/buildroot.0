Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53605C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 13:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F250B411F4;
	Sat, 11 Jun 2022 13:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qBeSYaLOKnNN; Sat, 11 Jun 2022 13:00:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8063040A8D;
	Sat, 11 Jun 2022 13:00:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C86A01BF35E
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 13:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3A6A4258D
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 13:00:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jqR7PuUvYiix for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 13:00:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B06042588
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 13:00:31 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u8so1719092wrm.13
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 06:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+xx+IsgWfDEJZZLaLx35Qq+1dxYMxIiXBSLwD7Wsyhc=;
 b=KkLXwS/gI900beayMawxVx7v7U+j75uGVzObHtDMn7d9zIL4/uVvjcja/+nvHisV0N
 9LcN2ReyJtKO0vDHH0PW+syX73VXRNEjtDqxuMnizcGXlARrBr6x4bUhtAs50AFKnnjE
 kJwi5e2Ol/mT//WnHKVljyTuujfasZkwJEn214q2rGbZDd5jhCOYLro+4di2f7W90X75
 4B14XWLzEPz5gDKYwCPb56htbEIFJY6/C2eRezX5zwnLmuLSgMLTXOi9jsVy6FpkPQPG
 TYCHKGHKci88lFFqCbQd+1XUT55w2GNRxM6jRQ78tq1CFTyU31jQBJ7CUjhnPFnI16HF
 eUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+xx+IsgWfDEJZZLaLx35Qq+1dxYMxIiXBSLwD7Wsyhc=;
 b=Ncynizgpa0Y+uLs0SK4pPgtctdHE21Abo1HWsuBDOhNzr7AqZ8gs9gPyZUWnAO3h3U
 b0y5hTmJVOgvX/aQUZTpGziXP+k7PdtitJIvlp/G7PzBWwfCIAZJaXT1oA3jO0PBk+bc
 i1h58r70JAvbziRhUHPnW+B2XqH5W0w/QC49j5khsEN9I6YivWy209FUTD0T4spuLE4T
 qWzDJZFoFpuIbPS2BVzWDmE1yZqH+xoDPlD11pQFdyAeK6NKN1WTKZ5XX8blks0rUx+4
 7cS/e6unRCehpR+leXy0YbWXEHDGHWqBuKHb6OwPZWe6Ai5R0SnAi6HmUR37d5gB1qg7
 fxuw==
X-Gm-Message-State: AOAM533XdwyU4+KWIZFuCOxGwYRh3KJQ3tnJi9YgvJjoPXFCOHE/eqSw
 ZPbbigsg9MhejJaXxDh/MBeiuhZtEsE=
X-Google-Smtp-Source: ABdhPJyaTGTJ0RBqw8Iy44GRZJiqEBPYZ9SpQskQ6/+L8XmpZkE2YtEYff//KO91gAQFuBmi2MqYZQ==
X-Received: by 2002:adf:e944:0:b0:210:30cf:6e42 with SMTP id
 m4-20020adfe944000000b0021030cf6e42mr48338285wrn.258.1654952429237; 
 Sat, 11 Jun 2022 06:00:29 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c384800b0039756cdc8e1sm2353583wmr.37.2022.06.11.06.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 06:00:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 14:57:52 +0200
Message-Id: <20220611125752.355351-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: bump to version 1.9.8
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

https://github.com/LudovicRousseau/PCSC/releases/tag/1.9.8
https://github.com/LudovicRousseau/PCSC/releases/tag/1.9.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcsc-lite/pcsc-lite.hash | 2 +-
 package/pcsc-lite/pcsc-lite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 10a8d92fa7..340a9edbea 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  fdb3fe8f68049019523801909b2a336d0d4ee315edafe363c30d375e3706537a  pcsc-lite-1.9.6.tar.bz2
+sha256  502d80c557ecbee285eb99fe8703eeb667bcfe067577467b50efe3420d1b2289  pcsc-lite-1.9.8.tar.bz2
 sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 5bf9ce7f30..ad34bb4b90 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.9.6
+PCSC_LITE_VERSION = 1.9.8
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
