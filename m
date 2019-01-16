From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 16 Jan 2019 06:39:52 -0600
Subject: [Buildroot] [PATCH v4] package/rcw: new package
Message-ID: <1547642392-62663-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>

This package adds NXP Layerscape and QoriQ reset config word
(RCW) / pre-bootloader (PBL) generation support.

The RCW is used to setup clocking and IO allocations and then launches
the next stage of boot (usually u-boot).

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v3 -> v4
 - Updated to use Aurora GIT repository
 - Bumped to version LSDK-18.12

v2 -> v3
 - Fixed bad patch format

v1 -> v2
[Thomas / Yann
 - Split out the basic package from the one providing the
   ability to do a custom board
---
 DEVELOPERS                 |  1 +
 package/Config.in.host     |  1 +
 package/rcw/Config.in.host | 12 ++++++++++++
 package/rcw/rcw.hash       |  3 +++
 package/rcw/rcw.mk         | 20 ++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/rcw/Config.in.host
 create mode 100644 package/rcw/rcw.hash
 create mode 100644 package/rcw/rcw.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c1950bb..a855bde 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1456,6 +1456,7 @@ F:	package/python-posix-ipc/
 F:	package/python-pypcap/
 F:	package/python-pyrex/
 F:	package/raptor/
+F:	package/rcw/
 F:	package/rng-tools/
 F:	package/rsyslog/
 F:	package/setools/
diff --git a/package/Config.in.host b/package/Config.in.host
index 16b474f..ed254e1 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -53,6 +53,7 @@ menu "Host utilities"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
+	source "package/rcw/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
diff --git a/package/rcw/Config.in.host b/package/rcw/Config.in.host
new file mode 100644
index 0000000..ba40f76
--- /dev/null
+++ b/package/rcw/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_RCW
+	bool "host rcw"
+	help
+	  This package provides an reset configuration word(RCW)
+	  compiler to build NXP QoriQ/LS PBL/RCW binary(s).
+
+	  The package installs example configurations and scripts
+	  for each devkit supported in the current release see
+	  $(HOST_DIR)/share/rcw. Either a SDK or post scripts can
+	  then use this toolset and examples.
+
+	  https://source.codeaurora.org/external/qoriq/qoriq-components/rcw/
diff --git a/package/rcw/rcw.hash b/package/rcw/rcw.hash
new file mode 100644
index 0000000..7de1ec6
--- /dev/null
+++ b/package/rcw/rcw.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 1421ada9fec10b12ff21cd9ad82f0a835b191cb2dde80f03547764574b1346c3 rcw-LSDK-18.12.tar.gz
+sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd LICENSE
diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
new file mode 100644
index 0000000..f4570b9
--- /dev/null
+++ b/package/rcw/rcw.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# rcw
+#
+################################################################################
+
+RCW_VERSION = LSDK-18.12
+RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
+RCW_SITE_METHOD = git
+RCW_LICENSE = BSD-3-Clause
+RCW_LICENSE_FILES = LICENSE
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
