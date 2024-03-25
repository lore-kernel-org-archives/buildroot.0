Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E1AC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8415608E6;
	Mon, 25 Mar 2024 22:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDV89Hp_bTyk; Mon, 25 Mar 2024 22:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC07160906
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC07160906;
	Mon, 25 Mar 2024 22:34:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB6F41BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6BB240721
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kr1UesQ5qnsK for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:34:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C87940551
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C87940551
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C87940551
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:34:39 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1e0d654590bso7045425ad.2
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406079; x=1712010879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Kx6qqjZ2zPlrsmQcJO3TTD8W3H9RpjfRTH/mG97Qqo=;
 b=pY8FDB6QjsiKKvI519EkfDw+ASopO/VTxFtt73FH3WnaQ3NI6vr/xGsVsrbFwZTJ8r
 qQRX61Nn4MAMzfC387osM+tfSk4DOgkr2SrXQDruNpcTpHLKNv+8sKeZlkwHDJ59VXst
 vgKl/Iq8rpTbEvYZTaVeCmFbb6n9aBZEodzTG5fSYY7b9ecudiWOw+5qpN244ehsuxSm
 +fJYZZrQDSAfpTvWbWpqhmG9BgrSkn3FPE9GX3JXvaa2G/oTI8BAey6HMc+MMquZ0rXK
 rz84vJ/7K0yPivuf7/uydSg+UWclwDjgA7v01IOayATkOumhVP7PNjj330D9ZhvVNXoy
 CpRg==
X-Gm-Message-State: AOJu0Yxj14X05kaFgNQnzUYssWgjPirZi1w3T49t42NY8in4YoipdWvl
 BPnUQa4xRSpbAWOMJvpvjlw8uLns20ICZqCQh2Mcu3swEec74fetINVieULmLqF15TnjkdbBQXO
 V
X-Google-Smtp-Source: AGHT+IF7HOaoOrMERGJXQqV/NKT9Lk4rGN0N9oPmflo4+y8j48oSVd/HVC0KvamVgd12p1chos6VmQ==
X-Received: by 2002:a17:902:d485:b0:1e0:e85b:bbac with SMTP id
 c5-20020a170902d48500b001e0e85bbbacmr628217plg.52.1711406079049; 
 Mon, 25 Mar 2024 15:34:39 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902f54a00b001dd7a97a266sm5245323plf.282.2024.03.25.15.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 15:34:38 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 16:34:16 -0600
Message-ID: <20240325223424.108702-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
References: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711406079; x=1712010879;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Kx6qqjZ2zPlrsmQcJO3TTD8W3H9RpjfRTH/mG97Qqo=;
 b=iGwH43ySAddqL+stn6uMe3tIhkM0GGPUW7CzsC+xHxFrXW05/3Y/N3MKy7NGXWXr/o
 B6ZOubSn6nadoEj08jpYjQUc9GhNHc0la1kzrviVHfHgZ8cfNFaZzT+PooZ3JYEYzgdM
 t+VLgY5dugfsRvG98yIyob9N6sDpWH56rAqWM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=iGwH43yS
Subject: [Buildroot] [PATCH v2 05/13]
 package/flutter-packages/flutter-go-router-example: new package
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

A Flutter plugin that manages files and interactions with file dialogs.
This package contains a dart_plugin_registrant dart file, much like the
flutter-gallery package. The build commands contain the three
lines from the flutter-gallery package referencing the
dart_plugin_registrant dart file.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Use SUBDIR and BUILDDIR [Arnout]

 DEVELOPERS                                    |  1 +
 package/flutter-packages/Config.in            |  1 +
 .../flutter-go-router-example/Config.in       |  7 +++
 .../flutter-go-router-example.hash            |  1 +
 .../flutter-go-router-example.mk              | 57 +++++++++++++++++++
 5 files changed, 67 insertions(+)
 create mode 100644 package/flutter-packages/flutter-go-router-example/Config.in
 create mode 120000 package/flutter-packages/flutter-go-router-example/flutter-go-router-example.hash
 create mode 100644 package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 699551b503..97418954c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-packages/
 F:	package/flutter-packages/flutter-adaptive-scaffold-example/
 F:	package/flutter-packages/flutter-animations-example/
 F:	package/flutter-packages/flutter-dynamic-layouts-example/
+F:	package/flutter-packages/flutter-go-router-example/
 F:	package/flutter-packages/flutter-markdown-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
index 17e68da8e1..bbcd3aec93 100644
--- a/package/flutter-packages/Config.in
+++ b/package/flutter-packages/Config.in
@@ -10,6 +10,7 @@ if BR2_PACKAGE_FLUTTER_PACKAGES
 source "package/flutter-packages/flutter-adaptive-scaffold-example/Config.in"
 source "package/flutter-packages/flutter-animations-example/Config.in"
 source "package/flutter-packages/flutter-dynamic-layouts-example/Config.in"
+source "package/flutter-packages/flutter-go-router-example/Config.in"
 source "package/flutter-packages/flutter-markdown-example/Config.in"
 endif
 
diff --git a/package/flutter-packages/flutter-go-router-example/Config.in b/package/flutter-packages/flutter-go-router-example/Config.in
new file mode 100644
index 0000000000..8cdb61e3bc
--- /dev/null
+++ b/package/flutter-packages/flutter-go-router-example/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FLUTTER_GO_ROUTER_EXAMPLE
+	bool "flutter go router example"
+	help
+	  A Flutter plugin that manages files and interactions
+	  with file dialogs.
+
+	  https://github.com/flutter/packages/tree/main/packages/go_router/example
diff --git a/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.hash b/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.hash
new file mode 120000
index 0000000000..879f2adb39
--- /dev/null
+++ b/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.hash
@@ -0,0 +1 @@
+../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk b/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk
new file mode 100644
index 0000000000..a7fa36ca9e
--- /dev/null
+++ b/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# flutter-go-router-example
+#
+################################################################################
+
+FLUTTER_GO_ROUTER_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
+FLUTTER_GO_ROUTER_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
+FLUTTER_GO_ROUTER_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
+FLUTTER_GO_ROUTER_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
+FLUTTER_GO_ROUTER_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
+FLUTTER_GO_ROUTER_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
+FLUTTER_GO_ROUTER_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
+FLUTTER_GO_ROUTER_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
+FLUTTER_GO_ROUTER_EXAMPLE_PKG_NAME = go_router_examples
+FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/$(FLUTTER_GO_ROUTER_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
+FLUTTER_GO_ROUTER_EXAMPLE_SUBDIR = packages/go_router/example
+
+define FLUTTER_GO_ROUTER_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_GO_ROUTER_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			-Dflutter.dart_plugin_registrant=file://$(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
+			--source file://$(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
+			--source package:flutter/src/dart_plugin_registrant.dart \
+			--native-assets $(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			package:$(FLUTTER_GO_ROUTER_EXAMPLE_PKG_NAME)/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
+			--deterministic \
+			--obfuscate \
+			--snapshot_kind=app-aot-elf \
+			--elf=libapp.so \
+			.dart_tool/flutter_build/*/app.dill
+endef
+
+define FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_TARGET_CMDS
+	mkdir -p $(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/{data,lib}
+	cp -dprf $(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/libapp.so \
+		$(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/lib/libapp.so
+
+	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/data/
+
+	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/lib/
+	$(RM) $(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+	touch $(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+endef
+
+$(eval $(generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
