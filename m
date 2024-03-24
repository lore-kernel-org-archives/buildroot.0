Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2B5C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 22:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EE0D81CE1;
	Sun, 24 Mar 2024 22:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qltk4ryXwaVm; Sun, 24 Mar 2024 22:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDDD581D16
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDDD581D16;
	Sun, 24 Mar 2024 22:51:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A10391BF4E4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 992BC607FF
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uw72SgihLewc for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 22:51:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8345160690
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8345160690
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8345160690
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 22:51:10 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6e74aa08d15so2490514b3a.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711320669; x=1711925469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/fCHKYx08sMh2pVFIRIBVqK01l/r0JXvAk32/4AofXY=;
 b=Lh8eqvRGIP4QE6HTbmaHawsjpsV+7gzgvrFDbMoEj/tMVhYdrp3k1kf4NCcZidZRYv
 ROnuOBoiTR4B+3RNDABZiFyFRWnOyEVolTJCX24yBoP5DT9cnJyH8oiGQjl9o8GKyRML
 uZX4q3RSId5eNoFqCnnA6USqWy7UWOcfEaL0P1VesJSMZ0bBvBPpcXfa8BesJCNLprHS
 STLDIE0bZBh1yEh1VcYnutY4ggBr9DrFM8KnSr9Rycd40CxAw/al61rrfLjoU/IAkU8/
 tbz6H2WftgkK5Q8fvQC0lS0rYnxPG2TGMyiUeJ75ANIrppC11qiltoGCmvAkym3Jcvmc
 2ozA==
X-Gm-Message-State: AOJu0YyzB+UuV3WPWVKTMfBSVqlvOeykhTPL984KjHnojwhrqitGRNm5
 7jdj2eTHynxw5hb9PKGh5ASf7y7wGVHSPS5F3ODrqUZr1EYRFCWOAHruvkjfCZB7Jg/+VvkLsQa
 X
X-Google-Smtp-Source: AGHT+IEKX6rp95cIRwVLL5vUlo3fDwCPftXN9ZzmiOi0flSjNfBlN6uFGFKXXSIBsMxMUfx3n/kVMg==
X-Received: by 2002:a62:6585:0:b0:6ea:ab85:60bd with SMTP id
 z127-20020a626585000000b006eaab8560bdmr1638906pfb.2.1711320669087; 
 Sun, 24 Mar 2024 15:51:09 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a33-20020a056a0011e100b006e580678dfbsm214031pfu.193.2024.03.24.15.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 15:51:08 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:50:43 -0600
Message-ID: <20240324225052.629874-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
References: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711320669; x=1711925469;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/fCHKYx08sMh2pVFIRIBVqK01l/r0JXvAk32/4AofXY=;
 b=SMJyPrgOu+ZggXWONB/ZRROh9Cjy2yIaYaiP0eLXZKZr9MF8VF+xOcnoYa1oQCtM4o
 p1/rQIKKS6u+JWs8f6ANKvfFoivWB82FDIKFZJrnSky9si8oP4FAkqzmsN0SZ2ACRfRH
 0PctzMaoXg5UVsEyENcw5ArIDV1PVmYcWuI4o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SMJyPrgO
Subject: [Buildroot] [PATCH 04/13]
 package/flutter-packages/flutter-dynamic-layouts-example: new package
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

This package provides two multi-sized tiles and different layouts:
Stagger and Wrap.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 package/flutter-packages/Config.in            |  1 +
 .../flutter-dynamic-layouts-example/Config.in |  8 +++
 .../flutter-dynamic-layouts-example.hash      |  1 +
 .../flutter-dynamic-layouts-example.mk        | 54 +++++++++++++++++++
 5 files changed, 65 insertions(+)
 create mode 100644 package/flutter-packages/flutter-dynamic-layouts-example/Config.in
 create mode 120000 package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.hash
 create mode 100644 package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 971b810859..699551b503 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -36,6 +36,7 @@ F:	package/flutter-gallery/
 F:	package/flutter-packages/
 F:	package/flutter-packages/flutter-adaptive-scaffold-example/
 F:	package/flutter-packages/flutter-animations-example/
+F:	package/flutter-packages/flutter-dynamic-layouts-example/
 F:	package/flutter-packages/flutter-markdown-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
index 365e91cd99..17e68da8e1 100644
--- a/package/flutter-packages/Config.in
+++ b/package/flutter-packages/Config.in
@@ -9,6 +9,7 @@ menuconfig BR2_PACKAGE_FLUTTER_PACKAGES
 if BR2_PACKAGE_FLUTTER_PACKAGES
 source "package/flutter-packages/flutter-adaptive-scaffold-example/Config.in"
 source "package/flutter-packages/flutter-animations-example/Config.in"
+source "package/flutter-packages/flutter-dynamic-layouts-example/Config.in"
 source "package/flutter-packages/flutter-markdown-example/Config.in"
 endif
 
diff --git a/package/flutter-packages/flutter-dynamic-layouts-example/Config.in b/package/flutter-packages/flutter-dynamic-layouts-example/Config.in
new file mode 100644
index 0000000000..a3f6630795
--- /dev/null
+++ b/package/flutter-packages/flutter-dynamic-layouts-example/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE
+	bool "flutter dynamic layouts example"
+	help
+	  This package provides support for multi sized tiles and
+	  different layouts. Currently the layouts that are implemented
+	  in this package are Stagger and Wrap.
+
+	  https://github.com/flutter/packages/tree/main/packages/dynamic_layouts/example
diff --git a/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.hash b/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.hash
new file mode 120000
index 0000000000..879f2adb39
--- /dev/null
+++ b/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.hash
@@ -0,0 +1 @@
+../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.mk b/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.mk
new file mode 100644
index 0000000000..81ff5df597
--- /dev/null
+++ b/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# flutter-dynamic-layouts-example
+#
+################################################################################
+
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_PKG_NAME = example
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/dynamc-layouts-$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILD_DIR = $(@D)/packages/dynamic_layouts/example
+
+define FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILD_DIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILD_DIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILD_DIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			package:$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_PKG_NAME)/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
+			--deterministic \
+			--obfuscate \
+			--snapshot_kind=app-aot-elf \
+			--elf=libapp.so \
+			.dart_tool/flutter_build/*/app.dill
+endef
+
+define FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_TARGET_CMDS
+	mkdir -p $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/{data,lib}
+	cp -dprf $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILD_DIR)/build/flutter_assets $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILD_DIR)/libapp.so \
+		$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/lib/libapp.so
+
+	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/
+
+	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/lib/
+	$(RM) $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+	touch $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+endef
+
+$(eval $(generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
