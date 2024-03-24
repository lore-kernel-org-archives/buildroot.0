Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B405FC54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 22:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FDCC81DE2;
	Sun, 24 Mar 2024 22:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kkAfYrpe7Q2p; Sun, 24 Mar 2024 22:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48DDC81CE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48DDC81CE3;
	Sun, 24 Mar 2024 22:51:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90E161BF4E4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BE1760690
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V74_R_3JuVqQ for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 22:51:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6FE4360754
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FE4360754
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FE4360754
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 22:51:11 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3c37e87756dso2388242b6e.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711320670; x=1711925470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LQ/hzmLO410hZGMO6SMHTHCxXLi9wOUEkiChDC1V7JM=;
 b=qs1q+HjZVfDaMKtuyBDraZrc0LzpSGqCEyoVNnggzcQ+dKKKAW43sFs27QDxZPTDT5
 dMfbM7i8wuZ4vL+7VM8ZmvrkwA2+gVefxZf9M1h2UaW+DlEj2a6gQsT+YA3wtsM4bqWN
 ZMvqpci+zxBgcta2hqGUtSPYfv+ui4aZsHViNXH0ktQ1+l7Z3ZmptbMgCi1K5p6pUH99
 V1pPQVWlnRTKNqYm2tpkIi5qRaCgBwsmrrGDqQJ65MlKJ6rDV2gRfuKXLLKe+UScTzHG
 5ptwPun6uxaX1gPa73/9faYeuoCNdYSylGNyquskf8lpMUSmkjBuwfZGg7i6pMEPuUXT
 MYHA==
X-Gm-Message-State: AOJu0Yw4qh/EVYgD9CPku4zCM+8gLj/dbXA1v6rF9gL6KT880ORDVf2K
 37Sr9wzT//HlHXlRIDYMEQl+ajmD2v7LXtDs0PZLvYWFpZDRAVNXIZaA3Tu1J+mY5PGGfSasPVW
 u
X-Google-Smtp-Source: AGHT+IGMOLWHde7IzDRhaQgPm2QfqtNuGV8tG3BmaULw3WUOihuEWA0CDsVWQlWivr2RDzJZK19QXg==
X-Received: by 2002:a05:6808:218d:b0:3c3:a683:c320 with SMTP id
 be13-20020a056808218d00b003c3a683c320mr8189273oib.13.1711320670186; 
 Sun, 24 Mar 2024 15:51:10 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a33-20020a056a0011e100b006e580678dfbsm214031pfu.193.2024.03.24.15.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 15:51:09 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:50:44 -0600
Message-ID: <20240324225052.629874-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
References: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711320670; x=1711925470;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LQ/hzmLO410hZGMO6SMHTHCxXLi9wOUEkiChDC1V7JM=;
 b=GRhX4VvOdkrgExB1Mw6+K12p0e+3ak+kTD/LGWOBpAi9VwNFUE6IbN1oTA87tCSS+k
 fLiQ30Fd21ktlVVGgV+2XkwCmezxqvuC6ZMrYBM2GT5+UFnKZzdYU8dNnR88V+p5ScQY
 X49re8styexJkvJGIyGLLDocND5Fgco3M18Vw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GRhX4VvO
Subject: [Buildroot] [PATCH 05/13]
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 0000000000..d3b7a94a29
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
+FLUTTER_GO_ROUTER_EXAMPLE_BUILD_DIR = $(@D)/packages/go_router/example
+
+define FLUTTER_GO_ROUTER_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_GO_ROUTER_EXAMPLE_BUILD_DIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_GO_ROUTER_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_GO_ROUTER_EXAMPLE_BUILD_DIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			-Dflutter.dart_plugin_registrant=file://$(FLUTTER_GO_ROUTER_EXAMPLE_BUILD_DIR)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
+			--source file://$(FLUTTER_GO_ROUTER_EXAMPLE_BUILD_DIR)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
+			--source package:flutter/src/dart_plugin_registrant.dart \
+			--native-assets $(FLUTTER_GO_ROUTER_EXAMPLE_BUILD_DIR)/.dart_tool/flutter_build/*/native_assets.yaml \
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
+	cp -dprf $(FLUTTER_GO_ROUTER_EXAMPLE_BUILD_DIR)/build/flutter_assets $(FLUTTER_GO_ROUTER_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_GO_ROUTER_EXAMPLE_BUILD_DIR)/libapp.so \
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
