Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22452C5B549
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 08:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1E7F6109F;
	Mon,  2 Jun 2025 08:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwvp6zLW-bqs; Mon,  2 Jun 2025 08:01:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE08D60DEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE08D60DEC;
	Mon,  2 Jun 2025 08:01:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AFEA1F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A252610FC
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNBMw15DUMPB for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 08:01:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0DFB60DF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0DFB60DF4
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0DFB60DF4
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:01:05 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-551fc6d4a76so4424127e87.0
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 01:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748851263; x=1749456063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t80nLswZZhHQik5oZPjT8uQZsf7Nfhx4SEe9Rf+3lz8=;
 b=wO+xrFz8M445War3ufzblcQP3SKTuOuD6ZcIuBxY8Haaj65flH0T0yXU63p1QMHnoO
 p5abmbzfM2rw64gI5Bvw7U9rcKQZKu6UedJYDeJVFeeNE9tZLL6eYhklOYg+4+shEqDq
 x9ZYXw/oc7vzgvnycJlfZHANHQZMKj38TrhjxW3rGQRkIeIMm9hlS1ffYS4gEpPVB7UZ
 R1qXYI2mEPYNYTjA/Of/uJ6hIIjE0CqVKnUKfeSpSCRkesxeikgb2j3J+xHsT8e1biME
 Mr2bFmnPGLhquDOIl5nCrpAlk8lTpWmOm0e0BGTsj1V9U/VUAKnVYYZus9ZBwJNhTWa9
 Uabw==
X-Gm-Message-State: AOJu0YwDs6Pbkp2DeKrvmq8/Qy8vqrIsXO8B0Fe6HDXAaF+DgR6VLESI
 +UtZA5WUvbG5aeS7TUVB1cPdhlwjMCzyswpNHZp8/peEwaa2/J4mjNxB8EkF1g==
X-Gm-Gg: ASbGncuPcylbkP2ccgQRIoZhf9O3mM6RzumoswzGKc0QuS3mwTAgJLy+zoqEt8jCiou
 Te7+ZKDEPx3qa/WxwXckYcurFeRP9k8q7FVo+iIpyyhK3ZI1Z54+tenbHUy//ziDeefIKmyYeFM
 JlMosIYCNBpcg1E8i9jEPsNdngpVybMFxf3AAH8YuRUtYeLX37wWoqOdJFNTjpdIMIDF43dB9YF
 evUILDjiSyFcj7XdRiJQsg9FR6G4JiJErk6xkBum+TkchTjPbLWCujSl6ikzl+AhD8IvE2LLY+m
 uGEmQxn7UW8U9DGTUBCntNHoPvTjloJmXfBOsXE6UV4luu8fz8rKgUfyBQEgtvna1TTZ9XgEAF3
 d9yxlu+1IQQ==
X-Google-Smtp-Source: AGHT+IEc14YmwISZE6bl+guQyhmckCEpp9Ha1uY/A0vLqUnLPmYy9XXcb8uree4pmwwn3XPH83dAUw==
X-Received: by 2002:a05:6512:b1b:b0:553:2c58:f96f with SMTP id
 2adb3069b0e04-5533d160f75mr3039297e87.1.1748851262473; 
 Mon, 02 Jun 2025 01:01:02 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533793770bsm1495467e87.238.2025.06.02.01.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 01:01:01 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  2 Jun 2025 10:00:51 +0200
Message-ID: <20250602080056.2466471-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602080056.2466471-1-roykollensvendsen@gmail.com>
References: <20250602080056.2466471-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748851263; x=1749456063; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t80nLswZZhHQik5oZPjT8uQZsf7Nfhx4SEe9Rf+3lz8=;
 b=XQZF8ISkXTWQ7kQCFP/74skT1dvVlXVNX5L+dnOlkbkBnjyjGsI965eIT8ibnY90cK
 clVH9cZhd6yY3JOQ69bBIFzaPGuqzLzau1TlRwN5dLdWpp57MALaq9vm2bYWgY+EvFqW
 JMpw5hC8v2Y3XPeQ8B7IvXNsTXQxBUH/cDyeFBiyS79ndJXPZlLN+D82DMxoMxBwShyv
 w3XizDWl6LytuZLw2NteIbnccs2Bpw8m9dpxYTSC93+pUJVeYfvt3uwlUZCIIuZUG1E/
 vKDeeWzK8bqZqPits9nmsErhp/joyMfl2Hh+4YtB3uDhVzQEoeVnUrfyo5gBJ3xiGfTz
 t4Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XQZF8ISk
Subject: [Buildroot] [PATCH v4 1/3] package/qt6/qt6tools: avoid build
 failures
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

Since we don't need assistant, designer or linguist on target, and we
don't need assistant or designer on host, we unconditionally disable
these tools, to avoid build failures without inreasing the complexity of
the package.

Fixes target linguist build:
-- Could NOT find Qt6LinguistTools (missing: Qt6LinguistTools_DIR)
CMake Error at <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:768 (message):
  Failed to find the host tool "Qt6::lconvert".  It is part of the
  Qt6LinguistTools package, but the package could not be found.  Make sure
  you have built and installed the host Linguist module, which will ensure
  the creation of the Qt6LinguistTools package.
Call Stack (most recent call first):
  <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
  src/linguist/lconvert/CMakeLists.txt:9 (qt_internal_add_tool)

The following defconfig triggers a target linguist build without
building the necessary lconvert host tool. See:
https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/CMakeLists.txt?h=6.8.1#n17

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

Fixes target desinger build:
CMake Error at <...>/output/build/qt6base-6.8.1/cmake/QtPublicWalkLibsHelpers.cmake:267 (message):
  The Xml target is mentioned as a dependency for Designer, but not declared.
Call Stack (most recent call first):
  <...>/output/build/qt6base-6.8.1/cmake/QtPrlHelpers.cmake:8 (__qt_internal_walk_libs)
  <...>/output/build/qt6base-6.8.1/cmake/QtPrlHelpers.cmake:47 (qt_collect_libs)
  <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtModuleHelpers.cmake:1027 (qt_generate_prl_file)
  <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtScopeFinalizerHelpers.cmake:24:EVAL:1 (qt_finalize_module)
  src/designer/src/lib/CMakeLists.txt:DEFERRED

The following defconfig triggers a target designer build, without
selecting the necessary xml qt6base option. See:
https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n64
https://code.qt.io/cgit/qt/qttools.git/tree/src/designer/src/lib/CMakeLists.txt?h=6.8.1#n182

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

Fixes target assistant build:
CMake Error at <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:768 (message):
  Failed to find the host tool "Qt6::qhelpgenerator".  It is part of the
  Qt6ToolsTools package, but the package did not contain the tool.  Make sure
  that the host module Tools was built with all features enabled (no
  explicitly disabled tools).
Call Stack (most recent call first):
  <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
  src/assistant/qhelpgenerator/CMakeLists.txt:9 (qt_internal_add_tool)

The following defconfig triggers a target assistant build, without
building the necessary qhelpgenerator host tool. See:
https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.8.1#n4
https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.8.1#n21

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_GUI=y
BR2_PACKAGE_QT6BASE_PNG=y
BR2_PACKAGE_QT6BASE_PRINTSUPPORT=y
BR2_PACKAGE_QT6BASE_SQL=y
BR2_PACKAGE_QT6BASE_SQLITE=y
BR2_PACKAGE_QT6BASE_WIDGETS=y
BR2_PACKAGE_QT6TOOLS=y

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6tools/Config.in.host | 3 ---
 package/qt6/qt6tools/qt6tools.mk    | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/qt6/qt6tools/Config.in.host b/package/qt6/qt6tools/Config.in.host
index 7a6f8a5176..404ebfa923 100644
--- a/package/qt6/qt6tools/Config.in.host
+++ b/package/qt6/qt6tools/Config.in.host
@@ -2,9 +2,6 @@ config BR2_PACKAGE_HOST_QT6TOOLS
 	bool "host qt6tools"
 	# The Qt Qt Network module is required
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
-	# Requires the Qt Sql module to build the qhelpgenerator
-	# tool, if target support for Sql is present
-	select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACKAGE_QT6BASE_SQL
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index b063f08887..a818cd7abc 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -28,6 +28,9 @@ QT6TOOLS_LICENSE_FILES = \
 	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6TOOLS_CONF_OPTS = \
+	-DFEATURE_assistant=OFF \
+	-DFEATURE_designer=OFF \
+	-DFEATURE_linguist=OFF \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DBUILD_WITH_PCH=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
@@ -42,6 +45,8 @@ QT6TOOLS_DEPENDENCIES += qt6declarative
 endif
 
 HOST_QT6TOOLS_CONF_OPTS = \
+	-DFEATURE_assistant=OFF \
+	-DFEATURE_designer=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
