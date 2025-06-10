Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B41CC5B552
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 12:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 484F460652;
	Tue, 10 Jun 2025 12:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J09QB7Kbnnbx; Tue, 10 Jun 2025 12:29:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EF6760DA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EF6760DA3;
	Tue, 10 Jun 2025 12:29:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0BBF1F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A748841BF0
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tju-2XOu8dH3 for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 12:29:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70E12418E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70E12418E4
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70E12418E4
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 12:29:37 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-54e98f73850so5765481e87.1
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 05:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749558575; x=1750163375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NnCyXL6ZuS7oGZHZmLx2EdummGpPdyILVGBigG1f6U=;
 b=tN10DZjDa7J2X0uwaKZLjBchpNAdf3WE+4E187Q0bFCx7u7fvktx2Lq70Vi9FhY8XD
 KZBXkXbWm/y1HNIv5anVhERPzPmfEQirC2dcuxur855FmftrSoGsLqbv1rxH6VKIEh8c
 yXHUaJJZ0T+lowT1qFTTG9eHxhS7XFJXWrsfIhryTR8ddphRFGhbs7x+G4Lepq57HqQL
 2g7OxVCU05PXMKeHyA31rKvjgIUg5MFuX5+cZ2KLbHr0JHxvxBOTJ3dKGLKxKrdOtrdH
 ZsSnzHyLybMOeFfXgRIz1MwC1KVbaGeUTPAzeq8TwL2jx5pxqtBoQVpmEuMKh/Oo+AY6
 Rq6w==
X-Gm-Message-State: AOJu0YzaCcbOt8zudU4fODRGGCBh0w3MNH9pQiIlO7kGFID6fSCAfw61
 1eQ7Qsck0cGMCn/VWkACW2eLojY4NXw+lPDeq3Asv1mZrzKo9k6j98ljw1Dlag==
X-Gm-Gg: ASbGncu6ksEcxXmCIDPn4i0y9VTgIZtyRCflNFqIYUKEGsjhpm/74aWKXDfNzdCgla9
 n3XeqopH4+ZdYvI+67PFMU+XP5PynTgUelM/5xXDp3AaHVGtBj0n5OSj37xpcXsd9OSyRFWPg+C
 1y9G3LXb4dyU63vxhtYgiw12nuXRcYtHE2Fte7uHWcsQVRKtu0P7S//b8LYV+Y3A8X0L3m+VrQu
 qN/yhTKcv0045Bdy8xw9RryfotIHAUj4a3xwOZeiwFkJkqxYWYjstPNfaBtBZPUbsobYVrqYV7B
 TYIBPZ5te9Vt7UXm56IBXA9DO5Hzq2Gkpb010iaUQNnvuYyA7f1sQ+47yac/6WiP6ZUvOQx3mnc
 3ZpIzD9y8F8/xe5Ll
X-Google-Smtp-Source: AGHT+IFVXdiFtJs3cjQRUdul2XOblPoEYO0XjfI3jqTr/Mw3vSNsWqHW5QSlGhGpLjzxbJ2BhYdkkw==
X-Received: by 2002:a05:6512:3f17:b0:553:2e76:710f with SMTP id
 2adb3069b0e04-55366c33751mr4107892e87.53.1749558574840; 
 Tue, 10 Jun 2025 05:29:34 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553677224cbsm1514875e87.139.2025.06.10.05.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:29:34 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Jun 2025 14:29:18 +0200
Message-ID: <20250610122924.431830-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610122924.431830-1-roykollensvendsen@gmail.com>
References: <20250610122924.431830-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749558575; x=1750163375; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NnCyXL6ZuS7oGZHZmLx2EdummGpPdyILVGBigG1f6U=;
 b=g4b/fHQkXNkkXUrX86FfmBm1ZrvQ6zUHCCvguQjHZu3Vj2p00I0EsHE8fAOOKap9el
 lemdgL7Zssce/x42aUPYxPhH3aRyV4Ax9XrhlNwgoXeEMC+YWWuQcyZaOZSsCVdz5/go
 vnwUls6qAQB9OwwdalXNb5OjjR8TtzTpzyw7S8ASkuDaBWSnc347UHi3TN2h4aos93F9
 ksbc08dQVcSYn2GZEmRlbvI0YDuCMJNiqW7/RYPpImM20MiZUhuLr98/uSQQN9h+7ZW+
 m44POY2NzJLLF/M8BVjxfaSDLkf1ioTlFM1zybb9DQcQQ3kg1xbv5PkId5W4PDbre7A6
 K/mQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g4b/fHQk
Subject: [Buildroot] [PATCH 4/6] package/qt6/qt6grpc: new package
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
index 0000000000..bbf30f2a2d
--- /dev/null
+++ b/package/qt6/qt6grpc/qt6grpc.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtgrpc-everywhere-src-6.9.1.tar.xz.sha256
+sha256  c34c869e203289b0fd695a1e5391840bc51b919a8b55e1ed1ff36b4cb923a750  qtgrpc-everywhere-src-6.9.1.tar.xz
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
