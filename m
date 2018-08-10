From: Christian Stewart <christian@paral.in>
Date: Fri, 10 Aug 2018 11:42:55 -0700
Subject: [Buildroot] [PATCH v1 1/1] tini: new package
Message-ID: <20180810184255.17612-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tini is a minimal init process to act as PID 1 for containers.

Note: it is not necessary to compile Tini statically for many non-docker
container environments, and Docker now statically links to Tini internally (as
of 1.13).

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in      |  1 +
 package/tini/Config.in | 16 ++++++++++++++++
 package/tini/tini.hash |  3 +++
 package/tini/tini.mk   | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+)
 create mode 100644 package/tini/Config.in
 create mode 100644 package/tini/tini.hash
 create mode 100644 package/tini/tini.mk

diff --git a/package/Config.in b/package/Config.in
index f5a17492c7..fa8e36747d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1996,6 +1996,7 @@ comment "Utilities"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
+	source "package/tini/Config.in"
 	source "package/tmux/Config.in"
 	source "package/which/Config.in"
 	source "package/xmlstarlet/Config.in"
diff --git a/package/tini/Config.in b/package/tini/Config.in
new file mode 100644
index 0000000000..235fc1a8fb
--- /dev/null
+++ b/package/tini/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_TINI
+	bool "tini"
+	help
+	  tini is a simple but valid init binary to
+	  act as PID 1 for containers.
+
+	  https://github.com/krallin/tini
+
+if BR2_PACKAGE_TINI
+
+config BR2_PACKAGE_TINI_MINIMAL
+	bool "build minimal variant"
+	help
+	  Disables argument parsing and verbose output.
+
+endif
diff --git a/package/tini/tini.hash b/package/tini/tini.hash
new file mode 100644
index 0000000000..34f919f068
--- /dev/null
+++ b/package/tini/tini.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	e5f46bca81266bdd511cf08018d66866870531794569c04f9b45f50dd23c28b0	LICENSE
+sha256	1097675352d6317b547e73f9dc7c6839fd0bb0d96dafc2e5c95506bb324049a2  tini-v0.18.0.tar.gz
diff --git a/package/tini/tini.mk b/package/tini/tini.mk
new file mode 100644
index 0000000000..f4ec63020b
--- /dev/null
+++ b/package/tini/tini.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# tini
+#
+################################################################################
+
+TINI_VERSION = v0.18.0
+TINI_SITE = $(call github,krallin,tini,$(TINI_VERSION))
+
+TINI_LICENSE = MIT
+TINI_LICENSE_FILES = LICENSE
+
+TINI_CFLAGS = $(TARGET_CFLAGS) \
+	-DTINI_VERSION=\"$(TINI_VERSION)\" \
+	-DTINI_GIT=\"\"
+
+ifeq ($(BR2_PACKAGE_TINI_MINIMAL),y)
+TINI_CFLAGS += -DTINI_MINIMAL
+endif
+
+define TINI_CONFIGURE_CMDS
+	printf "#pragma once\n" > $(@D)/src/tiniConfig.h
+endef
+
+define TINI_BUILD_CMDS
+	mkdir -p $(@D)/bin
+	$(TARGET_CC) \
+		$(TINI_CFLAGS) \
+		-o $(@D)/bin/tini $(@D)/src/tini.c
+endef
+
+define TINI_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/tini $(TARGET_DIR)/usr/bin/tini
+endef
+
+# Tini's CMakeLists.txt is not suitable for Buildroot.
+$(eval $(generic-package))
-- 
2.16.4
