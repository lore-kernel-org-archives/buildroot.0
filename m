From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 13 Mar 2013 10:31:57 -0700
Subject: [Buildroot] [PATCH] iozone: new package
In-Reply-To: <y>
References: <y>
Message-ID: <1363195917-13185-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/Config.in        |    1 +
 package/iozone/Config.in |   14 ++++++++++++++
 package/iozone/iozone.mk |   43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 package/iozone/Config.in
 create mode 100644 package/iozone/iozone.mk

diff --git a/package/Config.in b/package/Config.in
index a65054c..4d1aa67 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -22,6 +22,7 @@ source "package/cache-calibrator/Config.in"
 source "package/dhrystone/Config.in"
 source "package/dstat/Config.in"
 source "package/dmalloc/Config.in"
+source "package/iozone/Config.in"
 source "package/kexec/Config.in"
 source "package/latencytop/Config.in"
 source "package/lmbench/Config.in"
diff --git a/package/iozone/Config.in b/package/iozone/Config.in
new file mode 100644
index 0000000..f07e65c
--- /dev/null
+++ b/package/iozone/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_IOZONE
+	bool "IOzone"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork()
+	help
+	  IOzone is a filesystem benchmark tool.
+	  The benchmark generates and measures a variety of file operations
+
+	  http://www.iozone.org/
+
+comment "IOzone requires a toolchain with LARGEFILE and threads support"
+	depends on !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS)
+
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
new file mode 100644
index 0000000..2a046bc
--- /dev/null
+++ b/package/iozone/iozone.mk
@@ -0,0 +1,43 @@
+#############################################################
+#
+# IOZONE
+#
+#############################################################
+
+IOZONE_MAJOR_VERSION = 3
+IOZONE_MINOR_VERSION = 414
+IOZONE_VERSION = $(IOZONE_MAJOR_VERSION)_$(IOZONE_MINOR_VERSION)
+
+IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
+IOZONE_SITE = http://www.iozone.org/src/current
+IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
+# IOzone license details can be found at:
+# http://www.iozone.org/docs/Iozone_License.txt
+
+
+ifeq ($(BR2_arm)$(BR2_armeb),y)
+IOZONE_TARGET = linux-arm
+else ifeq ($(BR2_x86_64),y)
+IOZONE_TARGET = linux-ia64
+else ifeq ($(BR2_powerpc),y)
+IOZONE_TARGET = linux-powerpc
+else ifeq ($(BR2_sparc),y)
+IOZONE_TARGET = linux-sparc
+else
+IOZONE_TARGET = linux
+endif
+
+define IOZONE_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(IOZONE_TARGET) -C $(@D)/src/current
+endef
+
+define IOZONE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/src/current/iozone \
+		$(TARGET_DIR)/usr/bin/iozone
+endef
+
+define IOZONE_CLEAN_CMDS
+       $(MAKE) -C $(@D)/src/current clean
+endef
+
+$(eval $(generic-package))
-- 
1.7.4.1
