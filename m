Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F64C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 953C2608D3;
	Mon, 25 Mar 2024 22:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSLqGQzrbZNv; Mon, 25 Mar 2024 22:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30793608D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30793608D8;
	Mon, 25 Mar 2024 22:34:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB9841BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C85896082F
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nM-MJs7t0oho for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:34:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89AF4605D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89AF4605D8
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89AF4605D8
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:34:36 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1e0edd0340fso245535ad.2
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406075; x=1712010875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbsGy9rJG2bOgrV1VhYu8FXqLiWlxWawSQxAsE8MlUw=;
 b=BkFr6IBbs8AavZ4JvTEjeAOI+DBOlGULMZIKujVorDrFiR4rKUVmIbjA/vAqHON/Yj
 N6KMncZLtwJs1w+ffCSN6p/hGbFxszSmsiK5A6/S1wlVsX68Ala965+WcdfKQ+ZWqnV1
 8u1zabbW08OI4Hyp7jJT54yFKZhKE/LweY+x+Zp9KubRdiNvez619pCJ+uAjjGJoFXID
 9NvT1YMXpYMnQcNAFojAxonKBsl1uUradxc9I0MPvMFXIA8/rJb98sNh0J+mvub2sII+
 2J9K2upT20T23IMY42Q6buHnGmYRIw2SRtvJf/yhK/4Ypo/qO1Rqw55D5mnc6UAEcopg
 g++Q==
X-Gm-Message-State: AOJu0YwP5W7CAyKaZzjKFgtbYhgapNTeYlhh8ggumpwTgWxKOAHoggNj
 ah8VTGmsXyEh8iRcXbQdq44VqIy98f7HZwE0Iy/GiAmzs9Rds+78QglV43+PDo8C7ZOq+pOoI5s
 X
X-Google-Smtp-Source: AGHT+IHoUtfLVyG3hsRab3n6/SOgBilsac/Q/DJT2+MYIjN47KHojJ05SzoyHI/5L9M7Or1WtY1opQ==
X-Received: by 2002:a17:902:d484:b0:1e0:bd7f:16f with SMTP id
 c4-20020a170902d48400b001e0bd7f016fmr5978879plg.28.1711406074953; 
 Mon, 25 Mar 2024 15:34:34 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902f54a00b001dd7a97a266sm5245323plf.282.2024.03.25.15.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 15:34:34 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 16:34:13 -0600
Message-ID: <20240325223424.108702-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
References: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711406075; x=1712010875;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbsGy9rJG2bOgrV1VhYu8FXqLiWlxWawSQxAsE8MlUw=;
 b=d9TEzNx/cgKd5sb5dD4DmDShlMU7dCxgdvSYecujJ2ZlKn58yxRvJLgDAQv+315d/Z
 HGRWRRZUkp1aP8gXAw18Gru+SP4X6pVSlu34D33funf4mypY2ykePFVcHxsZk95ojnTJ
 3C/PfczG8fyC+1NBFZoh8d7pyz0gfHeULQb54=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=d9TEzNx/
Subject: [Buildroot] [PATCH v2 02/13]
 package/flutter-packages/flutter-adaptive-scaffold-example: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides a nice-looking Gmail lookalike application using
Material 3.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Use SUBDIR and BUILDDIR [Arnout]

 DEVELOPERS                                    |  1 +
 package/flutter-packages/Config.in            |  1 +
 .../Config.in                                 |  8 +++
 .../flutter-adaptive-scaffold-example.hash    |  1 +
 .../flutter-adaptive-scaffold-example.mk      | 54 +++++++++++++++++++
 5 files changed, 65 insertions(+)
 create mode 100644 package/flutter-packages/flutter-adaptive-scaffold-example/Config.in
 create mode 120000 package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.hash
 create mode 100644 package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8b487b04f3..f87a7c9e83 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -34,6 +34,7 @@ F:	package/foot/
 F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-packages/
+F:	package/flutter-packages/flutter-adaptive-scaffold-example/
 F:	package/flutter-packages/flutter-markdown-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
index 7cedf7c473..9c4b42b74c 100644
--- a/package/flutter-packages/Config.in
+++ b/package/flutter-packages/Config.in
@@ -7,6 +7,7 @@ menuconfig BR2_PACKAGE_FLUTTER_PACKAGES
 	  First-party Flutter package examples.
 
 if BR2_PACKAGE_FLUTTER_PACKAGES
+source "package/flutter-packages/flutter-adaptive-scaffold-example/Config.in"
 source "package/flutter-packages/flutter-markdown-example/Config.in"
 endif
 
diff --git a/package/flutter-packages/flutter-adaptive-scaffold-example/Config.in b/package/flutter-packages/flutter-adaptive-scaffold-example/Config.in
new file mode 100644
index 0000000000..f7c448e06c
--- /dev/null
+++ b/package/flutter-packages/flutter-adaptive-scaffold-example/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE
+	bool "flutter adaptive scaffold example"
+	help
+	  Adaptive Scaffold reacts to input from users, devices and
+	  screen elements and renders your Flutter application
+	  according to the Material 3 guidelines.
+
+	  https://github.com/flutter/packages/tree/main/packages/flutter_adaptive_scaffold/example
diff --git a/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.hash b/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.hash
new file mode 120000
index 0000000000..879f2adb39
--- /dev/null
+++ b/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.hash
@@ -0,0 +1 @@
+../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk b/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk
new file mode 100644
index 0000000000..f6ac086115
--- /dev/null
+++ b/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# flutter-adaptive-scaffold-example
+#
+################################################################################
+
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_PKG_NAME = flutter_adaptive_scaffold_example
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/$(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_SUBDIR = packages/flutter_adaptive_scaffold/example
+
+define FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			package:$(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_PKG_NAME)/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
+			--deterministic \
+			--obfuscate \
+			--snapshot_kind=app-aot-elf \
+			--elf=libapp.so \
+			.dart_tool/flutter_build/*/app.dill
+endef
+
+define FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_TARGET_CMDS
+	mkdir -p $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/{data,lib}
+	cp -dprf $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR)/libapp.so \
+		$(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/lib/libapp.so
+
+	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/data/
+
+	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/lib/
+	$(RM) $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+	touch $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+endef
+
+$(eval $(generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
