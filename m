Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003B6C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFB9341925;
	Mon, 18 Dec 2023 18:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFB9341925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sC22ij5lTJAm; Mon, 18 Dec 2023 18:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90449419D6;
	Mon, 18 Dec 2023 18:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90449419D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C60F61BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EE7782236
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EE7782236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SldAZFf-_DIk for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:54:55 +0000 (UTC)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89B0B82202
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89B0B82202
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-28b406a0fbfso2656392a91.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 10:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925694; x=1703530494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WUSFA7cbMFKk18Jf3x4EuKlpdaFvcyE+zZjLK7DU6kg=;
 b=AYVEKxPji0DKdjceIcmYHX0xrdYPO55H3N6wnfNJbek7VUsW+pUoluEzD/DUpe0j+w
 /sPeg8nLkkwShLAWOygrNIhc1RMVXCQrOE+sDoA/4F1Ubghbn29jN1+NCXgbn8KUV4br
 S9gHe+vJZBivsAclPwnV+BuYP5DWp1e2d2eqd/gvFRXLhmwt5y2GlagAbje30II3mLgh
 suj+5uTkApfYva6QNWmZUmHftG9JJH30Stw8W8NGihwZsTLBU3G7w4j1poOps3IpWkXI
 LXfZtIBq2O4muJyNiNET4DWKPDnB+j/QVROrl0rVr/x2YDUUKSiX1Dj1xclfPdFapqrf
 qHtA==
X-Gm-Message-State: AOJu0YwOM6mhG874nizNDIoiVlX13nUD7dBYysmMGU79XuKdZMC51dkr
 +2LKW0X1G1FdEZpdoaRydqngyaRl3WIK9LKHJO4=
X-Google-Smtp-Source: AGHT+IHWZad36TjOGgxpOqWeLgxAER/boNf3BwRnh5D2iJ+pCWolUNo0j82oGTkQL9fXjMVVp4exCA==
X-Received: by 2002:a17:90a:bb8d:b0:28b:8bc1:588f with SMTP id
 v13-20020a17090abb8d00b0028b8bc1588fmr1209196pjr.46.1702925694358; 
 Mon, 18 Dec 2023 10:54:54 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090ac00500b00285cc7a867esm21890580pjt.0.2023.12.18.10.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 10:54:53 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 11:54:37 -0700
Message-ID: <20231218185440.506995-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
References: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702925694; x=1703530494;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WUSFA7cbMFKk18Jf3x4EuKlpdaFvcyE+zZjLK7DU6kg=;
 b=ZEfK+3z56hBygrV/g6uimf8yrz7SGvin1xj+PY9DL6K+fpfbI3ux3tOEB4X/hwh7w5
 3JwTrkJkqKy//xZTUaRkhCv8rjYBj4uATG1Iy7vInOzqliKMRDGiM46LY/axUGaIbEKn
 WT5VVEXnwSeNMFII3MoQbteg5dQSY8eHWx78s=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZEfK+3z5
Subject: [Buildroot] [PATCH v2 11/13] package/flutter-gallery: depend on
 xdg-user-dirs and fix build options
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

- Drop 0001-remove-GetStorage.patch

  - Select and depend on xdg-user-dirs for the GetStorage plugin.

  - Pass the following new options to dart to allow flutter-gallery to
    properly run:

    -Dflutter.dart_plugin_registrant informs dart the
    dart_plugin_registrant.dart file is for a flutter application.

    --source file://$(@D)/.dart_tool/flutter_build/dart_plugin_registrant.dart
    adds the dart_plugin_registrant.dart file as a source file.

    --source package:flutter/src/dart_plugin_registrant.dart binds a plugin
      implementation to the platform interface based on the configuration of the
      app's pubpec.yaml, and the plugin's pubspec.yaml.

  - pass --obfuscate to flutter_gen_snapshot to obfuscate the .so for
    security purposes.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../0001-remove-GetStorage.patch              | 84 -------------------
 package/flutter-gallery/Config.in             |  1 +
 package/flutter-gallery/flutter-gallery.mk    | 10 ++-
 3 files changed, 9 insertions(+), 86 deletions(-)
 delete mode 100644 package/flutter-gallery/0001-remove-GetStorage.patch

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
index 224457ea6f..85d7a47e49 100644
--- a/package/flutter-gallery/Config.in
+++ b/package/flutter-gallery/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_FLUTTER_GALLERY
 	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_FLUTTER_ENGINE
 	select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
+	select BR2_PACKAGE_XDG_USER_DIRS
 	help
 	  Flutter Gallery is a resource to help developers evaluate
 	  and use Flutter. It is a collection of Material Design &
diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
index 50ddd9ffba..5299b18134 100644
--- a/package/flutter-gallery/flutter-gallery.mk
+++ b/package/flutter-gallery/flutter-gallery.mk
@@ -10,7 +10,8 @@ FLUTTER_GALLERY_LICENSE = BSD-3-Clause
 FLUTTER_GALLERY_LICENSE_FILES = LICENSE
 FLUTTER_GALLERY_DEPENDENCIES = \
 	host-flutter-sdk-bin \
-	flutter-engine
+	flutter-engine \
+	xdg-user-dirs
 
 FLUTTER_GALLERY_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/gallery/$(FLUTTER_ENGINE_RUNTIME_MODE)
 
@@ -25,9 +26,14 @@ endef
 define FLUTTER_GALLERY_BUILD_CMDS
 	cd $(@D) && \
 		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
-		$(HOST_FLUTTER_SDK_BIN_DART_BIN) package:gallery/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			-Dflutter.dart_plugin_registrant=file://$(@D)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
+			--source file://$(@D)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
+			--source package:flutter/src/dart_plugin_registrant.dart \
+			package:gallery/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
+			--obfuscate \
 			--snapshot_kind=app-aot-elf \
 			--elf=libapp.so \
 			.dart_tool/flutter_build/*/app.dill
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
