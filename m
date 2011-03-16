From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 16 Mar 2011 17:10:27 +0100
Subject: [Buildroot] [PATCH 1/2] Barebox add version selection support
Message-ID: <1300291828-7952-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 boot/barebox/Config.in  |   43 +++++++++++++++++++++++++++++++++++++++++++
 boot/barebox/barebox.mk |   18 ++++++++++++++++--
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index a821c45..eb7c2f9 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,6 +12,49 @@ config BR2_TARGET_BAREBOX_BOARD_DEFCONFIG
 	  Name of the board for which Barebox should be built, without
 	  the _defconfig suffix.
 
+choice
+	prompt "Barebox Version"
+	default BR2_TARGET_BAREBOX_2011.01
+	help
+	  Select the specific Barebox version you want to use
+
+config BR2_TARGET_BAREBOX_2011_01
+	bool "2011.01.0"
+
+config BR2_TARGET_BAREBOX_2011_02
+	bool "2011.02.0"
+
+config BR2_TARGET_BAREBOX_2011_03
+	bool "2011.03.0"
+
+config BR2_TARGET_BAREBOX_CUSTOM
+	bool "Custom"
+
+endchoice
+
+if BR2_TARGET_BAREBOX_CUSTOM
+
+config BR2_TARGET_BAREBOX_CUSTOM_LOCATION
+	string "URL of custom Barbox tarball"
+
+endif
+
+config BR2_TARGET_BAREBOX_VERSION
+	string
+	default "2011.01.0"	if BR2_TARGET_BAREBOX_2011_01
+	default "2011.02.0"	if BR2_TARGET_BAREBOX_2011_02
+	default "2011.03.0"	if BR2_TARGET_BAREBOX_2011_03
+	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM
+
+config BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR
+	string "custom patch dir"
+	help
+	  If your board requires custom patches, add the path to the
+	  directory containing the patches here. The patches must be
+	  named barebox-<version>-<something>.patch.
+
+	  Most users may leave this empty
+
 config BR2_TARGET_BAREBOX_BAREBOXENV
 	bool "bareboxenv tool in target"
 	help
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 09deb5c..116cc72 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,11 +4,25 @@
 #
 #############################################################
 
-BAREBOX_VERSION:=2011.01.0
+BAREBOX_VERSION:=$(call qstrip,$(BR2_TARGET_BAREBOX_VERSION))
+
+ifeq ($(BAREBOX_VERSION),custom)
+# Handle custom Barebox tarballs as specified by the configuration
+BAREBOX_TARBALL=$(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_LOCATION))
+BAREBOX_SITE:=$(dir $(BAREBOX_TARBALL))
+BAREBOX_SOURCE:=$(notdir $(BAREBOX_TARBALL))
+else
+# Handle stable official Barebox versions
 BAREBOX_SOURCE:=barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE:=http://www.barebox.org/download/
-BAREBOX_DIR:=$(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
+endif
 BAREBOX_CAT:=$(BZCAT)
+
+ifneq ($(BAREBOX_VERSION),)
+BAREBOX_DIR:=$(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
+else
+BAREBOX_DIR:=$(BUILD_DIR)/barebox
+endif
 BAREBOX_BOARD_DEFCONFIG:=$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))
 
 ifeq ($(KERNEL_ARCH),i386)
-- 
1.7.4.1
