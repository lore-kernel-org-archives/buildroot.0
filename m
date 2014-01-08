From: Andreas Naumann <anaumann@ultratronik.de>
Date: Wed,  8 Jan 2014 17:05:08 +0100
Subject: [Buildroot] [PATCH v3] evemu: new package
Message-ID: <1389197108-20536-1-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/Config.in       |  1 +
 package/evemu/Config.in |  7 +++++++
 package/evemu/evemu.mk  | 22 ++++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/evemu/Config.in
 create mode 100644 package/evemu/evemu.mk

diff --git a/package/Config.in b/package/Config.in
index e502cde..8af6a1e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -277,6 +277,7 @@ source "package/dmraid/Config.in"
 source "package/dvb-apps/Config.in"
 source "package/dvbsnoop/Config.in"
 source "package/eeprog/Config.in"
+source "package/evemu/Config.in"
 source "package/evtest/Config.in"
 source "package/fan-ctrl/Config.in"
 source "package/fconfig/Config.in"
diff --git a/package/evemu/Config.in b/package/evemu/Config.in
new file mode 100644
index 0000000..07b7174
--- /dev/null
+++ b/package/evemu/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_EVEMU
+	bool "evemu"
+	select BR2_PACKAGE_LIBEVDEV
+	help
+	  evemu records and replays device descriptions and events
+
+	  http://www.freedesktop.org/wiki/Evemu/
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
new file mode 100644
index 0000000..cebb2d0
--- /dev/null
+++ b/package/evemu/evemu.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# evemu
+#
+################################################################################
+
+EVEMU_VERSION = 1.0.10
+EVEMU_SITE = http://cgit.freedesktop.org/evemu/snapshot
+EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
+EVEMU_LICENSE_FILES = COPYING COPYING.GPL3
+
+# Uses PKG_CHECK_MODULES() in configure.ac
+EVEMU_DEPENDENCIES = host-pkgconf libevdev
+
+# Needs Python to generate a wrapper
+EVEMU_DEPENDENCIES += host-python
+
+# package source code coming from git, so it doesn't have generated
+# configure and Makefile.in
+EVEMU_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
1.8.4.1
