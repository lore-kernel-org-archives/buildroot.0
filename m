From: Christian Stewart <christian@paral.in>
Date: Tue,  9 May 2017 22:51:06 -0400
Subject: [Buildroot] [PATCH 1/3] dumb-init: new package
Message-ID: <20170510025108.21169-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dumb-init is a minimal init process to act as PID 1 for containers.

dumb-init can be used to satisfy docker-engine's docker-init binary
requirement.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                |  1 +
 package/dumb-init/Config.in      |  7 +++++++
 package/dumb-init/dumb-init.hash |  2 ++
 package/dumb-init/dumb-init.mk   | 22 ++++++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/dumb-init/Config.in
 create mode 100644 package/dumb-init/dumb-init.hash
 create mode 100644 package/dumb-init/dumb-init.mk

diff --git a/package/Config.in b/package/Config.in
index d57813c..b784f4a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1770,6 +1770,7 @@ comment "Utilities"
 	source "package/crudini/Config.in"
 	source "package/dialog/Config.in"
 	source "package/dtach/Config.in"
+	source "package/dumb-init/Config.in"
 	source "package/file/Config.in"
 	source "package/gnupg/Config.in"
 	source "package/gnupg2/Config.in"
diff --git a/package/dumb-init/Config.in b/package/dumb-init/Config.in
new file mode 100644
index 0000000..e817493
--- /dev/null
+++ b/package/dumb-init/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DUMB_INIT
+	bool "dumb-init"
+	help
+	  dumb-init is a simple but valid init binary to
+	  act as PID 1 for containers.
+
+	  https://github.com/Yelp/dumb-init
diff --git a/package/dumb-init/dumb-init.hash b/package/dumb-init/dumb-init.hash
new file mode 100644
index 0000000..4705ce4
--- /dev/null
+++ b/package/dumb-init/dumb-init.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	74486997321bd939cad2ee6af030f481d39751bc9aa0ece84ed55f864e309a3f	v1.2.0.tar.gz
diff --git a/package/dumb-init/dumb-init.mk b/package/dumb-init/dumb-init.mk
new file mode 100644
index 0000000..f06fe6a
--- /dev/null
+++ b/package/dumb-init/dumb-init.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# dumb-init
+#
+################################################################################
+
+DUMB_INIT_VERSION = v1.2.0
+DUMB_INIT_SITE = https://github.com/Yelp/dumb-init/archive
+DUMB_INIT_SOURCE = $(DUMB_INIT_VERSION).tar.gz
+DUMB_INIT_LICENSE = MIT
+DUMB_INIT_LICENSE_FILES = LICENSE
+
+define DUMB_INIT_BUILD_CMDS
+	$(TARGET_CC) \
+		-o $(@D)/dumb-init $(@D)/dumb-init.c
+endef
+
+define DUMB_INIT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/dumb-init $(TARGET_DIR)/usr/bin/dumb-init
+endef
+
+$(eval $(generic-package))
-- 
2.10.2
