From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 21:47:08 +0100
Subject: [Buildroot] [git commit] aoetools: new package
Message-ID: <20180115204711.328D183D50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a3ee648d61735135811e82c6733556117c9f52d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The aoetools are programs for users of the ATA over Ethernet (AoE)
network storage protocol, a simple protocol for using storage over an
ethernet LAN.

Tested on Beaglebone Black.

Build tested with test-pkg.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
[Thomas:
 - fix check-package warnings
 - use SPDX license code, GPL-2.0
 - use github helper
 - pass TARGET_CONFIGURE_OPTS instead of just CC]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/aoetools/Config.in     | 12 ++++++++++++
 package/aoetools/aoetools.hash |  5 +++++
 package/aoetools/aoetools.mk   | 21 +++++++++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bbe9d40..1c77763 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1583,6 +1583,7 @@ F:	package/rtl8189fs/
 F:	package/xr819-xradio/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
+F:	package/aoetools/
 F:	package/curlpp/
 F:	package/daq/
 F:	package/libgdiplus/
diff --git a/package/Config.in b/package/Config.in
index 01f4095..9625dae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1615,6 +1615,7 @@ endmenu
 
 menu "Networking applications"
 	source "package/aircrack-ng/Config.in"
+	source "package/aoetools/Config.in"
 	source "package/apache/Config.in"
 	source "package/argus/Config.in"
 	source "package/arp-scan/Config.in"
diff --git a/package/aoetools/Config.in b/package/aoetools/Config.in
new file mode 100644
index 0000000..70a838f
--- /dev/null
+++ b/package/aoetools/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_AOETOOLS
+	bool "aoetools"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  The aoetools are programs for users of the ATA over Ethernet
+	  (AoE) network storage protocol, a simple protocol for using
+	  storage over an ethernet LAN.
+
+	  http://aoetools.sourceforge.net/
+
+comment "aoetools needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/aoetools/aoetools.hash b/package/aoetools/aoetools.hash
new file mode 100644
index 0000000..76c3056
--- /dev/null
+++ b/package/aoetools/aoetools.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256 477e796f5c18e8c0e61b5d88e1759c68249e8e0210c2f3de2b98680e2cc63e32  aoetools-37.tar.gz
+
+# Hash for license files:
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/aoetools/aoetools.mk b/package/aoetools/aoetools.mk
new file mode 100644
index 0000000..3f6340f
--- /dev/null
+++ b/package/aoetools/aoetools.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# aoetools
+#
+################################################################################
+
+AOETOOLS_VERSION = 37
+AOETOOLS_SITE = $(call github,OpenAoE,aoetools,aoetools-$(AOETOOLS_VERSION))
+AOETOOLS_LICENSE = GPL-2.0
+AOETOOLS_LICENSE_FILES = COPYING
+
+define AOETOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define AOETOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) \
+		-C $(@D) install
+endef
+
+$(eval $(generic-package))
