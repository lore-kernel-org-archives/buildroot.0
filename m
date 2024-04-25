Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44D5C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 15:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91A2782BF4;
	Thu, 25 Apr 2024 15:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEXEfVJC3FKV; Thu, 25 Apr 2024 15:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9322682D14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9322682D14;
	Thu, 25 Apr 2024 15:55:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 535991BF35D
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 15:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C477415EA
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 15:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiNu3dKDxqoZ for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 15:55:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B2474159F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B2474159F
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B2474159F
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 15:55:48 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56c5d05128dso1172849a12.0
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 08:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714060546; x=1714665346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=toNV+ZTl/TsiDrMOPUF+UteTk1OZnr8pXVX0Le/11Co=;
 b=IV3bpRUkOMQFiSOdw5d+VgYCFTFMfKy9foR9b/h9BJIVr7FmjiDMLYccTMNEqpv6YP
 PXyu4F+nkWmC58nm3QCsTAxus/SesCinAawbFAD/E7urJ0iHvO4m8RcVYoNzKw5VeudJ
 kbTV42FLfiUmqVVFEz7g//24VOeAtJegq67sxRXL0pL8ZkryhYoAdGzF15Fj+eiLvXAe
 uFcYuKqb6kJEV4CMI6atwUA6OoL0a5QCFxdhvi0Zo8TjUc5nn8CFQ5kx/AabZl8wUpi3
 eWunv5HT7Aeg71I73iEdrEE7idSsH5P4doi4jOoOcWcGEOQ2w6XLGIRmaanZiTZv0AlE
 879Q==
X-Gm-Message-State: AOJu0YxB3gPny+Idd8zKWRx6M30GJa7zY5s9TG9PYyZfS6lM70wcahof
 wkfSemCbQrNPUrSwRhjFvx414yltecFe+7MHE5t5YRbwmQ5GDXqXE99dyQ==
X-Google-Smtp-Source: AGHT+IFdXNMCxCciWO7BatdEcIb/owQJo/6cjjBPNm1j7tpnDJBAJJbVwh4B99sRzBE9r6nUerLq2g==
X-Received: by 2002:a50:935e:0:b0:56e:6e0:9f39 with SMTP id
 n30-20020a50935e000000b0056e06e09f39mr31608eda.17.1714060546020; 
 Thu, 25 Apr 2024 08:55:46 -0700 (PDT)
Received: from localhost.localdomain ([212.22.152.70])
 by smtp.gmail.com with ESMTPSA id
 y43-20020a50bb2e000000b0057000a2cb5bsm9462061ede.18.2024.04.25.08.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 08:55:45 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 17:55:42 +0200
Message-Id: <20240425155542.537203-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714060546; x=1714665346; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=toNV+ZTl/TsiDrMOPUF+UteTk1OZnr8pXVX0Le/11Co=;
 b=N/wYgxtqR14J5IMUq5OljZ5/dUoocFFYDZe2+i7yCjCzaIQIEqR3EGk7sO9476o8n5
 2dKFh/nyrpTJn8BCfpo4qsOeutldMpkVvorQghhU33pmAEt1FxHYoocmnCtdJfRmx6pA
 /xwsyjNO58TmRYCaWR1uY16sNNlBTTcFmdL+rSS46wdxon0SHvY/PfB0XM5CAchmgUe1
 jE3bpCZQxhSVsBFYOwQkActqACWmAB8sFEJyr1ZjWhNwwZJEwm3XIqz88voHbu62DDXV
 JOrgby6/iKd20gThSfMaAljeb0eWCzeB0runr06PtAk8V28faA0XgBYePkR45xJP/hq0
 wDrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=N/wYgxtq
Subject: [Buildroot] [PATCH] package/openjpeg: bump to version 2.5.2
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/openjpeg/openjpeg.hash | 2 +-
 package/openjpeg/openjpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
index cfa0e01b7d..1e72054724 100644
--- a/package/openjpeg/openjpeg.hash
+++ b/package/openjpeg/openjpeg.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0333806d6adecc6f7a91243b2b839ff4d2053823634d4f6ed7a59bc87409122a  openjpeg-2.5.0.tar.gz
+sha256  90e3896fed910c376aaf79cdd98bdfdaf98c6472efd8e1debf0a854938cbda6a  openjpeg-2.5.2.tar.gz
 sha256  a6af136f3e15038a666b61f376612a07d9a4e48cb7c01adbf3e33b3f14ab49b6  LICENSE
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index 5b03a6cf58..e7cb7505e9 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENJPEG_VERSION = 2.5.0
+OPENJPEG_VERSION = 2.5.2
 OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2-Clause
 OPENJPEG_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
