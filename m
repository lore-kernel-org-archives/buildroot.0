From: Changming Huang <jerry.huang@nxp.com>
Date: Thu, 21 Nov 2019 18:23:16 +0800
Subject: [Buildroot] [PATCH v2 02/10] package/freescale-qoriq/fsl-qoriq-rcw:
 move rcw into freescale-qoriq and rename it
In-Reply-To: <20191121102324.35225-1-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
Message-ID: <20191121102324.35225-3-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jerry Huang <jerry.huang@nxp.com>

Move package/rcw into package/freescale-qoriq,
and rename it to fsl-qoriq-rcw.

Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
---
changes since v1:
1. new patch
2. move rcw to sub-directory freescale-qoriq
3. rename to fsl-qoriq-rcw
---
 DEVELOPERS                                    |  2 +-
 package/Config.in.host                        |  2 +-
 .../fsl-qoriq-rcw}/Config.in.host             |  0
 .../fsl-qoriq-rcw/fsl-qoriq-rcw.hash}         |  0
 .../fsl-qoriq-rcw/fsl-qoriq-rcw.mk}           | 22 +++++++++----------
 5 files changed, 13 insertions(+), 13 deletions(-)
 rename package/{rcw => freescale-qoriq/fsl-qoriq-rcw}/Config.in.host (100%)
 rename package/{rcw/rcw.hash => freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash} (100%)
 rename package/{rcw/rcw.mk => freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk} (72%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 19ea83df3b..9fbe229eb7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1603,7 +1603,7 @@ F:	package/python-pyrex/
 F:	package/python-tinyrpc/
 F:	package/python-txdbus/
 F:	package/raptor/
-F:	package/rcw/
+F:	package/freescale-qoriq/fsl-qoriq-rcw/
 F:	package/rng-tools/
 F:	package/rsyslog/
 F:	package/setools/
diff --git a/package/Config.in.host b/package/Config.in.host
index 758c268e00..e4840080ad 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -62,7 +62,7 @@ menu "Host utilities"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
-	source "package/rcw/Config.in.host"
+	source "package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
diff --git a/package/rcw/Config.in.host b/package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host
similarity index 100%
rename from package/rcw/Config.in.host
rename to package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host
diff --git a/package/rcw/rcw.hash b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash
similarity index 100%
rename from package/rcw/rcw.hash
rename to package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash
diff --git a/package/rcw/rcw.mk b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
similarity index 72%
rename from package/rcw/rcw.mk
rename to package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
index 36d2da61b5..a5f3854271 100644
--- a/package/rcw/rcw.mk
+++ b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
@@ -1,14 +1,14 @@
 ################################################################################
 #
-# rcw
+# fsl-qoriq-rcw
 #
 ################################################################################
 
-RCW_VERSION = LSDK-18.12
-RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
-RCW_SITE_METHOD = git
-RCW_LICENSE = BSD-3-Clause
-RCW_LICENSE_FILES = LICENSE
+FSL_QORIQ_RCW_VERSION = LSDK-18.12
+FSL_QORIQ_RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
+FSL_QORIQ_RCW_SITE_METHOD = git
+FSL_QORIQ_RCW_LICENSE = BSD-3-Clause
+FSL_QORIQ_RCW_LICENSE_FILES = LICENSE
 
 RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))
 
@@ -23,28 +23,28 @@ $(error BR2_PACKAGE_HOST_RCW_CUSTOM_PATH must have exactly one .rcw file)
 endif
 endif
 
-define HOST_RCW_ADD_CUSTOM_RCW_FILES
+define HOST_FSL_QORIQ_RCW_ADD_CUSTOM_RCW_FILES
 	mkdir -p $(@D)/custom_board/rcw
 	cp -f $(filter-out %.rcw,$(RCW_FILES)) $(@D)/custom_board
 	cp -f $(filter %.rcw,$(RCW_FILES)) $(@D)/custom_board/rcw
 endef
 HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
 
-define HOST_RCW_BUILD_CMDS
+define HOST_FSL_QORIQ_RCW_BUILD_CMDS
 	python $(@D)/rcw.py -i $(@D)/custom_board/rcw/$(RCW_PROJECT) -I $(@D)/custom_board -o $(@D)/PBL.bin
 endef
 
-define HOST_RCW_INSTALL_DELIVERY_FILE
+define HOST_FSL_QORIQ_RCW_INSTALL_DELIVERY_FILE
 	$(INSTALL) -D -m 0644 $(@D)/PBL.bin $(BINARIES_DIR)/PBL.bin
 endef
 endif
 
 # Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
 # could use a post image or SDK to build/install PBL files.
-define HOST_RCW_INSTALL_CMDS
+define HOST_FSL_QORIQ_RCW_INSTALL_CMDS
 	mkdir -p  $(HOST_DIR)/share/rcw
 	cp -a $(@D)/* $(HOST_DIR)/share/rcw
-	$(HOST_RCW_INSTALL_DELIVERY_FILE)
+	$(HOST_FSL_QORIQ_RCW_INSTALL_DELIVERY_FILE)
 endef
 
 $(eval $(host-generic-package))
-- 
2.17.1
