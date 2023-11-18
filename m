Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C753C197A0
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 01:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3391342D65;
	Sat, 18 Nov 2023 01:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3391342D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xk4CzApYiQ_C; Sat, 18 Nov 2023 01:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2220841778;
	Sat, 18 Nov 2023 01:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2220841778
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FE601BF329
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 01:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7608741898
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 01:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7608741898
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTKGRYPjqze1 for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 01:55:14 +0000 (UTC)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6697F41778
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 01:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6697F41778
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso1976641a12.3
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 17:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700272513; x=1700877313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W2Q8xrp4URFjlkaWSPtXmY/vo/kUfTCrKYPVhscVP9Q=;
 b=mc2KAYFYU35h59aHZ+1WlqZD5k/s22OBBDn3yM99pkb4RfV/WD6AXJRWEqKmeIPh0P
 Fdth9g4de0BQpm5PMlQUQodaBCcEVw5ASpqFh+Me/MuX7RCY0GpYYfry74nVgxCB6xg9
 cXSA+W0+586teHP0cFWrz9Lt3B1xSn5tONHqMETRdbLzIvpF597mF2Up2WHM47OMYAGu
 BJG4MbNxDVj1IZdlxqWcEAXdOxp8pbZeEPAM2wr4IuBTgd5+ZHNYGC94ZCDTCNdyaXAP
 9+MVAKSG5e4CUMMsOzt2y7SsgcT6P/iEdDnNMlfyzMJW8n4ioSXD7BlhpM7VS3aSOMSW
 r9GQ==
X-Gm-Message-State: AOJu0Yw8XS9eugICMaT1RJ3LqspAF4iLGxKTEnceKiOhGsdlwMEYK5+u
 gUR5ceVX4J+2w2rBAiCaQduvYVe0pOK6iYQ4hjREvQ==
X-Google-Smtp-Source: AGHT+IH8xY9ow1sy9xJiT9WI796kXrsZVgndzfDE2rKbkL2qRwcXlI4vB3cvWb4p2FBUtk30Uv3WAA==
X-Received: by 2002:a05:6a20:1592:b0:187:fb57:9181 with SMTP id
 h18-20020a056a20159200b00187fb579181mr1297844pzj.15.1700272512677; 
 Fri, 17 Nov 2023 17:55:12 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a63e64e000000b005bd3d6e270dsm2025704pgj.68.2023.11.17.17.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 17:55:12 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 17 Nov 2023 18:54:54 -0700
Message-ID: <20231118015456.2629144-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
References: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700272513; x=1700877313;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2Q8xrp4URFjlkaWSPtXmY/vo/kUfTCrKYPVhscVP9Q=;
 b=XyDgINFKhxi/NYXl1qURehaedT8b9z9f2uZlLzuds6d3lWYdAMwbqmXBayyC+/wQHI
 SJtLE2JWmNhWwbGB48zA2iM2ul0lO0NH2pnFFoVZZ3ZB8A8LQAyNmBpbc1C4zvwIhgBM
 b2Jsb1IZD+QIbWxQZUNMmLbN95jQ0Jqdxq0og=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XyDgINFK
Subject: [Buildroot] [PATCH/next 6/7] package/flutter-gallery: depend on
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
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
