From: Christian Stewart <christian@paral.in>
Date: Wed, 18 Oct 2017 20:22:46 -0400
Subject: [Buildroot] [PATCH 01/12] dumb-init: new package
Message-ID: <20171019002257.27646-1-christian@paral.in>
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
 package/dumb-init/Config.in      | 16 ++++++++++++++++
 package/dumb-init/dumb-init.hash |  2 ++
 package/dumb-init/dumb-init.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 package/dumb-init/Config.in
 create mode 100644 package/dumb-init/dumb-init.hash
 create mode 100644 package/dumb-init/dumb-init.mk

diff --git a/package/Config.in b/package/Config.in
index a27f55aec1..c161634daf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1862,6 +1862,7 @@ comment "Utilities"
 	source "package/crudini/Config.in"
 	source "package/dialog/Config.in"
 	source "package/dtach/Config.in"
+	source "package/dumb-init/Config.in"
 	source "package/file/Config.in"
 	source "package/easy-rsa/Config.in"
 	source "package/gnupg/Config.in"
diff --git a/package/dumb-init/Config.in b/package/dumb-init/Config.in
new file mode 100644
index 0000000000..56ca6dc7b1
--- /dev/null
+++ b/package/dumb-init/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_DUMB_INIT
+	bool "dumb-init"
+	help
+	  dumb-init is a simple but valid init binary to act as PID 1 for
+	  containers.
+
+	  https://github.com/Yelp/dumb-init
+
+if BR2_PACKAGE_DUMB_INIT
+
+config BR2_PACKAGE_DUMB_INIT_STATIC
+	bool "build static"
+	help
+	  Enables static compilation for dumb-init.
+
+endif
diff --git a/package/dumb-init/dumb-init.hash b/package/dumb-init/dumb-init.hash
new file mode 100644
index 0000000000..e7987b36e2
--- /dev/null
+++ b/package/dumb-init/dumb-init.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	74486997321bd939cad2ee6af030f481d39751bc9aa0ece84ed55f864e309a3f	dumb-init-v1.2.0.tar.gz
diff --git a/package/dumb-init/dumb-init.mk b/package/dumb-init/dumb-init.mk
new file mode 100644
index 0000000000..f2855122fb
--- /dev/null
+++ b/package/dumb-init/dumb-init.mk
@@ -0,0 +1,28 @@
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
+DUMB_INIT_CFLAGS=$(TARGET_CFLAGS) $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_PACKAGE_DUMB_INIT_STATIC),y)
+DUMB_INIT_CFLAGS += -static
+endif
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
