From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Oct 2018 11:46:43 -0500
Subject: [Buildroot] [PATCH 2/3] package/dsp-tools: remove package
In-Reply-To: <1539622004-43558-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1539622004-43558-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1539622004-43558-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The suit of TI OMAP3 dsp tools/libraries are being removed as the
upstream projects are no longer active.

The dsp-tools package used the tidsp-binaries package.

Suggest using Buildroot 2018.02.6 LTS if the feature is still
required.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

This patchset was started after an update was proposed to the TI DSP
related packages to fix upstream homepage URLS. It seems the upstream
stablized for this DSP feature set primarily for OMAP3 and then the
technology has not been moving forward with newer processors.
---
 Config.in.legacy                 |  6 ++++++
 package/Config.in                |  1 -
 package/dsp-tools/Config.in      |  8 --------
 package/dsp-tools/dsp-tools.hash |  2 --
 package/dsp-tools/dsp-tools.mk   | 21 ---------------------
 5 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 package/dsp-tools/Config.in
 delete mode 100644 package/dsp-tools/dsp-tools.hash
 delete mode 100644 package/dsp-tools/dsp-tools.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index acf578b..2089e82 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.11"
 
+config BR2_PACKAGE_DSP_TOOLS
+	bool "dsp-tools package removed"
+	select BR2_LEGACY
+	help
+	  The dsp-tools package was removed.
+
 config BR2_PACKAGE_GST_DSP
 	bool "gst-dsp package removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 8d995f8..2b645cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2097,7 +2097,6 @@ menu "System tools"
 	source "package/docker-containerd/Config.in"
 	source "package/docker-engine/Config.in"
 	source "package/docker-proxy/Config.in"
-	source "package/dsp-tools/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
 	source "package/emlog/Config.in"
diff --git a/package/dsp-tools/Config.in b/package/dsp-tools/Config.in
deleted file mode 100644
index 0267454..0000000
--- a/package/dsp-tools/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_DSP_TOOLS
-	bool "dsp-tools"
-	depends on BR2_cortex_a8
-	select BR2_PACKAGE_TIDSP_BINARIES
-	help
-	  Utilities for TI OMAP3 DSP.
-
-	  http://github.com/felipec/dsp-tools
diff --git a/package/dsp-tools/dsp-tools.hash b/package/dsp-tools/dsp-tools.hash
deleted file mode 100644
index cfcf06c..0000000
--- a/package/dsp-tools/dsp-tools.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256 734a1d5f21fb388bdbe64f7b599fef52357c3c72ff860f38456a352e7c1c3e78  dsp-tools-v2.0.tar.gz
diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
deleted file mode 100644
index ec63bcd..0000000
--- a/package/dsp-tools/dsp-tools.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# dsp-tools
-#
-################################################################################
-
-DSP_TOOLS_VERSION = v2.0
-DSP_TOOLS_SITE = $(call github,felipec,dsp-tools,$(DSP_TOOLS_VERSION))
-DSP_TOOLS_DEPENDENCIES = tidsp-binaries
-DSP_TOOLS_LICENSE = LGPL-2.1
-DSP_TOOLS_LICENSE_FILES = LICENSE
-
-define DSP_TOOLS_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
-endef
-
-define DSP_TOOLS_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
-- 
1.9.1
