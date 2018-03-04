From: Christian Stewart <christian@paral.in>
Date: Sat,  3 Mar 2018 19:43:40 -0500
Subject: [Buildroot] [PATCH v3 2/8] dumb-init: new package
In-Reply-To: <20180304004346.331-1-christian@paral.in>
References: <20180304004346.331-1-christian@paral.in>
Message-ID: <20180304004346.331-3-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dumb-init is a minimal init process to act as PID 1 for containers.

Static compilation is used, as dumb-init will typically be executed inside a
container.

dumb-init can satisfy docker-engine's docker-init requirement.

Signed-off-by: Christian Stewart <christian@paral.in>

---

Changes since v1:

 - Upgraded to v1.2.1
 - Added license hash
---
 package/Config.in                |  1 +
 package/dumb-init/Config.in      |  7 +++++++
 package/dumb-init/dumb-init.hash |  3 +++
 package/dumb-init/dumb-init.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/dumb-init/Config.in
 create mode 100644 package/dumb-init/dumb-init.hash
 create mode 100644 package/dumb-init/dumb-init.mk

diff --git a/package/Config.in b/package/Config.in
index 5bdaa24340..dd42db79ec 100644
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
index 0000000000..9e74ff5580
--- /dev/null
+++ b/package/dumb-init/dumb-init.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	56858088d9d6c911c227d196fcbfca06aff31fbe83e1519f9cabe5cf6f11b242	dumb-init-v1.2.1.tar.gz
+sha256	4d74123f166ad8f147e9939bfb451578db84823f22b48fd64b1086d3654a0149  LICENSE
diff --git a/package/dumb-init/dumb-init.mk b/package/dumb-init/dumb-init.mk
new file mode 100644
index 0000000000..4ebbff1930
--- /dev/null
+++ b/package/dumb-init/dumb-init.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# dumb-init
+#
+################################################################################
+
+DUMB_INIT_VERSION = v1.2.1
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
