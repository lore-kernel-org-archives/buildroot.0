Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8737C54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 22:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42CEC81BD9;
	Sun, 24 Mar 2024 22:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhjS4sfjC0Z9; Sun, 24 Mar 2024 22:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC3C781A24
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC3C781A24;
	Sun, 24 Mar 2024 22:51:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3BD31BF4E4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDA7A81A24
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2T0env72OBK for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 22:51:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC45681A15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC45681A15
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC45681A15
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 22:51:06 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6e8f51d0bf0so2910024b3a.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711320665; x=1711925465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NXBjZ1Y0pjRZdq3iPbClU4tUqZD/Ll14P1jWbQLug5c=;
 b=s1x52AiUJ6r7e1k9nVv+2Psoor6Fghhk+lHhVS//JKCwyhFOO8u2CKqe3zMMHFZVuI
 XM9gpjAuIECGdVITju7UuY8YsC6AEFZO+Nc6dgD7D7WXs/gfmMDpkkKbDLRWyjN2pUyw
 YqLrc7HKQyFLYzdLSiv508aJHlyYo/wuLqdnoxNnXw8Je/f6+mDyYJqQukQZ7o+bvn2e
 LNlin7lKfY84hlpvziI5JhT1AW87EMzy/gQRx0/gYqyCxKSSw6SYB5c4lOAKd1ehmM5n
 JSNafpwaaASyl63dhYMIcf0Zf5Qj/sb27EHad2HV6XpWAc/GZtDiPL0TGOr/RH20l8Jm
 wCJw==
X-Gm-Message-State: AOJu0YxNMJEEOi4GkrX+k7wHjFaMc31/a5eQ88ls9HunQJfA5T9Q2ttD
 g89eLD78GyAyX7SDYlPIM5JRpOzC/CVDHN1Sut8fpSJZqIQbvevXSQHLecavddFVcjmRM8VVMtH
 b
X-Google-Smtp-Source: AGHT+IFw9NquXUu+JBSMarP2X65x7TTlR0e7Q65wg4I8uOlq4zObDrWFi57UhrQZY8pBKMtNUJihsg==
X-Received: by 2002:aa7:88c6:0:b0:6ea:90dd:fc3a with SMTP id
 k6-20020aa788c6000000b006ea90ddfc3amr6017390pff.25.1711320665173; 
 Sun, 24 Mar 2024 15:51:05 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a33-20020a056a0011e100b006e580678dfbsm214031pfu.193.2024.03.24.15.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 15:51:04 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:50:40 -0600
Message-ID: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711320665; x=1711925465;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NXBjZ1Y0pjRZdq3iPbClU4tUqZD/Ll14P1jWbQLug5c=;
 b=dAHdKqBM0tir5CPRuijCYO9862EM6/9L8A/+nEcULznHX4jRk7RvpZwChkoP8P8CaY
 t5ppMGJbL9dP+h5Wj6Q9vwVpvb2tjc/M0uvpzHchmA7iRMkQaFFhhmJv62cvqJZMSOBc
 MbkEKSVSkmHVJPE4u8zeq5UBgpEwVp7FmdfAU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=dAHdKqBM
Subject: [Buildroot] [PATCH 01/13]
 package/flutter-packages/flutter-markdown-example: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The maintainers of the flutter-gallery package archived the project as of
February 16, 2024, necessitating a new reference package for users to port
their Flutter applications to Buildroot. The flutter-packages repository is
the perfect candidate for a reference package for several reasons:
  - It contains the source code for Flutter's first-party packages.
  - Many of the packages contain examples.
  - Many of the examples include Linux-specific examples.
  - The repository is updated regularly and often automatically, ensuring
    compatibility with the latest versions of Flutter.

However, the layout of the flutter-packages repository stores all of the
examples in sub-directories, which creates an organizational problem; either
every example application is stored in packages/flutter-example-${name}, with
the version, site, site_method, license, license_files, and dependencies of
each package independent from each other, or, each example application is in a
sub-directory of the flutter-packages directory, and flutter-packages acts as
the primary source of the above variables.

As option one is a nightmare to maintain, this patch provides option two,
which only necessitates the use of two features rarely used together in
Buildroot: $(PKG_NAME)_DL_SUBDIR and $(PKG_NAME)_SOURCE. With these two options
appropriately set, each sub-package uses the flutter-packages source tarball,
which downloads once, saving time, disk space, bandwidth, and future
maintenance headaches.

Three variables in the .mk file help with subsequent patches that add more
example applications:
  - FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME:
    - Set to the name of the application.

  - FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR:
    - It uses the PKG_NAME variable to set the installation directory.

  - FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR:
    - Provides the directory in which to build the package.

With the above variables, adding subsequent packages involves minimal effort:
  - Copy, paste, and rename a sub-directory to a new package name.
  - Set the above variables to new names and directories.
  - Check to see if there are any new build commands, such as specifying a
    dart_plugin_registrant.dart file.

The first package in this series is a Markdown example application that
displays several Markdown formatting demos. However, it does not support inline
HTML. This package also lacks a dart_plugin_registrant file, and unlike the
flutter-gallery package, the lines referencing such a file are not included in
the build commands.

Note: The version of the flutter-packages git hash is set to
947e34ce9fedcdd6750b54eb1cc74b854b49ab48, the last commit that supported
Flutter 3.16.x. Newer versions require Flutter 3.19.x

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                    |  2 +
 package/Config.in                             |  1 +
 package/flutter-packages/Config.in            | 15 ++++++
 .../flutter-markdown-example/Config.in        |  7 +++
 .../flutter-markdown-example.hash             |  1 +
 .../flutter-markdown-example.mk               | 54 +++++++++++++++++++
 .../flutter-packages/flutter-packages.hash    |  3 ++
 package/flutter-packages/flutter-packages.mk  | 18 +++++++
 8 files changed, 101 insertions(+)
 create mode 100644 package/flutter-packages/Config.in
 create mode 100644 package/flutter-packages/flutter-markdown-example/Config.in
 create mode 120000 package/flutter-packages/flutter-markdown-example/flutter-markdown-example.hash
 create mode 100644 package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
 create mode 100644 package/flutter-packages/flutter-packages.hash
 create mode 100644 package/flutter-packages/flutter-packages.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cb2132e67a..8b487b04f3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -33,6 +33,8 @@ F:	package/fcft/
 F:	package/foot/
 F:	package/flutter-engine/
 F:	package/flutter-gallery/
+F:	package/flutter-packages/
+F:	package/flutter-packages/flutter-markdown-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/ivi-homescreen/
diff --git a/package/Config.in b/package/Config.in
index 1a62bfb1be..dfdc716857 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -316,6 +316,7 @@ comment "Graphic applications"
 	source "package/cog/Config.in"
 	source "package/dmenu-wayland/Config.in"
 	source "package/flutter-gallery/Config.in"
+	source "package/flutter-packages/Config.in"
 	source "package/flutter-pi/Config.in"
 	source "package/foot/Config.in"
 	source "package/fswebcam/Config.in"
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
new file mode 100644
index 0000000000..7cedf7c473
--- /dev/null
+++ b/package/flutter-packages/Config.in
@@ -0,0 +1,15 @@
+menuconfig BR2_PACKAGE_FLUTTER_PACKAGES
+	bool "flutter packages"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE
+	select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
+	help
+	  First-party Flutter package examples.
+
+if BR2_PACKAGE_FLUTTER_PACKAGES
+source "package/flutter-packages/flutter-markdown-example/Config.in"
+endif
+
+comment "flutter packages need flutter-engine"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_FLUTTER_ENGINE
diff --git a/package/flutter-packages/flutter-markdown-example/Config.in b/package/flutter-packages/flutter-markdown-example/Config.in
new file mode 100644
index 0000000000..939b21053c
--- /dev/null
+++ b/package/flutter-packages/flutter-markdown-example/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FLUTTER_MARKDOWN_EXAMPLE
+	bool "flutter markdown example"
+	help
+	  A markdown renderer for Flutter. It supports the original
+	  format, but no inline HTML.
+
+	  https://github.com/flutter/packages/tree/main/packages/flutter_markdown
diff --git a/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.hash b/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.hash
new file mode 120000
index 0000000000..879f2adb39
--- /dev/null
+++ b/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.hash
@@ -0,0 +1 @@
+../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk b/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
new file mode 100644
index 0000000000..d6ae87d8ef
--- /dev/null
+++ b/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# flutter-markdown-example
+#
+################################################################################
+
+FLUTTER_MARKDOWN_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
+FLUTTER_MARKDOWN_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
+FLUTTER_MARKDOWN_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
+FLUTTER_MARKDOWN_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
+FLUTTER_MARKDOWN_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
+FLUTTER_MARKDOWN_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
+FLUTTER_MARKDOWN_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
+FLUTTER_MARKDOWN_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
+FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME = flutter_markdown_example
+FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/$(FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
+FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR = $(@D)/packages/flutter_markdown/example
+
+define FLUTTER_MARKDOWN_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_MARKDOWN_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR)/.dart_tool/flutter_build/*/native_assets.yaml \
+			package:$(FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME)/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
+			--deterministic \
+			--obfuscate \
+			--snapshot_kind=app-aot-elf \
+			--elf=libapp.so \
+			.dart_tool/flutter_build/*/app.dill
+endef
+
+define FLUTTER_MARKDOWN_EXAMPLE_INSTALL_TARGET_CMDS
+	mkdir -p $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/{data,lib}
+	cp -dprf $(FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR)/build/flutter_assets $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_MARKDOWN_EXAMPLE_BUILD_DIR)/libapp.so \
+		$(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/lib/libapp.so
+
+	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	$(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/data/
+
+	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/lib/
+	$(RM) $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+	touch $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+endef
+
+$(eval $(generic-package))
diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
new file mode 100644
index 0000000000..994434e25c
--- /dev/null
+++ b/package/flutter-packages/flutter-packages.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  8276276e050c1ea45787f74b0f8c915b8cf2162b6af8537ffa9886bd423f2828  flutter-packages-947e34ce9fedcdd6750b54eb1cc74b854b49ab48-br1.tar.gz
+sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
new file mode 100644
index 0000000000..426d49290b
--- /dev/null
+++ b/package/flutter-packages/flutter-packages.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# flutter-packages
+#
+################################################################################
+
+FLUTTER_PACKAGES_VERSION = 947e34ce9fedcdd6750b54eb1cc74b854b49ab48
+FLUTTER_PACKAGES_SITE = https://github.com/flutter/packages.git
+FLUTTER_PACKAGES_SITE_METHOD = git
+FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
+FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
+FLUTTER_PACKAGES_DL_SUBDIR = flutter-packages
+FLUTTER_PACKAGES_SOURCE = flutter-packages-$(FLUTTER_PACKAGES_VERSION)-br1.tar.gz
+FLUTTER_PACKAGES_DEPENDENCIES = \
+	host-flutter-sdk-bin \
+	flutter-engine
+
+include $(sort $(wildcard package/flutter-packages/*/*.mk))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
