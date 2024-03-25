Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34F5C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81E1F60906;
	Mon, 25 Mar 2024 22:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eo_leRGxQRG0; Mon, 25 Mar 2024 22:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DB37608EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DB37608EF;
	Mon, 25 Mar 2024 22:34:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8892F1BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8321340192
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkaDbRh9fpsP for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:34:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68FB6400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68FB6400CE
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68FB6400CE
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:34:41 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6e782e955adso4194415b3a.3
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406080; x=1712010880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0HsmKn3spTs5UaXZPJTkZyF4ILo4fw5IK3lIAJbgH64=;
 b=k+UNNkDYCSn7Ho3i6r2a1FIPbYU0eXDA/y9FSrs5viqK83VQeyULJgy8qaECnxQPvu
 +qWVxKIajbwuc5aebmys16u3nF4959bDIf3mwo3F9MK9EMHQ10XSag52Ubfawi/dcK2x
 jmYw1XopeIpL/97jmOxb/k056HXqIUNcV2eI7PHDi+2KT7+NGsGilfPKM1cSnCPBBxmd
 vU+3HvTzrXiVjXeQn2YRoMuk8K6S+K5k8NITPjzjmuqbQ5xvMkdrjBu9XS2y6mMxeD1Z
 d4rtWynjhXrDaDNJZY5jrv3ctMme3YMfkjHFY5Bojf58rcWe73m4xzHMBFf6nYgAljFH
 /Pzw==
X-Gm-Message-State: AOJu0Yx3FA8w6RAARgZ04wvWJ9FTs/5KkAL2I04XAQb75xqQVpEVl99m
 y2d9r5TrBzPkjpCInfp2uGb9QHhaL16l1w9/pd6Idg1mqV/MiBeDwVUovBgJ4Gp6pCQN7S5dLMu
 l
X-Google-Smtp-Source: AGHT+IFWHWb39KdjTwHSqFtgW/5X52uAclOXn/JBpIUO0BAfRcppzPR++DmlM9MvnOSlwYHmiXVlbw==
X-Received: by 2002:a05:6a20:1589:b0:1a3:558f:13e9 with SMTP id
 h9-20020a056a20158900b001a3558f13e9mr10298147pzj.19.1711406080028; 
 Mon, 25 Mar 2024 15:34:40 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902f54a00b001dd7a97a266sm5245323plf.282.2024.03.25.15.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 15:34:39 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 16:34:17 -0600
Message-ID: <20240325223424.108702-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
References: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711406080; x=1712010880;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0HsmKn3spTs5UaXZPJTkZyF4ILo4fw5IK3lIAJbgH64=;
 b=qY+8JTxAXeMeED6beVJ/sH12PU/a/V8o55VqbYDHuiNipGiwYaZJQRNS+IzuY2cn70
 NE5iYZg5SxyBR5zlaOzdZRIl/iAds8MdhhgZW4AFNKuvbl2gwH2rLwQn8pMev5h10Gza
 Hqp/eNJ+H6/NqqjKdv+Pvwr0FQyANW/DV87As=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qY+8JTxA
Subject: [Buildroot] [PATCH v2 06/13]
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package uses the NetworkImageWithRetry method to download the Flutter
logo. The package requires ca-certificates, or else SSL errors occur when
the application attempts to download the image.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Use SUBDIR and BUILDDIR [Arnout]

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
index 0000000000..20f185896d
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
+FLUTTER_IMAGE_EXAMPLE_SUBDIR = packages/flutter_image/example
+
+define FLUTTER_IMAGE_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_IMAGE_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
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
+	cp -dprf $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR)/libapp.so \
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
