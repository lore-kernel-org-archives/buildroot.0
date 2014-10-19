From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:22:37 +0200
Subject: [Buildroot] [git commit] pps-tools: new package
Message-ID: <20141019152824.B23AFAF9CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7db4999254b64a52637cd36edeea14d9c6f6a56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added pps-tools package to add support to the ntpd for a
pps source (requires timepps.h from pps-tools as part of ntpd
build).

[Thomas:
  - Use $(TARGET_MAKE_ENV) at install time.
  - Alphabetic ordering in package/Config.in, noticed by Jerzy
    Grzegorek.]

Signed-off-by: Bryan Brinsko <bryan.brinsko@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/pps-tools/Config.in    |    6 ++++++
 package/pps-tools/pps-tools.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7b18715..89b46dc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -353,6 +353,7 @@ endif
 	source "package/pciutils/Config.in"
 	source "package/picocom/Config.in"
 	source "package/pifmrds/Config.in"
+	source "package/pps-tools/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
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
index 0000000..7876403
--- /dev/null
+++ b/package/pps-tools/pps-tools.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# pps-tools
+#
+################################################################################
+
+PPS_TOOLS_VERSION = 0deb9c7e135e9380a6d09e9d2e938a146bb698c8
+PPS_TOOLS_SITE = $(call github,ago,pps-tools,$(PPS_TOOLS_VERSION))
+PPS_TOOLS_INSTALL_STAGING = YES
+PPS_TOOLS_LICENSE = GPLv2+
+PPS_TOOLS_LICENSE_FILES = COPYING
+
+define PPS_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define PPS_TOOLS_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/sys $(STAGING_DIR)/usr/bin
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
+endef
+
+define PPS_TOOLS_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/include/sys $(TARGET_DIR)/usr/bin
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
