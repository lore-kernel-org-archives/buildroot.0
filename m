Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0068CC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 22:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 496E381CFE;
	Sun, 24 Mar 2024 22:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mMO4zdGTQBO; Sun, 24 Mar 2024 22:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14F5481CDB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14F5481CDB;
	Sun, 24 Mar 2024 22:51:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09E441BF861
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E918F607FD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8oVUuDCDT_X for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 22:51:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F4BE60690
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F4BE60690
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F4BE60690
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 22:51:08 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3c396fec63aso1355290b6e.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711320666; x=1711925466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QT3ZRJGD42UUUNz+c9+nVWXHhkBhbm/1lxWrOYuXakc=;
 b=djrJzZ24d0vV0Z8dh3agobGjrKVYjJPUQ63tuJ49ZIU3/lU2lfcG417Hxxp07ebAAN
 nHKXRMT+5NGkZoePhOLUsaraGzc2SO6bZsAkSnN9d1KiFBU66IEMuTFuRhbmmdPS5OML
 oU9uTnB7/8CCpBO0PurzW3sGWN2qv5ByUbegc88TAE+9fdR5222XOXh8/Yxmke7u+k7A
 wv5PP9Jf46WBbjE3K7F+eNidoNa7kUEudQOorxCBuqDU1AmdjwhLcxnS33hlt3R+BMnT
 I9GGG9GWetxSfWhExlaypmJ3SdRORWnY0mYQbTfeVUabQkk7fZTOv46gyjuJsLFNIWDA
 Mqog==
X-Gm-Message-State: AOJu0YwWID74VhI2T2RJqGWqj4/wjtuKI2rvvk+h3lXoNzl9/92Jc0EN
 9XqeNI/IlQ0eBYlmH8qzTsxkkPbxwqYVKuzG3Bp3W/bodoY5/tCcLKsplwZVvMvRgB82PytOUxT
 e
X-Google-Smtp-Source: AGHT+IFsx2stUboxN8KT6kUAoUFB4OMfb8OBgT62JgqNj5VDT4X8Mi5d/rRG8yrgROuJ7teWv4pj9Q==
X-Received: by 2002:a05:6808:318f:b0:3c3:d10c:253e with SMTP id
 cd15-20020a056808318f00b003c3d10c253emr636263oib.22.1711320666616; 
 Sun, 24 Mar 2024 15:51:06 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a33-20020a056a0011e100b006e580678dfbsm214031pfu.193.2024.03.24.15.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 15:51:05 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:50:41 -0600
Message-ID: <20240324225052.629874-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
References: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711320666; x=1711925466;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QT3ZRJGD42UUUNz+c9+nVWXHhkBhbm/1lxWrOYuXakc=;
 b=ZjJ8/DCyhpzPA3cS7DIGxTNKj6uIONrAVBqd66oryZZq3YURHUPpJMgdJhwKmEVKvj
 l4Oz85y4MyE8nR4UOakQTTXk++1/9/EdCVa5bXjVTvPJ//pwNbp72caX72gCpLC7yqlK
 dBnIqLfxFS+uZm4gQNnp7YEdrSgz882PIoSVg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZjJ8/DCy
Subject: [Buildroot] [PATCH 02/13]
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides a nice-looking Gmail lookalike application using
Material 3.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
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
index 0000000000..1f4123f8d0
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
+FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILD_DIR = $(@D)/packages/flutter_adaptive_scaffold/example
+
+define FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILD_DIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILD_DIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILD_DIR)/.dart_tool/flutter_build/*/native_assets.yaml \
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
+	cp -dprf $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILD_DIR)/build/flutter_assets $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILD_DIR)/libapp.so \
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
