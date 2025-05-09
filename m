Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92697C3ABC5
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 01:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFC806111A;
	Fri,  9 May 2025 01:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hsd-lDmyFDjJ; Fri,  9 May 2025 01:46:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03AE561102
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03AE561102;
	Fri,  9 May 2025 01:46:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB3A71A9
 for <buildroot@buildroot.org>; Fri,  9 May 2025 01:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C37540D9D
 for <buildroot@buildroot.org>; Fri,  9 May 2025 01:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kigy2KOi15HO for <buildroot@buildroot.org>;
 Fri,  9 May 2025 01:46:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com;
 envelope-from=rubacha.jack03@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AFF59412B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFF59412B1
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFF59412B1
 for <buildroot@buildroot.org>; Fri,  9 May 2025 01:46:00 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-601a8b6c133so1451662eaf.1
 for <buildroot@buildroot.org>; Thu, 08 May 2025 18:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746755159; x=1747359959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FyHtiMSW1Obo+0OA5UKSgLQinNivTF1Xalu+aNzqFoE=;
 b=ptU17hvTPgzipAQgJNJRfR3N+/uskeECLCl7DwiVYnJEUeN8Ag5WIDQQVGvOM05MsH
 eI+Tu8sKqF8oP3EwK/p55GEvV7QfA7TnKJVEyDi0+DjaktrdFLFaz3q+qKW+XBJs/b9d
 cs5dURww+8mmGwaWeDUNoksMkLxstbbZjzQtUhRwznGp9znfcus9g3dv6UgBCOgeKdjW
 I8epyfu2otNydbvz+Ova3i9fR/qDyXyqzhK6tHxJ9pvN0O4IOXVd669+ChsaxKlWeKtV
 NKrxLGwiH5IyOj9fE2D0u0FeMeU9LfQdWYyn3hxvPE3T9G+jVm+GHka7f40DTp95wQNW
 hL+w==
X-Gm-Message-State: AOJu0YwlOrAl7dY9Ce5cz2f9rMTdASxc/rgnjdLoyrJA/EsMAHYPpE75
 EuFEWwrB9va43D3TsMIGVo1pLkF8dO7K5OpfGwhFsS3gexhVFcciDtuDmg==
X-Gm-Gg: ASbGnctKKBCvjYRS/tCTdmlVI3ifoJ/mTJZXWLNP5k5xkV8xJbNEmElZOMrqm8WQSJl
 2t8h6/FRQ2vegbXxGgnc6w8pSaimbBlijRaIy8UcrR9+dm+XW2FW4aKNpHa16VTeG9s6EcYkPc7
 4gqzQWIYD2PO0nABqm+x7zmhKqbocK6/hU72YKvGu2k6Dr6+YsRxd+k6ieL9tqTCbnood9H8X/V
 vV+uQswfKUiFaMZWIzsMUnAL7ciOx3sqlVQeyZEssiivZOWJkWtODIc1m50GuX/xAXRA85AG5Rb
 Ywcm2YL2bRJmDALb8YJzAySXRrfJwLKGRDN7C2+6nloNteUJTTCfFusSWfjtz7cmeTmtXYXy3i9
 gVLgz0mr7ytoLQyGDmuGVLQ==
X-Google-Smtp-Source: AGHT+IF9bSoXWrseDK8b4fxzEGVO4l1xd/Mvd566SdUk/5qRs6owk3AdAWbcCojeBZeyVH5WEBQRyQ==
X-Received: by 2002:a05:6808:23d0:b0:3f3:d699:e1a8 with SMTP id
 5614622812f47-403779e8fa8mr3677686b6e.13.1746755158600; 
 Thu, 08 May 2025 18:45:58 -0700 (PDT)
Received: from localhost.localdomain (syn-071-088-044-109.res.spectrum.com.
 [71.88.44.109]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2dba0619e78sm415854fac.3.2025.05.08.18.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 18:45:57 -0700 (PDT)
From: Jack Rubacha <rubacha.jack03@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jack Rubacha <rubacha.jack03@gmail.com>
Date: Thu,  8 May 2025 21:42:12 -0400
Message-ID: <20250509014212.88296-1-rubacha.jack03@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746755159; x=1747359959; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FyHtiMSW1Obo+0OA5UKSgLQinNivTF1Xalu+aNzqFoE=;
 b=QG+wnEJsIHOvXT0Z09UfI6Cu7reUsFqxicP2UGD66+Tw9W4/UGDTd4AN5dGKeHEuSx
 YUfe9Hi5K7NKP8RTN02vu1WZ85EyTavSPkodIY5UakO5rIKNzJG6D0BT1w2JFIhPvq5A
 HiHetOBjTPfz3HCqilrKegkzCND93cxFiqj6Y+uW6WCPhpmfN2ql+nU+v2Fw3qax8ifN
 Td+VK4rb4XC4vfxaNgtkaWSaN3zGBT6lpeDupetIe9CDIBarnzECaoJzFdmB+QSVHmg2
 hQDHGt1NUqsq2OhO6qSiI2H8+CpqafI+o0iYuwQTIwiei8tA0dY+CBj68jqeJhd6kcj4
 wTdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QG+wnEJs
Subject: [Buildroot] [PATCH v2] package/qt6/qt6grpc: new package
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
Changes v1 -> v2:
 - Remove 'selects BR2_PACKAGE_HOST_QT6BASE' as it is a make dependency
 - Changes help text to clearly state both modules
 - Adds a git repository link to the help text
 - Cleans up license files to show all necessary files, matches hashfile
 - Make multiline clauses alphabetically ordered

---
 package/qt6/Config.in            |  1 +
 package/qt6/qt6grpc/Config.in    |  7 +++++
 package/qt6/qt6grpc/qt6grpc.hash | 10 +++++++
 package/qt6/qt6grpc/qt6grpc.mk   | 46 ++++++++++++++++++++++++++++++++
 4 files changed, 64 insertions(+)
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
index 0000000000..b8bc2e4651
--- /dev/null
+++ b/package/qt6/qt6grpc/qt6grpc.mk
@@ -0,0 +1,46 @@
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
+QT6GRPC_LICENSE = \
+	GPL-3.0-only, \
+	Apache-2.0 (tests), \
+	BSD-3-Clause (infrastructure), \
+	GFDL-1.3-no-invariants-only (documentation)
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
+	host-qt6base \
+	host-protobuf
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
