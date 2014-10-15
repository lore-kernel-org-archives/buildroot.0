From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 15 Oct 2014 15:37:54 -0500
Subject: [Buildroot] [PATCH 1/2] pps-tools: new package
Message-ID: <1413405475-5179-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bryan Brinsko <bryan.brinsko@rockwellcollins.com>

Added pps-tools package to add support to the ntpd for a
pps source (requires timepps.h from pps-tools as part of ntpd
build).

Signed-off-by: Bryan Brinsko <bryan.brinsko@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in              |  1 +
 package/pps-tools/Config.in    |  6 ++++++
 package/pps-tools/pps-tools.mk | 28 ++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/pps-tools/Config.in
 create mode 100644 package/pps-tools/pps-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 93e148d..8c109a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -351,6 +351,7 @@ endif
 	source "package/parted/Config.in"
 	source "package/pciutils/Config.in"
 	source "package/picocom/Config.in"
+	source "package/pps-tools/Config.in"
 	source "package/pifmrds/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
diff --git a/package/pps-tools/Config.in b/package/pps-tools/Config.in
new file mode 100644
index 0000000..83308f4
--- /dev/null
+++ b/package/pps-tools/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PPS_TOOLS
+	bool "pps-tools"
+	help
+	  Pulse per second tools. Provides timepps.h and other PPS utilities.
+
+	  https://github.com/ago/pps-tools/
diff --git a/package/pps-tools/pps-tools.mk b/package/pps-tools/pps-tools.mk
new file mode 100644
index 0000000..4ebfb1e
--- /dev/null
+++ b/package/pps-tools/pps-tools.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# pps-tools
+#
+################################################################################
+PPS_TOOLS_VERSION = 0deb9c7e135e9380a6d09e9d2e938a146bb698c8
+PPS_TOOLS_SITE = https://github.com/ago/pps-tools.git
+PPS_TOOLS_SITE_METHOD = git
+PPS_TOOLS_INSTALL_STAGING = YES
+PPS_TOOLS_LICENSE = GPLv2
+PPS_TOOLS_LICENSE_FILES = COPYING
+
+define PPS_TOOLS_BUILD_CMDS
+	$(MAKE) CC=$(TARGET_CC) -C $(@D) all
+endef
+
+define PPS_TOOLS_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/timepps.h $(STAGING_DIR)/usr/include/timepps.h
+endef
+
+define PPS_TOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/ppsctl $(TARGET_DIR)/usr/bin/ppsctl
+	$(INSTALL) -D -m 0755 $(@D)/ppsfind $(TARGET_DIR)/usr/bin/ppsfind
+	$(INSTALL) -D -m 0755 $(@D)/ppstest $(TARGET_DIR)/usr/bin/ppstest
+	$(INSTALL) -D -m 0755 $(@D)/ppswatch $(TARGET_DIR)/usr/bin/ppswatch
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
