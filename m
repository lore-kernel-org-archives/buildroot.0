Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C058EC52D6F
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 14:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D87C040B3D;
	Thu,  8 Aug 2024 14:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZ4c-51vFfv3; Thu,  8 Aug 2024 14:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E9C240B7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E9C240B7B;
	Thu,  8 Aug 2024 14:18:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11B241BF294
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 14:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F206660ABB
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 14:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iN8FUJ2LDFiJ for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 14:17:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71A1260AB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71A1260AB7
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71A1260AB7
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 14:17:53 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-5a1337cfbb5so1291609a12.3
 for <buildroot@buildroot.org>; Thu, 08 Aug 2024 07:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723126671; x=1723731471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQiLB8rDwG+fqieEaWZAXgqpmNzBYdHkPePb+uft73E=;
 b=rIDFc7ObS19TLVuAuxQIRg16OHrNoWrsLiuJOfMCuUUi44Nq39ZcF/mw2g9wY686tu
 P6ai43crpjbrx02CT7yjc7+1SKfDmlBjp+gUw/4z2afE5814SxliKkkbfKXDaerep8e6
 Ly4moYGWta0Ol0NwSFRwqnYESmSy0toUI0duSxlrCCcoHTqB60OYwXbcTFw++BAYyc4D
 dL1gnZVq57DC6nyqdBOF36O6a0PsHr2+536JZOxs4718ENGOfahVlJ+ErEYTEfwXriYq
 RbbKOj4R3C9XUSY2TNGHD1a1zGgICmGI0x7FnklX8a5PA2Y9CHO/ebM+QlcUEFaOnEmt
 //HQ==
X-Gm-Message-State: AOJu0YzBo6sfvzUOqlbUx+EdzchuGNwyVriUGQ8pGfELFxZrH7z/jHDj
 Z3Gf6SHRCgpAlrOx+1WzDYAGeoOAwFR0JBSXB6hrrusnrzNXp+pv0Vuf7fypGvFtRsFvve1lEON
 s0CpBcAmX
X-Google-Smtp-Source: AGHT+IG/ECpyG0aSw7iTKAKIoIRXrDq3lCflQE1qYY8NWsqgZHrjx25WAn//XWxCDxwdrEJb71fnbQ==
X-Received: by 2002:a05:6402:11ca:b0:5a7:d986:6e4 with SMTP id
 4fb4d7f45d1cf-5bbb233a745mr1570019a12.28.1723126671072; 
 Thu, 08 Aug 2024 07:17:51 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 ([2a02:a477:a7d9:1:3678:e036:10d9:128d])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2d34a74sm701780a12.69.2024.08.08.07.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 07:17:50 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  8 Aug 2024 16:17:45 +0200
Message-ID: <20240808141747.1770035-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240808141747.1770035-1-adam.duskett@amarulasolutions.com>
References: <20240808141747.1770035-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1723126671; x=1723731471;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQiLB8rDwG+fqieEaWZAXgqpmNzBYdHkPePb+uft73E=;
 b=CTQhjAw+MTgF8d8pryq20Sb/a1Gbueqb4TPC+ic65ZYo+bsueMTC2SCO9L9DQ5ylE3
 vtBt0x2Otath3oaJ3qEUo+4GRdDSgzj6P7YRaCW4SMsqJEhK2jdgjW5ZBvH9WNE3Dj8K
 6vrLKvPnAeXjQqdXE3Tq0KEENWxV7XDToGdmM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=CTQhjAw+
Subject: [Buildroot] [PATCH 3/5] package/flutter-engine: bump version to
 3.24.0
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

Add `"download_fuchsia_deps": False` to the dot-gclient file as this is
for linux, not fuchsia, so the dependencies are not necessary.

Also, change various paths in flutter-engine.mk to ensure that the package
builds correctly.

Tested with tests.package.test_flutter.TestFlutter.test_run

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...on-dependency-if-unit-tests-are-disa.patch | 32 -------------------
 package/flutter-engine/dot-gclient            |  3 +-
 package/flutter-engine/flutter-engine.mk      | 10 +++---
 3 files changed, 7 insertions(+), 38 deletions(-)
 delete mode 100644 package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch

diff --git a/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch b/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch
deleted file mode 100644
index 125bfc6910..0000000000
--- a/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 2252a85e59669b5826019f60a98b7a69939dacfd Mon Sep 17 00:00:00 2001
-From: Greg Spencer <gspencer@google.com>
-Date: Mon, 4 Mar 2024 12:30:41 -0800
-Subject: [PATCH] Skip configuration dependency if unit tests are disabled.
-
-Commit 88baf62f made gtk+-3.0 an unconditional requirement, see:
-
-Issue: https://github.com/flutter/flutter/issues/144421
-Upstream: Merged. https://github.com/flutter/engine/pull/51179
-
-Signed-off-by: Greg Spencer <gspencer@google.com>
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- flutter/testing/BUILD.gn | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/flutter/testing/BUILD.gn b/flutter/testing/BUILD.gn
-index 9eac29452..a7d094695 100644
---- a/flutter/testing/BUILD.gn
-+++ b/flutter/testing/BUILD.gn
-@@ -51,7 +51,7 @@ source_set("testing") {
- 
-   sources = [ "run_all_unittests.cc" ]
- 
--  if (is_linux) {
-+  if (enable_unittests && is_linux) {
-     # So that we can call gtk_init in main().
-     configs += [ "//flutter/shell/platform/linux/config:gtk" ]
-   }
--- 
-2.44.0
-
diff --git a/package/flutter-engine/dot-gclient b/package/flutter-engine/dot-gclient
index ba9590a7f5..6ead80c8c2 100644
--- a/package/flutter-engine/dot-gclient
+++ b/package/flutter-engine/dot-gclient
@@ -8,6 +8,7 @@ solutions = [{
     "custom_vars": {
         "download_android_deps": False,
         "download_windows_deps": False,
-        "download_linux_deps": False
+        "download_linux_deps": False,
+        "download_fuchsia_deps": False
     },
 }]
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index dfc3c03ef9..020fa2ee8a 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.19.5
+FLUTTER_ENGINE_VERSION = 3.24.0
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
@@ -67,7 +67,7 @@ FLUTTER_ENGINE_INSTALL_FILES = libflutter_engine.so
 
 # Flutter engine includes a bundled patched clang that must be used for
 # compiling or else there are linking errors.
-FLUTTER_ENGINE_CLANG_PATH = $(@D)/buildtools/linux-x64/clang
+FLUTTER_ENGINE_CLANG_PATH = $(@D)/flutter/buildtools/linux-x64/clang
 
 FLUTTER_ENGINE_CONF_OPTS = \
 	--clang \
@@ -126,7 +126,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 FLUTTER_ENGINE_DEPENDENCIES += libgles
-FLUTTER_ENGINE_CONF_OPTS += --enable-impeller-opengles
+FLUTTER_ENGINE_CONF_OPTS += --enable-impeller-3d
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLFW),y)
@@ -153,7 +153,7 @@ FLUTTER_ENGINE_DEPENDENCIES += libxcb
 else
 define FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
 	$(SED) "s%vulkan_use_x11.*%vulkan_use_x11 = false%g" -i \
-		$(@D)/build_overrides/vulkan_headers.gni
+		$(@D)/flutter/build_overrides/vulkan_headers.gni
 
 	$(SED) "s%ozone_platform_x11.*%ozone_platform_x11 = false%g" \
 		$(@D)/build/config/BUILDCONFIG.gn
@@ -166,7 +166,7 @@ FLUTTER_ENGINE_DEPENDENCIES += wayland
 else
 define FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
 	$(SED) "s%vulkan_use_wayland.*%vulkan_use_wayland = false%g" \
-		$(@D)/build_overrides/vulkan_headers.gni
+		$(@D)/flutter/build_overrides/vulkan_headers.gni
 
 	$(SED) "s%ozone_platform_wayland.*%ozone_platform_wayland = false%g" \
 		$(@D)/build/config/BUILDCONFIG.gn
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
