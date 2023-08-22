Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38ACDEE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2DB460BF7;
	Tue, 22 Aug 2023 19:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2DB460BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-z2rkVYXc0O; Tue, 22 Aug 2023 19:48:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A2B46120D;
	Tue, 22 Aug 2023 19:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A2B46120D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF76C1BF35E
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5D6460AAE
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5D6460AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOM0urKqqUDl for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:48:10 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99BDC60A70
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99BDC60A70
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68a520dba33so1953045b3a.0
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 12:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692733689; x=1693338489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xy42/ML6otHyi6EBLPshklNv7yVvTVxrcmPY2+PML2Y=;
 b=EdJYT7xE7qeR5I+7L/eTYy+lfcK2Ge9aZcIkGbGgfLfThtHr0/Ak0hYehtP5oxz9Mi
 ZSFKwiUuB55YsHfR2YZCzD9H0d1sMvd5WxavMKDmrhCKNgKdE4Jn6cVRdKaA8HWvHJP7
 VWHKbkMzcdfIHWtH0/0Ts2S5pq6a0++iW64GamNyW7pJoVrPpNowiD6TI448lcXC84Ji
 /gX8mxjh3L/erUszjRwl2wx/K+hvt4o36F3CQUNHHdP5iTHvi50yQ9tGu88FYLo/CKBz
 mRte/zYsgNB9KROko1+CePe4TABPRfX18ij1lyi8nRbY1gLNAc9AhazyDwpbpDaojjN7
 rC1g==
X-Gm-Message-State: AOJu0YwTyLvQfN6AkNa7PUuwQhmD4xsyb/pCO9BfQ2270B3HhTfzULWc
 24vxH2BVh95Tl7Dh1SCX+h45pIjn/4xMV8n7KCU=
X-Google-Smtp-Source: AGHT+IHVAr3WoufZ5OEW03L83T+vI/+gO0WyatgFBJHZ1GDbp9w3bggzVxfl2pb3D1WM23DogJAqcA==
X-Received: by 2002:a05:6a00:14d4:b0:68a:cc7:12 with SMTP id
 w20-20020a056a0014d400b0068a0cc70012mr12531835pfu.3.1692733689577; 
 Tue, 22 Aug 2023 12:48:09 -0700 (PDT)
Received: from localhost.localdomain ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b0067aea93af40sm8128584pfa.2.2023.08.22.12.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 12:48:09 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 13:47:53 -0600
Message-ID: <20230822194757.1004572-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822194757.1004572-1-adam.duskett@amarulasolutions.com>
References: <20230822194757.1004572-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692733689; x=1693338489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xy42/ML6otHyi6EBLPshklNv7yVvTVxrcmPY2+PML2Y=;
 b=fybB2zW6PtMHf/3FiJmoz6nuPdHSmpj4qoRPHRFQBhTvZPLziqorXwb0a+YUed9GQP
 30XeZwt1heGLV18iq3R0YuHA29cugGIGO4XkXB1SKr9lEEXL+N6eFujyqdb+mt1SEXW4
 KfO1txh1EVr5inxCXsANa+nv9uN2TiKxzIVUA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fybB2zW6
Subject: [Buildroot] [PATCH v5 3/7] package/flutter-sdk-bin: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
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
Changes v4 -> v5:
  - Add a Config.in.host and set BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
    to only support x86_64 [Yann]

  - Set the HOME variable when calling flutter and dart to prevent .dart,
   .dart-sdk, and .flutter from showing up in ~/. Yes, this is insane, no, there
    is not another option I could find. [Yann]

  - Add more disable config options to cut down on unecessary features.

  - Call the config options in a loop.

 DEVELOPERS                                   |   1 +
 package/Config.in.host                       |   1 +
 package/flutter-sdk-bin/Config.in.host       |  16 +++
 package/flutter-sdk-bin/flutter-sdk-bin.hash |   3 +
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 100 +++++++++++++++++++
 5 files changed, 121 insertions(+)
 create mode 100644 package/flutter-sdk-bin/Config.in.host
 create mode 100644 package/flutter-sdk-bin/flutter-sdk-bin.hash
 create mode 100644 package/flutter-sdk-bin/flutter-sdk-bin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0a71ccf8ce..46ef769462 100644
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
index 0000000000..6ec2aad774
--- /dev/null
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -0,0 +1,100 @@
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
