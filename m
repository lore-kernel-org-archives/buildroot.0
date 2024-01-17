Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F91C47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 22:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 355F44214D;
	Wed, 17 Jan 2024 22:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 355F44214D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tppK8wOnf1Pc; Wed, 17 Jan 2024 22:51:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7970C42141;
	Wed, 17 Jan 2024 22:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7970C42141
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56E441BF484
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3041361589
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3041361589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MwtIzN7wNmVi for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 22:51:03 +0000 (UTC)
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50118614F6
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 22:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50118614F6
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-59923a4ee6cso923705eaf.1
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 14:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705531861; x=1706136661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pbR5YmF26pPjZnWmx4jnMuE6+AwVzj7bWHl+0n2k+dc=;
 b=pR/hfLUcacd9+QmcIOR0ca+S7+NeIMWAOBjR7F+Ug0d2dxz5WLyC3Ga5+BC7z6UyCP
 IEqPr1eHIux/8SQZQRbPWmDCsBGjSmwJjwFaI3MTfHFiaulgnECJMglOpqfiZxZFqBsN
 SqMadf08eyjcYU7Dt0J5mEx2KMT4vOB2jHfpcmCsYHrgBEXubXP1qfb1taEeF/Vtx5o8
 H61lQ5dTagXTv7CWbaMvB/9dgshQ5cLfGwtdibIurKM98rI1qPD/LGye01VUgycD4eGB
 aBCc2VtUZwJBJiD7NQf/oVkjsyrOmFoauURT7uN76AAvH5Q6SXH+5EqEUro/ID3kgWwQ
 pqwg==
X-Gm-Message-State: AOJu0YxK2ZiP+jKfVbJ/aU+AouBnXuNsXLr97dTnu0PrpYwAqXlpng2L
 4J7YWK4jCZ93f3QI2dSEkZ1+UF4wlyUiErD387Q/XiTFiDE=
X-Google-Smtp-Source: AGHT+IF0jOb9EOBywluFjEKMaRS24mPVz3wPnBkNHKcIZDeFHNrF1mQV6a7aqirVwr3DXYyJxz4WRQ==
X-Received: by 2002:a05:6359:6b81:b0:170:64cd:8aac with SMTP id
 ta1-20020a0563596b8100b0017064cd8aacmr7027248rwb.62.1705531861519; 
 Wed, 17 Jan 2024 14:51:01 -0800 (PST)
Received: from fedora.. ([174.27.218.222]) by smtp.gmail.com with ESMTPSA id
 p10-20020a63f44a000000b005c19c586cb7sm178716pgk.33.2024.01.17.14.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 14:51:00 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 15:50:43 -0700
Message-ID: <20240117225049.28443-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705531861; x=1706136661;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pbR5YmF26pPjZnWmx4jnMuE6+AwVzj7bWHl+0n2k+dc=;
 b=Ch9DALhldfcFu/lkpe7mbvSZl8VZ3ii69U/+9qAAJSCdqvXpfaQjv5rfHVSM2M3cK0
 XmIOAiaFoEGEh7VGqxxm+04zGtR24YzSo4uTgveZD8AEveROxz4dO4wpIyGaOEH+INYw
 y6NoqWlkOkZLc8a0zfYEjGjc+0FQLXmhvKoD4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Ch9DALhl
Subject: [Buildroot] [PATCH v3 04/10] package/flutter-sdk-bin: bump version
 to 3.16.8
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
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
index f0a855f2c9..48c9c7d7e3 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  57e59fa3a31be7e87b3847cdf782f1323578bbf70a0cd35f3615f01ab429ac29  flutter_linux_3.16.5-stable.tar.xz
+sha256  7cb12032cf615a92a7bc9042100f3f2af62df7df3ca3bee27f4b153fe218b239  flutter_linux_3.16.8-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 5e5042bea8..f644e5491a 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.16.5
+FLUTTER_SDK_BIN_VERSION = 3.16.8
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
