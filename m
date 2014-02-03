From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  3 Feb 2014 01:05:55 +0100
Subject: [Buildroot] [PATCH v2] uboot-tools: Allow users to use uboot's
	sources
Message-ID: <1391385955-13166-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the user has specified a custom U-Boot repository, he may also want
to use it for U-Boot tools.

This could be usefull in two identified use case:
  - User want the same version for U-Boot tools and U-Boot
  - User has modified U-Boot tools in his U-Boot repository

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
Changes v1 -> v2:
    - Add a choice option (Suggested by Luca Ceresoli)
    - Add an if/then/else structure (Suggested by Luca Ceresoli)
    - Take UBOOT_LICENSE and UBOOT_LICENCE_FILES into account (Suggested
      by Arnout Vandecappelle)
---
 package/uboot-tools/Config.in      | 18 ++++++++++++++++++
 package/uboot-tools/uboot-tools.mk | 17 +++++++++++++++--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index 7c8f17c..29580dd 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -7,6 +7,24 @@ config BR2_PACKAGE_UBOOT_TOOLS
 
 if BR2_PACKAGE_UBOOT_TOOLS
 
+if BR2_TARGET_UBOOT
+
+choice
+	prompt "version"
+	default BR2_PACKAGE_UBOOT_TOOLS_LATEST_VERSION
+	help
+	  Select the specific uboot-tools version you want to use
+
+config BR2_PACKAGE_UBOOT_TOOLS_LATEST_VERSION
+	bool "Use latest upstream version"
+
+config BR2_PACKAGE_UBOOT_TOOLS_USE_UBOOT_VERSION
+	bool "Use the same version as the uboot package"
+
+endchoice
+
+endif
+
 config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
 	bool "mkimage"
 	help
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 398ce8b..71c64ee 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,11 +4,24 @@
 #
 ################################################################################
 
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_USE_UBOOT_VERSION),y)
+# We have to use the BR2_TARGET_UBOOT_VERSION because of the order of inclusion
+# of the mk files.
+UBOOT_TOOLS_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
+UBOOT_TOOLS_SOURCE = $(UBOOT_SOURCE)
+UBOOT_TOOLS_SITE = $(UBOOT_SITE)
+ifneq ($(UBOOT_SITE_METHOD),)
+UBOOT_TOOL_SITE_METHOD = $(UBOOT_SITE_METHOD)
+endif
+UBOOT_TOOLS_LICENSE = $(UBOOT_LICENSE)
+UBOOT_TOOLS_LICENSE_FILES = $(UBOOT_LICENSE_FILES)
+else
 UBOOT_TOOLS_VERSION = 2014.01
-UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
-UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
+UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
+UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
 UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
+endif
 
 define UBOOT_TOOLS_BUILD_CMDS
 	$(MAKE) -C $(@D) 			\
-- 
1.8.5.3
