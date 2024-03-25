Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C42CD11BF
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C802860A48;
	Mon, 25 Mar 2024 22:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0j-eFrBxz1Qq; Mon, 25 Mar 2024 22:35:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19122608DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19122608DF;
	Mon, 25 Mar 2024 22:35:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 037DB1BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E490081371
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVq35HYRCwrS for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:34:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5AE781362
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5AE781362
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5AE781362
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:34:42 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1def3340682so39954015ad.1
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406081; x=1712010881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ytxr1JA7iF+nT0fTdrvqj194gB6CxTOcwCRiv8hQ/UU=;
 b=reT3+JVlldmkumP0U12SkmBwc5jHTtRsVp99TzasjAqmqjEZp0JRYg2SDH02J0w3w6
 u7pEQTgnx5vEjIRBPL2SN+iGlXrAFSiLar5vacgJwjAwPaS9H9J+kyM/jXuig8YzL0cC
 ndXP+d3an30MZYpoOP+P78Qm/eGRISRM3W6BlI8y5KCCsT5rVTKNuOd3XZ9eahqreyts
 wNjzApbuiLn9Pdi9zrkiWnuPt412T6b3EOuICEurePSwE4PpI/9vm0PdzqerSMaB7hb6
 WwC2fG9Jcmi8QujJpV8bnRF95VRcWmtW6S7bIUIOFjg9dsIV0crCBLQtSaS1xJSrDf79
 W53A==
X-Gm-Message-State: AOJu0YwODOhHaxbrh1ZRnR48uyELBqMnZcXa4+SFRgdBjG0BxV90obQg
 SdVI4h7xyScWNtqEl9kquEx1F3id2bf3VI4tldxA4z8a5pX5R88jQG4h19jEX4iRdxR65bpTWPd
 U
X-Google-Smtp-Source: AGHT+IE0MJIaNahBVawGK6tzjBe0xKhL69pLYqYEZJDAPMRw7gbsFUOAbaWFPtg0wMnsN7Nhb/1yWA==
X-Received: by 2002:a17:903:2350:b0:1e0:e2d5:524f with SMTP id
 c16-20020a170903235000b001e0e2d5524fmr1161807plh.25.1711406081231; 
 Mon, 25 Mar 2024 15:34:41 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902f54a00b001dd7a97a266sm5245323plf.282.2024.03.25.15.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 15:34:40 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 16:34:18 -0600
Message-ID: <20240325223424.108702-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
References: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711406081; x=1712010881;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ytxr1JA7iF+nT0fTdrvqj194gB6CxTOcwCRiv8hQ/UU=;
 b=YLYk17Eb079m0JFPVUPUbGjech9CgxLpgzoDn9+fIesl6xZtTNbbCONPMdvGvtoNOQ
 LwSdXSg6Tbk6yA/K91D4V+BCeHe5NyJc5UOeyM/E3E/Pnic3CzD/51JL5wjWgY3VZlzA
 i374nUJJ7kQHSIfXQ2NXN80K2gdMhmUmsqgK4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=YLYk17Eb
Subject: [Buildroot] [PATCH v2 07/13]
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Displays a custom "Hello, World!" custom widget in a
remote Flutter widget (RFW) for use by a remote widget.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Use SUBDIR and BUILDDIR [Arnout]

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
index 0000000000..b57c021f8b
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
+FLUTTER_RFW_LOCAL_EXAMPLE_SUBDIR = packages/rfw/example/local
+
+define FLUTTER_RFW_LOCAL_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_RFW_LOCAL_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
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
+	cp -dprf $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_RFW_LOCAL_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR)/libapp.so \
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
