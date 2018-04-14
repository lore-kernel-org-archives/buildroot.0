From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 13 Apr 2018 22:04:10 -0500
Subject: [Buildroot] [PATCH] rcw: new package
Message-ID: <1523675050-52136-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>

This package adds NXP Layerscape and QoriQ reset configruation word
(RCW) / pre-bootloader (PBL) generation support.

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in.host                             |  1 +
 ...dd-custom_board-support-to-build-a-binary.patch | 42 +++++++++++++++++
 package/rcw/Config.in.host                         | 52 ++++++++++++++++++++++
 package/rcw/rcw.hash                               |  3 ++
 package/rcw/rcw.mk                                 | 51 +++++++++++++++++++++
 6 files changed, 150 insertions(+)
 create mode 100644 package/rcw/0001-rcw-Add-custom_board-support-to-build-a-binary.patch
 create mode 100644 package/rcw/Config.in.host
 create mode 100644 package/rcw/rcw.hash
 create mode 100644 package/rcw/rcw.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 05693d3..ea00597 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1257,6 +1257,7 @@ F:	package/python-posix-ipc/
 F:	package/python-pypcap/
 F:	package/python-pyrex/
 F:	package/raptor/
+F:	package/rcw/
 F:	package/rng-tools/
 F:	package/rsyslog/
 F:	package/setools/
diff --git a/package/Config.in.host b/package/Config.in.host
index a8a4c1f..47ebd2d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -49,6 +49,7 @@ menu "Host utilities"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
+	source "package/rcw/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
diff --git a/package/rcw/0001-rcw-Add-custom_board-support-to-build-a-binary.patch b/package/rcw/0001-rcw-Add-custom_board-support-to-build-a-binary.patch
new file mode 100644
index 0000000..105d3c4
--- /dev/null
+++ b/package/rcw/0001-rcw-Add-custom_board-support-to-build-a-binary.patch
@@ -0,0 +1,42 @@
+From 28bb5405afdf5665ea8bc17b5063976d3f2ce004 Mon Sep 17 00:00:00 2001
+From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
+Date: Mon, 2 Apr 2018 13:18:47 -0500
+Subject: [PATCH] rcw: Add custom_board support to build a binary
+
+This patch added base structure for the custom_board folder and
+allow the user to generate a binary image from custom RCW files.
+
+Submitted upstream: https://github.com/qoriq-open-source/rcw/issues/2
+
+Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
+---
+ Makefile              |  3 ++-
+ custom_board/Makefile |  1 +
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+ create mode 100644 custom_board/Makefile
+ create mode 100644 custom_board/README
+
+diff --git a/Makefile b/Makefile
+index fb55c8b..95eb408 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3,7 +3,8 @@ BOARDS = b4420qds b4860qds \
+ 	 ls1021aqds ls1021atwr ls1043aqds ls1043ardb ls1046ardb ls1046aqds \
+ 	 p2041rdb p3041ds p4080ds p5020ds p5040ds \
+ 	 t1024qds t1023rdb t1024rdb t1040rdb t1042rdb t1042rdb_pi t1040qds \
+-	 t2080rdb t2080qds t2081qds t4240qds t4240rdb t1040d4rdb t1042d4rdb
++	 t2080rdb t2080qds t2081qds t4240qds t4240rdb t1040d4rdb t1042d4rdb \
++	 custom_board
+ 
+ VER = $(shell git describe --tags)
+ 
+diff --git a/custom_board/Makefile b/custom_board/Makefile
+new file mode 100644
+index 0000000..f77e46b
+--- /dev/null
++++ b/custom_board/Makefile
+@@ -0,0 +1 @@
++include ../Makefile.inc
+-- 
+1.9.1
+
diff --git a/package/rcw/Config.in.host b/package/rcw/Config.in.host
new file mode 100644
index 0000000..bb0bd9b
--- /dev/null
+++ b/package/rcw/Config.in.host
@@ -0,0 +1,52 @@
+config BR2_PACKAGE_HOST_RCW
+	bool "host rcw"
+	help
+	  This package compiles an reset configuration word(RCW)
+	  source file into an PBL/RCW binary
+
+	  https://github.com/qoriq-open-source/rcw
+
+if BR2_PACKAGE_HOST_RCW
+
+config BR2_PACKAGE_HOST_RCW_CUSTOM_PATH
+
+	string "RCW Source file paths"
+	help
+	  Path to custom RCW source files. You can provide a
+	  list of rcw paths to copy and build, separated by spaces.
+
+	  NOTE: If you want to build one common rcw file
+	  (e.g. "X.rcwi") with main rcw file (e.g. "Y.rcw") then
+	  include common rcw file X.rcwi in main rcw file Y.rcw
+	  using "#include"
+
+	  Do not use ".rcw" suffix for common rcw file because this
+	  tool will compile all .rcw into a binary image.
+
+config BR2_PACKAGE_HOST_RCW_FIRMWARE_FILE
+	string "RCW Firmware Filename Path"
+	default "t1040rdb/RR_P_66/rcw_1400MHz.bin"
+	help
+	  Specify the RCW firmware binary file path that should
+	  be placed in the BINARIES_DIR as PBL.bin
+
+	  NOTE: If you are building custom rcw file then specify
+	  "custom_board/rcw/" path before filename.
+
+	  e.g. If your BR2_PACKAGE_HOST_RCW_CUSTOM_PATH is
+	  /path/to/Y.rcw then specify "custom_board/rcw/Y.bin" in
+	  BR2_PACKAGE_HOST_RCW_FIRMWARE_FILE to copy right file in
+	  images/ folder with PBL.bin name.
+
+	  If you want to copy a in-build bin file into images/ folder
+	  with PBL.bin name then specify correct rcw source tree path
+	  with '.bin' suffix.
+
+	  e.g.
+	  "
+	  t1042rdb/RR_P_86/rcw_1400MHz.bin
+	  t1042rdb/RR_P_86/rcw_sben_1400MHz.bin
+	  t2080qds/RR_PNSNNR_6C_2D/rcw_6c_2d_1800MHz.bin
+	  "
+
+endif
diff --git a/package/rcw/rcw.hash b/package/rcw/rcw.hash
new file mode 100644
index 0000000..c6b6865
--- /dev/null
+++ b/package/rcw/rcw.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 78df534bb8fa0ebb9edd6791932b55f696abcb1b4120c8eacbd86a8b64f30318 rcw-LSDK-1703.tar.gz
+sha256 5d588eb3b157d52112afea935c88a7ff9efddc1e2d95a42c25d3b96ad9055008 COPYING
diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
new file mode 100644
index 0000000..d74358d
--- /dev/null
+++ b/package/rcw/rcw.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# rcw
+#
+################################################################################
+
+RCW_VERSION = LSDK-1703
+RCW_SITE = $(call github,qoriq-open-source,rcw,$(RCW_VERSION))
+RCW_LICENSE = BSD-3-Clause
+RCW_LICENSE_FILES = COPYING
+HOST_RCW_DEPENDENCIES = host-python
+
+RCW_BINARY_FILE = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_FIRMWARE_FILE))
+RCW_DELIVERY_FILE = PBL.bin
+
+# Create a rcw folder inside the custom_board folder and copy all files into
+# the folder.  Then symlink all custom_board/rcw/*.rcwi -> custom_board/*.rcwi
+# so we can reuse the existing Makefile logic in the package.
+define HOST_RCW_CUSTOM
+	mkdir -p $(@D)/custom_board/rcw
+	cp -f $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH)) $(@D)/custom_board/rcw
+	for rcwi in $(filter %.rcwi,$(notdir $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH)))); do \
+		cd $(@D)/custom_board; ln -sf rcw/$${rcwi} $${rcwi} ; \
+	done
+endef
+
+ifeq ($(BR2_PACKAGE_HOST_RCW),y)
+ifeq ($(RCW_BINARY_FILE),)
+$(error No RCW binary file. Check your BR2_PACKAGE_HOST_RCW_FIRMWARE_FILE setting)
+endif
+ifneq ($(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH)),)
+HOST_RCW_PRE_BUILD_HOOKS += HOST_RCW_CUSTOM
+endif
+endif
+
+HOST_RCW_MAKE_OPTS = PYTHON=$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR)
+
+define HOST_RCW_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_RCW_MAKE_OPTS) -C $(@D)
+endef
+
+# Copy source files and script into $(HOST_DIR)/share/rcw/ as a developer using
+# an SDK may want to build test PBL files.
+define HOST_RCW_INSTALL_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/$(RCW_BINARY_FILE) $(BINARIES_DIR)/$(RCW_DELIVERY_FILE)
+	mkdir -p  $(HOST_DIR)/share/rcw
+	cp -a $(@D)/* $(HOST_DIR)/share/rcw
+	find $(HOST_DIR)/share/rcw -name "*.bin" -delete
+endef
+
+$(eval $(host-generic-package))
-- 
1.9.1
