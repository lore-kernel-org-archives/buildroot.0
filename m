From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Jun 2014 19:50:28 -0700
Subject: [Buildroot] [PATCH v2 1/3] fmlib: new package
Message-ID: <1402455030-18008-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---

Changes v1 -> v2:
   - Fixed Config.in to have linux depend and comment when linux
     is not selected (Thomas P)
   - Fixed line wrap in Config.in description. (Thomas P)
   - Updated license to be BSD-3c or GPLv2+ (Thomas P)
   - Added comment about the pkg just being a static lib (Thomas P)
   - Removed extra space in arch conditional (Thomas P)
---
 package/Config.in       |    1 +
 package/fmlib/Config.in |   14 ++++++++++++++
 package/fmlib/fmlib.mk  |   36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 package/fmlib/Config.in
 create mode 100644 package/fmlib/fmlib.mk

diff --git a/package/Config.in b/package/Config.in
index 1706197..60118ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -715,6 +715,7 @@ source "package/c-ares/Config.in"
 source "package/cppzmq/Config.in"
 source "package/czmq/Config.in"
 source "package/filemq/Config.in"
+source "package/fmlib/Config.in"
 source "package/glib-networking/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
new file mode 100644
index 0000000..f9b09c6
--- /dev/null
+++ b/package/fmlib/Config.in
@@ -0,0 +1,14 @@
+comment "fmlib needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_FMLIB
+	bool "fmlib"
+	depends on BR2_powerpc_e500mc
+	depends on BR2_LINUX_KERNEL
+	help
+	  The Frame Manager library provides Freescale PowerPC platforms an
+	  API on top of the Frame Manager driver ioctl calls, that provides
+	  a user space application with a simple way to configure driver
+	  parameters and PCD (parse - classify - distribute) rules.
+
+	  http://git.freescale.com/git/cgit.cgi/ppc/sdk/fmlib.git/tree/README
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
new file mode 100644
index 0000000..8fca0cd
--- /dev/null
+++ b/package/fmlib/fmlib.mk
@@ -0,0 +1,36 @@
+#############################################################
+#
+# fmlib
+#
+#############################################################
+
+FMLIB_VERSION = fsl-sdk-v1.5-rc3
+FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
+FMLIB_LICENSE = BSD-3c GPLv2+
+FMLIB_LICENSE_FILES = COPYING
+FMLIB_DEPENDENCIES = linux
+FMLIB_INSTALL_STAGING = YES
+
+# This package installs a static library only, so there's
+# nothing to install to the target
+FMLIB_INSTALL_TARGET = NO
+
+FMLIB_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	KERNEL_SRC="$(LINUX_DIR)" \
+	PREFIX="$(STAGING_DIR)/usr"
+
+ifeq ($(BR2_powerpc_e500mc),y)
+	FMLIB_ARCHTYPE = ppce500mc
+endif
+
+define FMLIB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPTS) -C $(@D) libfm-$(FMLIB_ARCHTYPE).a
+endef
+
+define FMLIB_INSTALL_STAGING_CMDS
+	$(FMLIB_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPTS) -C $(@D) install-libfm-$(FMLIB_ARCHTYPE)
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
