From: Christian Stewart <christian@paral.in>
Date: Fri, 16 Feb 2018 03:26:08 -0500
Subject: [Buildroot] [PATCH 01/10] dumb-init: new package
In-Reply-To: <20180216082617.12039-1-christian@paral.in>
References: <20180216082617.12039-1-christian@paral.in>
Message-ID: <20180216082617.12039-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dumb-init is a minimal init process to act as PID 1 for containers.

dumb-init can be used to satisfy docker-engine's docker-init binary
requirement.

In many cases docker-init backing processes like dumb-init must be static, as
they are executed inside a container in an unknown environment. This
patch includes an option to specifically compile dumb-init statically, even if
the system is compiled dynamically.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                |  1 +
 package/dumb-init/Config.in      |  7 +++++++
 package/dumb-init/dumb-init.hash |  2 ++
 package/dumb-init/dumb-init.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/dumb-init/Config.in
 create mode 100644 package/dumb-init/dumb-init.hash
 create mode 100644 package/dumb-init/dumb-init.mk

diff --git a/package/Config.in b/package/Config.in
index 9cd5d9c087..f90a9e7bad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1906,6 +1906,7 @@ comment "Utilities"
 	source "package/crudini/Config.in"
 	source "package/dialog/Config.in"
 	source "package/dtach/Config.in"
+	source "package/dumb-init/Config.in"
 	source "package/easy-rsa/Config.in"
 	source "package/file/Config.in"
 	source "package/gnupg/Config.in"
diff --git a/package/dumb-init/Config.in b/package/dumb-init/Config.in
new file mode 100644
index 0000000000..e817493605
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
index 0000000000..4705ce4368
--- /dev/null
+++ b/package/dumb-init/dumb-init.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	74486997321bd939cad2ee6af030f481d39751bc9aa0ece84ed55f864e309a3f	v1.2.0.tar.gz
diff --git a/package/dumb-init/dumb-init.mk b/package/dumb-init/dumb-init.mk
new file mode 100644
index 0000000000..3133384f5a
--- /dev/null
+++ b/package/dumb-init/dumb-init.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# dumb-init
+#
+################################################################################
+
+DUMB_INIT_VERSION = v1.2.0
+DUMB_INIT_SITE = $(call github,Yelp,dumb-init,$(DUMB_INIT_VERSION))
+
+DUMB_INIT_LICENSE = MIT
+DUMB_INIT_LICENSE_FILES = LICENSE
+DUMB_INIT_CFLAGS += -static
+
+define DUMB_INIT_BUILD_CMDS
+	$(TARGET_CC) \
+		$(DUMB_INIT_CFLAGS) \
+		-o $(@D)/dumb-init $(@D)/dumb-init.c
+endef
+
+define DUMB_INIT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/dumb-init $(TARGET_DIR)/usr/bin/dumb-init
+endef
+
+$(eval $(generic-package))
-- 
2.13.6
