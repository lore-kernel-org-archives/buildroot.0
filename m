Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E08E9D411
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC9E160DFE;
	Wed,  4 Feb 2026 16:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Xw0d7aIMcWu; Wed,  4 Feb 2026 16:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2DD6608A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770222905;
	bh=XswBZfY0cswv0edhZ/7Ktxq2DyJdTPgfQh4XpXa2hLQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Ps5lK9gqTEqSBABFhwWb1Rr7y3tZCKGl75sEjBYRdIQ4wqJnpB0ZXrbPssy9teKDW
	 7iqpebMO7RDAWx5LBcSOads+OyQUqlzBwJA9FoDg7M8pWZ0hacHna6NhWD7h1kbGrf
	 mewHTmFKEJapzGo6GoZpFPAqbzrmFFjo10AWc0AYxzS09UJ1M3RwmkTH7fdG/Ovrce
	 gTGXjKIn1QOzkdR9Cx883SnDFM2Oj1rqKmlmAnUwvxhnPfWH3XlG+WIVd93mqC/0nA
	 Cf9aASRBM1309QBY/u7yd4snzEfjwX3uq1D/oqxEzE6/p0csue3gsMaNm+xujvB3KY
	 hnxyzJ0sbqYgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2DD6608A3;
	Wed,  4 Feb 2026 16:35:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2421CF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0886D405B2
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V53jUhb18p1e for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:35:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5183F402DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5183F402DB
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5183F402DB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:35:02 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4801d7c72a5so32115e9.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 08:35:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770222901; x=1770827701;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SAmRT03ZZXzzdjDfMUUMmdvfc8LN+e6WCcsyHG02BLY=;
 b=prLBe0E+gjYOToSUN2ENk+iRptyCklovSlswn1hLM37WbadQTSAVZqkUCeW5uKwVak
 PMDftFkBRlCXDARH1f8IGxZOuPuzYnqHQJO5auPDqZFy5rrq2RvBJLflplgZGXmLWw4f
 Y6uZlS09fY9fFvy7WzvKBt4fmEtJffSaxdKHziE4YflhDuhBlv4nQ+AdSv6W8mJ1Wz5l
 QJUB34PJ9W+m9+vToG9gBA4pP6iQj9C7SAir4ugwfctk/9rlsZ6dwk6xzWB8TCIxoEZ0
 MqfNZty1eVkEfnQkqECI7ubpwCseuNrFez1YYqx6RiEe+pnBcRqWWQ8mEqTlWMeti/EB
 RgSg==
X-Gm-Message-State: AOJu0YyY73Z4F8N6n78oyvwRNuEJezdNY0KdT9SCFa5QprxTONF2vo4E
 7qspMjLN4GPC7/lQZ2Mk9zixUfncFS25pQnI5ni0ejSTO3Obks/ofoLDOL0VYkiDUaLse1iLk7n
 CFU0R/3k=
X-Gm-Gg: AZuq6aJRydrVKNOKIZGYRie7rv2nM+KNU954QopGrs4tG1ANsu7vcjySKG7xsicqIno
 ONc+dX1bZiqANsVhMQe3wjLb3zCL5/57Ynfp74PA3V9NzCl3KrILnhbOQOzembVnfgQa60IQcLp
 qhPgDcygkhWa7nnPGidWPdYkKO2uPavEe3yyGR/X5ufqspB0uX0Du3jRvJroleKlzycwEKyFIrg
 uGuPcejBkMN2XLJHj9C5SdZke/wF1hc1iDHM6vTBwYbyltesQfkNqpFJhuOa2GgSQvAQCHuzp5p
 8V42W/1/N5wP9UGbI8hTutXU6tnRYDk5GFFP1XxtTz4FThVbjO+SgsDXt8eSh3D/sADpH5RpOON
 Z16MWwINVVeNR7ip+JB1IgOcr+zhDKkMHYvcMByesIb73f9ThuGnwaxEVxCejhNeQAbTjHPV1MZ
 CO8D4QiEG/aQ13O7mOdce7g9R036QONk1JkdHToVluO2i/PPcb
X-Received: by 2002:a05:600c:3acd:b0:47f:1a8d:4f30 with SMTP id
 5b1f17b1804b1-4830e972198mr46413475e9.26.1770222900859; 
 Wed, 04 Feb 2026 08:35:00 -0800 (PST)
Received: from dragon (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43618064844sm7267903f8f.42.2026.02.04.08.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 08:35:00 -0800 (PST)
To: buildroot@buildroot.org
Cc: Pierre Ducroquet <pinaraf@pinaraf.info>
Date: Wed,  4 Feb 2026 17:34:39 +0100
Message-ID: <20260204163439.777298-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770222901; x=1770827701; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SAmRT03ZZXzzdjDfMUUMmdvfc8LN+e6WCcsyHG02BLY=;
 b=QAckM/DF4liTaT5CTNGQNwpJ+SAUF6k6FwGeA/ieev4MQi9tCd7fJyQ8525m5ahlEa
 OLjGQtP9nPyUhIAa/ltFP+eoAVNhFRDeuQCd+ZA3dyhcYIFAI7PBv1hb4Z/h1bhAKfvx
 HVo7GSG+MycJ2qpL5pQahttJgyFURlzSgk4+ud7JPHo51d8jczyXJ7pqyz5gXn3t/Xod
 BX0wSHuNR1x56SizNVNbAKZAezqoR6Qw9SWBC6YvyYnCIpBGqwb4zgpJnfryxrNNw+5Q
 hVade53x8GWICM9xER+M592GGwQJGQUOTjOk02YhFxQZXGKnQuJ6UOKIMBJKFclUGEIw
 Kv8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QAckM/DF
Subject: [Buildroot] [PATCH] package/kf5/*: bump to v5.116
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the last (known) release of KDE Frameworks 5, read the announcement
https://kde.org/announcements/frameworks/5/5.116.0/

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash    | 2 +-
 package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash                | 2 +-
 package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash        | 2 +-
 package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash    | 2 +-
 package/kf5/kf5.mk                                              | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
index 70b776b5d7..bf87bc63b6 100644
--- a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
+++ b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9717885e30aadf184fa71511930409cabbf08eb6627ea8b051de8804fbcec54c  extra-cmake-modules-5.91.0.tar.xz
+sha256  e8f6d11a6ef478171f845d376523ad5c56e8f7fd4bae8791942cecba0b23cd08  extra-cmake-modules-5.116.0.tar.xz
 sha256  46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b  COPYING-CMAKE-SCRIPTS
diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
index e4ebf2bb39..ddb6af01fa 100644
--- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
+++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  dfe3da03260e0153f9f6ced1fc7464eaaf0ed1fb692fc6c2b2d968b629ad719b  kcoreaddons-5.91.0.tar.xz
+sha256  dfe3da03260e0153f9f6ced1fc7464eaaf0ed1fb692fc6c2b2d968b629ad719b  kcoreaddons-5.116.0.tar.xz
 
 # Hash for license files
 sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
index 4b6c03a3bb..cef63c3b3c 100644
--- a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
+++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a2673f18c7866d39c9cedca2f86540c56baf966a2491a86ca06a5a0427358496  modemmanager-qt-5.91.0.tar.xz
+sha256  a2673f18c7866d39c9cedca2f86540c56baf966a2491a86ca06a5a0427358496  modemmanager-qt-5.116.0.tar.xz
 
 # Hash for license files
 sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
diff --git a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
index de4504064f..9bf7ee4ad1 100644
--- a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
+++ b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2e20ffd995ce64a90b1133b594bab2b2292be54e538f62633e78e8296cc44738  networkmanager-qt-5.91.0.tar.xz
+sha256  0b4e80a4e110776b2f7bcbd4f6371ccbd8d9ed58f01c8a3738ce9c8ef1601b69  networkmanager-qt-5.116.0.tar.xz
 
 # Hash for license files
 sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
diff --git a/package/kf5/kf5.mk b/package/kf5/kf5.mk
index 64b08bae4f..9341ea89fb 100644
--- a/package/kf5/kf5.mk
+++ b/package/kf5/kf5.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KF5_VERSION_MAJOR = 5.91
+KF5_VERSION_MAJOR = 5.116
 KF5_VERSION = $(KF5_VERSION_MAJOR).0
 KF5_SITE = https://download.kde.org/stable/frameworks/$(KF5_VERSION_MAJOR)
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
