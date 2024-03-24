Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6606AC54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 22:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34530819D5;
	Sun, 24 Mar 2024 22:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31MfYtC0Yk1k; Sun, 24 Mar 2024 22:51:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B5AB81DED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B5AB81DED;
	Sun, 24 Mar 2024 22:51:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD0421BF4E4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFA2481CFE
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WbFS7Ihzu_nq for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 22:51:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8CAD681A24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CAD681A24
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CAD681A24
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 22:51:12 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-22222357d76so1342420fac.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711320671; x=1711925471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K/gS9as92FwOl4oYAMK9/gLuTrJEwG9W2O9boG7lg+c=;
 b=ftyQFHlC5CcWQ7cKTRnszEse8rdP7uJCk6dO5FiB+saMRy844HLpVWo3if5wRs0n2L
 qKAz/SKkI0V7WfBvShSvL0wdM89wTcDdU/5IlrT5xFgZ8hAFaOIrSQD9QFsx9FPoqveU
 +Nbi6LSM2ZDuV18l/xOMChT9NSfTh6SMzd9r+59u0EXch1sfT8Ijk7e9fK5idXIVHv+6
 JO0Mvzp3SqQM7v09Kfh0z72BrdCLOepXLKA3f7PJ6593C7Um/GJ8B85QSsoirJU0Y8UK
 EaMDuZLnWS0y2vQKnOAm3qKkyfC7W6DD6xdJ0UIyln+s9LkJz8WUCLbLYAlswdygG77r
 vEeQ==
X-Gm-Message-State: AOJu0YzmCRyzkpK+CrfTD/2PJO7DqI4kvWyM3uDJIbsSESzQicIhue8s
 rA3hJ9DkWFcTQGXdL573G06ICKKNPxzOWijEPVnFz4WEFhlJI8G9UqC7br7Xlk17FSMcTw3paPA
 0
X-Google-Smtp-Source: AGHT+IGwzmm8YOQbJKP1YMaQc+64/IFKq5GF25fOJeW0A1co3Ui4Vm0Q2yIX2+iydDHbmpz7Uwc6xw==
X-Received: by 2002:a05:6870:64a5:b0:229:e686:2029 with SMTP id
 cz37-20020a05687064a500b00229e6862029mr6373559oab.40.1711320671116; 
 Sun, 24 Mar 2024 15:51:11 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a33-20020a056a0011e100b006e580678dfbsm214031pfu.193.2024.03.24.15.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 15:51:10 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:50:45 -0600
Message-ID: <20240324225052.629874-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
References: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711320671; x=1711925471;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/gS9as92FwOl4oYAMK9/gLuTrJEwG9W2O9boG7lg+c=;
 b=Bhy1pkKOFPoKLrT7X4KLNXtDBCUPha3AxFGKVGUZUczjRizQVOABG6JHC8RZmdzU+O
 dW4HmvoK+F/3erup1+K/LhLgAPgWcvMIzjPyNw//hOfsEHKFRPTlCCEWtIgrcWy/ejQW
 9k8V3fcT9gmP8VUW1AuybUpdS4lgHdiRUXQyg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Bhy1pkKO
Subject: [Buildroot] [PATCH 06/13]
 package/flutter-packages/flutter-image-example: new package
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

This package uses the NetworkImageWithRetry method to download the Flutter
logo. The package requires ca-certificates, or else SSL errors occur when
the application attempts to download the image.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 package/flutter-packages/Config.in            |  1 +
 .../flutter-image-example/Config.in           |  8 +++
 .../flutter-image-example.hash                |  1 +
 .../flutter-image-example.mk                  | 54 +++++++++++++++++++
 5 files changed, 65 insertions(+)
 create mode 100644 package/flutter-packages/flutter-image-example/Config.in
 create mode 120000 package/flutter-packages/flutter-image-example/flutter-image-example.hash
 create mode 100644 package/flutter-packages/flutter-image-example/flutter-image-example.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 97418954c4..80dd061469 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -38,6 +38,7 @@ F:	package/flutter-packages/flutter-adaptive-scaffold-example/
 F:	package/flutter-packages/flutter-animations-example/
 F:	package/flutter-packages/flutter-dynamic-layouts-example/
 F:	package/flutter-packages/flutter-go-router-example/
+F:	package/flutter-packages/flutter-image-example/
 F:	package/flutter-packages/flutter-markdown-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
index bbcd3aec93..bfaccef264 100644
--- a/package/flutter-packages/Config.in
+++ b/package/flutter-packages/Config.in
@@ -11,6 +11,7 @@ source "package/flutter-packages/flutter-adaptive-scaffold-example/Config.in"
 source "package/flutter-packages/flutter-animations-example/Config.in"
 source "package/flutter-packages/flutter-dynamic-layouts-example/Config.in"
 source "package/flutter-packages/flutter-go-router-example/Config.in"
+source "package/flutter-packages/flutter-image-example/Config.in"
 source "package/flutter-packages/flutter-markdown-example/Config.in"
 endif
 
diff --git a/package/flutter-packages/flutter-image-example/Config.in b/package/flutter-packages/flutter-image-example/Config.in
new file mode 100644
index 0000000000..15ae20872a
--- /dev/null
+++ b/package/flutter-packages/flutter-image-example/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FLUTTER_IMAGE_EXAMPLE
+	bool "flutter image example"
+	select BR2_PACKAGE_CA_CERTIFICATES # runtime
+	help
+	  Use NetworkImageWithRetry instead of Image.network to
+	  load images from the network with a retry mechanism.
+
+	  https://github.com/flutter/packages/tree/main/packages/flutter_image/example
diff --git a/package/flutter-packages/flutter-image-example/flutter-image-example.hash b/package/flutter-packages/flutter-image-example/flutter-image-example.hash
new file mode 120000
index 0000000000..879f2adb39
--- /dev/null
+++ b/package/flutter-packages/flutter-image-example/flutter-image-example.hash
@@ -0,0 +1 @@
+../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-image-example/flutter-image-example.mk b/package/flutter-packages/flutter-image-example/flutter-image-example.mk
new file mode 100644
index 0000000000..b08fb21d8a
--- /dev/null
+++ b/package/flutter-packages/flutter-image-example/flutter-image-example.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# flutter-image-example
+#
+################################################################################
+
+FLUTTER_IMAGE_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
+FLUTTER_IMAGE_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
+FLUTTER_IMAGE_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
+FLUTTER_IMAGE_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
+FLUTTER_IMAGE_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
+FLUTTER_IMAGE_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
+FLUTTER_IMAGE_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
+FLUTTER_IMAGE_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
+FLUTTER_IMAGE_EXAMPLE_PKG_NAME = flutter_image_example
+FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/$(FLUTTER_IMAGE_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
+FLUTTER_IMAGE_EXAMPLE_BUILD_DIR = $(@D)/packages/flutter_image/example
+
+define FLUTTER_IMAGE_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_IMAGE_EXAMPLE_BUILD_DIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_IMAGE_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_IMAGE_EXAMPLE_BUILD_DIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_IMAGE_EXAMPLE_BUILD_DIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			package:$(FLUTTER_IMAGE_EXAMPLE_PKG_NAME)/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
+			--deterministic \
+			--obfuscate \
+			--snapshot_kind=app-aot-elf \
+			--elf=libapp.so \
+			.dart_tool/flutter_build/*/app.dill
+endef
+
+define FLUTTER_IMAGE_EXAMPLE_INSTALL_TARGET_CMDS
+	mkdir -p $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/{data,lib}
+	cp -dprf $(FLUTTER_IMAGE_EXAMPLE_BUILD_DIR)/build/flutter_assets $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_IMAGE_EXAMPLE_BUILD_DIR)/libapp.so \
+		$(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/lib/libapp.so
+
+	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/data/
+
+	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/lib/
+	$(RM) $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+	touch $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+endef
+
+$(eval $(generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
