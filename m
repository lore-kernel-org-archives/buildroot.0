Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D067AC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 22:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CDC081DA0;
	Sun, 24 Mar 2024 22:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MpS0SmJKBECO; Sun, 24 Mar 2024 22:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 583C281E56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 583C281E56;
	Sun, 24 Mar 2024 22:51:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 133F81BF4E4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 004FE60754
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ef1yz0iPBbaK for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 22:51:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2999A60690
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2999A60690
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2999A60690
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 22:51:20 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6ea9a605ca7so535128b3a.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711320679; x=1711925479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q6PWX0N0KwAqCbz4kcrO5ARKAkVpjpsecnuE9wDrzRE=;
 b=sivs15dwOfuO6NbSJRuB5KTz5CgixHnLYdNVyvJ1k2xNOnoGq2mxb2cR5GVz9jsoI+
 ZUPLjKr5DYi8tCCIVYHmIrB0LLBJZMS239OzI5PrPgnGCMzUTHU1caagQ8Z31F6WleJM
 X+Jr+1nKesIHWJHLN2h0b4miskVErBqna5+lYhXf8/uxm8ElmsGmEdyhvYn+dze/YbI2
 EXZo82hHNpIh/FB2oRCOHaJt5uNFoDTUnN54d2BZfPf1/DGA7q2eWE0LSvQksk7h7FtP
 O9c2fRZTb5EeGwrALWQEIYqztEjWfCR1wI1s7Z2gnwkjXxNqZstZpaVKCp5x7wcftBjF
 o7cw==
X-Gm-Message-State: AOJu0Yx3soErBMBurhgvqCtQd0EAgkCHP0vu87zKM7XdZpH2cZeZck8Z
 5+WPfucQctgGYIOJVVE8QeoraOYcJJPTHEpuB1T4qo4NONRHk0vbS370qcgMFC2SGaHkWMGpkJQ
 j
X-Google-Smtp-Source: AGHT+IHHwYBH2nHjt7zc1D0VlOoUJGdjbC+nAxC6ChXB/e3wMuguV2Lh/C04PgbUDTjj2Qt+C5taiw==
X-Received: by 2002:a05:6a20:258f:b0:1a3:c6aa:ec7d with SMTP id
 k15-20020a056a20258f00b001a3c6aaec7dmr2127443pzd.16.1711320678783; 
 Sun, 24 Mar 2024 15:51:18 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a33-20020a056a0011e100b006e580678dfbsm214031pfu.193.2024.03.24.15.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 15:51:17 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:50:52 -0600
Message-ID: <20240324225052.629874-13-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
References: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711320679; x=1711925479;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q6PWX0N0KwAqCbz4kcrO5ARKAkVpjpsecnuE9wDrzRE=;
 b=PnSIXWYk9wpAlpf8MBmVtAQ3WDDhLa3pW4J8Lkrh/HuvmcIBFqY1cz3F6i78L7AzHz
 pPLCPl2gI3VzotDK/yzVjVs4Os8FK7gb7/wDZBEsOL94I/JUBwbx975YE4Egb2mWoM4I
 qlhQAbkoG8cRWUrA+Txsxu9/SgTr+5UjKmiKk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PnSIXWYk
Subject: [Buildroot] [PATCH 13/13] package/flutter-packages: bump version to
 611aea1657fbfc0d2564a14b08e12dffc70189bb
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

Now that flutter-engine is 3.19.x, it is safe to bump flutter-packages to
the latest commit.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-packages/flutter-packages.hash | 2 +-
 package/flutter-packages/flutter-packages.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index 994434e25c..eac58e608f 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8276276e050c1ea45787f74b0f8c915b8cf2162b6af8537ffa9886bd423f2828  flutter-packages-947e34ce9fedcdd6750b54eb1cc74b854b49ab48-br1.tar.gz
+sha256  a42e39a920d72183119b0e0bb7399513369a2aa7472f25da57ae95aad32e022b  flutter-packages-611aea1657fbfc0d2564a14b08e12dffc70189bb-br1.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 426d49290b..ef7e1ada80 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = 947e34ce9fedcdd6750b54eb1cc74b854b49ab48
+FLUTTER_PACKAGES_VERSION = 611aea1657fbfc0d2564a14b08e12dffc70189bb
 FLUTTER_PACKAGES_SITE = https://github.com/flutter/packages.git
 FLUTTER_PACKAGES_SITE_METHOD = git
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
