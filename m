From: Changming Huang <jerry.huang@nxp.com>
Date: Wed, 27 Nov 2019 15:17:13 +0800
Subject: [Buildroot] [PATCH v3 2/9] package/qoriq-rcw: move rcw into nxp and
 rename it
In-Reply-To: <20191127071720.15623-1-jerry.huang@nxp.com>
References: <20191127071720.15623-1-jerry.huang@nxp.com>
Message-ID: <20191127071720.15623-2-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jerry Huang <jerry.huang@nxp.com>

Move package/rcw into package/nxp,
and rename it to qoriq-rcw.

Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
---
changes since v2:
1. change the package name to qoriq-rcw to keep consistent with imx-xxx.
2. add the handing in Config.in.legacy

changes since v1:
1. new patch.
2. move rcw to sub-directory freescale-qoriq.
3. rename to fsl-qoriq-rcw.
---
 Config.in.legacy                              |  8 +++
 DEVELOPERS                                    |  2 +-
 package/Config.in.host                        |  2 +-
 package/{rcw => nxp/qoriq-rcw}/Config.in.host |  6 +--
 .../rcw.hash => nxp/qoriq-rcw/qoriq-rcw.hash} |  2 +-
 package/nxp/qoriq-rcw/qoriq-rcw.mk            | 50 +++++++++++++++++++
 package/rcw/rcw.mk                            | 50 -------------------
 7 files changed, 64 insertions(+), 56 deletions(-)
 rename package/{rcw => nxp/qoriq-rcw}/Config.in.host (88%)
 rename package/{rcw/rcw.hash => nxp/qoriq-rcw/qoriq-rcw.hash} (82%)
 create mode 100644 package/nxp/qoriq-rcw/qoriq-rcw.mk
 delete mode 100644 package/rcw/rcw.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 7167b1d60c..515332e22c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_PACKAGE_HOST_RCW
+	bool "rcw package was removed"
+	select BR2_LEGACY
+	help
+	  Because rcw package has been renamed to qoriq-rcw and moved
+	  to "nxp", option BR2_PACKAGE_HOST_RCW is removed, the option
+	  BR2_PACKAGE_HOST_QORIQ_RCW can be used for QorIQ platforms.
+
 config BR2_PACKAGE_RPI_USERLAND_START_VCFILED
 	bool "rpi-userland start vcfiled was removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 78387c0468..887ab7ad95 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1590,6 +1590,7 @@ F:	package/mrouted/
 F:	package/mtd/
 F:	package/mtools/
 F:	package/nginx-upload/
+F:	package/nxp/qoriq-rcw/
 F:	package/omniorb/
 F:	package/openresolv/
 F:	package/paxtest/
@@ -1610,7 +1611,6 @@ F:	package/python-pyrex/
 F:	package/python-tinyrpc/
 F:	package/python-txdbus/
 F:	package/raptor/
-F:	package/rcw/
 F:	package/rng-tools/
 F:	package/rsyslog/
 F:	package/setools/
diff --git a/package/Config.in.host b/package/Config.in.host
index 758c268e00..2b2069b88d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -45,6 +45,7 @@ menu "Host utilities"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
+	source "package/nxp/qoriq-rcw/Config.in.host"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
 	source "package/opkg-utils/Config.in.host"
@@ -62,7 +63,6 @@ menu "Host utilities"
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
similarity index 82%
rename from package/rcw/rcw.hash
rename to package/nxp/qoriq-rcw/qoriq-rcw.hash
index 7de1ec659a..e9708d960d 100644
--- a/package/rcw/rcw.hash
+++ b/package/nxp/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1421ada9fec10b12ff21cd9ad82f0a835b191cb2dde80f03547764574b1346c3 rcw-LSDK-18.12.tar.gz
+sha256 1421ada9fec10b12ff21cd9ad82f0a835b191cb2dde80f03547764574b1346c3 qoriq-rcw-LSDK-18.12.tar.gz
 sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd LICENSE
diff --git a/package/nxp/qoriq-rcw/qoriq-rcw.mk b/package/nxp/qoriq-rcw/qoriq-rcw.mk
new file mode 100644
index 0000000000..3308f20192
--- /dev/null
+++ b/package/nxp/qoriq-rcw/qoriq-rcw.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# qoriq-rcw
+#
+################################################################################
+
+QORIQ_RCW_VERSION = LSDK-18.12
+QORIQ_RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
+QORIQ_RCW_SITE_METHOD = git
+QORIQ_RCW_LICENSE = BSD-3-Clause
+QORIQ_RCW_LICENSE_FILES = LICENSE
+
+QORIQ_RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH))
+
+ifneq ($(QORIQ_RCW_FILES),)
+# Get the name of the custom rcw file from the custom list
+QORIQ_RCW_PROJECT = $(notdir $(filter %.rcw,$(QORIQ_RCW_FILES)))
+
+# Error if there are no or more than one .rcw file
+ifeq ($(BR_BUILDING),y)
+ifneq ($(words $(QORIQ_RCW_PROJECT)),1)
+$(error BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH must have exactly one .rcw file)
+endif
+endif
+
+define HOST_QORIQ_RCW_ADD_CUSTOM_RCW_FILES
+	mkdir -p $(@D)/custom_board/rcw
+	cp -f $(filter-out %.rcw,$(QORIQ_RCW_FILES)) $(@D)/custom_board
+	cp -f $(filter %.rcw,$(QORIQ_RCW_FILES)) $(@D)/custom_board/rcw
+endef
+HOST_QORIQ_RCW_POST_PATCH_HOOKS += HOST_QORIQ_RCW_ADD_CUSTOM_RCW_FILES
+
+define HOST_QORIQ_RCW_BUILD_CMDS
+	python $(@D)/rcw.py -i $(@D)/custom_board/rcw/$(QORIQ_RCW_PROJECT) -I $(@D)/custom_board -o $(@D)/PBL.bin
+endef
+
+define HOST_QORIQ_RCW_INSTALL_DELIVERY_FILE
+	$(INSTALL) -D -m 0644 $(@D)/PBL.bin $(BINARIES_DIR)/PBL.bin
+endef
+endif
+
+# Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
+# could use a post image or SDK to build/install PBL files.
+define HOST_QORIQ_RCW_INSTALL_CMDS
+	mkdir -p  $(HOST_DIR)/share/rcw
+	cp -a $(@D)/* $(HOST_DIR)/share/rcw
+	$(HOST_QORIQ_RCW_INSTALL_DELIVERY_FILE)
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
deleted file mode 100644
index 36d2da61b5..0000000000
--- a/package/rcw/rcw.mk
+++ /dev/null
@@ -1,50 +0,0 @@
-################################################################################
-#
-# rcw
-#
-################################################################################
-
-RCW_VERSION = LSDK-18.12
-RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
-RCW_SITE_METHOD = git
-RCW_LICENSE = BSD-3-Clause
-RCW_LICENSE_FILES = LICENSE
-
-RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))
-
-ifneq ($(RCW_FILES),)
-# Get the name of the custom rcw file from the custom list
-RCW_PROJECT = $(notdir $(filter %.rcw,$(RCW_FILES)))
-
-# Error if there are no or more than one .rcw file
-ifeq ($(BR_BUILDING),y)
-ifneq ($(words $(RCW_PROJECT)),1)
-$(error BR2_PACKAGE_HOST_RCW_CUSTOM_PATH must have exactly one .rcw file)
-endif
-endif
-
-define HOST_RCW_ADD_CUSTOM_RCW_FILES
-	mkdir -p $(@D)/custom_board/rcw
-	cp -f $(filter-out %.rcw,$(RCW_FILES)) $(@D)/custom_board
-	cp -f $(filter %.rcw,$(RCW_FILES)) $(@D)/custom_board/rcw
-endef
-HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
-
-define HOST_RCW_BUILD_CMDS
-	python $(@D)/rcw.py -i $(@D)/custom_board/rcw/$(RCW_PROJECT) -I $(@D)/custom_board -o $(@D)/PBL.bin
-endef
-
-define HOST_RCW_INSTALL_DELIVERY_FILE
-	$(INSTALL) -D -m 0644 $(@D)/PBL.bin $(BINARIES_DIR)/PBL.bin
-endef
-endif
-
-# Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
-# could use a post image or SDK to build/install PBL files.
-define HOST_RCW_INSTALL_CMDS
-	mkdir -p  $(HOST_DIR)/share/rcw
-	cp -a $(@D)/* $(HOST_DIR)/share/rcw
-	$(HOST_RCW_INSTALL_DELIVERY_FILE)
-endef
-
-$(eval $(host-generic-package))
-- 
2.17.1
