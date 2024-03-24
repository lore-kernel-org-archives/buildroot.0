Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690E7C54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 22:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3802E81BA9;
	Sun, 24 Mar 2024 22:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FecILGja1isD; Sun, 24 Mar 2024 22:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E07C781E4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E07C781E4F;
	Sun, 24 Mar 2024 22:51:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E97C61BF861
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC3E581D5A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuWo5oYv92wz for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 22:51:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC50181D11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC50181D11
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC50181D11
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 22:51:17 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6e6f69e850bso3142410b3a.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711320676; x=1711925476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HjD4fipgzXEytUzMj1RpWqlyCczBIqc0RDqUDTwu5nQ=;
 b=xGkUKcUdYCTsQhOWA9ptQWU8EvCm9fUQfRCSWUlgHlCTCqjoKYN7FiBuojGiUKz2Tb
 RtCpJR1quwVZoToLomOSeyvbGFkoIlVgp1gWxO2qGh3PuQthSbXnRK88TkgcXm5bdwyS
 G5M0w9Jkb4K8BcmNtlY36AN9AthWBSij9yhAGbMA4nvA7xiNe3/T1lLsaeMl8EcnqxcL
 Ndfw9+ceXhT/o2UjS12aP97EUT0N9223N/qsqs73ovMKVWMW95KaHaNw9gy0AljhYNfq
 6ohNXqjan9aGNNwVju8CsElu1N0S7DxTh9AFsPWW8K9Lyghx205D+yoYZ02m8FeJK9yN
 OwBw==
X-Gm-Message-State: AOJu0YxUsoz1YfhyUdl71IqBQY/rXlYv/CPAnKYhvZ3qSp4Yl3NuYBG9
 G90/1TiX7JhwkHWa9L4zY2qcimpqyLd8CHMDlTVme2Z+YngYJVjmsdBTL1HAxMDGXbx4HqyIYxM
 S
X-Google-Smtp-Source: AGHT+IEcfJZ4KPjixRINVIFEz4bM4r7/f97N3EDYX8h87Ka28+LZTUtGTBL1fjo5O6WmmBja2EXguA==
X-Received: by 2002:a05:6a00:2d05:b0:6e6:a908:f213 with SMTP id
 fa5-20020a056a002d0500b006e6a908f213mr7490204pfb.12.1711320676609; 
 Sun, 24 Mar 2024 15:51:16 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a33-20020a056a0011e100b006e580678dfbsm214031pfu.193.2024.03.24.15.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 15:51:15 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:50:50 -0600
Message-ID: <20240324225052.629874-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
References: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711320676; x=1711925476;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HjD4fipgzXEytUzMj1RpWqlyCczBIqc0RDqUDTwu5nQ=;
 b=AhHW+uet9MoEGaFU+SbCcJ5l91/BZlC7uCSBjpSsaoKqRDfujGniir4hhW9ouYOeqY
 4QOCIfzq8rPn19KEXkBP4ENMDMEUzpQO2B2aNzZUikdPzpoK/6ed3pEs+51/41h4QqCl
 QmizFINfF8vEPhssAJxioTHyLVulb7JacGiGg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=AhHW+uet
Subject: [Buildroot] [PATCH 11/13] package/flutter-sdk-bin: bump version to
 3.19.4
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index 48c9c7d7e3..1102c50cc6 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7cb12032cf615a92a7bc9042100f3f2af62df7df3ca3bee27f4b153fe218b239  flutter_linux_3.16.8-stable.tar.xz
+sha256  66adfe6b6559a2e2f1fdbf89c938d0af53add3860c854c79dbbd5452f5d2290a  flutter_linux_3.19.4-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 0d9a44596d..f8453c3090 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.16.8
+FLUTTER_SDK_BIN_VERSION = 3.19.4
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
