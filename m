Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CF5C54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 22:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F39F81BA9;
	Sun, 24 Mar 2024 22:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2p-O5u5zVeh9; Sun, 24 Mar 2024 22:51:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCACB81D2D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCACB81D2D;
	Sun, 24 Mar 2024 22:51:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC6601BF4E4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD389607FD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkYsvUErCZjp for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 22:51:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 806BA60754
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 806BA60754
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 806BA60754
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 22:51:09 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6e73e8bdea2so3057336b3a.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711320668; x=1711925468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6yfQ6s6Je/5e9gK9chbW7pVp3VYW0yCfecTk7+ybRZ8=;
 b=I/NET2ujlfhmFea5e5o83ZAIg5UxGV1hBu1fYqGv/7SknqtuR1/XNIkxA0qY69uJhN
 j5nNoNuYCVJGV7zpaoCLVtNpwapi3w/MGqoDOeH7cKJtjuLDetO/FXJa6t/TNWG203l0
 ZJjy6LC/AqwtJJh4ZaZw15IWasSXuw0ugMfUvrYU6k6naYGqWX7uWrOZF+ouVDC8JZNJ
 ncxU0lZAw8wjOJSNbipArnLpuFvV1MjUtb6QgBv1ipsl8jtVSyrp5rlsNqkG1yAVU6ZA
 kIIFF0BfnN4UReSjpdSFMu5KYDUoW6cb9cUCiOdxTPC2M5mB3NtogehjThSKDJyn972w
 zF6g==
X-Gm-Message-State: AOJu0YznA2w406YiHzJkiI6Avh5h7Uhpa+QhGM/MdlGgPb7GFPxGO9TH
 WUxTKit9flrXpp3gC93W+BRj62ttKL8bc6nJyNx6cO/UUXeK9tv6PJBwAaEj4+XrbC7xp98h09c
 r
X-Google-Smtp-Source: AGHT+IF38X0VbS24b127NWbBWDlNt7BBgIyl39LXCjqs2YfhE6XysLUZzc6R9LKCmnOKYgXbrNnjhQ==
X-Received: by 2002:a05:6a00:1897:b0:6ea:8e89:7eca with SMTP id
 x23-20020a056a00189700b006ea8e897ecamr7133862pfh.32.1711320667804; 
 Sun, 24 Mar 2024 15:51:07 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a33-20020a056a0011e100b006e580678dfbsm214031pfu.193.2024.03.24.15.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 15:51:07 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:50:42 -0600
Message-ID: <20240324225052.629874-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
References: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711320668; x=1711925468;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yfQ6s6Je/5e9gK9chbW7pVp3VYW0yCfecTk7+ybRZ8=;
 b=betjVwq/NaMfSH/67H077dmXWMivn7rm5PRIFsLjo2t5nR2airblluso/29xfnHw6l
 CqFZep2gs8SIH9eAVuUOtq/j1NqOMx+L+e/orZi1dmA3h8AiDNyVlBSKwQrmxmWw4spw
 bgNdOTFqIywymOMQhrkwA56kmU+ej592pvpMc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=betjVwq/
Subject: [Buildroot] [PATCH 03/13]
 package/flutter-packages/flutter-animations-example: new package
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

This package provides examples of the following animations:
  - OpenContainer
  - SharedAxisTransition
  - FadeThroughTransisiton
  - FadeScaleTransition

The package also provides a toggle that slows all the animations.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 package/flutter-packages/Config.in            |  1 +
 .../flutter-animations-example/Config.in      |  6 +++
 .../flutter-animations-example.hash           |  1 +
 .../flutter-animations-example.mk             | 54 +++++++++++++++++++
 5 files changed, 63 insertions(+)
 create mode 100644 package/flutter-packages/flutter-animations-example/Config.in
 create mode 120000 package/flutter-packages/flutter-animations-example/flutter-animations-example.hash
 create mode 100644 package/flutter-packages/flutter-animations-example/flutter-animations-example.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f87a7c9e83..971b810859 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -35,6 +35,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-packages/
 F:	package/flutter-packages/flutter-adaptive-scaffold-example/
+F:	package/flutter-packages/flutter-animations-example/
 F:	package/flutter-packages/flutter-markdown-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
index 9c4b42b74c..365e91cd99 100644
--- a/package/flutter-packages/Config.in
+++ b/package/flutter-packages/Config.in
@@ -8,6 +8,7 @@ menuconfig BR2_PACKAGE_FLUTTER_PACKAGES
 
 if BR2_PACKAGE_FLUTTER_PACKAGES
 source "package/flutter-packages/flutter-adaptive-scaffold-example/Config.in"
+source "package/flutter-packages/flutter-animations-example/Config.in"
 source "package/flutter-packages/flutter-markdown-example/Config.in"
 endif
 
diff --git a/package/flutter-packages/flutter-animations-example/Config.in b/package/flutter-packages/flutter-animations-example/Config.in
new file mode 100644
index 0000000000..c7801dccf1
--- /dev/null
+++ b/package/flutter-packages/flutter-animations-example/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_FLUTTER_ANIMATIONS_EXAMPLE
+	bool "flutter animations example"
+	help
+	  High quality pre-built Animations for Flutter
+
+	  https://github.com/flutter/packages/tree/main/packages/animations/example
diff --git a/package/flutter-packages/flutter-animations-example/flutter-animations-example.hash b/package/flutter-packages/flutter-animations-example/flutter-animations-example.hash
new file mode 120000
index 0000000000..879f2adb39
--- /dev/null
+++ b/package/flutter-packages/flutter-animations-example/flutter-animations-example.hash
@@ -0,0 +1 @@
+../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-animations-example/flutter-animations-example.mk b/package/flutter-packages/flutter-animations-example/flutter-animations-example.mk
new file mode 100644
index 0000000000..0c0156a5d7
--- /dev/null
+++ b/package/flutter-packages/flutter-animations-example/flutter-animations-example.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# flutter-animations-example
+#
+################################################################################
+
+FLUTTER_ANIMATIONS_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
+FLUTTER_ANIMATIONS_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
+FLUTTER_ANIMATIONS_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
+FLUTTER_ANIMATIONS_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
+FLUTTER_ANIMATIONS_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
+FLUTTER_ANIMATIONS_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
+FLUTTER_ANIMATIONS_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
+FLUTTER_ANIMATIONS_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
+FLUTTER_ANIMATIONS_EXAMPLE_PKG_NAME = animations_example
+FLUTTER_ANIMATIONS_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/$(FLUTTER_ANIMATIONS_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
+FLUTTER_ANIMATIONS_EXAMPLE_BUILD_DIR = $(@D)/packages/animations/example
+
+define FLUTTER_ANIMATIONS_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_ANIMATIONS_EXAMPLE_BUILD_DIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_ANIMATIONS_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_ANIMATIONS_EXAMPLE_BUILD_DIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_ANIMATIONS_EXAMPLE_BUILD_DIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			package:$(FLUTTER_ANIMATIONS_EXAMPLE_PKG_NAME)/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
+			--deterministic \
+			--obfuscate \
+			--snapshot_kind=app-aot-elf \
+			--elf=libapp.so \
+			.dart_tool/flutter_build/*/app.dill
+endef
+
+define FLUTTER_ANIMATIONS_EXAMPLE_INSTALL_TARGET_CMDS
+	mkdir -p $(FLUTTER_ANIMATIONS_EXAMPLE_INSTALL_DIR)/{data,lib}
+	cp -dprf $(FLUTTER_ANIMATIONS_EXAMPLE_BUILD_DIR)/build/flutter_assets $(FLUTTER_ANIMATIONS_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_ANIMATIONS_EXAMPLE_BUILD_DIR)/libapp.so \
+		$(FLUTTER_ANIMATIONS_EXAMPLE_INSTALL_DIR)/lib/libapp.so
+
+	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_ANIMATIONS_EXAMPLE_INSTALL_DIR)/data/
+
+	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_ANIMATIONS_EXAMPLE_INSTALL_DIR)/lib/
+	$(RM) $(FLUTTER_ANIMATIONS_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+	touch $(FLUTTER_ANIMATIONS_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+endef
+
+$(eval $(generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
