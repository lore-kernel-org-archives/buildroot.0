Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF55C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D5F41E01;
	Sun,  1 Jun 2025 10:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wo0hswKsDMzF; Sun,  1 Jun 2025 10:13:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5EEA41DD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5EEA41DD0;
	Sun,  1 Jun 2025 10:13:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBEA2222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A865960A9C
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmNjoue8mhOc for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:13:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 90537606C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90537606C2
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90537606C2
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:24 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-54b10594812so4277065e87.1
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 03:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748772802; x=1749377602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gSGYknjlBO6UPjYnWePlZbgn9fINQTtS0gZIY7YbvgI=;
 b=kOWkcf7rTRwjP10lpG0vM3v/OzP50uCgPwKCOEBFmMWNbqYy6BIntqT4hIsc5uLNqZ
 DOhLqGjcgAS40VGDJW2PSsDVNuBzKF7M1jlYqgQh8htAgbxyJESVJcL2jFCq+VrS15ta
 BLhENFwRuBr1FQAXrfCwGNCRAx/6FD34ETyZ9rjUqBFYYi7Xv9WQHvf3wGFOUpoAk7Cv
 8AETKICUn9H+eOYaoVMd13HPh5aHBwFd8k5Xhn/vFtb/I9FHFLvs+osbAHCWkrJN4nsF
 Y7YYhYOn46G09tAgEHFgLo9scAcVP/lCBpBgNXUdxXsvABr0iuZfbdpFDSNWmj3SqECT
 SZXQ==
X-Gm-Message-State: AOJu0YyciRkOuokPi11UOv1Yr/JWGOzSlYhoHqR47jJt/5111hk14h7B
 Q9O8DaTQJhZ7GYi5lz+o7E/HDJ2Ii/3AIGwX2YLwP5lmn4lPs5goPSoTi9EGZQ==
X-Gm-Gg: ASbGncu+r0WdDMHjFzHyuEuB6WFLHEBliNexxCQX8Q3U4fBMyT2wG26DaLOxmMIZdlI
 TLjGOjmap22y/rhhs0rJUrfKeUZYzCytrzhZ/FT0pIwkEX2faOSi0/3kn+k/eUZdteXu1cHxjn1
 NHDm0g/UwS92T5MUJfBOlj5ydzt+Z/E7+Pgy30IsxSOZO51urjrrF8GJOd9opg75GzBOlRclDdc
 ypMglJTEgvblRVnIsFpGWuAU4zlqReA6VV7QL1M7z7lmi4xuRzRTaJkRwyPVOjjH/XnBKFr023p
 X1KTrlzsBNu8IG4QaJkF8EwKNza+4bcWsGUG4ZmBOtvcegG3MUDLrEkpvHyBAfDYPSSAHKzGKgv
 Xjq+9QfjCo8zHBuURF0H7
X-Google-Smtp-Source: AGHT+IEHtMUR6RyUpT0PTkkE1THGHt5+wMkBwsrfS2VQPK5vClfYFoup17YdngnZeo0nA4iCwyU78A==
X-Received: by 2002:a05:6512:a92:b0:553:2dd6:5e9 with SMTP id
 2adb3069b0e04-55342f5dccemr870594e87.21.1748772801517; 
 Sun, 01 Jun 2025 03:13:21 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553378a0031sm1237404e87.64.2025.06.01.03.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 03:13:20 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 12:12:57 +0200
Message-ID: <20250601101305.3198541-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
References: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748772802; x=1749377602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gSGYknjlBO6UPjYnWePlZbgn9fINQTtS0gZIY7YbvgI=;
 b=H7f2IuV36gOkUb9YisO68RRzSCWBqQHumcARy8ETXHH9/gtefJcyKdKW9OQASK3FY7
 vZKd/jLkMKrwNcJbDaZC89wyViLmFWvIQpNTbef5Z9mDd1Rhh97u6Eauwf8boDHhtCjn
 K0oswG54k607Lu1ghfey9mCFPhKRgo17HdlnD/vkn6vVKDyiC3C9+BwED6Zht9YcYxVO
 LyCoAGn2bv6j5rdZeXpKyOvRFtMWvzWqovfYZBwUUi8mkkAYXeEesOVSi1ljDD5Et4MV
 oswe3Cg7RY4oX/Hy9Yg/VO0Fnfw8yautPVTeeT17Zi/Z+7kzgcaHIAF5sYaONk32I8Mq
 /wXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=H7f2IuV3
Subject: [Buildroot] [PATCH v2 3/6] package/qt6/qt6tools: fix designer build
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
CMake Error at <...>/output/build/qt6base-6.8.1/cmake/QtPublicWalkLibsHelpers.cmake:267 (message):
  The Xml target is mentioned as a dependency for Designer, but not declared.
Call Stack (most recent call first):
  <...>/output/build/qt6base-6.8.1/cmake/QtPrlHelpers.cmake:8 (__qt_internal_walk_libs)
  <...>/output/build/qt6base-6.8.1/cmake/QtPrlHelpers.cmake:47 (qt_collect_libs)
  <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtModuleHelpers.cmake:1027 (qt_generate_prl_file)
  <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtScopeFinalizerHelpers.cmake:24:EVAL:1 (qt_finalize_module)
  src/designer/src/lib/CMakeLists.txt:DEFERRED

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
BR2_PACKAGE_QT6TOOLS_LINGUIST=y

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6tools/Config.in   | 11 +++++++++++
 package/qt6/qt6tools/qt6tools.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index 8fff08b3e6..5828715aa6 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -14,6 +14,17 @@ config BR2_PACKAGE_QT6TOOLS
 
 if BR2_PACKAGE_QT6TOOLS
 
+config BR2_PACKAGE_QT6TOOLS_DESIGNER
+	bool "designer"
+	select BR2_PACKAGE_QT6BASE_GUI # https://code.qt.io/cgit/qt/qttools.git/tree/src/designer/src/designer/CMakeLists.txt?h=6.8.1#n41
+	select BR2_PACKAGE_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n64
+	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n64
+	select BR2_PACKAGE_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n64
+	select BR2_PACKAGE_QT6BASE_XML # https://code.qt.io/cgit/qt/qttools.git/tree/src/designer/src/lib/CMakeLists.txt?h=6.8.1#n182
+	help
+	  Graphical tool for designing and building Qt user interfaces
+	  with a drag-and-drop editor.
+
 config BR2_PACKAGE_QT6TOOLS_LINGUIST
 	bool "linguist"
 	select BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS # lconvert is needed for linguist to build
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index 25cbb82c84..f5f2dc64b0 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -41,6 +41,12 @@ ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
 QT6TOOLS_DEPENDENCIES += qt6declarative
 endif
 
+ifeq ($(BR2_PACKAGE_QT6TOOLS_DESIGNER),y)
+QT6TOOLS_CONF_OPTS += -DFEATURE_designer=ON
+else
+QT6TOOLS_CONF_OPTS += -DFEATURE_designer=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6TOOLS_LINGUIST),y)
 QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
 else
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
