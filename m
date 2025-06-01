Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C609C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 08:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D916C41E11;
	Sun,  1 Jun 2025 08:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edBND60dv0-o; Sun,  1 Jun 2025 08:46:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EECA241E15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EECA241E15;
	Sun,  1 Jun 2025 08:46:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1C85222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3DCA80E6E
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tru82E9eQdKN for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 08:46:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7007180E6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7007180E6B
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7007180E6B
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:34 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-551fc6d4a76so3794446e87.0
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 01:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748767592; x=1749372392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5naTyxS497QlhgbCfbVrlvbFHLEpVuucSxLIBQhqZUk=;
 b=Ogz5hgLxwRLiTv1sJg0K0JQd3omftZ4RHiy4e96T67NR2RILBCi0F8JtXyyZPxFj1W
 +o9NC3HCdvtuUy314DYVKbFMK2+AJisqehoVOwLH/kvruv9nC/EZRzlwiTU5LMOfawPv
 L6U0KxmFXjxyMdqeneqEVnhgayRCHP9+5G4FXNN0Gha6DtWvSKjsRExODS1fGFBUgryu
 yjK6uxIseW6XXNbdc3l31gMdH9RAZ2BsP3sHOuT8VXx73AVcWvbk0g4TZuNs+5juMI/5
 0THHOjcwy0RVigkXwQMo2IpmgTmZhEHvchwsKviPtxTZ4FkGbMlL6A+CJyaZ/DmkkF1a
 QuFg==
X-Gm-Message-State: AOJu0Yxz98vBbAxsP5Ge7yYml1Pk1yQsmARFm1Ecmu1BqieGrkWe9xxX
 sUDvdqoBf/M2k0m7k6MsztFyBEgU0Y9P+tN8jlT6xAJ0DotUXGvWQWF+4mMbMg==
X-Gm-Gg: ASbGncuC8ZUfP6vXKQ0sTTQoNCBfm1uhQ9tQfADCZXS/1o45wmeahdZ6IF07iBFoMa1
 43/4IdIvgip1g2vZzhB8dcqU7WZYG0LaCBume+5/OPQp/2l2nkJHRn8wHWBF6azVsSA/pwypmdT
 ikvIiU7XPdFybI3nZdpwr1NVQIb22P8NgRR+fiskuVghjFvo8n5srVip29aOQYAw7y0WvqVao85
 ypnw2u6t/4Sb1CyrvXXGyt8e8L6fy48W6r7SXQZiKWGEbmZ/FpJS1lf8Ap5/E/hci//N57LMuca
 lT8G61+ZDJqnIbvAy90/J2GkjDb/dAZayZdiUGXC4LmGiBT8+AXDgFRd+98jMbUsm50iR7KiTBD
 kVuxSpqQSLQ==
X-Google-Smtp-Source: AGHT+IEVHpm/H7EJZqjSpf1llsfg149/vdKT2L+Jv6nH0+7B19spKBopTk2QdwVlFv84CQaLB9jkFw==
X-Received: by 2002:a05:6512:1322:b0:552:1c1b:561 with SMTP id
 2adb3069b0e04-5533d16ea8bmr2336207e87.23.1748767592050; 
 Sun, 01 Jun 2025 01:46:32 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55337937764sm1227020e87.231.2025.06.01.01.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 01:46:31 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 10:46:12 +0200
Message-ID: <20250601084616.3104736-6-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601084616.3104736-1-roykollensvendsen@gmail.com>
References: <20250601084616.3104736-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748767592; x=1749372392; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5naTyxS497QlhgbCfbVrlvbFHLEpVuucSxLIBQhqZUk=;
 b=eeRMLoPHh98sLe2zz8OGgz7nGVc7K1a/7KszoSTARph6XADZpdJ17piZy82AlbhzGI
 I1VN987xe6IqEVP8Yd308U6r5VuTK4KmWdyGG605mPmJNp67jWSzykqlC7uHBoGSA2XH
 FyWx59fnarUdhnvyHBbc07MksHUOqtChtomI4PYOhHxyx6rhr8iBGAs6KS4V+sMTECCu
 toUWScCNm3ga/xQUtGQNZtACQMUDWztmOl1ROoc2AUfTdiO/hGkfvl5PzQr0065zWlq3
 vHfKteAg1vQR/gipzmV57Y8FX1KFqE5K8mQ6DYVNBQzlk/iV2Bp5hsLOdroLoMpyOvjw
 cIhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eeRMLoPH
Subject: [Buildroot] [PATCH 5/5] package/qt6/qt6tools: fix assistant build
 failure
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

Fixes:
<...>/output/build/host-qt6tools-6.8.1/src/assistant/help/qhelpenginecore.cpp:11:10:
fatal error: QtConcurrent/qtconcurrentrun.h: Ingen slik fil eller filkatalog
   11 | #include <QtConcurrent/qtconcurrentrun.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.

The above error can be triggered by the following defconfig:
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6TOOLS=y
BR2_PACKAGE_QT6TOOLS_ASSISTANT=y

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6tools/Config.in      | 1 +
 package/qt6/qt6tools/Config.in.host | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index f03ddf29a5..f33ee13cee 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -17,6 +17,7 @@ if BR2_PACKAGE_QT6TOOLS
 config BR2_PACKAGE_QT6TOOLS_ASSISTANT
 	bool "assistant"
 	select BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT # qhelpgenerator
+	select BR2_PACKAGE_QT6BASE_CONCURRENT
 	select BR2_PACKAGE_QT6BASE_GUI
 	select BR2_PACKAGE_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
 	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
diff --git a/package/qt6/qt6tools/Config.in.host b/package/qt6/qt6tools/Config.in.host
index 0ea214168d..0e2a13d457 100644
--- a/package/qt6/qt6tools/Config.in.host
+++ b/package/qt6/qt6tools/Config.in.host
@@ -15,6 +15,7 @@ if BR2_PACKAGE_HOST_QT6TOOLS
 
 config BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT
 	bool "host assistant"
+	select BR2_PACKAGE_HOST_QT6BASE_CONCURRENT
 	select BR2_PACKAGE_HOST_QT6BASE_GUI
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
 	select BR2_PACKAGE_HOST_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
