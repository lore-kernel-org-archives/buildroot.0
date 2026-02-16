Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13397E81A40
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 16:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4DF660D68;
	Mon, 16 Feb 2026 16:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tl7aXfwWrogf; Mon, 16 Feb 2026 16:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D74F360D6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771259480;
	bh=wPiu+WUM7KNJ1f4QSHgr1wLzbFxbeikRKrpA82W5qcA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=CiUJRJDbK31ldkgV8RKvnXlsk+54HvEsTxDDWisPQJ4QEu6Cvt15oefllPuG2CIwH
	 X/p39VkdQBxZCp0CMBVGT2yp2raqov7Is9HQdEsja14NYm0h78qPA9CUYvgWtzK2YO
	 ntt32EDh8XSzkoO4T68guZt454JvvdkRg3bS0UNJhyfnwWVN1EaRcXcC3BX21QEkDz
	 GXeeZvpcQbibJvGogzCm8T18BBclTmHsnVgTtP4QrkQuoVGCdz4aAmw35UINi7JYs4
	 4zT7Pgt/h0AK8xp8VjKxPejolL3psxPSL/a9oHAuRk44hG22C0S74QNZ8OMw7VTTJN
	 Vom9Ob6PrUMLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D74F360D6D;
	Mon, 16 Feb 2026 16:31:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CDE235B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 16:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 368FB407C8
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 16:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZ-M_-K5ZKga for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 16:31:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E70D40791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E70D40791
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E70D40791
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 16:31:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4834826e555so34651455e9.2
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 08:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771259475; x=1771864275;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Vf1+zd/huDBwcrM+XcxNcLV9CX4dKJ9dT0gXqaJy18=;
 b=do6uMGP5oei+hcoMYtWfi1V7vBabjZffk1gO6PSNaZgzYam40en8T24Apjb31VXyrV
 KJYLsPqA3zW8WEauX/Q/4jU7MmHTL0y6gx+z0G1qsiAWJwWRMEPHAy1R5tiTgS7D3rO4
 l7wpKmwtIlz+AgHPn9hdaD+7Uo1LKx3uh2z/KlFgxm/T5UsPc+lry8NK5FeU3wnSQk2/
 ywgea1IkpXqP/OlG7xK/AhNMbKtsp6Tgg2QL797KK4HjnI5I/4wto7nXc0Zi3MG7ooei
 A62vwAKGO1SubO2K+CHi4i9LJVqUzlJl2t+Pq1T3hdJeWTLhVVcXYbAyNfIujAgcUHeU
 jghg==
X-Gm-Message-State: AOJu0Yx8YLAR5yYktegMelGpneHRqvXO6q+QVosEI3I9u0rWqHObGx89
 CiOhrm265jP9AHhUHUE6wNtmmVD5UIwpD5yJz4mMTrNg1Y4udc7sVMbtEReJngxzhFuaB4anOGg
 Qx7p6ygo=
X-Gm-Gg: AZuq6aL5c7XiHfsr+K2nkjcluuipn4HkwmDN7YNWZRrbOSI7tsBqMU2gYiDLI3vyUrH
 k337RIHqFCvoAYeIkaj409h8s71G1rUgExLS249VX4LBLncvJWiWnYkx+UtDC7JlwYYrlZn8HcS
 bZzTn9lOb9tWblEN4mk/TFMg5GtNqMu7SzJg0qWjXOIRckL2PaKerubN3DaS+AL3yXqmRwoNfwz
 DHskW28+pF6EPPBTnnrzwA0oJuMiIi2Ha8Rmowgj8Oz3VniBMkNGed9uzyUn9ZwzBHJ1/Mo9swo
 cTLa8S1qV/YHvZRYmmGd9SL1c7v3JLB/Abm9aaB0Mdy7Ka35NIbWJFx3U7KGJX28Lp9KxmqArRK
 UEGJWOovytDXBjNqr+YdzaWOLT9RezdKL5A8AzQoNdSJ8UxtFdf2sPAx+FMW8az1XuqpQc5mT4/
 9gJd25jvF0F8qRWm5AAGRt86szdr3s43BF5/yKMG0mKCTE094kYLrcfQYeFA==
X-Received: by 2002:a05:600c:154f:b0:483:3384:a873 with SMTP id
 5b1f17b1804b1-48379c15d86mr136661775e9.36.1771259474862; 
 Mon, 16 Feb 2026 08:31:14 -0800 (PST)
Received: from dragon (ptr-94-109-131-55.dyn.orange.be. [94.109.131.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7e50casm446133115e9.8.2026.02.16.08.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:31:14 -0800 (PST)
To: buildroot@buildroot.org
Cc: Pierre Ducroquet <pinaraf@pinaraf.info>,
	ju.o@free.fr
Date: Mon, 16 Feb 2026 17:30:57 +0100
Message-ID: <20260216163057.360035-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771259475; x=1771864275; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Vf1+zd/huDBwcrM+XcxNcLV9CX4dKJ9dT0gXqaJy18=;
 b=KrZKgvnm/CzoDv4Pnv2Yv2bqDd05IjytE/rhKHPpIoOw4HMkakKyFkbo7qvIlE77qS
 npEf4/vhPREGbkzSesOsrS3CtAnxZ4c5JxbfRz9Wx1czQ8QLDDQLMeQ0TSXzSLZEvWcV
 OIb09kLpebC2Ld1FnmcMe95dzA7m4F5C/WlvtuuMoGaCU3wbP45htgGwtNjhm4HlOMBw
 9q9wjDdiHB0ELu5L9s1m6vU9YRCm2pZwMCzWkkUNx/9jSJBxrnz3ng8DUtLGruEKNOzQ
 4reqtCvYvfSmb6ZNEY4rvtTZWJfmc9r23nEnMFYhNLJIdWYDWpIxKGCSp/opxDlP2/Gt
 HUiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KrZKgvnm
Subject: [Buildroot] [PATCH v2] package/kf5/*: bump to v5.116
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
Changes v1 -> v2:
- Fix incorrect download hashes (thx Julien Olivain)
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
index e4ebf2bb39..f9b631827f 100644
--- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
+++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  dfe3da03260e0153f9f6ced1fc7464eaaf0ed1fb692fc6c2b2d968b629ad719b  kcoreaddons-5.91.0.tar.xz
+sha256  defbb4c068fcfccf7a08298ee6f7b88f9c2d3f34e4ae22b8f8e2df47dfb73174  kcoreaddons-5.116.0.tar.xz
 
 # Hash for license files
 sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
index 4b6c03a3bb..db1c37960a 100644
--- a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
+++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a2673f18c7866d39c9cedca2f86540c56baf966a2491a86ca06a5a0427358496  modemmanager-qt-5.91.0.tar.xz
+sha256  06055351f3a6f8755df60f48b3fdaabb4a406939b9c777f474e8a22bdd116f80  modemmanager-qt-5.116.0.tar.xz
 
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
