Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8563FC3ABCB
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 04:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E973D60868;
	Wed, 14 May 2025 04:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BXaYxdWWsw5; Wed, 14 May 2025 04:17:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7B7860FCC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B7860FCC;
	Wed, 14 May 2025 04:17:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2576B12A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 04:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21F2240B81
 for <buildroot@buildroot.org>; Wed, 14 May 2025 04:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdYvyoHt6Xoz for <buildroot@buildroot.org>;
 Wed, 14 May 2025 04:17:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com;
 envelope-from=rubacha.jack03@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0AB2E405F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AB2E405F0
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AB2E405F0
 for <buildroot@buildroot.org>; Wed, 14 May 2025 04:17:38 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7cadd46eb07so714462385a.3
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747196257; x=1747801057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qnGB+TOO0c4H/xpTzLLvVxdsEHJL1uqPco2gMXqb15w=;
 b=B5A/ka91LC1QxZ7nZtc7tuxZg9KHfYxAod2etUcyfRUmHILrOxs/xKm/YXzQseFcid
 5w/Pa6kP0TaVgAN/utcNQX/G7P/tBS4uyMvAf0vdl0JCw7DPD33Y2NClvlT15hI9kNfF
 4SlWJNEM3kufZUGhPvxO2xB9QvJWyip3vO2bcCWKtyS1X50kIl2Bg/pTQK9H1xeA+708
 NXlSAr5A4Yq+gZXdjUYLWyeKk/kGqhnYSI68H9HAWTByucEC2wT0JL1TdGVVGReNzhay
 0hnCNLUUl9WblTqvggKqpTTpxiiyMap3v2Vzg3B0nWRAsLayZFyg6RhLmR9MXr2HM9Vt
 Mlsg==
X-Gm-Message-State: AOJu0YzImNM5fe7LSuR4wOCTOxESYwZqxekSdisQkZnoPw8Q+Rcbs1Zn
 UoMerCYsTaEQ/Q4lyaWPBKL8Vl8Q74wplr77RwHYlXWWB6V5gfiiKnKISqtH
X-Gm-Gg: ASbGncujoTs8OJ9JeDNoxK2IFAR6n+llC2fFULb2+/TuglrypgBxpvvlEk9m8RivJRt
 F3aMfD6LtW8hBzb3G4v9hWt/zSLagYIfUQiZx3UyA3dmFi6+atpGKgqjrfrTUiLVnmL1UM3Gw7b
 XI3gAbegGI06p2vyNsRIn5HSLr7UtM7TA1QSVqldSuCsmkXH4ZCWTB0NzWTDeyi8nL0KaBQiean
 1pwoU24T5zNRhWqeRiiI8S+rOKuZwnbzK4jBgnhCxpdDxdZCYBFxuT+z+oKLmxmA/WgoHJaY1hY
 jaPC9iAT3lBFbJZPXq1DEL6a1zhHkfk20jrPF9CjzLlnILmgF/oLjwglScI+k6ijxko9yjuAGKI
 =
X-Google-Smtp-Source: AGHT+IE88BdBke4oTIobUzk/y9qKZCDm4zEXbR8Fju+jhxLlTn5x1CpUTA9MJZRU4ELPTto7q9wSTg==
X-Received: by 2002:a05:620a:454b:b0:7c5:4b18:c4c3 with SMTP id
 af79cd13be357-7cd287f773emr310027585a.30.1747196257145; 
 Tue, 13 May 2025 21:17:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2600:1000:b01e:87c6:d0d0:d3f6:4d61:cb4e])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd00f9b24esm793795685a.62.2025.05.13.21.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 21:17:36 -0700 (PDT)
From: Jack Rubacha <rubacha.jack03@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jack Rubacha <rubacha.jack03@gmail.com>
Date: Wed, 14 May 2025 00:17:32 -0400
Message-ID: <20250514041732.242321-1-rubacha.jack03@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747196257; x=1747801057; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qnGB+TOO0c4H/xpTzLLvVxdsEHJL1uqPco2gMXqb15w=;
 b=Xv2clysupiV5nOwmaiF38SV8s8R57B28qF1618OHpZ+6zJCPn/0GTPh7BiPrDVn9qE
 afyw5IUGtY5SQoBEew+8tnITQr2GJET6Z+cOqvRxPic5+5bnbbP+LHxYTAsPp3D3wHZE
 1PxMTLyPaBx5lvBtdG2i64oIH0ZI5RQVsuk7Muz3ZBRDz7E0VvEXeoYpenBx86BNf81i
 NcQDlFNx9J3/g4tYzjJtxmnxO7mxZbGqHtP4B59+WJTZ5psJndMi7db+JsEffS3dcVxn
 8qrqvWxUZ8Okv7LQiauRJuvOgxxsS9tXm0IyXwJHzm+usYhaOnk96rOJm6ZlsTvdBWQO
 dmCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Xv2clysu
Subject: [Buildroot] [PATCH v3] package/qt6/qt6grpc: new package
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

Adds the QT GRPC module (containing Qt Protobuf as well).

Signed-off-by: Jack Rubacha <rubacha.jack03@gmail.com>

---
Changes v2 -> v3:
 - Make license GPL-3.0-only
 - Add newline for readability
 - Alphabetize host dependencies

Changes v1 -> v2:
 - Remove 'selects BR2_PACKAGE_HOST_QT6BASE' as it is a make dependency
 - Changes help text to clearly state both modules
 - Adds a git repository link to the help text
 - Cleans up license files to show all necessary files, matches hashfile
 - Make multiline clauses alphabetically ordered

Signed-off-by: Jack Rubacha <rubacha.jack03@gmail.com>
---
 package/qt6/Config.in            |  1 +
 package/qt6/qt6grpc/Config.in    |  7 ++++++
 package/qt6/qt6grpc/qt6grpc.hash | 10 ++++++++
 package/qt6/qt6grpc/qt6grpc.mk   | 43 ++++++++++++++++++++++++++++++++
 4 files changed, 61 insertions(+)
 create mode 100644 package/qt6/qt6grpc/Config.in
 create mode 100644 package/qt6/qt6grpc/qt6grpc.hash
 create mode 100644 package/qt6/qt6grpc/qt6grpc.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 10594691cf..9c297b321e 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -48,6 +48,7 @@ source "package/qt6/qt6charts/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6graphs/Config.in"
+source "package/qt6/qt6grpc/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6multimedia/Config.in"
diff --git a/package/qt6/qt6grpc/Config.in b/package/qt6/qt6grpc/Config.in
new file mode 100644
index 0000000000..3d82cfcb0c
--- /dev/null
+++ b/package/qt6/qt6grpc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QT6GRPC
+	bool "qt6grpc"
+	help
+	  This package provides the Qt GRPC and Protobuf modules:
+
+	  https://doc.qt.io/qt-6/qtgrpc-index.html
+	  https://code.qt.io/cgit/qt/qtgrpc.git/
diff --git a/package/qt6/qt6grpc/qt6grpc.hash b/package/qt6/qt6grpc/qt6grpc.hash
new file mode 100644
index 0000000000..06da9f0700
--- /dev/null
+++ b/package/qt6/qt6grpc/qt6grpc.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtgrpc-everywhere-src-6.8.1.tar.xz.sha256
+sha256  b1615c7096b012e5f42aea57c420d2ce21c906d0eda3ea373b09a47cf40b5e80  qtgrpc-everywhere-src-6.8.1.tar.xz
+
+# Hashes for license files:
+sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSE.Apache-2.0.txt
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSES/LicenseRef-protobuf.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6grpc/qt6grpc.mk b/package/qt6/qt6grpc/qt6grpc.mk
new file mode 100644
index 0000000000..8b1c511fef
--- /dev/null
+++ b/package/qt6/qt6grpc/qt6grpc.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# qt6grpc
+#
+################################################################################
+
+QT6GRPC_VERSION = $(QT6_VERSION)
+QT6GRPC_SITE = $(QT6_SITE)
+QT6GRPC_SOURCE = qtgrpc-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6GRPC_VERSION).tar.xz
+QT6GRPC_INSTALL_STAGING = YES
+QT6GRPC_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6GRPC_CMAKE_BACKEND = ninja
+QT6GRPC_LICENSE = GPL-3.0-only
+
+QT6GRPC_LICENSE_FILES = \
+	LICENSE.Apache-2.0.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LicenseRef-protobuf.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6GRPC_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DQT_HOST_PATH=$(HOST_DIR)
+
+QT6GRPC_DEPENDENCIES = \
+	host-pkgconf \
+	host-qt6grpc \
+	qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6GRPC_DEPENDENCIES += qt6declarative
+endif
+
+HOST_QT6GRPC_DEPENDENCIES = \
+	host-protobuf \
+	host-qt6base
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
