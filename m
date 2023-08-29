Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31E5C83F12
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 21:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC4E460ECD;
	Tue, 29 Aug 2023 21:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC4E460ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id up-eT70lxSPT; Tue, 29 Aug 2023 21:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 815C160FAD;
	Tue, 29 Aug 2023 21:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 815C160FAD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A0C81BF5A8
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F121060F2E
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F121060F2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHzezoKVHmxR for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 21:37:35 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9E9060F65
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 21:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9E9060F65
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c0c6d4d650so38685685ad.0
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 14:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693345053; x=1693949853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SwkA163uyLCgVtYF1oawqVfPaLzNnsFLdGggfs28i2M=;
 b=cv6vQ7yFZ0fB667qnoW8cJB5cYdxEysaBpgEqkkrx+Qyd9AwxJbHt7P7nOahQC4T0x
 pJUkxgKRXKCv2iUyKaOA1nw7XsgXwRt1pzG4T2tcrl2F36Z8UgXr2Eo3IAmq1428QX0+
 w43628ftiaOJVJDO2CeeksdiPLAver0J0v37+OaA1oj5/73FRzICYahQPv/zLV+vhP1b
 GTOu8KG2Orl3RjnC7f4vpOQ7vgm6fVyQJk8t7dZuItIBZLvV9MkuDHEU1Xsizcg1JJrO
 /ksFL+kJnWWc3p2gCDeC+Oi7T/HHV87bFtlebApM45i0LZdINfrgahhoLdyr3LYSfrHP
 S7vw==
X-Gm-Message-State: AOJu0YzCa0vit+YgXy/A9FrlEttJ728V5HyZ5dn2bCesvmi77N/isJEd
 8qvsUPZViR66sVwxmaoTnLf7Ey0TM0W5CVXaCls=
X-Google-Smtp-Source: AGHT+IEQHMA2HKwuPl8EZ5nJn6OBGMNqjlcyIn+nGbrpWIxSzGjYqpblp6ysOLnu/Nrj9ZeJffQO+A==
X-Received: by 2002:a17:902:e546:b0:1bc:7001:6e5e with SMTP id
 n6-20020a170902e54600b001bc70016e5emr392943plf.32.1693345053573; 
 Tue, 29 Aug 2023 14:37:33 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170902a70500b001ae0152d280sm9691516plq.193.2023.08.29.14.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 14:37:33 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 15:37:22 -0600
Message-ID: <20230829213726.1957587-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829213726.1957587-1-adam.duskett@amarulasolutions.com>
References: <20230829213726.1957587-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693345053; x=1693949853;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SwkA163uyLCgVtYF1oawqVfPaLzNnsFLdGggfs28i2M=;
 b=UeGz9xV//DgF67dLIWXw+hoXvjaGaH9yu0qINZBct4NKHGKu7g7bXNwKdua2B+0aQW
 eJXj8KM/KaOOn3jYfKn1TJb8cV3oOht/fKHrYQAqYzwNwa0BTYVcxRBGoS72HymN/SxW
 qnejYIcUlmWFL0rKnnR28tJviY2lTYmcDcWNI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UeGz9xV/
Subject: [Buildroot] [PATCH v7 3/7] package/flutter-sdk-bin: new package
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
index 0000000000..9ae6d78137
--- /dev/null
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  ca528b56edfd18180098ababee5fae58265f9033d34faa989813567c39100f2f  flutter_linux_3.13.1-stable.tar.xz
+sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
new file mode 100644
index 0000000000..e701dbdc4a
--- /dev/null
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -0,0 +1,95 @@
+################################################################################
+#
+# host-flutter-sdk-bin
+#
+################################################################################
+
+FLUTTER_SDK_BIN_VERSION = 3.13.1
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
