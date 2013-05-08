From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed,  8 May 2013 13:55:26 -0500
Subject: [Buildroot] [PATCH v4 1/2] lockdev: add lockdev
In-Reply-To: <1367964142-23036-1-git-send-email-spenser@gillilanding.com>
References: <1367964142-23036-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368039327-10007-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add lockdev a package for locking devices.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/Config.in          |    1 +
 package/lockdev/Config.in  |    4 ++++
 package/lockdev/lockdev.mk |   41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 package/lockdev/Config.in
 create mode 100644 package/lockdev/lockdev.mk

diff --git a/package/Config.in b/package/Config.in
index 81a3f76..05e2d45 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -256,6 +256,7 @@ source "package/irda-utils/Config.in"
 source "package/kbd/Config.in"
 source "package/lcdproc/Config.in"
 source "package/lm-sensors/Config.in"
+source "package/lockdev/Config.in"
 source "package/lshw/Config.in"
 source "package/lsuio/Config.in"
 source "package/lvm2/Config.in"
diff --git a/package/lockdev/Config.in b/package/lockdev/Config.in
new file mode 100644
index 0000000..2bd75d1
--- /dev/null
+++ b/package/lockdev/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_LOCKDEV
+	bool "lockdev"
+	help
+	  library for locking devices
diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
new file mode 100644
index 0000000..9b6efa8
--- /dev/null
+++ b/package/lockdev/lockdev.mk
@@ -0,0 +1,41 @@
+#############################################################
+#
+# lockdev
+#
+#############################################################
+
+LOCKDEV_VERSION = 1.0.3
+LOCKDEV_SOURCE = lockdev_$(LOCKDEV_VERSION).orig.tar.gz
+LOCKDEV_SITE = http://snapshot.debian.org/archive/debian/20130508T154517Z/pool/main/l/lockdev/ 
+LOCKDEV_LICENSE = LGPLv2.1
+LOCKDEV_LICENSE_FILES = LICENSE
+LOCKDEV_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+define LOCKDEV_BUILD_CMDS
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) static
+endef
+
+define LOCKDEV_INSTALL_STAGING_CMDS
+	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) install_dev
+endef
+
+else # BR2_PREFER_STATIC_LIB
+
+define LOCKDEV_BUILD_CMDS
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) static shared
+endef
+
+define LOCKDEV_INSTALL_STAGING_CMDS
+	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) install_dev install_run
+	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
+	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1
+endef
+
+define LOCKDEV_INSTALL_TARGET_CMDS
+	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) install_run
+	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1
+endef
+endif # BR2_PREFER_STATIC_LIB
+
+$(eval $(generic-package))
-- 
1.7.9.5
