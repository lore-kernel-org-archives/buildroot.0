From: Christian Stewart <christian@paral.in>
Date: Wed, 20 Sep 2017 04:02:03 +0100
Subject: [Buildroot] [PATCH 2/9] tini: new package
In-Reply-To: <20170920030210.19446-1-christian@paral.in>
References: <20170920030210.19446-1-christian@paral.in>
Message-ID: <20170920030210.19446-3-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tini is a minimal init process to act as PID 1 for containers.

Tini can be used to satisfy docker-engine's docker-init binary
requirement.

In many cases docker-init backing processes like Tini must be static, as
they are executed inside a container in an unknown environment. This
patch adds an option to specifically compile Tini statically, even if
the system is compiled dynamically.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in      |  1 +
 package/tini/Config.in | 21 +++++++++++++++++++++
 package/tini/tini.hash |  2 ++
 package/tini/tini.mk   | 41 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 package/tini/Config.in
 create mode 100644 package/tini/tini.hash
 create mode 100644 package/tini/tini.mk

diff --git a/package/Config.in b/package/Config.in
index 96f04dec7a..b3fb8fa222 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1851,6 +1851,7 @@ comment "Utilities"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
+	source "package/tini/Config.in"
 	source "package/tmux/Config.in"
 	source "package/which/Config.in"
 	source "package/xmlstarlet/Config.in"
diff --git a/package/tini/Config.in b/package/tini/Config.in
new file mode 100644
index 0000000000..323b9d17a1
--- /dev/null
+++ b/package/tini/Config.in
@@ -0,0 +1,21 @@
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
+config BR2_PACKAGE_TINI_STATIC
+	bool "build static"
+	help
+	  Enables static compilation for tini.
+
+endif
diff --git a/package/tini/tini.hash b/package/tini/tini.hash
new file mode 100644
index 0000000000..a4731bb791
--- /dev/null
+++ b/package/tini/tini.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	d624bb6fba3bc02701977813b7bdac9dfc9bdeedf88aff67066cf8948d2ec6ab	v0.14.0.tar.gz
diff --git a/package/tini/tini.mk b/package/tini/tini.mk
new file mode 100644
index 0000000000..6fa40e7920
--- /dev/null
+++ b/package/tini/tini.mk
@@ -0,0 +1,41 @@
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
+ifeq ($(BR2_PACKAGE_TINI_STATIC),y)
+TINI_CFLAGS += -static
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
2.13.5
