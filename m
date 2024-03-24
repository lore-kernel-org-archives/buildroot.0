Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF388C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 22:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64F9C81D11;
	Sun, 24 Mar 2024 22:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BmnWONMUsfdG; Sun, 24 Mar 2024 22:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AFE681E28
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AFE681E28;
	Sun, 24 Mar 2024 22:51:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD831BF4E4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1398F405A4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blxOkm_mBawe for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 22:51:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6DD9E405A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DD9E405A1
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DD9E405A1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 22:51:15 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6e6b729669bso3072486b3a.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711320674; x=1711925474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EgLYz3DdXhyiD+ODi81LeW2FE9/KJtX1MtyZhGGCybI=;
 b=PtRFmJlge/2bfDt1HarQc8+L1Vf6RHLA4PbpDtLOXwPEY2V6huVkflkS6AEN+A1His
 4m4CKYh8EWk7aX8ckLTYSnvzCVbvIYeqsR4rB5kFsv42WWX7QQPytb8acA3wZmmQp3op
 UBnbhijsW5jiI3f7RJpFNA6YM46DQjkGV31ezev+HaAc2XdhSkovylUroQmjoAREnDjb
 rdHOI1QaiAol4j+QOXQ9uoCd6SxofBeLhKcDj5kdoEnWpauvGjG9+Lm/FvwQH4P20Fgy
 qswrhq7KED7S5Jl71hLd36p1FjWsDeC0OC8UbLo8r0vqhgwq83GVcodjMprssM2yA5YD
 zw8g==
X-Gm-Message-State: AOJu0YyyYvkSMkNOHYlvzvg4QP3XYqm6ruSJX7GW4Sbm4yC+5arriNp4
 pj3NvtnnbHVpNwbXrFUm2KAaIiVjrlv6CUrLsI2reN/PL4s2RnoPSqPtqh7AB3vIPsOnlUefQlj
 h
X-Google-Smtp-Source: AGHT+IHPrFhZyWvuh5RGmCUUmXh6iHODHRWrJzkGy/a5Z1WdATopc4j9j7ukThQjCo8y9guWutvS0Q==
X-Received: by 2002:a05:6a00:22cc:b0:6ea:8b0c:584 with SMTP id
 f12-20020a056a0022cc00b006ea8b0c0584mr7277923pfj.9.1711320674387; 
 Sun, 24 Mar 2024 15:51:14 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a33-20020a056a0011e100b006e580678dfbsm214031pfu.193.2024.03.24.15.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 15:51:13 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:50:48 -0600
Message-ID: <20240324225052.629874-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
References: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711320674; x=1711925474;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EgLYz3DdXhyiD+ODi81LeW2FE9/KJtX1MtyZhGGCybI=;
 b=RmmQwJhSjDWoTqA09EWwhG4TJtOVLSS+k9ST6Ew56mSaS79GnV5X8+fTyqLMKjkDKZ
 8TqUxqhFDiKqSP/pUeIlo+hlnx57gjwXpQYUHy/5r/jshsfpKkIkrrAKykWEh8FO2o7V
 kPRK0h6cjMcOeNKZs8UQc2zUz2UoSUDbOAX2c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=RmmQwJhS
Subject: [Buildroot] [PATCH 09/13] package/flutter-gallery: drop package
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

The maintainers of the flutter-gallery package archived the project as of
February 16, 2024. In addition, the flutter-gallery package is incompatible
with Flutter 3.19.x. Now that the flutter tests do not use this package, it
is safe to drop it.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 Config.in.legacy                              |  7 ++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 .../0001-remove-GetStorage.patch              | 84 -------------------
 package/flutter-gallery/Config.in             | 16 ----
 package/flutter-gallery/flutter-gallery.hash  |  3 -
 package/flutter-gallery/flutter-gallery.mk    | 57 -------------
 7 files changed, 7 insertions(+), 162 deletions(-)
 delete mode 100644 package/flutter-gallery/0001-remove-GetStorage.patch
 delete mode 100644 package/flutter-gallery/Config.in
 delete mode 100644 package/flutter-gallery/flutter-gallery.hash
 delete mode 100644 package/flutter-gallery/flutter-gallery.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 1d3dc8b5c8..5967c1c5ca 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_PACKAGE_FLUTTER_GALLERY
+	bool "flutter-gallery removed"
+	select BR2_LEGACY
+	help
+	  flutter-gallery has been removed due to being abandoned
+	  and no longer working with flutter 3.19+
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	bool "Codescape IMG GNU Linux Toolchain 2018.09 has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 38079407c5..df19e341b9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -32,7 +32,6 @@ F:	package/dmenu-wayland/
 F:	package/fcft/
 F:	package/foot/
 F:	package/flutter-engine/
-F:	package/flutter-gallery/
 F:	package/flutter-packages/
 F:	package/flutter-packages/flutter-adaptive-scaffold-example/
 F:	package/flutter-packages/flutter-animations-example/
diff --git a/package/Config.in b/package/Config.in
index dfdc716857..410fe0f493 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -315,7 +315,6 @@ comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
 	source "package/dmenu-wayland/Config.in"
-	source "package/flutter-gallery/Config.in"
 	source "package/flutter-packages/Config.in"
 	source "package/flutter-pi/Config.in"
 	source "package/foot/Config.in"
diff --git a/package/flutter-gallery/0001-remove-GetStorage.patch b/package/flutter-gallery/0001-remove-GetStorage.patch
deleted file mode 100644
index 142cf853da..0000000000
--- a/package/flutter-gallery/0001-remove-GetStorage.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From a1d38d78163d84d3506c188e195cd5fa363f4be6 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <adam.duskett@amarulasolutions.com>
-Date: Thu, 17 Aug 2023 13:00:07 -0600
-Subject: [PATCH] remove GetStorage
-
-Commit 287b20a8bfc71196cd733625e622b98b2f84bef1 introduced the get_storage
-plugin which breaks with the following error when the application is ran:
-
-Unhandled Exception: MissingPluginException(No implementation found for method
-getApplicataionDocumentsDirectory on channel plugins.flutter.io/path_provider)
-
-Revert the change.
-
-Upstream: https://github.com/flutter/gallery/issues/994
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- lib/feature_discovery/feature_discovery.dart | 10 ----------
- lib/main.dart                                |  2 --
- pubspec.yaml                                 |  1 -
- 3 files changed, 13 deletions(-)
-
-diff --git a/lib/feature_discovery/feature_discovery.dart b/lib/feature_discovery/feature_discovery.dart
-index 288c78b..965d83c 100644
---- a/lib/feature_discovery/feature_discovery.dart
-+++ b/lib/feature_discovery/feature_discovery.dart
-@@ -6,7 +6,6 @@ import 'package:flutter/material.dart';
- import 'package:flutter/scheduler.dart';
- import 'package:gallery/feature_discovery/animation.dart';
- import 'package:gallery/feature_discovery/overlay.dart';
--import 'package:get_storage/get_storage.dart';
- 
- const _featureHighlightShownKey = 'feature_highlight_shown';
- 
-@@ -271,15 +270,6 @@ class _FeatureDiscoveryState extends State<FeatureDiscovery>
- 
-     initAnimationControllers();
-     initAnimations();
--
--    final localStorage = GetStorage();
--    final featureHiglightShown =
--        localStorage.read<bool>(_featureHighlightShownKey) ?? false;
--    localStorage.write(_featureHighlightShownKey, true);
--    showOverlay = widget.showOverlay && !featureHiglightShown;
--    if (showOverlay) {
--      localStorage.write(_featureHighlightShownKey, true);
--    }
-   }
- 
-   void initAnimationControllers() {
-diff --git a/lib/main.dart b/lib/main.dart
-index e9f4ff9..8c7a4e3 100644
---- a/lib/main.dart
-+++ b/lib/main.dart
-@@ -16,7 +16,6 @@ import 'package:gallery/pages/backdrop.dart';
- import 'package:gallery/pages/splash.dart';
- import 'package:gallery/routes.dart';
- import 'package:gallery/themes/gallery_theme_data.dart';
--import 'package:get_storage/get_storage.dart';
- import 'package:google_fonts/google_fonts.dart';
- 
- import 'firebase_options.dart';
-@@ -26,7 +25,6 @@ export 'package:gallery/data/demos.dart' show pumpDeferredLibraries;
- 
- void main() async {
-   GoogleFonts.config.allowRuntimeFetching = false;
--  await GetStorage.init();
- 
-   if (defaultTargetPlatform != TargetPlatform.linux &&
-       defaultTargetPlatform != TargetPlatform.windows &&
-diff --git a/pubspec.yaml b/pubspec.yaml
-index 964edad..4b00e40 100644
---- a/pubspec.yaml
-+++ b/pubspec.yaml
-@@ -24,7 +24,6 @@ dependencies:
-   firebase_core: ^2.7.0
-   firebase_crashlytics: ^3.1.1
-   firebase_performance: ^0.9.0+14
--  get_storage: ^2.1.1
-   google_fonts: ^5.0.0
-   intl: any # An exact version pin will be provided by the Flutter SDK
-   meta: ^1.7.0
--- 
-2.41.0
-
diff --git a/package/flutter-gallery/Config.in b/package/flutter-gallery/Config.in
deleted file mode 100644
index 224457ea6f..0000000000
--- a/package/flutter-gallery/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_FLUTTER_GALLERY
-	bool "flutter-gallery"
-	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_FLUTTER_ENGINE
-	select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
-	help
-	  Flutter Gallery is a resource to help developers evaluate
-	  and use Flutter. It is a collection of Material Design &
-	  Cupertino widgets, behaviors, and vignettes implemented
-	  with Flutter.
-
-	  https://github.com/flutter/gallery
-
-comment "flutter-gallery needs flutter-engine"
-	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_FLUTTER_ENGINE
diff --git a/package/flutter-gallery/flutter-gallery.hash b/package/flutter-gallery/flutter-gallery.hash
deleted file mode 100644
index aea1ed39be..0000000000
--- a/package/flutter-gallery/flutter-gallery.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  14272aba90b7d26db33bac7b4692f0e3ed1a008286a08eaf2ea79abd478f23e9  flutter-gallery-2.10.2.tar.gz
-sha256  c731cf5a33db0e12647e0680ef0bc7839f99749404ac1ba4626cf7192065b3b0  LICENSE
diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
deleted file mode 100644
index acad706dae..0000000000
--- a/package/flutter-gallery/flutter-gallery.mk
+++ /dev/null
@@ -1,57 +0,0 @@
-################################################################################
-#
-# flutter-gallery
-#
-################################################################################
-
-FLUTTER_GALLERY_VERSION = 2.10.2
-FLUTTER_GALLERY_SITE = $(call github,flutter,gallery,v$(FLUTTER_GALLERY_VERSION))
-FLUTTER_GALLERY_LICENSE = BSD-3-Clause
-FLUTTER_GALLERY_LICENSE_FILES = LICENSE
-FLUTTER_GALLERY_DEPENDENCIES = \
-	host-flutter-sdk-bin \
-	flutter-engine
-
-FLUTTER_GALLERY_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/gallery/$(FLUTTER_ENGINE_RUNTIME_MODE)
-
-define FLUTTER_GALLERY_CONFIGURE_CMDS
-	cd $(@D) && \
-		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
-endef
-
-define FLUTTER_GALLERY_BUILD_CMDS
-	cd $(@D) && \
-		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
-		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			-Dflutter.dart_plugin_registrant=file://$(@D)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
-			--source file://$(@D)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
-			--source package:flutter/src/dart_plugin_registrant.dart \
-			--native-assets $(@D)/.dart_tool/flutter_build/*/native_assets.yaml \
-			package:gallery/main.dart && \
-		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
-			--deterministic \
-			--obfuscate \
-			--snapshot_kind=app-aot-elf \
-			--elf=libapp.so \
-			.dart_tool/flutter_build/*/app.dill
-endef
-
-define FLUTTER_GALLERY_INSTALL_TARGET_CMDS
-	mkdir -p $(FLUTTER_GALLERY_INSTALL_DIR)/{data,lib}
-	cp -dprf $(@D)/build/flutter_assets $(FLUTTER_GALLERY_INSTALL_DIR)/data/
-
-	$(INSTALL) -D -m 0755 $(@D)/libapp.so \
-		$(FLUTTER_GALLERY_INSTALL_DIR)/lib/libapp.so
-
-	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
-	$(FLUTTER_GALLERY_INSTALL_DIR)/data/
-
-	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_GALLERY_INSTALL_DIR)/lib/
-	$(RM) $(FLUTTER_GALLERY_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
-	touch $(FLUTTER_GALLERY_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
-endef
-
-$(eval $(generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
