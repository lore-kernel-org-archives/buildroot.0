From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Mon, 15 Jan 2018 07:08:51 -0200
Subject: [Buildroot] [PATCH] aoetools: new package
Message-ID: <1516007331-17509-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The aoetools are programs for users of the ATA over Ethernet (AoE)
network storage protocol, a simple protocol for using storage over an
ethernet LAN.

Tested on Beaglebone Black.

Build tested with test-pkg.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/aoetools/Config.in     | 12 ++++++++++++
 package/aoetools/aoetools.hash |  5 +++++
 package/aoetools/aoetools.mk   | 22 ++++++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/aoetools/Config.in
 create mode 100644 package/aoetools/aoetools.hash
 create mode 100644 package/aoetools/aoetools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f7d051e8a98..ec960dee9ab1 100644
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
index 01f4095be5aa..9625dae121d3 100644
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
index 000000000000..25623743b884
--- /dev/null
+++ b/package/aoetools/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_AOETOOLS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	bool "aoetools"
+	help
+	  The aoetools are programs for users of the ATA over Ethernet (AoE)
+	  network storage protocol, a simple protocol for using storage over
+	  an ethernet LAN.
+
+	  http://aoetools.sourceforge.net/
+
+comment "aoetools needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/aoetools/aoetools.hash b/package/aoetools/aoetools.hash
new file mode 100644
index 000000000000..76c305624d5e
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
index 000000000000..e11a4f72f924
--- /dev/null
+++ b/package/aoetools/aoetools.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# aoetools
+#
+################################################################################
+
+AOETOOLS_VERSION = 37
+AOETOOLS_SITE = https://github.com/OpenAoE/aoetools/archive
+
+AOETOOLS_LICENSE = GPLv2
+AOETOOLS_LICENSE_FILES = COPYING
+
+define AOETOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
+endef
+
+define AOETOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) \
+		-C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
