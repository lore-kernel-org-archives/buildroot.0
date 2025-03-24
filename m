Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD4BC36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 09:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E003880DE6;
	Mon, 24 Mar 2025 09:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5YlUsFxbgrM; Mon, 24 Mar 2025 09:44:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D97EB81801
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D97EB81801;
	Mon, 24 Mar 2025 09:44:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E81F85E
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE6A540C1E
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHV7UHTsMeS6 for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 09:44:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E172340347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E172340347
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E172340347
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:44:31 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e52bf5eb0fso922916a12.2
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 02:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742809469; x=1743414269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/fVIHNshpMbSYy7UtfaEkj1PLfxsCD+IYZaOFKIRIQ=;
 b=eoVuzOMiXaqrObPv+p9fQp2aEjSQYrCOKTrEk5qDCHek9vF+m9bTR/jS4D6i0/7zHu
 nGfoJP4ScJUpxJ5MDM9Nly7ctNWo5ufI+G08V1l65tp0J+NqHSraimRtVq6RDTRo9gzZ
 s+zGonKh/8pTDfVMdW3cj+YgTaQS+yzjBHJO/0eTqJlkejyWpYYkF2u+1XkF9P+Y7qyC
 HXrxEuQu0aieiYhHWPiuQFCYPA/BjYtg4vC7EvSmBPfYAP4CZCthdCdZitIkS+akrzpN
 VKAbUAKtHq3OVzKAaFIGokKsHsc0J3dkPbdi8YNyO3lkXD11hw24TgmQXz5U+nn7oZT6
 YCcg==
X-Gm-Message-State: AOJu0YzFJFivV8If/CIXmua+9z+WgGjxxtaXuALqUjdsEMWYgRF5k8mL
 qDmlnLo6tFF8sUzhe9kMrgjJN/x/92vEaKx+q8ok7o5Em/i7mFtLY9sAewRphk4ObKSDyPMakv9
 m
X-Gm-Gg: ASbGncuNULQp6l9pyZFsfV0ro6pQh+bsc4FC3VkrzOOSRocNR7fF1LbgCP0Zr6W1nKG
 ODxCRbfuyVbi9qorsKeVQPDSvplByODvAE7rMsHsPHjnmDYSynGqUhz3U66NDMypk0sG2ESzdE7
 wOFCYcNpiofsd6BrEI2XhNNF/WX/wu1/buaiAb7+y7ldDCXy0KyGKsh+iO1TmZQmL8pIR2mdPYr
 A9wEEaEqFZB7by38KLUgxD/6AcNS0dPcVe1JOH6uudkNlC8gE2uzw/iGydoTNCkRmqZDB54/MET
 AMxW0TNj0XQXjja9EOR09d6lnW3JnV/e6BZuvcMUlztyCjoCx85VkrXX5guPcInBgaDgOtG5BxV
 giAwSU1qLgHACDwvsuw2D8/9rk7fVh8Tb1JObwjzoa8LPMN2Plyy/zbYxbvm5OQ/XRIRMZKHB1P
 JM3avRqAwIgZAeq43iPx9/
X-Google-Smtp-Source: AGHT+IEgqFzMVKaoNlTloOvO4ztSFjnAPjY5eYt9MOWJtZjFcEevGQpCdC+wxMfGFYoUlVo84cxf4w==
X-Received: by 2002:a17:907:86a0:b0:ac1:e332:b1dc with SMTP id
 a640c23a62f3a-ac3f2478211mr443232066b.6.1742809469505; 
 Mon, 24 Mar 2025 02:44:29 -0700 (PDT)
Received: from fedora.arnhem.chello.nl
 (2a02-a211-a140-6480-ea4e-3e0b-5fd4-931c.cable.dynamic.v6.ziggo.nl.
 [2a02:a211:a140:6480:ea4e:3e0b:5fd4:931c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef869fd6sm653841666b.19.2025.03.24.02.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 02:44:28 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 24 Mar 2025 10:44:22 +0100
Message-ID: <20250324094424.428727-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324094424.428727-1-adam.duskett@amarulasolutions.com>
References: <20250324094424.428727-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1742809469; x=1743414269;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/fVIHNshpMbSYy7UtfaEkj1PLfxsCD+IYZaOFKIRIQ=;
 b=jlYMXVa3yecnY+eoS0OzYKwKKm97ubzQcgqUdXbKl1iK5qlEANOlT0WMBti1AnDKV9
 ZXrc1x41dgTKgMI+IXlKiJujpNVDjfs/9aPwSBRB8Ou36y+1HxmKMfqONhu1G/ayaUkX
 BUjjdzbxdhrpBsXCoDdT17fz8Pn12rZlaBfl4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jlYMXVa3
Subject: [Buildroot] [PATCH 3/5] package/flutter-packages: bump to version
 2df1c3a524131e35d6e385eb9465c47d530e341b
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

native_assets.yaml are now native_assets.json

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../flutter-adaptive-scaffold-example.mk                        | 2 +-
 .../flutter-animations-example/flutter-animations-example.mk    | 2 +-
 .../flutter-go-router-example/flutter-go-router-example.mk      | 2 +-
 .../flutter-image-example/flutter-image-example.mk              | 2 +-
 .../flutter-markdown-example/flutter-markdown-example.mk        | 2 +-
 package/flutter-packages/flutter-packages.hash                  | 2 +-
 package/flutter-packages/flutter-packages.mk                    | 2 +-
 .../flutter-rfw-local-example/flutter-rfw-local-example.mk      | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk b/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk
index f6ac086115..e8e27d4383 100644
--- a/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk
+++ b/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk
@@ -26,7 +26,7 @@ endef
 define FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILD_CMDS
 	cd $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR) && \
 		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			--native-assets $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
 			package:$(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_PKG_NAME)/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
diff --git a/package/flutter-packages/flutter-animations-example/flutter-animations-example.mk b/package/flutter-packages/flutter-animations-example/flutter-animations-example.mk
index 2b5c896736..440aec4964 100644
--- a/package/flutter-packages/flutter-animations-example/flutter-animations-example.mk
+++ b/package/flutter-packages/flutter-animations-example/flutter-animations-example.mk
@@ -26,7 +26,7 @@ endef
 define FLUTTER_ANIMATIONS_EXAMPLE_BUILD_CMDS
 	cd $(FLUTTER_ANIMATIONS_EXAMPLE_BUILDDIR) && \
 		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_ANIMATIONS_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			--native-assets $(FLUTTER_ANIMATIONS_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
 			package:$(FLUTTER_ANIMATIONS_EXAMPLE_PKG_NAME)/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
diff --git a/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk b/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk
index a7fa36ca9e..9279a4503f 100644
--- a/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk
+++ b/package/flutter-packages/flutter-go-router-example/flutter-go-router-example.mk
@@ -29,7 +29,7 @@ define FLUTTER_GO_ROUTER_EXAMPLE_BUILD_CMDS
 			-Dflutter.dart_plugin_registrant=file://$(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
 			--source file://$(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
 			--source package:flutter/src/dart_plugin_registrant.dart \
-			--native-assets $(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			--native-assets $(FLUTTER_GO_ROUTER_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
 			package:$(FLUTTER_GO_ROUTER_EXAMPLE_PKG_NAME)/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
diff --git a/package/flutter-packages/flutter-image-example/flutter-image-example.mk b/package/flutter-packages/flutter-image-example/flutter-image-example.mk
index 20f185896d..5d754c0ff6 100644
--- a/package/flutter-packages/flutter-image-example/flutter-image-example.mk
+++ b/package/flutter-packages/flutter-image-example/flutter-image-example.mk
@@ -26,7 +26,7 @@ endef
 define FLUTTER_IMAGE_EXAMPLE_BUILD_CMDS
 	cd $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR) && \
 		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			--native-assets $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
 			package:$(FLUTTER_IMAGE_EXAMPLE_PKG_NAME)/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
diff --git a/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk b/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
index eb6792fb02..0859b947eb 100644
--- a/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
+++ b/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
@@ -26,7 +26,7 @@ endef
 define FLUTTER_MARKDOWN_EXAMPLE_BUILD_CMDS
 	cd $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR) && \
 		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			--native-assets $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
 			package:$(FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME)/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index 615c1142b8..00346a8a6a 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  769de0bbccc6c5b04ccc0be72652c1a9b22d6b4e03b0477a3c7fccacfdb04177  flutter-packages-3976c1bbd8ffba10007e5beeaddff37bfbaa2ae1.tar.gz
+sha256  9b6fdc8660ac3c601887c3c7e8859662e7fca19584af56dfac9c8acb86298a01  flutter-packages-2df1c3a524131e35d6e385eb9465c47d530e341b.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 3dbbebb067..40a586f7e0 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = 3976c1bbd8ffba10007e5beeaddff37bfbaa2ae1
+FLUTTER_PACKAGES_VERSION = 2df1c3a524131e35d6e385eb9465c47d530e341b
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
diff --git a/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk b/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk
index b57c021f8b..49f1dc4dda 100644
--- a/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk
+++ b/package/flutter-packages/flutter-rfw-local-example/flutter-rfw-local-example.mk
@@ -26,7 +26,7 @@ endef
 define FLUTTER_RFW_LOCAL_EXAMPLE_BUILD_CMDS
 	cd $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR) && \
 		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			--native-assets $(FLUTTER_RFW_LOCAL_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
 			package:$(FLUTTER_RFW_LOCAL_EXAMPLE_PKG_NAME)/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
