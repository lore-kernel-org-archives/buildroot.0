Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD37CD3425
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 00:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 629D2416BB;
	Tue, 19 Sep 2023 00:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 629D2416BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W8oIEbaaB3BY; Tue, 19 Sep 2023 00:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B1B941697;
	Tue, 19 Sep 2023 00:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B1B941697
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 827F91BF95F
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 00:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CF208226A
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 00:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CF208226A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K1X19NLI4f3m for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 00:33:46 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B0C982268
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 00:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B0C982268
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c59c40b840so1520205ad.3
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 17:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695083625; x=1695688425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3jSdR0N4z5p8N3+iPSEDzGpRhGrews7v+gzQ6VwwG+o=;
 b=JHmUJEB8vFM3qV/0n851MRMwsJ03kHIV3WXC+AY4iO6k475WFWLkQwxPCACzJl1FVt
 I+ct+Vw4hAebhEErFigrAIUotRA3CQTh5rqO0kGdoYc+Fcfuh+TMIMPnEjA3STqOb+Cv
 v68qt47Su2jR+Eqq4dujXCv7h6kylU39I7RsZ9mgnhgV8MP3n4xNG/9jTqIUpLL4WejA
 WNcUZ6tEr1qLXKI4ZoiKJHCCfwxRPtadRGRDDtNUA5PRLQz8g2Fq7wuIIxN1W/51GYoq
 5Ql5uwKpXia5P+71C8CmMRZ17fx1KKrzjuYPkIiGcU1Ccg0u/nDNGRpnaEUoDJV8SxaC
 /6jQ==
X-Gm-Message-State: AOJu0YxY1Ud1sR7r0eaKARbLvIadW6tFm0Y37Op+n+UDvEMxa9HQYUAp
 pSyaURAeVBNv9cA+A2FXf4WQAPc2bppC04TxcFr64A==
X-Google-Smtp-Source: AGHT+IHHCGX3CtzPI98hHditnr6UgiZGvobWO5h9HtViwnfECMWMczbr8MfkgtObgMJ1DglFn4PTNA==
X-Received: by 2002:a17:902:e5c2:b0:1c1:f6d1:3118 with SMTP id
 u2-20020a170902e5c200b001c1f6d13118mr13882185plf.27.1695083625318; 
 Mon, 18 Sep 2023 17:33:45 -0700 (PDT)
Received: from Adam-laptop.amarulasolutions.com ([172.56.200.164])
 by smtp.gmail.com with ESMTPSA id
 iw13-20020a170903044d00b001c582de968dsm1558001plb.72.2023.09.18.17.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 17:33:45 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 18:33:33 -0600
Message-Id: <20230919003337.565432-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919003337.565432-1-adam.duskett@amarulasolutions.com>
References: <20230919003337.565432-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695083625; x=1695688425;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jSdR0N4z5p8N3+iPSEDzGpRhGrews7v+gzQ6VwwG+o=;
 b=nnoLvjV0oDMYJ1N4gyCc+a3xm+QeI0ac5bKP+UowkOtPkvfkHmfCxYtGOIsyzshPX3
 ZZZ27rbMAiVhYjY8R6yj6LgrIale9Vj3lgCmfhRdwLteABu60BDhGxKmDdioy6yu24YE
 Vn9Oynkw+fSk7IIDDvFTrdbNjdIhFK5X9+P70=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nnoLvjV0
Subject: [Buildroot] [PATCH v8 3/7] package/flutter-sdk-bin: new package
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

flutter-sdk-bin is a collection of host tools and plugins used to compile
flutter applications.

- As this is a collection of pre-compiled tools, append -bin to the end of the
  package name.

- We must set the HOME directory variable to the sdk directory or else the
  flutter dart binaries place .dart, .dart-sdk, and .flutter in ~/.

- set --clear-features, --no-analytics and --disable-telemetry first to disable
  google tracking as soon as possible.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
Changes v6 -> v7:
  - Update from 3.13.1 to 3.13.4

Changes v6 -> v7:
  - Update from 3.10.6 to 3.13.1

Changes v5 -> v6:
  - Drop removing the cache directories. It's unecessary and causes flutter to
    redownload a bunch of packages to create the same directory structure as
    before. I am not sure why the flutter yocto recipe does this.

Changes v4 -> v5:
  - Add a Config.in.host and set BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
    to only support x86_64 [Yann]

  - Set the HOME variable when calling flutter and dart to prevent .dart,
   .dart-sdk, and .flutter from showing up in ~/. Yes, this is insane, no, there
    is not another option I could find. [Yann]

  - Add more disable config options to cut down on unecessary features.

  - Call the config options in a loop.

 DEVELOPERS                                   |  1 +
 package/Config.in.host                       |  1 +
 package/flutter-sdk-bin/Config.in.host       | 16 ++++
 package/flutter-sdk-bin/flutter-sdk-bin.hash |  3 +
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 95 ++++++++++++++++++++
 5 files changed, 116 insertions(+)
 create mode 100644 package/flutter-sdk-bin/Config.in.host
 create mode 100644 package/flutter-sdk-bin/flutter-sdk-bin.hash
 create mode 100644 package/flutter-sdk-bin/flutter-sdk-bin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 057e740fb8..5235498d5f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -33,6 +33,7 @@ F:	package/vulkan-tools/
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
+F:	package/flutter-sdk-bin/
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/package/Config.in.host b/package/Config.in.host
index 377dbed7d3..387a28cff2 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -36,6 +36,7 @@ menu "Host utilities"
 	source "package/faketime/Config.in.host"
 	source "package/fatcat/Config.in.host"
 	source "package/firmware-utils/Config.in.host"
+	source "package/flutter-sdk-bin/Config.in.host"
 	source "package/fwup/Config.in.host"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
diff --git a/package/flutter-sdk-bin/Config.in.host b/package/flutter-sdk-bin/Config.in.host
new file mode 100644
index 0000000000..a48714ea7f
--- /dev/null
+++ b/package/flutter-sdk-bin/Config.in.host
@@ -0,0 +1,16 @@
+# All host rust packages should depend on this option
+config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	bool
+	default y if BR2_HOSTARCH = "x86_64"
+
+config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
+	bool "host flutter-sdk-bin"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	help
+	  Flutter is Google's SDK for crafting beautiful, fast user
+	  experiences for mobile, web, and desktop from a single
+	  codebase. Flutter works with existing code, is used by
+	  developers and organizations around the world, and is
+	  free and open source.
+
+	  https://flutter.dev/
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
new file mode 100644
index 0000000000..9daf6c58be
--- /dev/null
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  d9bbfbfb6fe3c72a29c1040235126edd0cd461e4e18556335fd1cf217c2e1473  flutter_linux_3.13.4-stable.tar.xz
+sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
new file mode 100644
index 0000000000..b1abf9e318
--- /dev/null
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -0,0 +1,95 @@
+################################################################################
+#
+# host-flutter-sdk-bin
+#
+################################################################################
+
+FLUTTER_SDK_BIN_VERSION = 3.13.4
+FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
+FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
+FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
+FLUTTER_SDK_BIN_LICENSE_FILES = LICENSE
+
+HOST_FLUTTER_SDK_BIN_SDK = $(HOST_DIR)/share/flutter/sdk
+HOST_FLUTTER_SDK_BIN_DART_SDK = $(HOST_FLUTTER_SDK_BIN_SDK)/bin/cache/dart-sdk
+HOST_FLUTTER_SDK_BIN_SDK_ENGINE = $(HOST_FLUTTER_SDK_BIN_SDK)/bin/cache/artifacts/engine
+
+# We must set the home directory to the sdk directory or else flutter will
+# place .dart, .dart-sdk, and .flutter in ~/.
+HOST_FLUTTER_SDK_BIN_ENV = \
+	HOME=$(HOST_FLUTTER_SDK_BIN_SDK) \
+	PATH=$(BR_PATH):$(HOST_FLUTTER_SDK_BIN_SDK):$(HOST_FLUTTER_SDK_BIN_SDK)/bin \
+	PUB_CACHE=$(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
+
+# The following config options must be ran one at a time.
+HOST_FLUTTER_SDK_BIN_CONF_OPTS = \
+	--clear-features \
+	--no-analytics \
+	--disable-telemetry \
+	--enable-custom-devices \
+	--enable-linux-desktop \
+	--no-enable-android \
+	--no-enable-fuchsia \
+	--no-enable-ios \
+	--no-enable-macos-desktop \
+	--no-enable-windows-desktop
+
+define HOST_FLUTTER_SDK_BIN_CONFIGURE_CMDS
+	$(foreach i,$(HOST_FLUTTER_SDK_BIN_CONF_OPTS),
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter config $(i); \
+	)
+	$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/dart --disable-analytics
+endef
+
+# Remove the cache, as we will run precache after setting up flutter and dart
+# with the new config options.
+define HOST_FLUTTER_SDK_BIN_BUILD_CMDS
+	mkdir -p $(HOST_FLUTTER_SDK_BIN_SDK)
+	rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
+	cd $(@D) && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter precache;
+endef
+
+define HOST_FLUTTER_SDK_BIN_INSTALL_CMDS
+	cp -rpdT $(@D)/. $(HOST_FLUTTER_SDK_BIN_SDK)/
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
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
