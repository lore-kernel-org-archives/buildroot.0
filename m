Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54CCC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 14:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7966640C5B;
	Thu,  8 Aug 2024 14:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hE-bBdRKCXaW; Thu,  8 Aug 2024 14:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F0EE40BC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F0EE40BC3;
	Thu,  8 Aug 2024 14:18:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 973C61BF294
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 14:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9233981E11
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 14:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4e_qjlnCUIb for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 14:17:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BA7481E0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BA7481E0C
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BA7481E0C
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 14:17:55 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id
 38308e7fff4ca-2f01e9f53e3so16127931fa.1
 for <buildroot@buildroot.org>; Thu, 08 Aug 2024 07:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723126673; x=1723731473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UWqwiK5UDZonIZh32vNDmQ8oSDI4AkbMamhDIYC/iSc=;
 b=W+IyCjVRweovxuj3xY6dX1iiTOKH81vy9zrKB8qFpBWjtvEpfSWXSyLEZ5V06Qr3W+
 jg+2VMIat+bNYf9pohCycA+rkDwFdVx5D92XOVY0ML9dNryC0oB9wY0JUsxTYiurOnkU
 uqOBrfsNnZrkbFzvDXdYoELmgQmTA+wXzmfXpPfSXDV+hbyN6V7Pe1WEXfWLexN9J4CD
 g3EVq437JyW8XEv7F+jyueY034AZ+FGRt1XSgUD+vCw1+yiviTDH+V19dyfUyER0sja+
 8ZtzRfuygvfFDL/EtQlCwIEyL15p2nxe7RhaHNZpok2AGbAdGzHpv2yjCnkcQQq+xGRt
 jBMg==
X-Gm-Message-State: AOJu0Yz9NzNCM5z6nO+u41hKLIOusj4Q2qOaa/U6W/z4xx4L5JHHYmaI
 iXPLdRr1Q8OGUb/IikF8MjCpuL+g4NYD9AAXz9HszLBDWEBz6IEOHauNOr14OrltjvAAC88vfR0
 qb44zzKTy
X-Google-Smtp-Source: AGHT+IEC4GNJNlgKcraebO8RSjQkmC9hMj92TKIQI+HF/YVtlUNIwYEPXqXsraXuc96bXsgwLy2ZoQ==
X-Received: by 2002:a2e:a545:0:b0:2ef:17ee:62a2 with SMTP id
 38308e7fff4ca-2f19de2a230mr18757191fa.14.1723126672428; 
 Thu, 08 Aug 2024 07:17:52 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 ([2a02:a477:a7d9:1:3678:e036:10d9:128d])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2d34a74sm701780a12.69.2024.08.08.07.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 07:17:52 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  8 Aug 2024 16:17:47 +0200
Message-ID: <20240808141747.1770035-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240808141747.1770035-1-adam.duskett@amarulasolutions.com>
References: <20240808141747.1770035-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1723126673; x=1723731473;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWqwiK5UDZonIZh32vNDmQ8oSDI4AkbMamhDIYC/iSc=;
 b=FY9SMVS3F9zKTdE6FepCG8LbOLT5Blk9pHEW6a3rV5+MUnArP0mv5tLQoZD0mEfNpL
 8dtbWmFbplMtnJ46hRQLwZ3sBWQyenPAd0abybH9Hv+MOLTbpkjf3Hiak/tCFCrF6hkl
 +zKrPJJxiBzAQgIi2pYtsevBtytCftGTRzXlY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FY9SMVS3
Subject: [Buildroot] [PATCH 5/5] package/flutter-packages: bump version to
 8af79fbca12699248e96b50b4705da74396cd6a3
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

As of commit e35f29177495131f0f598fc7ae1ffd74d89edf15, the dynamic-layouts
example has been removed from the flutter-packages repository, which fixes
https://github.com/flutter/flutter/issues/148979.

The exact reasoning is as follows:

```
The dynamic_layouts package is unpublished, and its core feature set has not
been updated in years.

Though it's not high-traffic, all packages in that repo require maintenance
for Flutter versions, gradle bumps, and project migrations.
```

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 Config.in.legacy                              |  7 +++
 DEVELOPERS                                    |  1 -
 package/flutter-packages/Config.in            |  1 -
 .../flutter-dynamic-layouts-example/Config.in |  8 ---
 .../flutter-dynamic-layouts-example.hash      |  1 -
 .../flutter-dynamic-layouts-example.mk        | 54 -------------------
 .../flutter-packages/flutter-packages.hash    |  2 +-
 package/flutter-packages/flutter-packages.mk  |  2 +-
 8 files changed, 9 insertions(+), 67 deletions(-)
 delete mode 100644 package/flutter-packages/flutter-dynamic-layouts-example/Config.in
 delete mode 120000 package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.hash
 delete mode 100644 package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 6473947a9a..c1870613af 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE
+	bool "flutter-dynamic-layouts-example has been removed"
+	select BR2_LEGACY
+	help
+	  flutter-dynamic-layouts was removed from flutter-packages
+	  as of commit e35f29177495131f0f598fc7ae1ffd74d89edf15.
+
 config BR2_KERNEL_HEADERS_6_9
 	bool "kernel headers version 6.9.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index c52f53565c..d7d0af3543 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -35,7 +35,6 @@ F:	package/flutter-engine/
 F:	package/flutter-packages/
 F:	package/flutter-packages/flutter-adaptive-scaffold-example/
 F:	package/flutter-packages/flutter-animations-example/
-F:	package/flutter-packages/flutter-dynamic-layouts-example/
 F:	package/flutter-packages/flutter-go-router-example/
 F:	package/flutter-packages/flutter-image-example/
 F:	package/flutter-packages/flutter-markdown-example/
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
index 4e3e29582f..88d9193608 100644
--- a/package/flutter-packages/Config.in
+++ b/package/flutter-packages/Config.in
@@ -9,7 +9,6 @@ menuconfig BR2_PACKAGE_FLUTTER_PACKAGES
 if BR2_PACKAGE_FLUTTER_PACKAGES
 source "package/flutter-packages/flutter-adaptive-scaffold-example/Config.in"
 source "package/flutter-packages/flutter-animations-example/Config.in"
-source "package/flutter-packages/flutter-dynamic-layouts-example/Config.in"
 source "package/flutter-packages/flutter-go-router-example/Config.in"
 source "package/flutter-packages/flutter-image-example/Config.in"
 source "package/flutter-packages/flutter-markdown-example/Config.in"
diff --git a/package/flutter-packages/flutter-dynamic-layouts-example/Config.in b/package/flutter-packages/flutter-dynamic-layouts-example/Config.in
deleted file mode 100644
index a3f6630795..0000000000
--- a/package/flutter-packages/flutter-dynamic-layouts-example/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE
-	bool "flutter dynamic layouts example"
-	help
-	  This package provides support for multi sized tiles and
-	  different layouts. Currently the layouts that are implemented
-	  in this package are Stagger and Wrap.
-
-	  https://github.com/flutter/packages/tree/main/packages/dynamic_layouts/example
diff --git a/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.hash b/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.hash
deleted file mode 120000
index 879f2adb39..0000000000
--- a/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.hash
+++ /dev/null
@@ -1 +0,0 @@
-../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.mk b/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.mk
deleted file mode 100644
index aefcf3f62c..0000000000
--- a/package/flutter-packages/flutter-dynamic-layouts-example/flutter-dynamic-layouts-example.mk
+++ /dev/null
@@ -1,54 +0,0 @@
-################################################################################
-#
-# flutter-dynamic-layouts-example
-#
-################################################################################
-
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_PKG_NAME = example
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/dynamc-layouts-$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
-FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_SUBDIR = packages/dynamic_layouts/example
-
-define FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_CONFIGURE_CMDS
-	cd $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR) && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
-endef
-
-define FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILD_CMDS
-	cd $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR) && \
-		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
-			package:$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_PKG_NAME)/main.dart && \
-		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
-			--deterministic \
-			--obfuscate \
-			--snapshot_kind=app-aot-elf \
-			--elf=libapp.so \
-			.dart_tool/flutter_build/*/app.dill
-endef
-
-define FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_TARGET_CMDS
-	mkdir -p $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/{data,lib}
-	cp -dprf $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/
-
-	$(INSTALL) -D -m 0755 $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_BUILDDIR)/libapp.so \
-		$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/lib/libapp.so
-
-	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
-	$(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/
-
-	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/lib/
-	$(RM) $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
-	touch $(FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
-endef
-
-$(eval $(generic-package))
diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index f266c497e4..1fbe601396 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2e1e19713ac74b6e00a6f5ec516e8ccda5e5ba1fc8b249d40abcfe4cb50dff87  flutter-packages-ab1630b9b9bd1130b4d5d1ac18a588b690fd0fa3.tar.gz
+sha256  388ec45142ddfab711aa82958c82657b8c2238deb6c131cec94a5a993ba4c760  flutter-packages-8af79fbca12699248e96b50b4705da74396cd6a3.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 6b1a4371e8..1a1913043b 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = ab1630b9b9bd1130b4d5d1ac18a588b690fd0fa3
+FLUTTER_PACKAGES_VERSION = 8af79fbca12699248e96b50b4705da74396cd6a3
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
