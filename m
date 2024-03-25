Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A97DC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F57E608E7;
	Mon, 25 Mar 2024 22:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlFncWY96Jbm; Mon, 25 Mar 2024 22:34:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66090608EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66090608EF;
	Mon, 25 Mar 2024 22:34:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BAA01BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 380DD40721
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nP45PTGlxBhD for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:34:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C688140551
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C688140551
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C688140551
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:34:37 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1e0eaf81dabso1026505ad.3
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406076; x=1712010876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQJSSSlPJme1hlah+ooPUwRy+wxtY1t/Kwgnb5Mvs80=;
 b=lupiyjFP/kYcew4PY28G3pnm55e+Fffi9oggmzCQUJO90k6bCSJsJdp2usLYwDflWD
 wNm+0bzJxmnIFnhGAFwvlfnlWcMnzFfIhGC5LSf/pMzhIn7XTZaJq9OgeP/JeohEfYUm
 iebOO4eQeUlOzK2p47EoUlGgsBd3sdMUq2vniGh5Z77dUDa01Rg8Dk1kd0snmA23q1iG
 4x9S0qHuMBptlOzvL2cjQEH5zssqdP4IP8inMi/sr2IhmPiNd5OUiTddHFS/dlnqYQvj
 RUX6elVB5A62KnsjdJm8t3jL2SgoOlyG4DvGvOP9gho1Sr26GmxEPicnKfMbPo6kXIQ1
 OoYQ==
X-Gm-Message-State: AOJu0YyPGuIi6foiYr5M+JWPu244XhLpTyUBOalokz/ZYj6rbCQXmuUW
 IZbfNJvlH2ji8cIVLnO/Jr/zj19kLnlzPAUDLqYhj5Pmyk1IuzgOnDTasakMPY9fNbYKLUdBPID
 6
X-Google-Smtp-Source: AGHT+IE5deM9oSKuSRo8gRx1qSRzMsgn8UYywB/wYQc0JZ07Qiz0cOh+qyfVLrWzjVgS7XZxO7VvOQ==
X-Received: by 2002:a17:903:24c:b0:1e0:bc5e:5ee1 with SMTP id
 j12-20020a170903024c00b001e0bc5e5ee1mr1616956plh.47.1711406076369; 
 Mon, 25 Mar 2024 15:34:36 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902f54a00b001dd7a97a266sm5245323plf.282.2024.03.25.15.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 15:34:35 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 16:34:14 -0600
Message-ID: <20240325223424.108702-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
References: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711406076; x=1712010876;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQJSSSlPJme1hlah+ooPUwRy+wxtY1t/Kwgnb5Mvs80=;
 b=HbmQAS+1zSlXQBxml7y+mNMNU1coEvpLkVgS+y/kryPeQSuqmpLXfWSlgS18xLZDdb
 EHhcXWGyT+Hq77838aejPPHHWh1KZWfy+c8uE/0mKRbCyQHokygBMCXePVeoUcs0c4My
 dyWRkwteIfl0dKL9arDC5q6pVBNyXhgIbKJxE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=HbmQAS+1
Subject: [Buildroot] [PATCH v2 03/13]
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
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
v1 -> v2: Use SUBDIR and BUILDDIR [Arnout]

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
index 0000000000..2b5c896736
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
+FLUTTER_ANIMATIONS_EXAMPLE_SUBDIR = packages/animations/example
+
+define FLUTTER_ANIMATIONS_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_ANIMATIONS_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_ANIMATIONS_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_ANIMATIONS_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_ANIMATIONS_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
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
+	cp -dprf $(FLUTTER_ANIMATIONS_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_ANIMATIONS_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_ANIMATIONS_EXAMPLE_BUILDDIR)/libapp.so \
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
