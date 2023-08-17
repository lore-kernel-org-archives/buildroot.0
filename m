Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464A5C5479A
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 20:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F27B7830A7;
	Thu, 17 Aug 2023 20:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F27B7830A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3dNW6fYoom58; Thu, 17 Aug 2023 20:59:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EFD183ED3;
	Thu, 17 Aug 2023 20:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EFD183ED3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A34D61BF215
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 20:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DCB240003
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 20:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DCB240003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3yj6Yi_B9wR9 for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 20:59:02 +0000 (UTC)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48F414015F
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 20:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48F414015F
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-26b139f4e42so165104a91.1
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 13:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692305941; x=1692910741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wUdi7naGBEnbu7LKhAPqBDR9nE27blsFl+64gr3aEl4=;
 b=G2p/62PfHjRF3Ncc6k6mIuxSTtIhexK1LtqmqBRJsLvffMP16XHpQCzKN+31JoVRJ1
 3IVt1TL7+jReh2CMaJCGNoqZaxgjurtNjlP7RQc9p2nj3jmmCQe7XrW3OMQjjmiJU/fa
 4/P8ctUfDb/mUHxbqwnHrjpW+xhOPfH0XMQDolZod1jRZJ7hQf3TryMN0HiopxL5rMPv
 CJe9xkwSeQcKKFNGJZgfBa2WOSKNJOK7v6SbqbjRxqmtYTAb8zkiqroP6FFhbxEg/JYL
 Pv7tXgsPAQn05yRsi9uCIkzi8Zia9BhMGtsf7w7GQM7GQ48CRPsHw+cvQWNNON5e1zsZ
 tqQw==
X-Gm-Message-State: AOJu0YwzcVkfzutSPyuPvZABl4HZogNDlyIrumNk8Srg4hsDvESQ1LtH
 ztI1D3oTGsYM8prb3dUPfTlS8mt3SsVgPMs/YGs=
X-Google-Smtp-Source: AGHT+IGp8vhxO3fzzYDGTmZ17SN/8lPSPxw5Sot/tXJ00atRLyXtDTx6/SggxCyKmjRzFsS8FyaIcA==
X-Received: by 2002:a17:90b:104b:b0:26d:2b42:cdae with SMTP id
 gq11-20020a17090b104b00b0026d2b42cdaemr607716pjb.3.1692305941193; 
 Thu, 17 Aug 2023 13:59:01 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([75.174.130.12])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a17090a3f1600b0026d034f6badsm243143pjc.38.2023.08.17.13.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 13:59:00 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 17 Aug 2023 14:58:51 -0600
Message-ID: <20230817205855.1556239-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817205855.1556239-1-adam.duskett@amarulasolutions.com>
References: <20230817205855.1556239-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692305941; x=1692910741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wUdi7naGBEnbu7LKhAPqBDR9nE27blsFl+64gr3aEl4=;
 b=VSWR/8uVrvcokcqWyURKJCV8NMv+B8L0hX4Bs/JiXc+66EtXDzJmt2WuKFqrBtnobu
 8y9VcYdFZSmUVBkYCGAIQEHfY9WLTcbTwvQtW5DbHJG/EJlJ+xpoG3yRLL9YawieZPMc
 2EVoPWMRJbo32YR/h5GL0/pG6ld14R5mMqV2I=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=VSWR/8uV
Subject: [Buildroot] [PATCH v4] package/flutter-sdk-bin: new package
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                   |  1 +
 package/flutter-sdk-bin/flutter-sdk-bin.hash |  3 +
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 87 ++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 package/flutter-sdk-bin/flutter-sdk-bin.hash
 create mode 100644 package/flutter-sdk-bin/flutter-sdk-bin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fde00567fd..25eb374fae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -28,6 +28,7 @@
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
+F:	package/flutter-sdk-bin/
 
 N:	Adam Duskett <aduskett@gmail.com>
 F:	package/firewalld/
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
