Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975B9C54795
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 21:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59BE34111F;
	Mon, 19 May 2025 21:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eSmFnj6-SLl; Mon, 19 May 2025 21:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75843410B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75843410B4;
	Mon, 19 May 2025 21:06:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 645BC193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 493CE4192E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcg4lzdrFanJ for <buildroot@buildroot.org>;
 Mon, 19 May 2025 21:06:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D4014194E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D4014194E
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D4014194E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:24 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-3105ef2a08dso45435651fa.0
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747688782; x=1748293582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8JVYWcWOt1Kv6x4ottqErfC+1gFk6EunBLAlJklxf18=;
 b=EFDHVQm8IkuGtcA4DV5Ymk69yPBzuYhxKZZxykycawgFRR7b6VC2lxmZlRiagONmhA
 fvySBsLYL+X0co6nmMcgN5/kXFYDmNliZE8hi2So8ghK/hGZM3NPECZ//5PGc6Z5OzOI
 yCyA5+nBfuSFP8TJBO57GkKu7rjM+xs35AjX4FvvO6TU6tlume6FxMIOtVTFVrGGVB8E
 S6F4jWYzPswnL5zIKkOxm3ydYdPMSsA93ykgCANKE6UqPbqjM5Il2UlUJzBkA3nj+G84
 4/SmSqLKsjE0xZ/Qgw5DULgkzGIFrqP+bLU43joA3/WNOYu758Gef/v+JvmvFp8D6BW4
 8l3A==
X-Gm-Message-State: AOJu0YyT8AOU22IeNLPO3oBGhx5nszCC03fbFLHrLq6JxdQ3QbO+v2UE
 dyV13qEvn/iOGdWD+qZm2RYoc6wWzzQfSqqF39dizGWkp1kmyyaCxZglv8StmA==
X-Gm-Gg: ASbGncvXT4zSMVoNcnBGUdBUjCfzkDDzbAfppZHkbiKcpPemwSOZOF2iJbgAGXF8Cly
 s0WWe/8MF2dWGlLnp0xHVkUV/qIYGsWA8RAzufuGS1Jl690MirWbThwgPJ+lzKejWnw8rydxKqj
 Nkr3yp8czTYl6eXEGxDQMswb115yIKU2/OhtR9zxnWBwwhDinINkFFTHtT7BWSFUw4ARgXnsO12
 CN/7mffyzpE7nWLIgCQkTWXf8xh6h2cEIewawlxDUhQ4v3dU4hVtr5FGACcRC4sUPay8vo4ROpg
 /nulELmojpmtDWmJ2wYPrdyCEvpDDNxpE4PZogimDTt+yqP4/aqdRQE2XWm05qm6jqivEH/m2KJ
 CKfYqWw==
X-Google-Smtp-Source: AGHT+IGJ+DpSjOuVyGJvKjRUHj0eypdIT4Dot1p8/Ao63lU5vCB+kSI3Eji/XhTDRu9VzUx4S8Xzog==
X-Received: by 2002:a05:651c:41cd:b0:30b:d156:9e97 with SMTP id
 38308e7fff4ca-328076e8a21mr39355001fa.8.1747688781837; 
 Mon, 19 May 2025 14:06:21 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cfaebsm20181171fa.100.2025.05.19.14.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 14:06:21 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 23:05:44 +0200
Message-ID: <20250519210553.265725-11-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519210553.265725-1-roykollensvendsen@gmail.com>
References: <20250519210553.265725-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747688782; x=1748293582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8JVYWcWOt1Kv6x4ottqErfC+1gFk6EunBLAlJklxf18=;
 b=AGXRX8kOVSvPaGHv0jznQsZOnG+LoaYCkAHRwCTY9LPmydgX2sN2LqWsIpXsMrCG/s
 h8TUdWsPCw1jSz8M8PGGMuyqm3JHPsGysIeWej6a2s8zpM+/HdiWfPFUC6vT0EuHwegG
 n8QBJPTpxJHEOVx91e2iJTwtj3WEsSPXOHAqfil8imu02/r0WBopFFbD62b26BRJhAnk
 FCBVKd32dTgTlsYnqYeydWJ0Dz3wWj89lglr7yVfNQxBFwyVr3WQxfOYcwPx3Eg+STjQ
 HfK/g33wfbhbw/zdB7rGCuKppMJ9SVnWJ37w4kXNAR5wpF0M80F8/kH+DSpib9lxKJG6
 DOGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AGXRX8kO
Subject: [Buildroot] [PATCH v2 10/11] package/qt6/qt6tools: fix linguist
 build failure
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
Cc: Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
-- Could NOT find Qt6LinguistTools (missing: Qt6LinguistTools_DIR)
CMake Error at <...>/output/build/qt6base-6.9.0/cmake/QtToolHelpers.cmake:784 (message):
  Failed to find the host tool "Qt6::lconvert".  It is part of the
  Qt6LinguistTools package, but the package could not be found.  Make sure
  you have built and installed the host Linguist module, which will ensure
  the creation of the Qt6LinguistTools package.
Call Stack (most recent call first):
  <...>/output/build/qt6base-6.9.0/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
  src/linguist/lconvert/CMakeLists.txt:9 (qt_internal_add_tool)

The above error can be triggered by the following defconfig:
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_GUI=y
BR2_PACKAGE_QT6BASE_PNG=y
BR2_PACKAGE_QT6BASE_WIDGETS=y
BR2_PACKAGE_QT6TOOLS=y

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6tools/Config.in   | 10 ++++++++++
 package/qt6/qt6tools/qt6tools.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index e86011e7f1..cc0c507b86 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -39,4 +39,14 @@ config BR2_PACKAGE_QT6TOOLS_DESIGNER
 	  Graphical tool for designing and building Qt user interfaces
 	  with a drag-and-drop editor.
 
+config BR2_PACKAGE_QT6TOOLS_LINGUIST
+	bool "linguist"
+	select BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS # lconvert is needed for linguist to build
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/CMakeLists.txt?h=6.9.0#n17
+	select BR2_PACKAGE_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/CMakeLists.txt?h=6.9.0#n17
+	help
+	  Tool for translating Qt applications, including editors and
+	  utilities for managing translation files.
+
 endif
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index c38630f5a7..2e3268558e 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -53,6 +53,12 @@ else
 QT6TOOLS_CONF_OPTS += -DFEATURE_designer=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6TOOLS_LINGUIST),y)
+QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
+else
+QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=OFF
+endif
+
 HOST_QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
