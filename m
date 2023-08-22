Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217EAEE49AF
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D23CC6058D;
	Tue, 22 Aug 2023 19:49:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D23CC6058D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEKHv0D5DNh7; Tue, 22 Aug 2023 19:49:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E20B26121E;
	Tue, 22 Aug 2023 19:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E20B26121E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67E081BF35E
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40AFA40317
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40AFA40317
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3W1jpupJW7XC for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:48:14 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8C624018E
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8C624018E
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-68a4025b5e8so2101742b3a.3
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 12:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692733694; x=1693338494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dOLpUWj+dRG1Eq228/vaoh51J5QqpwpoI03iPojqJKw=;
 b=Og9ZSkTDUe42im5dXSJp327tjp5AKTIddY57FHO84oaMNs9wo0UWYEs8HRp5G/mGli
 6MnGrkgKyjbfnH0mbgUXsrJ6DbTpJC+M/PXVm1uTCWdclPYmC3jnFD7xj1um5ANKnfCU
 6hx5sPsvWiHEthHKJulzzCkRJkPS3gKnigOKxVUicPf5UfCJa0uOvKulUgIZJ/954Al4
 jE3tY8sRCoYmhg9bm4/4cmkGqS3M3xQVkPldgdT0rJ22PyRo7ccSB8m5r2B2OsgH5c8Y
 34fKWtBWbsxpMn84yz1g6nS7NZYTaZ2WncSBbKUTX6S8JQal+RckBR9UgmqiSAMFuwEa
 RGOQ==
X-Gm-Message-State: AOJu0YwS4IaAkXRM+fJXmCrMMrMgABINWRDJLnsyVsRigzSrNS6S4fxR
 KcMSHFEtX07VkQ7CBQ6KUseoAwJ7EIdw5NSWbVE=
X-Google-Smtp-Source: AGHT+IGBwvUZHuxtWiAdkjnHuS5PBFtUJz8yNc0TSPT2nJxlm6FdSUxa3xZRdC+vtwIilRCQbNFXTg==
X-Received: by 2002:a05:6a00:16d4:b0:67a:8f2a:2cb2 with SMTP id
 l20-20020a056a0016d400b0067a8f2a2cb2mr9794365pfc.20.1692733693741; 
 Tue, 22 Aug 2023 12:48:13 -0700 (PDT)
Received: from localhost.localdomain ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b0067aea93af40sm8128584pfa.2.2023.08.22.12.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 12:48:13 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 13:47:56 -0600
Message-ID: <20230822194757.1004572-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822194757.1004572-1-adam.duskett@amarulasolutions.com>
References: <20230822194757.1004572-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692733694; x=1693338494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dOLpUWj+dRG1Eq228/vaoh51J5QqpwpoI03iPojqJKw=;
 b=Npgzv+eovDVoIHdKNp2NQx5SgO5qjX6hDO6TFbNmWgK+s+FdY82eWDSR8MFB1hO1AA
 42aQnmZYL5ERSS8dzpmgrzsdfxURmkp3rogKgeT6ktiAHmYm5C9zpckmePE2OZb1NqMj
 mvrLu8Zvd+Jq//HKRKqN9BQ6s7FXX+7SrTOME=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Npgzv+eo
Subject: [Buildroot] [PATCH v5 6/7] package/flutter-gallery: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Flutter Gallery is a resource to help developers evaluate and use Flutter.
It is a collection of Material Design & Cupertino widgets, behaviors, and
vignettes implemented with Flutter.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
Changes v4 -> v5:
  - Depend on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
  - select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-remove-GetStorage.patch              | 84 +++++++++++++++++++
 package/flutter-gallery/Config.in             | 16 ++++
 package/flutter-gallery/flutter-gallery.hash  |  3 +
 package/flutter-gallery/flutter-gallery.mk    | 44 ++++++++++
 6 files changed, 149 insertions(+)
 create mode 100644 package/flutter-gallery/0001-remove-GetStorage.patch
 create mode 100644 package/flutter-gallery/Config.in
 create mode 100644 package/flutter-gallery/flutter-gallery.hash
 create mode 100644 package/flutter-gallery/flutter-gallery.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5fa7ee7411..e34a11f03a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -29,6 +29,7 @@
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
 F:	package/flutter-engine/
+F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 
diff --git a/package/Config.in b/package/Config.in
index b9230f5d04..b10ca818d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -343,6 +343,7 @@ comment "Graphic libraries"
 	source "package/fbset/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
+	source "package/flutter-gallery/Config.in"
 	source "package/flutter-pi/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
diff --git a/package/flutter-gallery/0001-remove-GetStorage.patch b/package/flutter-gallery/0001-remove-GetStorage.patch
new file mode 100644
index 0000000000..142cf853da
--- /dev/null
+++ b/package/flutter-gallery/0001-remove-GetStorage.patch
@@ -0,0 +1,84 @@
+From a1d38d78163d84d3506c188e195cd5fa363f4be6 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 17 Aug 2023 13:00:07 -0600
+Subject: [PATCH] remove GetStorage
+
+Commit 287b20a8bfc71196cd733625e622b98b2f84bef1 introduced the get_storage
+plugin which breaks with the following error when the application is ran:
+
+Unhandled Exception: MissingPluginException(No implementation found for method
+getApplicataionDocumentsDirectory on channel plugins.flutter.io/path_provider)
+
+Revert the change.
+
+Upstream: https://github.com/flutter/gallery/issues/994
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ lib/feature_discovery/feature_discovery.dart | 10 ----------
+ lib/main.dart                                |  2 --
+ pubspec.yaml                                 |  1 -
+ 3 files changed, 13 deletions(-)
+
+diff --git a/lib/feature_discovery/feature_discovery.dart b/lib/feature_discovery/feature_discovery.dart
+index 288c78b..965d83c 100644
+--- a/lib/feature_discovery/feature_discovery.dart
++++ b/lib/feature_discovery/feature_discovery.dart
+@@ -6,7 +6,6 @@ import 'package:flutter/material.dart';
+ import 'package:flutter/scheduler.dart';
+ import 'package:gallery/feature_discovery/animation.dart';
+ import 'package:gallery/feature_discovery/overlay.dart';
+-import 'package:get_storage/get_storage.dart';
+ 
+ const _featureHighlightShownKey = 'feature_highlight_shown';
+ 
+@@ -271,15 +270,6 @@ class _FeatureDiscoveryState extends State<FeatureDiscovery>
+ 
+     initAnimationControllers();
+     initAnimations();
+-
+-    final localStorage = GetStorage();
+-    final featureHiglightShown =
+-        localStorage.read<bool>(_featureHighlightShownKey) ?? false;
+-    localStorage.write(_featureHighlightShownKey, true);
+-    showOverlay = widget.showOverlay && !featureHiglightShown;
+-    if (showOverlay) {
+-      localStorage.write(_featureHighlightShownKey, true);
+-    }
+   }
+ 
+   void initAnimationControllers() {
+diff --git a/lib/main.dart b/lib/main.dart
+index e9f4ff9..8c7a4e3 100644
+--- a/lib/main.dart
++++ b/lib/main.dart
+@@ -16,7 +16,6 @@ import 'package:gallery/pages/backdrop.dart';
+ import 'package:gallery/pages/splash.dart';
+ import 'package:gallery/routes.dart';
+ import 'package:gallery/themes/gallery_theme_data.dart';
+-import 'package:get_storage/get_storage.dart';
+ import 'package:google_fonts/google_fonts.dart';
+ 
+ import 'firebase_options.dart';
+@@ -26,7 +25,6 @@ export 'package:gallery/data/demos.dart' show pumpDeferredLibraries;
+ 
+ void main() async {
+   GoogleFonts.config.allowRuntimeFetching = false;
+-  await GetStorage.init();
+ 
+   if (defaultTargetPlatform != TargetPlatform.linux &&
+       defaultTargetPlatform != TargetPlatform.windows &&
+diff --git a/pubspec.yaml b/pubspec.yaml
+index 964edad..4b00e40 100644
+--- a/pubspec.yaml
++++ b/pubspec.yaml
+@@ -24,7 +24,6 @@ dependencies:
+   firebase_core: ^2.7.0
+   firebase_crashlytics: ^3.1.1
+   firebase_performance: ^0.9.0+14
+-  get_storage: ^2.1.1
+   google_fonts: ^5.0.0
+   intl: any # An exact version pin will be provided by the Flutter SDK
+   meta: ^1.7.0
+-- 
+2.41.0
+
diff --git a/package/flutter-gallery/Config.in b/package/flutter-gallery/Config.in
new file mode 100644
index 0000000000..224457ea6f
--- /dev/null
+++ b/package/flutter-gallery/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_FLUTTER_GALLERY
+	bool "flutter-gallery"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE
+	select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
+	help
+	  Flutter Gallery is a resource to help developers evaluate
+	  and use Flutter. It is a collection of Material Design &
+	  Cupertino widgets, behaviors, and vignettes implemented
+	  with Flutter.
+
+	  https://github.com/flutter/gallery
+
+comment "flutter-gallery needs flutter-engine"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_FLUTTER_ENGINE
diff --git a/package/flutter-gallery/flutter-gallery.hash b/package/flutter-gallery/flutter-gallery.hash
new file mode 100644
index 0000000000..aea1ed39be
--- /dev/null
+++ b/package/flutter-gallery/flutter-gallery.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  14272aba90b7d26db33bac7b4692f0e3ed1a008286a08eaf2ea79abd478f23e9  flutter-gallery-2.10.2.tar.gz
+sha256  c731cf5a33db0e12647e0680ef0bc7839f99749404ac1ba4626cf7192065b3b0  LICENSE
diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
new file mode 100644
index 0000000000..948cffa8db
--- /dev/null
+++ b/package/flutter-gallery/flutter-gallery.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# flutter-gallery
+#
+################################################################################
+
+FLUTTER_GALLERY_VERSION = 2.10.2
+FLUTTER_GALLERY_SITE = $(call github,flutter,gallery,v$(FLUTTER_GALLERY_VERSION))
+FLUTTER_GALLERY_LICENSE = BSD-3-Clause
+FLUTTER_GALLERY_LICENSE_FILES = LICENSE
+FLUTTER_GALLERY_DEPENDENCIES = \
+	host-flutter-sdk-bin \
+	flutter-engine 
+
+FLUTTER_GALLERY_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/gallery/$(FLUTTER_ENGINE_VERSION)/$(FLUTTER_ENGINE_RUNTIME_MODE)
+
+define FLUTTER_GALLERY_BUILD_CMDS
+	cd $(@D) && \
+		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) packages get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) package:gallery/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
+			--deterministic \
+			--snapshot_kind=app-aot-elf \
+			--elf=libapp.so \
+			.dart_tool/flutter_build/*/app.dill
+endef
+
+define FLUTTER_GALLERY_INSTALL_TARGET_CMDS
+	mkdir -p $(FLUTTER_GALLERY_INSTALL_DIR)/{data,lib}
+	cp -dprf $(@D)/build/flutter_assets $(FLUTTER_GALLERY_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(@D)/libapp.so \
+		$(FLUTTER_GALLERY_INSTALL_DIR)/lib/libapp.so
+
+	ln -sf ../../../../$(FLUTTER_ENGINE_VERSION)/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_GALLERY_INSTALL_DIR)/data/
+
+	ln -sf ../../../../../../lib/libflutter_engine.so $(FLUTTER_GALLERY_INSTALL_DIR)/lib/
+endef
+
+$(eval $(generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
