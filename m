From: Francois Gervais <fgervais@distech-controls.com>
Date: Thu, 16 Jul 2020 09:57:38 -0400
Subject: [Buildroot] [PATCH 2/2] package/qoriq-rcw: move rcw into nxp and
 rename it
In-Reply-To: <20200716135738.19050-1-fgervais@distech-controls.com>
References: <20200716135738.19050-1-fgervais@distech-controls.com>
Message-ID: <20200716135738.19050-3-fgervais@distech-controls.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Changming Huang <jerry.huang@nxp.com>

Move package/rcw into package/nxp,
and rename it to qoriq-rcw.

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
---
 Config.in.legacy                              | 16 +++++++
 DEVELOPERS                                    |  2 +-
 package/Config.in.host                        |  2 +-
 package/{rcw => nxp/qoriq-rcw}/Config.in.host |  6 +--
 .../rcw.hash => nxp/qoriq-rcw/qoriq-rcw.hash} |  2 +-
 .../rcw.mk => nxp/qoriq-rcw/qoriq-rcw.mk}     | 46 +++++++++----------
 6 files changed, 45 insertions(+), 29 deletions(-)
 rename package/{rcw => nxp/qoriq-rcw}/Config.in.host (88%)
 rename package/{rcw/rcw.hash => nxp/qoriq-rcw/qoriq-rcw.hash} (50%)
 rename package/{rcw/rcw.mk => nxp/qoriq-rcw/qoriq-rcw.mk} (51%)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7a5435188b..24b16a7985 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -160,6 +160,22 @@ config BR2_PACKAGE_KODI_PERIPHERAL_STEAMCONTROLLER
 	help
 	  This package is broken.
 
+config BR2_PACKAGE_HOST_RCW
+        bool "rcw package was removed"
+        select BR2_LEGACY
+        help
+          Because rcw package has been renamed to qoriq-rcw and moved
+          to "nxp", option BR2_PACKAGE_HOST_RCW is removed, the option
+          BR2_PACKAGE_HOST_QORIQ_RCW can be used for QorIQ platforms.
+
+config BR2_PACKAGE_HOST_RCW
+        bool "rcw package was removed"
+        select BR2_LEGACY
+        help
+          Because rcw package has been renamed to qoriq-rcw and moved
+          to "nxp", option BR2_PACKAGE_HOST_RCW is removed, the option
+          BR2_PACKAGE_HOST_QORIQ_RCW can be used for QorIQ platforms.
+
 comment "Legacy options removed in 2020.05"
 
 config BR2_PACKAGE_WIRINGPI
diff --git a/DEVELOPERS b/DEVELOPERS
index e9cab3c6a0..ba17e675db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1704,6 +1704,7 @@ F:	package/mrouted/
 F:	package/mtd/
 F:	package/mtools/
 F:	package/nginx-upload/
+F:	package/nxp/qoriq-rcw/
 F:	package/omniorb/
 F:	package/openresolv/
 F:	package/paxtest/
@@ -1726,7 +1727,6 @@ F:	package/python-pysftp/
 F:	package/python-tinyrpc/
 F:	package/python-txdbus/
 F:	package/raptor/
-F:	package/rcw/
 F:	package/rng-tools/
 F:	package/rsyslog/
 F:	package/setools/
diff --git a/package/Config.in.host b/package/Config.in.host
index 647fc24841..da73a11ed4 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -48,6 +48,7 @@ menu "Host utilities"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
+	source "package/nxp/qoriq-rcw/Config.in.host"
 	source "package/odb/Config.in.host"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
@@ -67,7 +68,6 @@ menu "Host utilities"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
-	source "package/rcw/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
diff --git a/package/rcw/Config.in.host b/package/nxp/qoriq-rcw/Config.in.host
similarity index 88%
rename from package/rcw/Config.in.host
rename to package/nxp/qoriq-rcw/Config.in.host
index a9253958d9..8f78a40908 100644
--- a/package/rcw/Config.in.host
+++ b/package/nxp/qoriq-rcw/Config.in.host
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_HOST_RCW
+config BR2_PACKAGE_HOST_QORIQ_RCW
 	bool "host rcw"
 	help
 	  This package provides an reset configuration word(RCW)
@@ -11,9 +11,9 @@ config BR2_PACKAGE_HOST_RCW
 
 	  https://source.codeaurora.org/external/qoriq/qoriq-components/rcw/
 
-if BR2_PACKAGE_HOST_RCW
+if BR2_PACKAGE_HOST_QORIQ_RCW
 
-config BR2_PACKAGE_HOST_RCW_CUSTOM_PATH
+config BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH
 	string "RCW Source file paths"
 	help
 	  Space-separated list of .rcw and .rcwi files, that will be
diff --git a/package/rcw/rcw.hash b/package/nxp/qoriq-rcw/qoriq-rcw.hash
similarity index 50%
rename from package/rcw/rcw.hash
rename to package/nxp/qoriq-rcw/qoriq-rcw.hash
index 76b6373942..88460716f9 100644
--- a/package/rcw/rcw.hash
+++ b/package/nxp/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b69a6a8b187ba794e0af716a509ced2bbac83da0f6e94b5c7331a34619db21b1 rcw-LSDK-19.09.tar.gz
+sha256 4a9ce5bb1733239bf1b740b705df20f90802b16114e24f3fd56c08a7ba4b56c2 qoriq-rcw-LSDK-19.09.tar.gz
 sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd LICENSE
diff --git a/package/rcw/rcw.mk b/package/nxp/qoriq-rcw/qoriq-rcw.mk
similarity index 51%
rename from package/rcw/rcw.mk
rename to package/nxp/qoriq-rcw/qoriq-rcw.mk
index 22e3be4f13..440f388747 100644
--- a/package/rcw/rcw.mk
+++ b/package/nxp/qoriq-rcw/qoriq-rcw.mk
@@ -1,67 +1,67 @@
 ################################################################################
 #
-# rcw
+# qoriq-rcw
 #
 ################################################################################
 
-RCW_VERSION = LSDK-19.09
-RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
-RCW_SITE_METHOD = git
-RCW_LICENSE = BSD-3-Clause
-RCW_LICENSE_FILES = LICENSE
+QORIQ_RCW_VERSION = LSDK-19.09
+QORIQ_RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
+QORIQ_RCW_SITE_METHOD = git
+QORIQ_RCW_LICENSE = BSD-3-Clause
+QORIQ_RCW_LICENSE_FILES = LICENSE
 
 HOST_RCW_DEPENDENCIES = $(BR2_PYTHON3_HOST_DEPENDENCY)
 
-RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))
+QORIQ_RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH))
 
-ifneq ($(RCW_FILES),)
-RCW_INCLUDES = $(filter-out %.rcw,$(RCW_FILES))
+ifneq ($(QORIQ_RCW_FILES),)
+QORIQ_RCW_INCLUDES = $(filter-out %.rcw,$(QORIQ_RCW_FILES))
 # Get the name of the custom rcw file from the custom list
-RCW_PROJECT = $(notdir $(filter %.rcw,$(RCW_FILES)))
+QORIQ_RCW_PROJECT = $(notdir $(filter %.rcw,$(QORIQ_RCW_FILES)))
 
 # Error if there are no or more than one .rcw file
 ifeq ($(BR_BUILDING),y)
-ifneq ($(words $(RCW_PROJECT)),1)
-$(error BR2_PACKAGE_HOST_RCW_CUSTOM_PATH must have exactly one .rcw file)
+ifneq ($(words $(QORIQ_RCW_PROJECT)),1)
+$(error BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH must have exactly one .rcw file)
 endif
 endif
 
-ifneq ($(RCW_INCLUDES),)
-define HOST_RCW_ADD_CUSTOM_RCW_INCLUDES
+ifneq ($(QORIQ_RCW_INCLUDES),)
+define HOST_QORIQ_RCW_ADD_CUSTOM_RCW_INCLUDES
 	mkdir -p $(@D)/custom_board
-	cp -f $(RCW_INCLUDES) $(@D)/custom_board
+	cp -f $(QORIQ_RCW_INCLUDES) $(@D)/custom_board
 endef
 HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_INCLUDES
 endif
 
-define HOST_RCW_ADD_CUSTOM_RCW_FILES
+define HOST_QORIQ_RCW_ADD_CUSTOM_RCW_FILES
 	mkdir -p $(@D)/custom_board/rcw
-	cp -f $(filter %.rcw,$(RCW_FILES)) $(@D)/custom_board/rcw
+	cp -f $(filter %.rcw,$(QORIQ_RCW_FILES)) $(@D)/custom_board/rcw
 endef
-HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
+HOST_QORIQ_RCW_POST_PATCH_HOOKS += HOST_QORIQ_RCW_ADD_CUSTOM_RCW_FILES
 
 # rcw.py is a python3-only script, and we can be using either the
 # system-provided python3, or our own built with host-python3.
 # Fortunately, rcw.py uses #!/usr/bin/env python3, so it will
 # easily find it from PATH.
-define HOST_RCW_BUILD_CMDS
+define HOST_QORIQ_RCW_BUILD_CMDS
 	PATH=$(BR_PATH) \
 	$(@D)/rcw.py \
-		-i $(@D)/custom_board/rcw/$(RCW_PROJECT) \
+		-i $(@D)/custom_board/rcw/$(QORIQ_RCW_PROJECT) \
 		-I $(@D)/custom_board -o $(@D)/PBL.bin
 endef
 
-define HOST_RCW_INSTALL_DELIVERY_FILE
+define HOST_QORIQ_RCW_INSTALL_DELIVERY_FILE
 	$(INSTALL) -D -m 0644 $(@D)/PBL.bin $(BINARIES_DIR)/PBL.bin
 endef
 endif
 
 # Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
 # could use a post image or SDK to build/install PBL files.
-define HOST_RCW_INSTALL_CMDS
+define HOST_QORIQ_RCW_INSTALL_CMDS
 	mkdir -p  $(HOST_DIR)/share/rcw
 	cp -a $(@D)/* $(HOST_DIR)/share/rcw
-	$(HOST_RCW_INSTALL_DELIVERY_FILE)
+	$(HOST_QORIQ_RCW_INSTALL_DELIVERY_FILE)
 endef
 
 $(eval $(host-generic-package))
-- 
2.17.1
