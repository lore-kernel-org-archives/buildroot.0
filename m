Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755B2C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 13:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E97A160A74;
	Sun, 30 Oct 2022 13:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E97A160A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yNCnqSAnffEF; Sun, 30 Oct 2022 13:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 285F0608D8;
	Sun, 30 Oct 2022 13:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 285F0608D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73B631BF489
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 13:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C50E608D8
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 13:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C50E608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jWntfaW__mbX for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 13:10:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C0D160806
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C0D160806
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 13:10:52 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id cl5so854563wrb.9
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 06:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8vnxAGM1BX2Kvl1HVcXxO2YJs80c2Ulbm8yIh75XGDo=;
 b=ZP4/dWoIs/PR074LdzL+vEMY8b8GFXy9kAg0mPDr3MQ7l1PAPY4BKWXnGJ9GpYMFSi
 0mQENyTcKkpKwJbjZk6MzQJRd76Cl69q2xwEp7IQoDiYd7JZEfwpEhxQTY18iFxJ6vBU
 Ywg351qUoEvsU4kwdKmNR9IUN61t8MWyPPKtri8Cv+JykwbZ2FxW27gKTnRr9TZqzxuJ
 eWX0a8nT0sgG0/DsBfUyPKkeXIOTOMovYUkxm5a/wdLlwJ3zbuRKBBvJ5m0dMP/gsZYa
 Y/cfkk0+VKxj4aH1UsXJsQdjjSDQFCO/In/M3qBIWhK6DmXbY7Y/00zw+u3qQjRm2ePz
 5ePA==
X-Gm-Message-State: ACrzQf1NeMSyO0RIMSAX9p3J3jsZFngOjA6mQeToxkUy6cuwAN7LtlgN
 WLrm7sUGwX2hcJ7GJvjONEGcBVMp3CA=
X-Google-Smtp-Source: AMsMyM7+ugDPlKbJO/EsQjDayh2Tw8TXWnPhNFrAScqSc2vmpQqh/Hq1ffd0qiUxvWDhkxcOehgOKA==
X-Received: by 2002:adf:e196:0:b0:236:740f:f234 with SMTP id
 az22-20020adfe196000000b00236740ff234mr5013437wrb.518.1667135450342; 
 Sun, 30 Oct 2022 06:10:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p2-20020a5d4582000000b00228d52b935asm4168654wrq.71.2022.10.30.06.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 06:10:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 14:10:48 +0100
Message-Id: <20221030131048.410237-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8vnxAGM1BX2Kvl1HVcXxO2YJs80c2Ulbm8yIh75XGDo=;
 b=ec5SMKdbeOyamLb3CmfoS/rL7+W5aNtTqE1Ez5l5ZZXRru9Xn55P9RPtvw5PXWNaff
 +ejcxmTLzSuVW/77935M75RUv8Va1lhzkR8yktpTo5xSPhiaiWj4RuSWUFenjB+RbBmQ
 3LQ//Ll+DOLoTZlRFzpRUw+jeoJ98KS5dsGO3TAx5Z0K+3L0LQn4QGaxMUNobarxkhFu
 s3JGXKg9AOW2QCgSTU4TYgiY0FPlEV0i4Pldz8x3Iw1RV9bc0mkwUwwQBHyflwRQ6A6W
 Mrbu5/ZiqxJ/Vm8ojhWdoHtiTHpz1M7OAFzxK4phkejMAfhHptxHFyIMtJ3UJpu1vMKo
 FD2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ec5SMKdb
Subject: [Buildroot] [PATCH 1/1] package/mcelog: bump to version 189
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/andikleen/mcelog/releases/tag/v189
https://github.com/andikleen/mcelog/releases/tag/v188

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mcelog/mcelog.hash | 2 +-
 package/mcelog/mcelog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
index c64e652453..e0350b085d 100644
--- a/package/mcelog/mcelog.hash
+++ b/package/mcelog/mcelog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  02eb3f4cb0976048f191d124fb45a1720caf082cd246d858acb0a39a9d026641  mcelog-187.tar.gz
+sha256  30364d134ff416f3f9469720add84bdccea226268d334f06022110f484550cd9  mcelog-189.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index de1b76cfd3..8b5876d32e 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MCELOG_VERSION = 187
+MCELOG_VERSION = 189
 MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
 MCELOG_LICENSE = GPL-2.0
 MCELOG_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
