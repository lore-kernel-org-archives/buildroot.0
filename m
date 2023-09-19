Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92957CE79A8
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 20:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D9DC83903;
	Tue, 19 Sep 2023 20:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D9DC83903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3OLP0NuMRY5; Tue, 19 Sep 2023 20:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EFEF83942;
	Tue, 19 Sep 2023 20:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EFEF83942
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B40C41BF20B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 20:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AB968332A
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 20:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AB968332A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEk-vVXN0KMi for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 20:43:06 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D25B830B8
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 20:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D25B830B8
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68fb98745c1so4659004b3a.1
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 13:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695156185; x=1695760985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lOWplDQv/eMKfbJRXBkBalh8BfN5uAGxw7eO/PK5+88=;
 b=krjufR2PvRFirR0UbV2cNDTN/trgY48D/uTv7HOHzSovxhRS3s0EDJR3DXLt4xTgd9
 Xml+dLKG2Z8n9abQ0bKq4sXjikv/6E2yJ0jN4IKyJC554d4Sp06GxViL1K4XT/kgDKdd
 Ipy/ji2n9QDHlqcQqcTTjlkK/0X/WOLkVlj3hRBVCcVAVIJoz3KV5vovaBmC2zLiDqwX
 6KOMiYmf/ZRq80apAZcTzlFgxjZzMQ8RYFXSQs4IMdPWWzq0F8p8FgCzk/n7PPvKEBNy
 ZSnPIRrPmmmUSCXcu8gV3V3T6k8AvBPIAZbya8RlFrNEB/xkGeqNygvp9ceOp961SnXz
 etOA==
X-Gm-Message-State: AOJu0YwgA/wCg1X8to3fzCu8v/PyTBLLQHlcdvmvXK0MdZtehSQzkajs
 zCYUE0J9OThtyHPBZwnKO97ZMMoCzBrvG/jx+nFVVg==
X-Google-Smtp-Source: AGHT+IEfgEtUe8QczRRc++i/oXuZAPaqJ3iqayuu4DJPNOsjG05jBQmV8OSDRI2qmJPRn9Ii3i4mWw==
X-Received: by 2002:a05:6a20:428e:b0:15a:478f:9f2e with SMTP id
 o14-20020a056a20428e00b0015a478f9f2emr801880pzj.1.1695156185410; 
 Tue, 19 Sep 2023 13:43:05 -0700 (PDT)
Received: from Adam-laptop.amarulasolutions.com ([172.56.201.58])
 by smtp.gmail.com with ESMTPSA id
 18-20020a056a00073200b0068844ee18dfsm8918700pfm.83.2023.09.19.13.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 13:43:04 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 14:42:51 -0600
Message-Id: <20230919204252.2272594-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
References: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695156185; x=1695760985;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lOWplDQv/eMKfbJRXBkBalh8BfN5uAGxw7eO/PK5+88=;
 b=kDgWVrTrHovAuOTKxCEJ4bFm/iMnpu9QgMbkPZv5tD0jRK+2sb5t+TyCj0+NvLkDoB
 EoR9Bbzia4QE5LewznybV47LXtEPAEupMG9mXFQboMdE7PEe/U3ElfJFr4Y4PcyhJKkJ
 8m2aUjEYBdI2bPhi21if9wCHjBBVxXN/UFrV0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kDgWVrTr
Subject: [Buildroot] [PATCH v9 6/7] package/flutter-gallery: new package
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
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Flutter Gallery is a resource to help developers evaluate and use Flutter.
It is a collection of Material Design & Cupertino widgets, behaviors, and
vignettes implemented with Flutter.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
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
index c9b972e8ab..48a4ec776a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -34,6 +34,7 @@ F:	package/vulkan-tools/
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
 F:	package/flutter-engine/
+F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 
diff --git a/package/Config.in b/package/Config.in
index b73bb33bf6..109c2921a2 100644
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
index 0000000000..e89fbb009d
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
+FLUTTER_GALLERY_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/gallery/$(FLUTTER_ENGINE_RUNTIME_MODE)
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
+	ln -sf ../../../$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_GALLERY_INSTALL_DIR)/data/
+
+	ln -sf ../../../../../lib/libflutter_engine.so $(FLUTTER_GALLERY_INSTALL_DIR)/lib/
+endef
+
+$(eval $(generic-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
