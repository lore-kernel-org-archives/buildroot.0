Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87D6C54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 22:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99F7981D67;
	Sun, 24 Mar 2024 22:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gieJ1aK9GXQd; Sun, 24 Mar 2024 22:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7F8D81CBA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7F8D81CBA;
	Sun, 24 Mar 2024 22:51:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 399681BF4E4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29A6881A24
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCjokHPFWedM for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 22:51:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 72EAF818C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72EAF818C4
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72EAF818C4
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 22:51:13 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5e4f79007ffso2374262a12.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711320672; x=1711925472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9N8+r2/Gs7o6qfFi4wU/71f/yvKc7IZeiUD6dU2r9rU=;
 b=T7uyNtJZ02re2ipn01bwdgCHW1JXulkN0ljGt9yA6qzGIuBztpyXugOZdkeyndgH7N
 raz7/kHQVdcwW9Oe7UEG0hq+iMBz52oPcaFbSUdLqZVfnjerSGJkI4F3jdZ33P72JR90
 wliKoW2BU3i4MrEZvJ+px0L9oWcf7ppOqR6tgRwyL6+AQ1/JVnVHOjzOaWhzo7WeaE6u
 iVMaE+0hauFsEt4Mhaa/Jz6jOnomTs2csUBXRExr0mhym5n+FGWvXh6ZfaMA87pG2gKj
 16G0sZFuBbBBEAI2YN7ROhOLrviEIlKRANRDDFBvhNtA+LOfAKgKmui0Jaigz2GkJSnC
 VbLA==
X-Gm-Message-State: AOJu0YwdbAVs0paJdYkHgzrvF//w0+XBANguIyB2m2tEtyf3MNIvN0QA
 O2QJX61VgnGYNJ2//S02K3Q2fP4fh7cj7Zzgz2WCl3c9iTdHh+W3MiewVztuI/7B1zyexaKc7/P
 +
X-Google-Smtp-Source: AGHT+IHAKiXrILDsnise7aBG1XgwRt0izupvVFO0tkr5qzDQYRQnEZDyJbV/Q7FDG7DGzpyDx3rn4w==
X-Received: by 2002:a05:6a20:3d07:b0:1a3:c511:34cf with SMTP id
 y7-20020a056a203d0700b001a3c51134cfmr2690718pzi.2.1711320671870; 
 Sun, 24 Mar 2024 15:51:11 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a33-20020a056a0011e100b006e580678dfbsm214031pfu.193.2024.03.24.15.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 15:51:11 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:50:46 -0600
Message-ID: <20240324225052.629874-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
References: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711320672; x=1711925472;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9N8+r2/Gs7o6qfFi4wU/71f/yvKc7IZeiUD6dU2r9rU=;
 b=f9TlXklxprd5swK3f1Cfvu/Y+CmVYR8ukSdcK5YD30UReWOsG5UlLcntkaIV43LlA3
 SiDnbWFU4Hyt33KqaQCuBgiOEv8UyV6+XHQM0dOdMQbDvnfK9jjrK7f73j2QuCZJ5jx4
 GMxkwYrbFLxLESt57oSHl/lWH5kofD3CM+Tfc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=f9TlXklx
Subject: [Buildroot] [PATCH 07/13]
 package/flutter-packages/flutter-rfw-local-example: new package
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

Displays a custom "Hello, World!" custom widget in a
remote Flutter widget (RFW) for use by a remote widget.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 package/flutter-packages/Config.in            |  1 +
 .../flutter-rfw-local-example/Config.in       |  7 +++
 .../flutter-rfw-local-example.hash            |  1 +
 .../flutter-rfw-local-example.mk              | 54 +++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/flutter-packages/flutter-rfw-local-example/Config.in
 create mode 120000 package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.hash
 create mode 100644 package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 80dd061469..38079407c5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -40,6 +40,7 @@ F:	package/flutter-packages/flutter-dynamic-layouts-example/
 F:	package/flutter-packages/flutter-go-router-example/
 F:	package/flutter-packages/flutter-image-example/
 F:	package/flutter-packages/flutter-markdown-example/
+F:	package/flutter-packages/flutter-rfw-local-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/ivi-homescreen/
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
index bfaccef264..4e3e29582f 100644
--- a/package/flutter-packages/Config.in
+++ b/package/flutter-packages/Config.in
@@ -13,6 +13,7 @@ source "package/flutter-packages/flutter-dynamic-layouts-example/Config.in"
 source "package/flutter-packages/flutter-go-router-example/Config.in"
 source "package/flutter-packages/flutter-image-example/Config.in"
 source "package/flutter-packages/flutter-markdown-example/Config.in"
+source "package/flutter-packages/flutter-rfw-local-example/Config.in"
 endif
 
 comment "flutter packages need flutter-engine"
diff --git a/package/flutter-packages/flutter-rfw-local-example/Config.in b/package/flutter-packages/flutter-rfw-local-example/Config.in
new file mode 100644
index 0000000000..42324a1eaa
--- /dev/null
+++ b/package/flutter-packages/flutter-rfw-local-example/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FLUTTER_RFW_LOCAL_EXAMPLE
+	bool "remote flutter widgets example"
+	help
+	  This example shows how one can create custom widgets in an RFW
+	  client, for use by remote widgets.
+
+	  https://github.com/flutter/packages/tree/main/packages/rfw/example/local
diff --git a/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.hash b/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.hash
new file mode 120000
index 0000000000..879f2adb39
--- /dev/null
+++ b/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.hash
@@ -0,0 +1 @@
+../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk b/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk
new file mode 100644
index 0000000000..9718b222f0
--- /dev/null
+++ b/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# flutter-rfw-local-example
+#
+################################################################################
+
+FLUTTER_RFW_LOCAL_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
+FLUTTER_RFW_LOCAL_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
+FLUTTER_RFW_LOCAL_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
+FLUTTER_RFW_LOCAL_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
+FLUTTER_RFW_LOCAL_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
+FLUTTER_RFW_LOCAL_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
+FLUTTER_RFW_LOCAL_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
+FLUTTER_RFW_LOCAL_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
+FLUTTER_RFW_LOCAL_EXAMPLE_PKG_NAME = local
+FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/rfw-$(FLUTTER_RFW_LOCAL_EXAMPLE_PKG_NAME)-example/$(FLUTTER_ENGINE_RUNTIME_MODE)
+FLUTTER_RFW_LOCAL_EXAMPLE_BUILD_DIR = $(@D)/packages/rfw/example/local
+
+define FLUTTER_RFW_LOCAL_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILD_DIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_RFW_LOCAL_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILD_DIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILD_DIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			package:$(FLUTTER_RFW_LOCAL_EXAMPLE_PKG_NAME)/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
+			--deterministic \
+			--obfuscate \
+			--snapshot_kind=app-aot-elf \
+			--elf=libapp.so \
+			.dart_tool/flutter_build/*/app.dill
+endef
+
+define FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_TARGET_CMDS
+	mkdir -p $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/{data,lib}
+	cp -dprf $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILD_DIR)/build/flutter_assets $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILD_DIR)/libapp.so \
+		$(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/lib/libapp.so
+
+	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/data/
+
+	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/lib/
+	$(RM) $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+	touch $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+endef
+
+$(eval $(generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
