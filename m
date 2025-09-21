Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76073CAC5A7
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 16:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2409941356;
	Sun, 21 Sep 2025 16:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YvJDje5Zwgkr; Sun, 21 Sep 2025 16:48:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BCB34142A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BCB34142A;
	Sun, 21 Sep 2025 16:48:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 466C7D3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 385AC60A95
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxeiiY8dzVlU for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 16:47:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 38D31608AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38D31608AC
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38D31608AC
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:47:58 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-36639c30bb7so15287261fa.3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 09:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758473276; x=1759078076;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/xhgSscZSGYZaF3U5mMJ28Q5hCrcR/RdGkMRyczDm20=;
 b=uQRq7QAq9cPr/ruWMfnAAUgX/0vOpeXdcq8OfxJ7nSWWB0NUj/c2V+ggEivtU4qBNV
 E+TuN0OZWIWdp51K0pUrFa7XzZH3K5qNvT4iWI4OPleleW+K4lTOcBoJz9Cw4N5+rKaB
 3ePyGgDEicxkNbUqY/D1TOTCPE0iCF1sCv16fwXvACeXNSnFDrBoSVdkzCzqn4G2uOFr
 fITXe/GDJ33W8phlFqlZtlIE0z/z5bkbhB9Uq9SC52m0W/SctMTVm1/tSKVHaxdmM+Py
 qzGniqFGhgOOa/1ZcxCdG2mC4Hy8tvOxP+2J0yZNGjCc166OMh9a4TXW+AU5EKbLQeAX
 ILCw==
X-Gm-Message-State: AOJu0YwWWS4ngbrxSWj4ltVPJv+7Ss4/UeMiPfX/zhiI3dutKBF7ijqI
 4U3e9KWNW8GRrNPc/V6rnLrHq7yDkrN9RVvP8RqF6YPIUeQEQdRVKrq/qYpeX8+mybU=
X-Gm-Gg: ASbGncur6zizsvlCFHlU75WPDr4wsjYn3mPdJXhBxUyYGhxOOORY7x/xMFhuZD+oa7p
 nTyQCIOfRKURDfnqKO6m0b8GYQVYKy9SqF+QjdIe5XmapKcSKPJTL+0wX31mMLS3b9NpbLsDXa8
 WwTdf9Nqu8WNrdV6DBfuqHbvpHRpwIKCBu1jQbYzsuFBXAjvHgVKS8lSpDloKKtR6C3Nvjkt1Il
 TF/6HZMa4O/euZ+UB0arK3SbABStkof6yZ6auRZtSHaEium8XYYJ4WomfogRRB1qFCmSm21sKDd
 1Bq1nX76teOACG6Rmv0aBiSKQHcn5VQ7aCqczY3rvKOHVt2yGI7zKJ7gyT/9j2R2E+Wd+Y2oRW0
 OP8glv7Ksx1CS
X-Google-Smtp-Source: AGHT+IEQUlqe7y2GqEqDg1YJlb9JS5AjOGJRlRgG231aQIiLcU4SDspzVGbDiJg3uBPNT23Zho9YzA==
X-Received: by 2002:a2e:be9d:0:b0:36a:9d4f:4853 with SMTP id
 38308e7fff4ca-36a9d4f490bmr5453031fa.34.1758473275599; 
 Sun, 21 Sep 2025 09:47:55 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00::f6da])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-363f6ea333esm18450601fa.19.2025.09.21.09.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 09:47:55 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Sun, 21 Sep 2025 18:47:08 +0000
Message-ID: <20250921184708.557546-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758473276; x=1759078076; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/xhgSscZSGYZaF3U5mMJ28Q5hCrcR/RdGkMRyczDm20=;
 b=YmKlc85NRjDF9dJRVwv08B8Ns8WItD6HVcZEYCsRiiDGvVfa2VoQdpPxYxp1MLIX0O
 ZZvFm+Q620+DLXaIsyIxthTuQBUo8xdXrEePH1Idc+zi4wJI/cLMyHusJQcHlReu3dTq
 5JKjKcksMNoKiB3F725nHYcu9V1HO2pt7XRLlRt5g5/jpAxkT9XuSIHivoPCXkODyP2L
 EGlJpZXD1XKZubJxaWZWwtICW402SYiVV2OE4dHnYZVFm23uMY86p9cJNI1NKeUGy2NN
 ss4cBxS372YCJgm2vT4wrlGx99sjrFa08XNwfNDK6nVvrOSd0ZPFdsSqXZ/X5Q9EJPVH
 Opww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YmKlc85N
Subject: [Buildroot] [PATCH v1 1/1] package/shadow: bump to version 4.18.0
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

Changelog:
https://github.com/shadow-maint/shadow/releases/tag/4.18.0
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/shadow/shadow.hash | 4 ++--
 package/shadow/shadow.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
index 985d8eced0..68703e6082 100644
--- a/package/shadow/shadow.hash
+++ b/package/shadow/shadow.hash
@@ -1,4 +1,4 @@
-# Verified from https://github.com/shadow-maint/shadow/releases/download/4.17.4/shadow-4.17.4.tar.xz.asc
+# Verified from https://github.com/shadow-maint/shadow/releases/download/4.18.0/shadow-4.18.0.tar.xz.asc
 # with key 66D0387DB85D320F8408166DB175CFA98F192AF2
-sha256  554801054694ff7d8a7abdf0d6ece34e2f16e111673cc01b8c9ee1278451181e  shadow-4.17.4.tar.xz
+sha256  add4604d3bc410344433122a819ee4154b79dd8316a56298c60417e637c07608  shadow-4.18.0.tar.xz
 sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 41b0122f62..2ba7a0e03e 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOW_VERSION = 4.17.4
+SHADOW_VERSION = 4.18.0
 SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)
 SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
