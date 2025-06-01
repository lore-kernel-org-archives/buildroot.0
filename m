Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E78EC5B549
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32A0441E0A;
	Sun,  1 Jun 2025 10:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEJybdcqMPNT; Sun,  1 Jun 2025 10:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C07A741DDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C07A741DDC;
	Sun,  1 Jun 2025 10:41:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B555127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C50360A51
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8ktDpi35EsU for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:41:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0DA93606E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DA93606E7
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DA93606E7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:50 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-55324587a53so5243053e87.0
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 03:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748774509; x=1749379309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fAQEgoiOH4EBCStNdc+PJrg2RWow+edS/2/Hu0AZxKA=;
 b=Yjugak4q3UPRsw4LN+n5apuLv+MX76kojKBj+VKVK7TolLcA7X/cGsyvUkjeh5qVNK
 OT8Mvmdbi195uUtMesnP2Glrru58vzAosB2qnCGi4uji5GISbRSeyitQZNoyCRWUj269
 rCy+2+a4QznP70t+XrfKQWUgtYtsy3k+Gy7Qc02pI3ZySTOqvFt4H5DaauzDp4ZjTb0Q
 IApQu9lRdAOYQJZv/p2+vVBEQ/pCHpw0rhySdiynzdZmfW+z0np0wXF1YDFE05j5dSTn
 F5TyWbP/nxrh77+brkxKdVXGQGw/zewW+e9MoMzvvdxl3k8VV7CNf2e5sSaf4RktvbwD
 1MfA==
X-Gm-Message-State: AOJu0YwHjb28QsTNKnEVLDLtu1n4mSXggkk/RgOS59C3LyBJhR//B5Uq
 TQkd4UP4MTiSfwMncLPCoQEsNMtIH6mUiSyWviuU9pkApR3YVP88nvouVKgLpw==
X-Gm-Gg: ASbGncsVLlWKW0P1gCYkWhHT2+kAESDhIHiOItII7CzgoglbOdZjNurACm5cygovirf
 SiuHkK9NQoZN7S9m6Dn5xG+GNm0LtCxiqTx5d7pH3Zh/orTd2ZXueH+pugNRkDWO9Wp4catUh9a
 DZ9Gc4UvIN0G0ScENksM6sFki7J0cziBy9CFls4CTZ4HLegYtGyZVKccZC81an6ZWaRzttfK5J4
 OxuJOowC1qQ8+005guNghf7Kjg2bN7XdYjOd7IOePuTcxUzZ6b0UvEAOxd8/YakWGXQIZAZU+TD
 8ZpipTl90V+yBLWz/MCfGgAesyJ7068Ckuy0h8LArM3edkmSSR4d60+iGL90ep7IhKsdzqE361o
 7AArr2Mry5zHXwu4GOR10
X-Google-Smtp-Source: AGHT+IE9ePHAHTZqJwoNrFKKGAqJRca/NC8pm1/kHK5I+G8nexhNp4kVSlGEM5THhulwO7WHyDtVzw==
X-Received: by 2002:a05:6512:3b86:b0:54a:c4af:15 with SMTP id
 2adb3069b0e04-5533ba8be3emr2903600e87.19.1748774508614; 
 Sun, 01 Jun 2025 03:41:48 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553379378easm1266670e87.240.2025.06.01.03.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 03:41:48 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jack Rubacha <rubacha.jack03@gmail.com>
Date: Sun,  1 Jun 2025 12:41:26 +0200
Message-ID: <20250601104133.3238551-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601104133.3238551-1-roykollensvendsen@gmail.com>
References: <20250601104133.3238551-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748774509; x=1749379309; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fAQEgoiOH4EBCStNdc+PJrg2RWow+edS/2/Hu0AZxKA=;
 b=GM6dQO4PlFj1gxvclCGDQDXMorZ5XCOF21qzuCQpuKMjlV9vY99iMmZ8lM0G+xA5hK
 KZQGaAf2ajLHAj7KpbngAZkfr4FlvJ/HsfBl8nJ/vO3YeTKhXsfo3sedGKrWGYr5opL2
 UUYsArB5sF+MkqFvnQhuSYAXCAjX11RiwlcOCORUEp88hhIu9Ojq6NzBcvm7FYP4C5KP
 vFpfEbgUKvzkeRf8SpW0/ABrjEM0sm7wm+QzxhoUGEXmlWpz0FuqNJGMKXZvOzByGFjE
 YmyQ8cuxZyplme8B6Id02I8JIcBRh+P1HqbjO57LmMkdi6dra/jOWR4gzAU86wNLvekX
 4UoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GM6dQO4P
Subject: [Buildroot] [PATCH v4 4/6] package/qt6/qt6grpc: new package
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
