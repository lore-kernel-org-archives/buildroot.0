Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB04AC001DF
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 22:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A65C560B10;
	Tue, 15 Aug 2023 22:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A65C560B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mOMjCA-78YeU; Tue, 15 Aug 2023 22:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD6B3611D0;
	Tue, 15 Aug 2023 22:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD6B3611D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 165F11BF47F
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 22:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCFAE41993
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 22:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCFAE41993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sv5QLRthHqCg for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 22:28:53 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E94F54186B
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 22:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E94F54186B
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-68872cadc7cso659718b3a.1
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 15:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692138532; x=1692743332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sk5kSXN8bUoAXjEkSONyYnnLAogn43Y7FPP+K0JkZ6c=;
 b=VelTxAt/ZANMdFkitX9i0qLCx2i7VknTtmWysVlv56/YJwFbchM50dR7abvE0E56ZG
 5hItJjStO+YCA3F2VexEPk8hh0OJs/c/w/ijlotUV9ATLd8VTutn/hyDMMFyH8Lhef0i
 dXVBR2LGmtwvuNkPFNuIbXiBwb8hfjuxvgH9apLnvyon/sR9ZQ50zH7PdurMHjWPsljM
 6+E2mT8Z9nZziORDK7Ri78bl7sjoNFmiIcjS0aS3UpD34/Def3Fl5ukfhMIdUWLBctty
 0yZAOxWjfDI0wWolkfUhSTvgWPUe6LvT78yN/GkmoHFKQCdUGHOa3YnVcSFfaYZKslQU
 Ocgg==
X-Gm-Message-State: AOJu0Yyv1WcwE2nRrKhRog1GHt5Bh9fnt8yvql/W4yHiOEtduLppEvX4
 jw559yXbwHM7jzl4uFcqFRPoyAoDxmI0ZVAjFI0=
X-Google-Smtp-Source: AGHT+IEiOUDjRMQqwOoCi1VzToTe3w/VZzKoONmoLDu+q/mBmyxwP0LhZvbhLp5Mpsie26cW1sA1nA==
X-Received: by 2002:a05:6a00:1792:b0:682:3126:961a with SMTP id
 s18-20020a056a00179200b006823126961amr122873pfg.5.1692138531866; 
 Tue, 15 Aug 2023 15:28:51 -0700 (PDT)
Received: from fedora.. ([174.27.153.162]) by smtp.gmail.com with ESMTPSA id
 q24-20020a62e118000000b006873aa079aasm10177758pfh.171.2023.08.15.15.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:28:51 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 16:28:45 -0600
Message-ID: <20230815222847.2460201-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815222847.2460201-1-adam.duskett@amarulasolutions.com>
References: <20230815222847.2460201-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692138532; x=1692743332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sk5kSXN8bUoAXjEkSONyYnnLAogn43Y7FPP+K0JkZ6c=;
 b=ebN7Ekifs9SxnG3yE1FYgUMkd0FI8u5Ka5vUkzOev4R0hUEtiaFCA0SOseP3Ug0JNr
 OtyUXjvXNnl+Zj7RJkYS/UXBtXG69QuukMQwAOKJZim1Q48n+5MSLFh5JqDFNKTE0Zgh
 /sUIS8BNfxv1+l+KmDdc+6eu72TMgPpkiwOcg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ebN7Ekif
Subject: [Buildroot] [PATCH v2] package/flutter-sdk-bin: new package
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

flutter-sdk-bin is a collection of host tools and plugins used to cross-compile
flutter applications.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                   |  1 +
 package/flutter-sdk-bin/flutter-sdk-bin.hash |  3 +
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 87 ++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 package/flutter-sdk-bin/flutter-sdk-bin.hash
 create mode 100644 package/flutter-sdk-bin/flutter-sdk-bin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1769f4db61..45197c80ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -31,6 +31,7 @@ F:	package/firewalld/
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
+F:	package/flutter-sdk-bin/
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
new file mode 100644
index 0000000000..13e588cd83
--- /dev/null
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7048e51a89c99a5b6cac6d8ae416121264effa76da34dba5c0e7cf85519c8e98  flutter_linux_3.10.6-stable.tar.xz
+sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
new file mode 100644
index 0000000000..87dd035faf
--- /dev/null
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -0,0 +1,87 @@
+################################################################################
+#
+# host-flutter-sdk-bin
+#
+################################################################################
+
+FLUTTER_SDK_BIN_VERSION = 3.10.6
+FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
+FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
+FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
+FLUTTER_SDK_BIN_LICENSE_FILES = LICENSE
+
+HOST_FLUTTER_SDK_BIN_SDK = $(HOST_DIR)/share/flutter/sdk
+HOST_FLUTTER_SDK_BIN_SDK_ENGINE = $(HOST_FLUTTER_SDK_BIN_SDK)/bin/cache/artifacts/engine
+HOST_FLUTTER_SDK_BIN_DART_SDK = $(HOST_FLUTTER_SDK_BIN_SDK)/bin/cache/dart-sdk
+
+HOST_FLUTTER_SDK_BIN_ENV = \
+	PATH=$(BR_PATH):$(HOST_FLUTTER_SDK_BIN_SDK):$(HOST_FLUTTER_SDK_BIN_SDK)/bin \
+	PUB_CACHE=$(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
+
+# The following config options must be ran one at a time.
+define HOST_FLUTTER_SDK_BIN_CONFIGURE_CMDS
+	cd $(@D) && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter config --clear-features && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter config --enable-linux-desktop && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter config --enable-custom-devices && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter config --no-analytics && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/dart --disable-analytics
+endef
+
+# Remove the cache, as we will run precache after setting up flutter and dart
+# with the new config options.
+define HOST_FLUTTER_SDK_BIN_BUILD_CMDS
+	mkdir -p $(HOST_FLUTTER_SDK_BIN_SDK)
+	rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
+	rm -rf $(@D)/bin/cache
+	cd $(@D) && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter precache && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter config && \
+		rm -rf $(@D)/bin/cache/pkg/sky_engine
+		rm -rf $(@D)/bin/cache/artifacts/*
+endef
+
+define HOST_FLUTTER_SDK_BIN_INSTALL_CMDS
+	mkdir -p $(HOST_FLUTTER_SDK_BIN_SDK)
+	cp -rT $(@D)/. $(HOST_FLUTTER_SDK_BIN_SDK)/
+endef
+
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
+HOST_FLUTTER_SDK_BIN_SDK_ROOT = \
+	$(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk
+HOST_FLUTTER_SDK_BIN_SDK_PRODUCT = false
+else
+HOST_FLUTTER_SDK_BIN_SDK_ROOT = \
+	$(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk_product
+HOST_FLUTTER_SDK_BIN_SDK_PRODUCT = true
+endif
+
+# The Order matters.Taken from:
+# https://github.com/meta-flutter/meta-flutter/blob/kirkstone/classes/flutter-app.inc
+HOST_FLUTTER_SDK_BIN_DART_ARGS = \
+	--verbose \
+	--disable-analytics \
+	--disable-dart-dev $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/linux-x64/frontend_server.dart.snapshot \
+	--sdk-root $(HOST_FLUTTER_SDK_BIN_SDK_ROOT) \
+	--target=flutter \
+	--no-print-incremental-dependencies \
+	-Ddart.vm.profile=false \
+	-Ddart.vm.product=$(HOST_FLUTTER_SDK_BIN_SDK_PRODUCT) \
+	--aot \
+	--tfa \
+	--packages .dart_tool/package_config.json \
+	--output-dill .dart_tool/flutter_build/*/app.dill \
+	--depfile .dart_tool/flutter_build/*/kernel_snapshot.d
+
+# Helper wrapper to run flutter when building flutter applications.
+HOST_FLUTTER_SDK_BIN_FLUTTER = \
+	$(HOST_FLUTTER_SDK_BIN_ENV) \
+	$(HOST_FLUTTER_SDK_BIN_SDK)/bin/flutter
+
+# Helper wrapper to run dart when building flutter applications.
+HOST_FLUTTER_SDK_BIN_DART_BIN = \
+	$(HOST_FLUTTER_SDK_BIN_ENV) \
+	$(HOST_FLUTTER_SDK_BIN_DART_SDK)/bin/dart \
+	$(HOST_FLUTTER_SDK_BIN_DART_ARGS)
+
+$(eval $(host-generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
