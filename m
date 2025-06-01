Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A880C5B559
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 13:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3844860B1E;
	Sun,  1 Jun 2025 13:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsjCVNhrv_R6; Sun,  1 Jun 2025 13:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D8DA60B2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D8DA60B2B;
	Sun,  1 Jun 2025 13:28:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8F631F7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FA1640841
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0XdFoamaBMh for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 13:28:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8DBE40830
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8DBE40830
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8DBE40830
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:28:40 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-553245cad29so3772695e87.1
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 06:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748784518; x=1749389318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+5hgYp7Y1HKUJjHvwTWGIJeb2dD2INoAQn41ILqCCtU=;
 b=wswE7sSRTT/AiqaLOt5xM7dPgpbeFdfvg5FLjlTS0UiXrICbw4IxGWw3ChEcJty0JU
 n4vRpDalwZLBijy3YsJgdEBGN4Dxf4XAq2p0RUq44XKDHEJpEB5y+FJIKt0kac01796K
 R7emXF6+7J6G5ZTFKYf52bHMcIz7TrZKsgwmP84gWB9siO0xLR0MIHlJD92IMGnLjk35
 nI6jhXebVaxGsi8EqA3NZP7zU2ntz/n1wYwsshMrOdn3PqiOUz/Bncwk+EDKiUTXLOJQ
 yrYBaxyEXtVSEzCkbFAit56Bg4+aNrJxAgzhTbpyJrg+cmFqpwnxXUdtOxeNMAn3FQum
 Iy9A==
X-Gm-Message-State: AOJu0YwGEsRua4Rte9tz4QdHZYVw8Lr1IpP+nn5LYN+lryh6/rtT3qax
 qqVUdwqVFt0Y67+sB4MKvfxnjzFYLsZ9x7339elMar1XWqM8ArVWlZ1uYysc7Q==
X-Gm-Gg: ASbGnctmduTFeCF1soPHR/n7okxaeoyAj45SQj0gEJc0bXvKmB77tK1IHvNb4R0bWzP
 pX6aHBRRU9KAd+kXMNN4Q2iPNhMnRBkDdVzy8SEvw0kMTAh8htOChudUOE5CH2vD/9I0Hor7XcY
 j1hd8aRrpa9dFmnlDdKxu3BRFlKVzHK8oASuVFaXkHLNdffvCOO/8+lNFfvwtS/uBi/FHG65Pr8
 us7caVNZpKbOwiSZqvDgLMSjTkm1dfNMCFsXlSnIKuSft1BgJ/2VovOjPGt3Vmk+LdaDDePtlWl
 LCOBGsqphBuBsLCOnD3JRLL9YiTAObLzQ0uN3JV7ieTWfwz0Tr3e1aon3tmoDuaYRLcA8gNxAhi
 napo=
X-Google-Smtp-Source: AGHT+IGvliwHVa9UlqquWVawUVgoEhuklysf10pGyzt6d+ZD5HtDQEliJpMk/iBZvp7BwzwXytIUyA==
X-Received: by 2002:a05:6512:3194:b0:553:34d6:d687 with SMTP id
 2adb3069b0e04-5533d1bb75bmr2706074e87.40.1748784518230; 
 Sun, 01 Jun 2025 06:28:38 -0700 (PDT)
Received: from localhost.localdomain ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533787d38fsm1275178e87.42.2025.06.01.06.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 06:28:37 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 15:27:33 +0200
Message-ID: <20250601132736.3582117-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601132736.3582117-1-roykollensvendsen@gmail.com>
References: <20250601132736.3582117-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748784518; x=1749389318; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+5hgYp7Y1HKUJjHvwTWGIJeb2dD2INoAQn41ILqCCtU=;
 b=Sh45B8Zx4ub4kMkDe6VVWrDB8fA4dqc1EJyIag7nVVeMqR6cnMRsO6mHVBaihDJ7aM
 Q88h5yVFav2GStvB9iiR7CHhLB/OH3PhcvcVZf/P7epqhnvkscoYRxsLkhKO6H3+NDa+
 WTiW3RWtxS4zoB2BKEQAdxtWgd5TPfsSOsW/Y+RfWxJryZxMMvo4JiGImsRUtgk4oOsR
 M82mfOYAt+2mhynMS09sDVF8N/n84+RnjP2eQ7V8C7vbT/r8RG1BDev9QvkQaE0KikL9
 JliFDfPauudR6bSwlVyh3ueeF7KSQCaAsNewR1z9UhaKLxR9GJshGWZH2irBO8hcyEF9
 eHNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Sh45B8Zx
Subject: [Buildroot] [PATCH v3 3/3] package/qt6/qt6base: remove unused
 hidden host option
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/Config.in.host | 5 -----
 package/qt6/qt6base/qt6base.mk     | 9 ---------
 2 files changed, 14 deletions(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index e38e99fbaf..bc605c6821 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -16,10 +16,5 @@ config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 config BR2_PACKAGE_HOST_QT6BASE_TEST
 	bool
 
-# Select this if you need host qt6 tools that require the Qt::Sql module
-# (e.g. qhelpgenerator).
-config BR2_PACKAGE_HOST_QT6BASE_SQL
-	bool
-
 config BR2_PACKAGE_HOST_QT6BASE_WIDGETS
 	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 39fb440be7..3ab1cff6ba 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -139,15 +139,6 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
-# We need host qt6base with Sql support for host-qt6tools to generate the
-# qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
-# available.
-ifeq ($(BR2_PACKAGE_HOST_QT6BASE_SQL),y)
-HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=ON
-else
-HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
-endif
-
 # We need host-qt6base with Testlib support when building host-qt6declarative
 # with QuickTest support. QuickTest support is further required for building the
 # qmltestrunner host tool. qt6declarative will fail to build if qmltestrunner is
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
