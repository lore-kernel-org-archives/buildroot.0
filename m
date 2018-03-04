From: Christian Stewart <christian@paral.in>
Date: Sat,  3 Mar 2018 19:43:39 -0500
Subject: [Buildroot] [PATCH v3 1/8] tini: new package
In-Reply-To: <20180304004346.331-1-christian@paral.in>
References: <20180304004346.331-1-christian@paral.in>
Message-ID: <20180304004346.331-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tini is a minimal init process to act as PID 1 for containers.

Tini can be used to satisfy docker-engine's docker-init binary
requirement.

Signed-off-by: Christian Stewart <christian@paral.in>

---

Changes since v2:

 - Upgraded to v0.17.0
 - Added hash for license file
---
 package/Config.in      |  1 +
 package/tini/Config.in | 16 ++++++++++++++++
 package/tini/tini.hash |  3 +++
 package/tini/tini.mk   | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 package/tini/Config.in
 create mode 100644 package/tini/tini.hash
 create mode 100644 package/tini/tini.mk

diff --git a/package/Config.in b/package/Config.in
index 9cd5d9c087..5bdaa24340 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1921,6 +1921,7 @@ comment "Utilities"
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
index 0000000000..c4f85c43b0
--- /dev/null
+++ b/package/tini/tini.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	5244691718f6856db74dcf6dbb3576a901e737f41412e7895747f0ccb4ccaff0	tini-v0.17.0.tar.gz
+sha256	e5f46bca81266bdd511cf08018d66866870531794569c04f9b45f50dd23c28b0	LICENSE
diff --git a/package/tini/tini.mk b/package/tini/tini.mk
new file mode 100644
index 0000000000..9f9d986745
--- /dev/null
+++ b/package/tini/tini.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# tini
+#
+################################################################################
+
+TINI_VERSION = v0.17.0
+TINI_SITE = $(call github,krallin,tini,$(TINI_VERSION))
+
+TINI_LICENSE = MIT
+TINI_LICENSE_FILES = LICENSE
+
+TINI_CFLAGS = $(TARGET_CFLAGS) -DTINI_VERSION=\"$(TINI_VERSION)\" -DTINI_GIT=\"\"
+TINI_CFLAGS += -static
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
+	$(TARGET_CC) \
+		$(TINI_CFLAGS) \
+		-o $(@D)/tini $(@D)/src/tini.c
+endef
+
+define TINI_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/tini $(TARGET_DIR)/usr/bin/tini
+endef
+
+# Tini's CMakeLists.txt is not suitable for Buildroot.
+$(eval $(generic-package))
-- 
2.13.6
