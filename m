Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83107C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 14:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 167C98472C;
	Fri, 28 Feb 2025 14:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsAssBwE4ZzT; Fri, 28 Feb 2025 14:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D63E084726
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D63E084726;
	Fri, 28 Feb 2025 14:48:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CD7268
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA940407E4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3m1khLVFqLc for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 14:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 599A040881
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 599A040881
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 599A040881
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:28 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-abf4145368dso7075466b.3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 06:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740754106; x=1741358906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DkqF9Y0USesgpbejyl0XZ4CouKrQigdbR3n0oKVw8+E=;
 b=aupsxZhs1/AK8b954E2gOYyFj4EYcOCikml5U29WxEP+1yeU675qN/gdLljqctIyW3
 T8exlZdjAvBGynkPDz3kSPIJzBy2N7i6eXLJFs6hdCbThvpgywEg65aiPiBpo71dfUuw
 WzxJ9mVxATFlgYtoT0V16j5HOx9T7YeHlID/VfpmqMylNhT3cP3ck24FNP5HYUuuhINS
 H/kcMH6m1SA3nnKt39OOrJthupTYO40dFF36t/yAX0wmcgsO5Sr0TppP243EdGifMFls
 QRc7ywdCEQ2eLAuwIKO6bUaIWKIQ9ePrAUF11AYfeG5GXSzevbPWytQE+WD/EnFG1X8R
 xM/Q==
X-Gm-Message-State: AOJu0YwQjRM7OQgBFH76VVlnn5TqbbD5J2zF1wdT/rTUZAmYis7y7bqw
 Dd/5iFBcXKz4DKM4U23AuOYexzmgz+TyKxI54dfj2YvZ6uO1UXBvFAofmQe/d6CteHdYejkF5x8
 L
X-Gm-Gg: ASbGncsK3REqNbH31eBZAeOtUzDAsEgxCGhrXV91Wntd+V5zMLE2QSYUHAEH8SJDLwR
 h5bKGKJd46aLyRKGcvkzSypclMI3Ov0+5G1kv1m84b9jLJYxlXlfcIV1wXvQ9gFqHGXUF6kkmg8
 rZqWsYnvOYj515vLRtC4lXkKqwr4hG4MtuE8OqgDUF8oLMM/LWiGOm187+ChxDsdiZaQk8kZ0ED
 0qqErJM5kOlOVL2sUbuwjL2+9eqwsoa9WyO9DRRNnwosQr9z0HT2sNbOdFuBKkbs3g3lbMZHrp2
 uOYOmHoeOukyTK5fOM45+etGwIcjadfrmkbm/k1/jmwn7Ko7oVvR7LK3FOCtHXSTl7+AKG0TVDT
 lwgU0TfWhkOZ8
X-Google-Smtp-Source: AGHT+IGr5k3O8jlBtROxZVULqiqMUdbJLcpdRNnwDxPr3mld95z9hBBMHMBbTG8xCLHq5TcDQ64Csg==
X-Received: by 2002:a17:906:dc90:b0:ab7:cd83:98b7 with SMTP id
 a640c23a62f3a-abf26847e8emr128654166b.11.1740754106032; 
 Fri, 28 Feb 2025 06:48:26 -0800 (PST)
Received: from fedora.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c6ee4b3sm293663566b.112.2025.02.28.06.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 06:48:25 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri, 28 Feb 2025 15:48:20 +0100
Message-ID: <20250228144822.860085-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228144822.860085-1-adam.duskett@amarulasolutions.com>
References: <20250228144822.860085-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740754106; x=1741358906;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DkqF9Y0USesgpbejyl0XZ4CouKrQigdbR3n0oKVw8+E=;
 b=qvsJcFR7DtMNTDaRlvaBJI7y7gVjiMaY9CDKSOoGl46z+DVJyhbIUs+Rm1wWIe6rhl
 JEOLxR2O7E9AISdbZiQtxebr2x3M2OKn0QhWMO5a9rcFvPZPV7vfgW6vMx0J2wqI6tHZ
 8ZWsSOx1EAhMyDnapV9wJ7eXZb2TrFayz/WN0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qvsJcFR7
Subject: [Buildroot] [PATCH 3/5] package/flutter-packages: bump to version
 70b41e1adff02b30a37a149b5ef1ddfcaf0debcc
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
index 615c1142b8..6c91c59242 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  769de0bbccc6c5b04ccc0be72652c1a9b22d6b4e03b0477a3c7fccacfdb04177  flutter-packages-3976c1bbd8ffba10007e5beeaddff37bfbaa2ae1.tar.gz
+sha256  e33b93e1e61382050996ad938ebfe7cd1a9034016b84fe7b02a2160263044030  flutter-packages-70b41e1adff02b30a37a149b5ef1ddfcaf0debcc.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 3dbbebb067..8fd13b51ed 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = 3976c1bbd8ffba10007e5beeaddff37bfbaa2ae1
+FLUTTER_PACKAGES_VERSION = 70b41e1adff02b30a37a149b5ef1ddfcaf0debcc
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
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
