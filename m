Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9441DC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 23:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5959D60A47;
	Mon, 25 Mar 2024 23:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdTvM-1LLboB; Mon, 25 Mar 2024 23:45:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A33B860A5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A33B860A5B;
	Mon, 25 Mar 2024 23:45:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A5731BF417
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 872EF40722
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mgUCWA8cR4K for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE0C0406F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE0C0406F1
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 916D884117; Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 23:38:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84caea5d58b979490260e733841f2dde591b75cc
X-Git-Newrev: 631647f4a7c580e8964515f275584a628eca61bd
X-Patchwork-Hint: ignore
Message-Id: <20240325234447.916D884117@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=631647f4a7c580e8964515f275584a628eca61bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

  - FLUTTER_MARKDOWN_EXAMPLE_SUBDIR:
    - Provides the directory in which to build the package.

With the above variables, adding subsequent packages involves minimal effort:
  - Copy, paste, and rename a sub-directory to a new package name.
  - Set the above variables to new names and directories.
  - Check to see if there are any new build commands, such as specifying a
    dart_plugin_registrant.dart file.

Another option that seems appealing is to have a single package, with the
Config.in options to select which example(s) to build. However, this option
does not work well for two reasons:

  - The logic between this package and the flutter-gallery package it replaces
    would be very different. As the flutter-gallery package acts as a reference
    package for other users, changing the logic would make the package difficult
    to parse and possibly useless for other users to use as a reference when
    porting their Flutter-based applications to Buildroot.

  - Not all packages in the flutter-package repository use the same directory
    structure. Take, for example, the flutter-rfw-local-example. The build
    directory is located at rfw/example/local, whereas most other packages are
    at ${pkg_name}/example, which makes a pure-foreach loop impossible.

These packages are intended for reference, and changing the logic instead of
using the same would hinder users from attempting to port their Flutter
applications to Buildroot. As such, this option is ruled out for the above
reasons.

The first package in this series is a Markdown example application that
displays several Markdown formatting demos. However, it does not support inline
HTML. This package also lacks a dart_plugin_registrant file, and unlike the
flutter-gallery package, the lines referencing such a file are not included in
the build commands. This is not a problem, but is something to note.

Also, the `FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE)` line from the
configure commands is not copied from the flutter-gallery package, as it was
included by mistake and did not have any effecton the clean command.

Note: The version of the flutter-packages git hash is set to
947e34ce9fedcdd6750b54eb1cc74b854b49ab48, the last commit that supported
Flutter 3.16.x. Newer versions require Flutter 3.19.x

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                         |  2 +
 package/Config.in                                  |  1 +
 package/flutter-packages/Config.in                 | 15 ++++++
 .../flutter-markdown-example/Config.in             |  7 +++
 .../flutter-markdown-example.hash                  |  1 +
 .../flutter-markdown-example.mk                    | 54 ++++++++++++++++++++++
 package/flutter-packages/flutter-packages.hash     |  3 ++
 package/flutter-packages/flutter-packages.mk       | 17 +++++++
 8 files changed, 100 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 99b0b1ec8f..cf2d9e93cd 100644
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
index 0000000000..eb6792fb02
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
+FLUTTER_MARKDOWN_EXAMPLE_SUBDIR = packages/flutter_markdown/example
+
+define FLUTTER_MARKDOWN_EXAMPLE_CONFIGURE_CMDS
+	cd $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
+		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
+endef
+
+define FLUTTER_MARKDOWN_EXAMPLE_BUILD_CMDS
+	cd $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR) && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			--native-assets $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.yaml \
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
+	cp -dprf $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/data/
+
+	$(INSTALL) -D -m 0755 $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR)/libapp.so \
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
index 0000000000..4beaa39325
--- /dev/null
+++ b/package/flutter-packages/flutter-packages.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# flutter-packages
+#
+################################################################################
+
+FLUTTER_PACKAGES_VERSION = 947e34ce9fedcdd6750b54eb1cc74b854b49ab48
+FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
+FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
+FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
+FLUTTER_PACKAGES_DL_SUBDIR = flutter-packages
+FLUTTER_PACKAGES_SOURCE = flutter-packages-$(FLUTTER_PACKAGES_VERSION)-br1.tar.gz
+FLUTTER_PACKAGES_DEPENDENCIES = \
+	host-flutter-sdk-bin \
+	flutter-engine
+
+include $(sort $(wildcard package/flutter-packages/*/*.mk))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
