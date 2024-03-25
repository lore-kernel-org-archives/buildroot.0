Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C097FC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BB1D608CE;
	Mon, 25 Mar 2024 22:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hLustAyTvhiG; Mon, 25 Mar 2024 22:34:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 368A860904
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 368A860904;
	Mon, 25 Mar 2024 22:34:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8AF171BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78E4640192
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4669_lcWRa1 for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:34:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6BD82400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BD82400CE
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BD82400CE
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:34:39 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1e0d6356ce9so7135845ad.3
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406078; x=1712010878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7z6ehATtsVDLdESdFNbZKsyGB9dziWOqTIbM3eniPMo=;
 b=YHwbceGKWG7C2T7/e2r0THR1+XQPS9Px+TIWFnSPakE2bh9s5ASO/kuREl42Kf5amJ
 SlWbxgr2Ijeel0Ry+1UR9TZUs0+PBMx645ID87Dh9//Wsr3Q3CdIJoo04UqFNy9xTfv4
 +T/aLWa9GxJPD/lOUiPiKlQ/r8eUVk7hE8EjE1tzTLRKrLZSrR65wfOagBS3PhfSWosd
 kOx+txRDXcW/u1lXXhul8NhontHjYvtL71MnQJE3mPZYysHWZClpHr4+o03oys9W9BpF
 PfNaBcdiHSBoEF8AnFpq0qnytDPnBOxxuuE1Dpxy5nKFfhoHPFdepjsbWheSIaehqKMB
 nlgg==
X-Gm-Message-State: AOJu0YwUPlgbpd27hk/LzZWL4fwLQTU67MmBfNXyW95wkMM3JGFnNnU9
 H5QATJK1oPN8wPPvSz87NvNG36Wl3rU2Un/8BSvjm9dtJn423DqmrcBYxwB6yFqq1wt9UVwOMuB
 b
X-Google-Smtp-Source: AGHT+IFlLa4A5UtwJNr+DDH/hOR5sAPejTpt5DZZA84OEI4TBht+cWFtDSew8GApf9iz4jPNM/YWig==
X-Received: by 2002:a17:902:e8c8:b0:1e0:e9d7:83de with SMTP id
 v8-20020a170902e8c800b001e0e9d783demr273975plg.12.1711406078033; 
 Mon, 25 Mar 2024 15:34:38 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902f54a00b001dd7a97a266sm5245323plf.282.2024.03.25.15.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 15:34:37 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 16:34:15 -0600
Message-ID: <20240325223424.108702-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
References: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711406078; x=1712010878;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7z6ehATtsVDLdESdFNbZKsyGB9dziWOqTIbM3eniPMo=;
 b=RH6rF5r1mNm5cZIqZ93OuZtGh5gEux37F28mcp1T4JP+csBlV1AqlCqgAmh651NXDS
 z77tJVeFm9a5hVDkQGOeqSpfVs+bmPIwljg+QUms/C8aZjkkjb1Z88Ao4P0VIaZGEdr4
 xX0qkE+ldiX+ootUKiu+2TOLuTesj/o84YUqg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=RH6rF5r1
Subject: [Buildroot] [PATCH v2 04/13]
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides two multi-sized tiles and different layouts:
Stagger and Wrap.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Use SUBDIR and BUILDDIR [Arnout]

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
index 0000000000..aefcf3f62c
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
+FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SUBDIR = packages/dynamic_layouts/example
+
+define FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
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
+	cp -dprf $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR)/libapp.so \
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
