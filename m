From: Gilles Talis <gilles.talis@gmail.com>
Date: Mon, 25 Mar 2013 12:26:05 -0700
Subject: [Buildroot] [PATCH v2] IOzone: new package
In-Reply-To: <y>
References: <y>
Message-ID: <1364239565-22135-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
Changes since V1:
* Removed erroneous use of IA64 build target
* Used generic build target for uClibc-based toolchains
* Factorized linux-arm and linux build targets

 package/Config.in        |    1 +
 package/iozone/Config.in |   13 +++++++++++++
 package/iozone/iozone.mk |   38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 package/iozone/Config.in
 create mode 100644 package/iozone/iozone.mk

diff --git a/package/Config.in b/package/Config.in
index be1aa99..766b9ae 100644
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
index 0000000..b6dfb18
--- /dev/null
+++ b/package/iozone/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_IOZONE
+	bool "IOzone"
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork()
+	help
+	  IOzone is a filesystem benchmark tool.
+	  The benchmark generates and measures a variety of file operations
+
+	  http://www.iozone.org/
+
+comment "IOzone requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
new file mode 100644
index 0000000..24ba515
--- /dev/null
+++ b/package/iozone/iozone.mk
@@ -0,0 +1,38 @@
+#############################################################
+#
+# IOZONE
+#
+#############################################################
+
+IOZONE_VERSION = 3_414
+IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
+IOZONE_SITE = http://www.iozone.org/src/current
+IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
+# IOzone license details can be found at:
+# http://www.iozone.org/docs/Iozone_License.txt
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+# aio.h is not available on uClibc. Select "generic" target that does not use it.
+IOZONE_TARGET = generic
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
