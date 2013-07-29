From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jul 2013 21:23:04 +0200
Subject: [Buildroot] [git commit] lockdev: add lockdev
Message-ID: <20130729192308.44C069AE88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f2a007480cab92c359432b9fa307eb48c5510086
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add lockdev a package for locking devices.

[Thomas: change location in menuconfig, reformat header in .mk file.]

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/lockdev/Config.in  |    6 ++++++
 package/lockdev/lockdev.mk |   41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ed373de..5189b23 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -443,6 +443,7 @@ source "package/libconfuse/Config.in"
 source "package/libfuse/Config.in"
 source "package/liblockfile/Config.in"
 source "package/libsysfs/Config.in"
+source "package/lockdev/Config.in"
 endmenu
 
 menu "Graphics"
diff --git a/package/lockdev/Config.in b/package/lockdev/Config.in
new file mode 100644
index 0000000..4b386f4
--- /dev/null
+++ b/package/lockdev/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LOCKDEV
+	bool "lockdev"
+	help
+	  Library for locking devices.
+
+	  No upstream site, primary site is Debian.
diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
new file mode 100644
index 0000000..004b637
--- /dev/null
+++ b/package/lockdev/lockdev.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# lockdev
+#
+################################################################################
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
