From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Dec 2020 19:34:45 +0100
Subject: [Buildroot] [git commit] package/qoriq-rcw: rename from package/rcw
Message-ID: <20201216204108.5BE338349D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad50d8a4788859f18effcc086edd0bd8f05b1c8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is really only for QoriQ SoCs. Also the upstream package - despite
its base name of the git repository - is "qoriq-components/rcw". Thus
rename it to a more specify package name.

Note that there are other rcw implementations for other platforms, and
each implementation only applies to that specific platform; it hus does
not make sense that there are more than one rcw enabled at the same
time; so we keep using /usr/share/rcw as the install location; this also
help backward compatibility with existing post-build scripts.

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
Cc: Michael Walle <michael@walle.cc>
[yann.morin.1998 at free.fr:
  - rebase on master
  - incorporate changes by Michael
  - don't move to an 'nxp' sub-directory
  - reword the legacy entry; select the new package
  - expand commit log to explain why we keep installing in
    host/usr/share/rcw/ (thanks to Michael for prompting that)
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   |  9 +++
 DEVELOPERS                                         |  2 +-
 package/Config.in.host                             |  2 +-
 package/{rcw => qoriq-rcw}/Config.in.host          |  8 +--
 package/{rcw/rcw.hash => qoriq-rcw/qoriq-rcw.hash} |  2 +-
 package/qoriq-rcw/qoriq-rcw.mk                     | 67 ++++++++++++++++++++++
 package/rcw/rcw.mk                                 | 67 ----------------------
 7 files changed, 83 insertions(+), 74 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4928a35bb4..899a72d57b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2021.02"
 
+config BR2_PACKAGE_HOST_RCW
+	bool "rcw package was renamed to oriq-rcw"
+	select BR2_PACKAGE_HOST_QORIQ_RCW
+	select BR2_LEGACY
+	help
+	  The rcw package was specific to the QorIQ platform, so it has
+	  been renamed to qoriq-rcw, to leave room for other *-rcw
+	  packages for other platforms.
+
 config BR2_KERNEL_HEADERS_5_8
 	bool "kernel headers version 5.8.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index a2c7f7f34a..882e8cd825 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1747,8 +1747,8 @@ F:	package/python-pyrex/
 F:	package/python-pysftp/
 F:	package/python-tinyrpc/
 F:	package/python-txdbus/
+F:	package/qoriq-rcw/
 F:	package/raptor/
-F:	package/rcw/
 F:	package/rng-tools/
 F:	package/rsyslog/
 F:	package/setools/
diff --git a/package/Config.in.host b/package/Config.in.host
index 4f69785810..ba6a68c728 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -70,9 +70,9 @@ menu "Host utilities"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
+	source "package/qoriq-rcw/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
-	source "package/rcw/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
diff --git a/package/rcw/Config.in.host b/package/qoriq-rcw/Config.in.host
similarity index 86%
rename from package/rcw/Config.in.host
rename to package/qoriq-rcw/Config.in.host
index a9253958d9..1f69c0389c 100644
--- a/package/rcw/Config.in.host
+++ b/package/qoriq-rcw/Config.in.host
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_HOST_RCW
-	bool "host rcw"
+config BR2_PACKAGE_HOST_QORIQ_RCW
+	bool "host qoriq-rcw"
 	help
 	  This package provides an reset configuration word(RCW)
 	  compiler to build NXP QoriQ/LS PBL/RCW binary(s).
@@ -11,9 +11,9 @@ config BR2_PACKAGE_HOST_RCW
 
 	  https://source.codeaurora.org/external/qoriq/qoriq-components/rcw/
 
-if BR2_PACKAGE_HOST_RCW
+if BR2_PACKAGE_HOST_QORIQ_RCW
 
-config BR2_PACKAGE_HOST_RCW_CUSTOM_PATH
+config BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH
 	string "RCW Source file paths"
 	help
 	  Space-separated list of .rcw and .rcwi files, that will be
diff --git a/package/rcw/rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
similarity index 50%
rename from package/rcw/rcw.hash
rename to package/qoriq-rcw/qoriq-rcw.hash
index 76b6373942..88460716f9 100644
--- a/package/rcw/rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b69a6a8b187ba794e0af716a509ced2bbac83da0f6e94b5c7331a34619db21b1 rcw-LSDK-19.09.tar.gz
+sha256 4a9ce5bb1733239bf1b740b705df20f90802b16114e24f3fd56c08a7ba4b56c2 qoriq-rcw-LSDK-19.09.tar.gz
 sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
new file mode 100644
index 0000000000..2e06b6d53e
--- /dev/null
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -0,0 +1,67 @@
+################################################################################
+#
+# qoriq-rcw
+#
+################################################################################
+
+QORIQ_RCW_VERSION = LSDK-19.09
+QORIQ_RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
+QORIQ_RCW_SITE_METHOD = git
+QORIQ_RCW_LICENSE = BSD-3-Clause
+QORIQ_RCW_LICENSE_FILES = LICENSE
+
+HOST_QORIQ_RCW_DEPENDENCIES = $(BR2_PYTHON3_HOST_DEPENDENCY)
+
+QORIQ_RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH))
+
+ifneq ($(QORIQ_RCW_FILES),)
+QORIQ_RCW_INCLUDES = $(filter-out %.rcw,$(QORIQ_RCW_FILES))
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
+ifneq ($(QORIQ_RCW_INCLUDES),)
+define HOST_QORIQ_RCW_ADD_CUSTOM_RCW_INCLUDES
+	mkdir -p $(@D)/custom_board
+	cp -f $(QORIQ_RCW_INCLUDES) $(@D)/custom_board
+endef
+HOST_QORIQ_RCW_POST_PATCH_HOOKS += HOST_QORIQ_RCW_ADD_CUSTOM_RCW_INCLUDES
+endif
+
+define HOST_QORIQ_RCW_ADD_CUSTOM_RCW_FILES
+	mkdir -p $(@D)/custom_board/rcw
+	cp -f $(filter %.rcw,$(QORIQ_RCW_FILES)) $(@D)/custom_board/rcw
+endef
+HOST_QORIQ_RCW_POST_PATCH_HOOKS += HOST_QORIQ_RCW_ADD_CUSTOM_RCW_FILES
+
+# rcw.py is a python3-only script, and we can be using either the
+# system-provided python3, or our own built with host-python3.
+# Fortunately, rcw.py uses #!/usr/bin/env python3, so it will
+# easily find it from PATH.
+define HOST_QORIQ_RCW_BUILD_CMDS
+	PATH=$(BR_PATH) \
+	$(@D)/rcw.py \
+		-i $(@D)/custom_board/rcw/$(QORIQ_RCW_PROJECT) \
+		-I $(@D)/custom_board -o $(@D)/PBL.bin
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
index 22e3be4f13..0000000000
--- a/package/rcw/rcw.mk
+++ /dev/null
@@ -1,67 +0,0 @@
-################################################################################
-#
-# rcw
-#
-################################################################################
-
-RCW_VERSION = LSDK-19.09
-RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
-RCW_SITE_METHOD = git
-RCW_LICENSE = BSD-3-Clause
-RCW_LICENSE_FILES = LICENSE
-
-HOST_RCW_DEPENDENCIES = $(BR2_PYTHON3_HOST_DEPENDENCY)
-
-RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))
-
-ifneq ($(RCW_FILES),)
-RCW_INCLUDES = $(filter-out %.rcw,$(RCW_FILES))
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
-ifneq ($(RCW_INCLUDES),)
-define HOST_RCW_ADD_CUSTOM_RCW_INCLUDES
-	mkdir -p $(@D)/custom_board
-	cp -f $(RCW_INCLUDES) $(@D)/custom_board
-endef
-HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_INCLUDES
-endif
-
-define HOST_RCW_ADD_CUSTOM_RCW_FILES
-	mkdir -p $(@D)/custom_board/rcw
-	cp -f $(filter %.rcw,$(RCW_FILES)) $(@D)/custom_board/rcw
-endef
-HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
-
-# rcw.py is a python3-only script, and we can be using either the
-# system-provided python3, or our own built with host-python3.
-# Fortunately, rcw.py uses #!/usr/bin/env python3, so it will
-# easily find it from PATH.
-define HOST_RCW_BUILD_CMDS
-	PATH=$(BR_PATH) \
-	$(@D)/rcw.py \
-		-i $(@D)/custom_board/rcw/$(RCW_PROJECT) \
-		-I $(@D)/custom_board -o $(@D)/PBL.bin
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
