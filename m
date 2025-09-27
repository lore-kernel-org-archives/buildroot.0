Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C0DCAC5B9
	for <buildroot@archiver.kernel.org>; Sat, 27 Sep 2025 06:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E2486E937;
	Sat, 27 Sep 2025 06:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWERup6msNFm; Sat, 27 Sep 2025 06:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD3E361603
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD3E361603;
	Sat, 27 Sep 2025 06:45:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 613E0177
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 06:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51AFD61603
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 06:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fIMmLK6AeG3 for <buildroot@buildroot.org>;
 Sat, 27 Sep 2025 06:45:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BF6D615E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BF6D615E3
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BF6D615E3
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 06:45:49 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-27d3540a43fso33031655ad.3
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 23:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758955548; x=1759560348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/E8sFhFUvIFHUNkIZsngXhNRHQtvi8T+p4uqsHjAkDs=;
 b=r3n78P2LADijLMvXkNwwgiiW+t9nOBuapHQ6fCAZIDUTQnPVNL2Kbn9+MTYskA64eh
 /byojVLsB66TELzZdr7Sf0jjrekziDxTrRiAngSzDMzfNzoCnFmUxVGsPE4S/umiP6/k
 3WZeg5gMwUPPQgRkEI27wfoKqPsyB8P1XOtDE8sIIRUSN6JYYaLoXDPafybyrqf2xKWC
 nFYdmkIWRxYdjGuPI4AAs9p9qo7vSgxXGT6A3l2Yy8jk0GngRg3AmtuiXI1Uqpx6cKzw
 iUtobY3e5DKw84Cp5B0pDWo6jYpiGIOO3rUHLB9kq0evdVD1fbZpTvS2nJNlErzECuGW
 SpxQ==
X-Gm-Message-State: AOJu0YyziTNXRJSe8F1cUf87vGlZSZgkIGGTWvYX7M9RYp/Hh1o8BKlI
 eHu7KEMrEq4DVlEP0On7L6emzVpOncgNtSUn4wjHYEPD/yCdZGhsy8VY5gMVWQ==
X-Gm-Gg: ASbGncuSv4rXJsg3K0NJH/7l9pLcW5gcd/NN319cixDroz81BEb5ZVmG8i8SjTdUu6B
 S0tq5Rz19/dIh0e2QiFw49fjBYr8okFPL9e9ueZJ9iAihR1pG/SlEVWKqyNCQAV5yZodywWT/d/
 oJwt4KaM9R8lqlhD3nXqmW1dfqRCg/DeWY3Qt4/fopuKJav76peUbS1mhBaiaLkDFxqLVzMrekL
 ZDzTcePsAUlPcNxxiiIAvOINgGaFPv5fm3VOoKm0ggWGsFt1/19uHg/78JYnCNf6Zj93lvBfgI/
 3bj4Soan74cqI9S1VyrWDT4yjJcKCh3/7LDE1l87Eh8a7fIFuuPEigiv14SDN5YaMTTN2lT9yUk
 zL4ej9Y4RMgDYMed7A5I=
X-Google-Smtp-Source: AGHT+IH7qLtfdQqIdTrOsk2e44L0uKUvl56p6xxTNCs3sCZzR/DJQN23JL/3Bm+ATCf4J84nSrRakA==
X-Received: by 2002:a17:903:22d1:b0:24c:bc02:788b with SMTP id
 d9443c01a7336-27ed4a92388mr91483475ad.44.1758955548141; 
 Fri, 26 Sep 2025 23:45:48 -0700 (PDT)
Received: from localhost ([66.112.214.180])
 by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-3341be3a010sm10770113a91.28.2025.09.26.23.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 23:45:47 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Sat, 27 Sep 2025 14:45:41 +0800
Message-ID: <20250927064542.174906-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758955548; x=1759560348; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/E8sFhFUvIFHUNkIZsngXhNRHQtvi8T+p4uqsHjAkDs=;
 b=WSSAA8CUXO8A13YSQiRnSFnftY6FtWWjJimErhaO1tr4hwwFvKERBhQGTy1FCVoGIs
 Qupw/IclKhZ7ibzF9bzucXb30voUEfJFvzNcIozzlfjpw2asx9cw0oyPf5ttvQyZMzl9
 A5MEMqBMbFxSFb0NV1aPNynxA6IWwmV5j1z7uLF3+gYk0SYZfY+piPGBfaZ5x9/wX1QL
 xZCU04BlGAP3Na23vie+C5OHXr3uEGTznBhHyg6wdJDpqNhP5zJSGDseNBKotSFQ1wbN
 y1g6Oq6KvlGBT31VfbIpsZRP4X0KtzCdjoSFbR8DQ1lM2NQfsa05pyGiS/gk+p2MRxZ5
 VLuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WSSAA8CU
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.21.4
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

Release notes: https://github.com/timescale/timescaledb/blob/2.21.4/CHANGELOG.md

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 54e122fcdc..75396c9164 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5b357d6c3e99cea3a5269618066cdebd9731e27da6e67e4181c7c6d07456ca70  timescaledb-2.21.3.tar.gz
+sha256  09496504e78a9896eaf7689929f4fa0ab40dde90d202259aa4dcf6ec32fe528f  timescaledb-2.21.4.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 593421dd7a..234420c105 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.21.3
+TIMESCALEDB_VERSION = 2.21.4
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
