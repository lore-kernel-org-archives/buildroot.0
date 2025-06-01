Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1E4C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26E4F41DD6;
	Sun,  1 Jun 2025 10:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUJx6M4NZ6Nb; Sun,  1 Jun 2025 10:13:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A0C641DBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A0C641DBB;
	Sun,  1 Jun 2025 10:13:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40CF5222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DAC581B58
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IGbVKdEmlrn for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:13:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 42062814BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42062814BD
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42062814BD
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:22 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5532f9ac219so4037166e87.1
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 03:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748772800; x=1749377600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QTmqjls+OikcY8HxqziQ5lKySzOEswY5CPCEPyoSLhc=;
 b=N9K8Vu+hijROQQCEWHaeYKYOnPWR7jCncQXFsxmJXeGQDO+5IqR9xjQp/QZs+x0weg
 URNxz+Toqyj31xoQ0ZY4HQ2zljbvfamzpmV+/OFs19YthTduJHOJrgp+HBG/OqUYzc1O
 8EqNG/dzw7+fc+kFXXzt3kZmDk9eRefp17ERBjpWZGw69jW+hFISTLbjD8IREgThmHvd
 ULsqJpnXkW4xOXFOS72OjwjcpySm5NJd74j70lQw4g+/SHPZuYKnpUocZ7xqtBtXrCqg
 6xMdh6Db3KLrG9JAs16rKr0jttrflMpxr/dIg8QrK5KWs6qogSDdAPNYrBUAVY51slQ8
 nFxw==
X-Gm-Message-State: AOJu0YzBceKVyGbEY20S8xkHQuBaIDsZcSEA5ZpBhRb+YkAbzs8AQCZ1
 0X6ZC4EWx6t3CJhsSig+aHJQsYns62G8wCYMMkm7Od7Ci95ZCHXQCYvodnndrQ==
X-Gm-Gg: ASbGncvLY4RrrJ4xPOAW53FGt5NiOi/JTlPqIiS7Q3rK82GAg1Ms5B/DTbsLVl16gn4
 HCGKR2BZxlsnSG6B3jfShyS0vq8sOGjkcrzs443L3ouzi/Fd2zBHSVBkGO8ueBgjPT4rFC4wli3
 V+c78InXcrFV78/L6KQMpsIg08l+EXG1+asGAY285sTXBgAKE83l35ajB4trjI6ts/IW6uxic93
 ZbLY7px2wjbKoiMIm7aBw9ea6djDDu5GWIwZ9XdfJhWa9+N5DJJeve2W9ZAOG4vQZ+4ksg+sv2T
 Vo3yzfvkADga6KVdcayGFNC+Z2LFgHCy4st+hUsVPzoJiCqQv1QIGmV/mm4noKMUFKJ9jvNKW/M
 9vECT1OQHRw==
X-Google-Smtp-Source: AGHT+IH27m7e4b7jAMiovoXRyJX0ojdNX29Vhvr13eevBpwyZZeV0JsPmm7SLA9gGgjX3MdF/ds64w==
X-Received: by 2002:a05:6512:3b11:b0:553:2989:1720 with SMTP id
 2adb3069b0e04-5533b8e1096mr2912303e87.2.1748772799701; 
 Sun, 01 Jun 2025 03:13:19 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553378a0031sm1237404e87.64.2025.06.01.03.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 03:13:19 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 12:12:56 +0200
Message-ID: <20250601101305.3198541-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
References: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748772800; x=1749377600; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTmqjls+OikcY8HxqziQ5lKySzOEswY5CPCEPyoSLhc=;
 b=PTR/C5RwcaZ9piTuFstU13CA9NH35yZKqS6NtI9MxL9K/EJ6L47Zc3cQKBefOwhX2d
 feKLuljU1VR0rFNnhkm182E5DxWsvrkVGsmbhi056C2IX0BNhx3gDKCKrl8SsdXaR1+7
 NPqOFBCfr5ChtgMopf42xNn5MR/FDr6XJ2YZN0uEmu4lm7+8npoKBD+k0tgf8TA/JTPZ
 HXLbxN10tqVn1R/8mJ2xAnLmYnPLt+YU3s4Pzyhls5oIJNpFh7yumzKB/GYyVL/kxQrK
 mln0iEK/plZxayaHRl4H5K2Mh4qsl7nH/BQr1OfcJB+StXS59/2OpOIU+YMmSY09wLxw
 wWAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PTR/C5Rw
Subject: [Buildroot] [PATCH v2 2/6] package/qt6/qt6tools: fix linguist build
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
-- Could NOT find Qt6LinguistTools (missing: Qt6LinguistTools_DIR)
CMake Error at <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:768 (message):
  Failed to find the host tool "Qt6::lconvert".  It is part of the
  Qt6LinguistTools package, but the package could not be found.  Make sure
  you have built and installed the host Linguist module, which will ensure
  the creation of the Qt6LinguistTools package.
Call Stack (most recent call first):
  <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
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
 package/qt6/qt6tools/Config.in   | 14 ++++++++++++++
 package/qt6/qt6tools/qt6tools.mk |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index 1828e5f043..8fff08b3e6 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -11,3 +11,17 @@ config BR2_PACKAGE_QT6TOOLS
 	  and design of applications.
 
 	  https://github.com/qt/qttools
+
+if BR2_PACKAGE_QT6TOOLS
+
+config BR2_PACKAGE_QT6TOOLS_LINGUIST
+	bool "linguist"
+	select BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS # lconvert is needed for linguist to build
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/CMakeLists.txt?h=6.8.1#n17
+	select BR2_PACKAGE_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/CMakeLists.txt?h=6.8.1#n17
+	help
+	  Tool for translating Qt applications, including editors and
+	  utilities for managing translation files.
+
+endif
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index b063f08887..25cbb82c84 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -41,6 +41,12 @@ ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
 QT6TOOLS_DEPENDENCIES += qt6declarative
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
