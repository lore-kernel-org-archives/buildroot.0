From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue,  7 May 2013 15:47:00 -0500
Subject: [Buildroot] [PATCH v2 2/2] lockdev: add lockdev
In-Reply-To: <1367959620-17176-1-git-send-email-spenser@gillilanding.com>
References: <1367618887-25757-1-git-send-email-spenser@gillilanding.com>
 <1367959620-17176-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1367959620-17176-2-git-send-email-spenser@gillilanding.com>
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
 package/lockdev/lockdev.mk |   30 ++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/lockdev/Config.in
 create mode 100644 package/lockdev/lockdev.mk

diff --git a/package/Config.in b/package/Config.in
index 23af3f5..8498609 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -255,6 +255,7 @@ source "package/iostat/Config.in"
 source "package/irda-utils/Config.in"
 source "package/kbd/Config.in"
 source "package/lcdproc/Config.in"
+source "package/lockdev/Config.in"
 source "package/lm-sensors/Config.in"
 source "package/lshw/Config.in"
 source "package/lsuio/Config.in"
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
index 0000000..10a5929
--- /dev/null
+++ b/package/lockdev/lockdev.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# lockdev
+#
+#############################################################
+
+LOCKDEV_VERSION = 1.0.3
+LOCKDEV_SOURCE = lockdev_$(LOCKDEV_VERSION).orig.tar.gz
+LOCKDEV_SITE = http://ftp.debian.org/debian/pool/main/l/lockdev/
+LOCKDEV_LICENSE = LGPLv2.1
+LOCKDEV_LICENSE_FILE = LICENSE
+LOCKDEV_INSTALL_STAGING = YES
+
+define LOCKDEV_BUILD_CMDS
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) static shared
+endef
+
+define LOCKDEV_INSTALL_STAGING_CMDS
+	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) install
+	ln -sf $(STAGING_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
+	ln -sf $(STAGING_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1
+endef
+
+define LOCKDEV_INSTALL_TARGET_CMDS
+	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) install
+	ln -sf $(TARGET_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so
+	ln -sf $(TARGET_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.1
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
