Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5C9C369B4
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 13:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C31E240527;
	Tue, 15 Apr 2025 13:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emTcnhG7vR5w; Tue, 15 Apr 2025 13:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C94140833
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C94140833;
	Tue, 15 Apr 2025 13:55:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D031200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 13:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1BEA40527
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 13:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0kPzCbwNPPE for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 13:55:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A4F340833
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A4F340833
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A4F340833
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 13:55:30 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-736c3e7b390so4669616b3a.2
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 06:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744725329; x=1745330129;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f16+2vJDna8MnWNitLABhka15QyvaYbaXmnjGzG3Kvk=;
 b=ZOuzwS4DOGUd8WNhd8DIyzGSGBbbAgRV4Cg2WKFfJBKwbBPhicMPvqJnK+VjKKl6UE
 FzNGrLsK8WX4hWO6bqiPdd8ozmao/62POOmdzkW4KDOmwOMORVUD2cLa2KFYHBdEEbqg
 7BA76KkyU3pt3GMjiSDgV9DmOREzWJlW5ZW/edkXFfE5GtbNHeTCreZal7FawbJ4p93Z
 JjDpOV2sVeLnmjsYd1Sr7pC6rHbDnrvazXb3Iw7uaOTme5/SGoeMMt9hI2BdD50cLB1u
 apwfJ+8KaGIWsHOf+qgM9DRuXWJuJkMZgwMUo3ekKYTCLSEbBUvhyDqcnlWVXivhP9Lm
 RbFg==
X-Gm-Message-State: AOJu0Yyq303Liakc2Mb2IwyDPm5XFUVSG9opFFnaG8dQo1bFxEZRl7zA
 idwGvDC/k3IWn577lLIK43tjlpZCxaY7ktie6p0MtdLERKf8T7A41RS3QQ==
X-Gm-Gg: ASbGnctdYH/Qgp5+4LwKSNgHQtS2XCNw2xEBtHvW8Ke8ST9TkfBaiVAK38onoVwQXTh
 qnRYm6l/aZ6xlk8bmzPNOuXXUFM0Oa5caayMf0M46gGoZBtYqj4Zhrnd+7ngBzVKpERwCJEpcO7
 23L6u1cRSaUM7TdgVxbEdH7I+Tim+NkVyHcP27Si52cNA3u2oMFl3v+V7fStS2FRHJEhF7VmpBp
 Hz2xSNcTgKPSUlH+dvXb7B8qevNNC5j5WdXfsK5t79hiqOI/GYuC0BIDoLBO0EEKDniHV/WrKR7
 Zk1sBigLqLLBROC3vhWHNPs5nwpvH5G/
X-Google-Smtp-Source: AGHT+IFVGkaaRvjeE88H5XBaVfOfvVsBodcqHFbdVjjFh55NQDEJw1XfoZIJxTtv9bV75Ur8rkocQA==
X-Received: by 2002:a05:6a00:390a:b0:736:fff2:9ac with SMTP id
 d2e1a72fcca58-73bd12a82dbmr20174036b3a.23.1744725329338; 
 Tue, 15 Apr 2025 06:55:29 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd22f1012sm8792800b3a.96.2025.04.15.06.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 06:55:28 -0700 (PDT)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Cc: Lance Fredrickson <lancethepants@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Dimitrios Siganos <dimitris@siganos.org>
Date: Tue, 15 Apr 2025 07:54:59 -0600
Message-Id: <20250415135459.1939063-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744725329; x=1745330129; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f16+2vJDna8MnWNitLABhka15QyvaYbaXmnjGzG3Kvk=;
 b=M0to75JPsVEajbqqLhdqeRvjvZ5Cl1SsIxql2XEov3deVT/cdLTfatFr9xYzpJ/QK8
 71kfcQq1gzJ6/p9UrIyrBfXmGz6N/UxoXUhSgfPflk8rwuJ5XM67H/o+1mND+STvxlK3
 BHf90DTCONE/oVZLzalVgaxiW2C+E1aayyGJCrQ/ZoI7mRx7ohrnr+mRRZjbkQl5H3se
 cn49XrHqZPJ9hhLAeyzzVRxwyM3bon0fO1qeVRJaZMgWs45EnJAU7ud2e6raA2Ghh/5K
 fPiQjs82/iBLfejn9uztlIzM2ZUFitg6Gz+oKT7VorykTkBTdLOg3Fi9CK4KzWNVW+SC
 bK+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M0to75JP
Subject: [Buildroot] [PATCH] package/wireless-regdb: bump version to
 2025.02.20
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

From: Lance Fredrickson <lancethepants@gmail.com>

See release announce:
https://lists.infradead.org/pipermail/wireless-regdb/2025-February/001686.html
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index a3b5973bad..cb915c4415 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  f76f2bd79a653e9f9dd50548d99d03a4a4eb157da056dfd5892f403ec28fb3d5  wireless-regdb-2024.10.07.tar.xz
+sha256  57f8e7721cf5a880c13ae0c202edbb21092a060d45f9e9c59bcd2a8272bfa456  wireless-regdb-2025.02.20.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 2aec19c507..999a986de2 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2024.10.07
+WIRELESS_REGDB_VERSION = 2025.02.20
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
