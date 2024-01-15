Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6686CC3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 10:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CAD680FB1;
	Mon, 15 Jan 2024 10:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CAD680FB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JG_HG-9ihhEU; Mon, 15 Jan 2024 10:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7376D80FA4;
	Mon, 15 Jan 2024 10:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7376D80FA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5F7C1BF4E5
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 10:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABF2B80FA1
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 10:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABF2B80FA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k0o39Lm6K2rI for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 10:53:45 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A3E680F73
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 10:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A3E680F73
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d3b84173feso15726265ad.1
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 02:53:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705316024; x=1705920824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TCez1qAlqJH890ls/mslHmkilI+q1kCUObz6SIKmd34=;
 b=B457Kw1ulZ3vRigTqpmaKut8xSns8DxD8tEb29JKWV8Ke1ed2nsDbNCVtJiwp3jBXr
 oL+1lWg6nWntgnG6ekWL6tCCtcn1KvGhpuY/Wy++kFLeX1caTfM2MI0GhSRABva3ievZ
 ScuIil7xtWBFO32ZlNdrVV291Ui9MTuGkB/fpurJDicSXnxb4GA7X/xT/60vryW1Iyqj
 SwSs1sjrVQxBsDFz3L4WDDVaysx+BjjITa41PXcaRIIgiqUNfN6JboxQ6ZFVVBtMPbti
 9A4q/BImFxzXK3Rs28FcI6v+PoTC7g805ok/9F1KrmGkiqG5VmKHJ/gFQdJPbtUs5aDi
 YhMw==
X-Gm-Message-State: AOJu0YwXUgG5lXoV2EDNV31YJLbcbZ1EfzeWNFSpHQ984LklFZ2AqM+j
 1SjzI+BuddzkmdwlOHwCfluyiQ39QTw=
X-Google-Smtp-Source: AGHT+IHKArolxIYuWoTyHgWLhm2aoJ+AltrS5ip7hhUblHocSutLYZLju5OwfVWm2yx7PHg5pl86Nw==
X-Received: by 2002:a05:6a21:8199:b0:18c:198a:469b with SMTP id
 pd25-20020a056a21819900b0018c198a469bmr8954841pzb.6.1705316024091; 
 Mon, 15 Jan 2024 02:53:44 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:2104:76ba:2f92:11c3])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a056a000bd000b006d9b2694b0csm7372911pfu.200.2024.01.15.02.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 02:53:43 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 07:53:36 -0300
Message-Id: <20240115105336.3178049-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705316024; x=1705920824; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TCez1qAlqJH890ls/mslHmkilI+q1kCUObz6SIKmd34=;
 b=KT3irVa5FpfWZkY9k/Bsw/FcOQTdO1HMSlQ6fhv3SHCfPTA2RyBMk8Yzd21t/2jqN/
 Q9QCRzLilmCO7FyweiszWPwQL2HcURoC3LVVvNzmdIkrxuw6abONx8qjGrswz1er+Na9
 HvhEnpketv7dx5ly98l0zMn9BXS4l2FwjL+q6CRaNyh+dC/KU4g4XwhwTVojWlRQEnxM
 XmG7cUJjJ34iKUtet1FFfhiBYFpaJspjEqMmImkhN8aFrum5V2dDwbbFMrzTC5rnC8f5
 eggT+xMRQ6oTShuNZKKWP7pXyHKV/pC54U65hwENZ4ECcCN5LECrEBqZ3e7z0FarU7KA
 JxOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KT3irVa5
Subject: [Buildroot] [PATCH] package/crucible: bump to version 2023.11.02
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to version 2023.11.02.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/crucible/crucible.hash | 2 +-
 package/crucible/crucible.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
index 256513da6b98..d5fee0068d8e 100644
--- a/package/crucible/crucible.hash
+++ b/package/crucible/crucible.hash
@@ -1,2 +1,2 @@
-sha256  bfeaa9b1c8bb95f02d33bd915892e748eb8939fd8b901e1d31d2efa7f7aefcb3  crucible-2023.04.12.tar.gz
+sha256  d21842f050163765269290d72fe79d3f95005038e865138d94e247cb455098da  crucible-2023.11.02.tar.gz
 sha256  d88514630470aec9fa7abdc990a1e0a8751a752321bffa868188c49009d64d59  LICENSE
diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
index dad89b214956..2206663e248f 100644
--- a/package/crucible/crucible.mk
+++ b/package/crucible/crucible.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUCIBLE_VERSION = 2023.04.12
+CRUCIBLE_VERSION = 2023.11.02
 CRUCIBLE_SITE = $(call github,usbarmory,crucible,v$(CRUCIBLE_VERSION))
 CRUCIBLE_LICENSE = GPL-3.0
 CRUCIBLE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
