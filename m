Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C02C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 21:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6426A40E62;
	Mon, 19 May 2025 21:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYtzu05PnbvN; Mon, 19 May 2025 21:06:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D281C40DE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D281C40DE9;
	Mon, 19 May 2025 21:06:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E5C2193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AF1B4192E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hU23n_8xbdXo for <buildroot@buildroot.org>;
 Mon, 19 May 2025 21:06:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 02009400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02009400EC
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02009400EC
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:13 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-3106217268dso45924671fa.1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747688772; x=1748293572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fAQEgoiOH4EBCStNdc+PJrg2RWow+edS/2/Hu0AZxKA=;
 b=jiUyKiJC+dYYMelLSgjmm1Y6p7SuwIW4tWh3YfxLWS8GfBSTuBpiym0FWX4f9MFoYi
 Lm5qj690a9cj7rf5vjUoIMkTonYKKcF6z6cswdmvGph6m9rnm82Fbdc1YuyLVRojShXv
 LuqS+vC0X8t6do1Mh+RdMGWDde1ZwoliGJvm9dqIRrxcGapixd0U7tZKpp20IYw1ROj4
 oMeOrN0HBix2kbeQg/FRCrU0TznKtcTS06aD/HhKNvjwiQC+b8GMXtXKqY1YN3VaU0ot
 p/2YryV0AoviZ2e/p4yGjugOgvTYwBfszBbmqsPpKmHHgBGgkpHdyIbu/AGGRexh48c/
 M55g==
X-Gm-Message-State: AOJu0YxQuChCGJc3AYB1OdXFMIi4pruadGYPHVU90poWHsC552w8E9ep
 GKiIiuNNb/PHACZKUvgoZeArXRwo+sl9THS2GPl/vRuK/bvnvw/WqKDkJzpWZQMP
X-Gm-Gg: ASbGnctP+M7h6Oun279joMJFTblo+FTFfAjgBxeDYAuganZWtUtR3n9P1P6qNSQ1oC/
 ETqF+UJQriwaW3Cl0557RrRxj9rg9HpTZ++JAnNBcFRK3rDAQxD6JoiEJTjiI968a/HqN8T1XVf
 zFIh+VoEZzWItSIB7LVRg06FfuYZLUxbqoPCNBQNTvlG/F7ryakJ2TOQqNwB3M4aVrIR3UyABsT
 hxGBWejnvs9kSsyeT2HsAqCY4JrDRdblk9OTCUlqcYwciywXK0aM+sfrnaL7FkC0Ua1SoJBxF4J
 yGo4/etAImg0Z0ywfVs7myjOVYbP0nJRtovz4fvuIg6bx9/9K701MlSttFIt6fL2CqsH+Y1Z+nx
 3Jk4fbA==
X-Google-Smtp-Source: AGHT+IGtgEei4s/Nty2ublBFySixdTIc3bN4CY7k8N4ljD+TTQSttwqql58eFeR8CReZu8hpFrILdg==
X-Received: by 2002:a05:651c:421b:b0:30b:bfca:bbf2 with SMTP id
 38308e7fff4ca-328076e8a38mr37854431fa.7.1747688771557; 
 Mon, 19 May 2025 14:06:11 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cfaebsm20181171fa.100.2025.05.19.14.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 14:06:10 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 23:05:38 +0200
Message-ID: <20250519210553.265725-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519210553.265725-1-roykollensvendsen@gmail.com>
References: <20250519210553.265725-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747688772; x=1748293572; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fAQEgoiOH4EBCStNdc+PJrg2RWow+edS/2/Hu0AZxKA=;
 b=cMeGWx1wJYrvKygW9UUxxXUM3BBrfJnOzBDSGsi1EMHTxfuUZRRpyrYlvzWdI4TtR3
 rOLPtzp12gAtdDQIYNvFPYo/49zLs8tEH2tWcFlmLgMxc3AGo7YZqYKjYQcepqnsHt1+
 wpcl5qm20tEfEzB/Lr70la0m7BbDHem0oG05EJKxX6zI45CPKYzE2ZQEzUXphlK7STlL
 2jsoirwHK1/GpnMB+PVJC/xueiL+OdNefnelwlaaMEUa82AOTJnmyYDJAVFA88r6gq6L
 TJKqquZ2+corB23/3g17g1uzSSfLwBjRwdEMO+rlMAPXyulTYpB0dhLdSvzPCZOXhKdE
 ZNbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cMeGWx1w
Subject: [Buildroot] [PATCH v2 04/11] package/qt6/qt6grpc: new package
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
 Jack Rubacha <rubacha.jack03@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jack Rubacha <rubacha.jack03@gmail.com>

Adds the QT GRPC module (containing Qt Protobuf as well).

Signed-off-by: Jack Rubacha <rubacha.jack03@gmail.com>
Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
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
index 6b7152d902..c1ea543242 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -49,6 +49,7 @@ source "package/qt6/qt6connectivity/Config.in"
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
index 0000000000..6e003cb525
--- /dev/null
+++ b/package/qt6/qt6grpc/qt6grpc.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtgrpc-everywhere-src-6.9.0.tar.xz.sha256
+sha256  3957e076181ac0d9a8f9fca93ec49e1e5e143e39eee1ec3feee10ca13f64b137  qtgrpc-everywhere-src-6.9.0.tar.xz
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
