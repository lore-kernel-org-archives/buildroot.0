From: Christian Stewart <christian@paral.in>
Date: Tue,  9 May 2017 22:51:07 -0400
Subject: [Buildroot] [PATCH 2/3] tini: new package
In-Reply-To: <20170510025108.21169-1-christian@paral.in>
References: <20170510025108.21169-1-christian@paral.in>
Message-ID: <20170510025108.21169-2-christian@paral.in>
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
 package/Config.in      |  1 +
 package/tini/Config.in | 16 ++++++++++++++++
 package/tini/tini.hash |  2 ++
 package/tini/tini.mk   | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 package/tini/Config.in
 create mode 100644 package/tini/tini.hash
 create mode 100644 package/tini/tini.mk

diff --git a/package/Config.in b/package/Config.in
index b784f4a..5d4d21c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1784,6 +1784,7 @@ comment "Utilities"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
+	source "package/tini/Config.in"
 	source "package/tmux/Config.in"
 	source "package/which/Config.in"
 	source "package/xmlstarlet/Config.in"
diff --git a/package/tini/Config.in b/package/tini/Config.in
new file mode 100644
index 0000000..235fc1a
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
index 0000000..a4731bb
--- /dev/null
+++ b/package/tini/tini.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	d624bb6fba3bc02701977813b7bdac9dfc9bdeedf88aff67066cf8948d2ec6ab	v0.14.0.tar.gz
diff --git a/package/tini/tini.mk b/package/tini/tini.mk
new file mode 100644
index 0000000..7c40c33
--- /dev/null
+++ b/package/tini/tini.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# tini
+#
+################################################################################
+
+TINI_VERSION = v0.14.0
+TINI_SITE = https://github.com/krallin/tini/archive
+TINI_SOURCE = $(TINI_VERSION).tar.gz
+TINI_LICENSE = MIT
+TINI_LICENSE_FILES = LICENSE
+TINI_CFLAGS = $(TARGET_CFLAGS) -DTINI_VERSION=\"$(TINI_VERSION)\" -DTINI_GIT=\"\"
+
+ifeq ($(BR2_PACKAGE_TINI_MINIMAL),y)
+TINI_CFLAGS += -DTINI_MINIMAL
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+TINI_CFLAGS += -fstack-protector --param=ssp-buffer-size=4
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
2.10.2
