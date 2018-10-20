From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 20 Oct 2018 14:42:54 -0500
Subject: [Buildroot] [PATCH v2 2/2] package/rcw: new package
In-Reply-To: <1540064574-54964-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1540064574-54964-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1540064574-54964-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>

This package adds NXP Layerscape and QoriQ reset config word
(RCW) / pre-bootloader (PBL) generation support.

The RCW is used to setup clocking and IO allocaitons and then launches
the next stage of boot (usually u-boot).

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes v1 -> v2
[Thomas / Yann
 - Split out the basic package from the one providing the
   ability to do a custom board
---
 DEVELOPERS                 |  1 +
 package/Config.in.host     |  1 +
 package/rcw/Config.in.host | 11 +++++++++++
 package/rcw/rcw.hash       |  3 +++
 package/rcw/rcw.mk         | 19 +++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/rcw/Config.in.host
 create mode 100644 package/rcw/rcw.hash
 create mode 100644 package/rcw/rcw.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 17db96a..9d5f3f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1434,6 +1434,7 @@ F:	package/python-posix-ipc/
 F:	package/python-pypcap/
 F:	package/python-pyrex/
 F:	package/raptor/
+F:	package/rcw/
 F:	package/rng-tools/
 F:	package/rsyslog/
 F:	package/setools/
diff --git a/package/Config.in.host b/package/Config.in.host
index 3a3578c..b51563e 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -52,6 +52,7 @@ menu "Host utilities"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
+	source "package/rcw/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
diff --git a/package/rcw/Config.in.host b/package/rcw/Config.in.host
new file mode 100644
index 0000000..74b1e97
--- /dev/null
+++ b/package/rcw/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_RCW
+	bool "host rcw"
+	help
+	  This package provides an reset configuration word(RCW)
+	  compiler to build NXP QoriQ/LS PBL/RCW binary(s).
+
+	  The package installs example configurations and scripts
+	  for each devkit supported in the current release see
+	  $(HOST_DIR)/share/rcw.
+
+	  https://github.com/qoriq-open-source/rcw
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
index 0000000..0a69c10
--- /dev/null
+++ b/package/rcw/rcw.mk
@@ -0,0 +1,19 @@
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
+
+# Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
+# could use a post image or SDK to build/install PBL files.
+define HOST_RCW_INSTALL_CMDS
+	mkdir -p  $(HOST_DIR)/share/rcw
+	cp -a $(@D)/* $(HOST_DIR)/share/rcw
+endef
+
+$(eval $(host-generic-package))
-- 
1.9.1
