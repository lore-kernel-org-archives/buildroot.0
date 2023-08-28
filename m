Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530B6C83F11
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 17:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D017940AB7;
	Mon, 28 Aug 2023 17:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D017940AB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8WhLi70IP7kf; Mon, 28 Aug 2023 17:59:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B35AF40AE2;
	Mon, 28 Aug 2023 17:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B35AF40AE2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 283871BF271
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 17:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F8B8405BC
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 17:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F8B8405BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kre6NptsVwjy for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 17:59:23 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C7EC404FC
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 17:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C7EC404FC
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68a41031768so2437324b3a.3
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 10:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693245562; x=1693850362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YzQehUpUeHVih5lZhJN2nqdc48FVjMkY5NokYcnDzSY=;
 b=j8L9RDXegU01BknscYyeE+Bk60JbipC54+LfJd8SE/M/k1CveQcurCyxkqHfu5fQET
 yit7fCTMJ4+l2carp2A0R3CZ+vTBGUZ+sHdFZzljd6Z5+4caRr3ehfOAVCEMi6WKZdu+
 Rg5JrGj1BHzZv4RPgzqL7NYop+dIlJN7iPAnzEHblCKJ7MyZmlmW8m8AkFPqwnUh71gz
 WIBGCO1hn7HPOMaTQFWamryKWVpSizO/1+y37NXK4VQoznjDP9e7Lp18IVAGoLEHpKcE
 AtrZLXgQd3ok4Yn9FXWN1AO3UmXDJTVnc0M/jWAwvmGdVUyfv1DjnMBv2Y+2Q6ubI4qD
 ZB0w==
X-Gm-Message-State: AOJu0Yxi8sAqWRIFkNxfWGV3m73cmm7Axsf0hK3jH5FqR45qxJaAYiVM
 h8KnQtQlEe/XVwcZdEJEgxmvw4goFo/eAHcxAC8=
X-Google-Smtp-Source: AGHT+IFc3i9J1P9ojwODUKZKHdUZTakVJHfdwHJunM5Uwhuny/quCSR2gvqeA0r1N3/qkMlVIjo8DA==
X-Received: by 2002:a05:6a00:6008:b0:68c:431e:648a with SMTP id
 fo8-20020a056a00600800b0068c431e648amr3284755pfb.29.1693245562067; 
 Mon, 28 Aug 2023 10:59:22 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a63505a000000b00570132a022csm1823143pgl.79.2023.08.28.10.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 10:59:21 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 28 Aug 2023 11:58:54 -0600
Message-ID: <20230828175858.309974-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828175858.309974-1-adam.duskett@amarulasolutions.com>
References: <20230828175858.309974-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693245562; x=1693850362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YzQehUpUeHVih5lZhJN2nqdc48FVjMkY5NokYcnDzSY=;
 b=anQm26DXK+ItRacb7TDkwI9QirpXI9Mdpc9cAeUEaGakKbm5ejbICuhXmjyLpUhFO8
 ht7TDm4kusZAvpqtUbEEw+cs6RLmY81VHKmijbEileWzaKMPGSJ8mCGQramr0ExULrRA
 SjfquFoqKVBT7zO0eW7qP4wacGGJzmXjyIxD4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=anQm26DX
Subject: [Buildroot] [PATCH v6 3/7] package/flutter-sdk-bin: new package
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
index 0373d5243e..7bd77544e2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -28,6 +28,7 @@
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
+F:	package/flutter-sdk-bin/
 
 N:	Adam Duskett <aduskett@gmail.com>
 F:	package/firewalld/
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
index 0000000000..13e588cd83
--- /dev/null
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7048e51a89c99a5b6cac6d8ae416121264effa76da34dba5c0e7cf85519c8e98  flutter_linux_3.10.6-stable.tar.xz
+sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
new file mode 100644
index 0000000000..a6a7899444
--- /dev/null
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -0,0 +1,95 @@
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
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
