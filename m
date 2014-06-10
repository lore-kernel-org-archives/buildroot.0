From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Jun 2014 08:02:04 -0700
Subject: [Buildroot] [PATCH 1/3] fmlib: new package
In-Reply-To: <1402412526-24844-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1402412526-24844-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1402412526-24844-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in       |    1 +
 package/fmlib/Config.in |    9 +++++++++
 package/fmlib/fmlib.mk  |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
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
index 0000000..43f7aa3
--- /dev/null
+++ b/package/fmlib/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_FMLIB
+	bool "fmlib"
+	depends on BR2_powerpc_e500mc
+	help
+	  The Frame Manager library provides an API on top of the Frame Manager driver
+	  ioctl calls, that provides a user space application with a simple way
+	  to configure driver parameters and PCD (parse - classify - distribute) rules.
+
+	  http://git.freescale.com/git/cgit.cgi/ppc/sdk/fmlib.git/tree/README
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
new file mode 100644
index 0000000..b2dedaa
--- /dev/null
+++ b/package/fmlib/fmlib.mk
@@ -0,0 +1,33 @@
+#############################################################
+#
+# fmlib
+#
+#############################################################
+
+FMLIB_VERSION = fsl-sdk-v1.5-rc3
+FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
+FMLIB_LICENSE = BSD-c3
+FMLIB_LICENSE_FILES = COPYING
+FMLIB_DEPENDENCIES = linux
+FMLIB_INSTALL_STAGING = YES
+FMLIB_INSTALL_TARGET = NO
+
+FMLIB_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	KERNEL_SRC="$(LINUX_DIR)" \
+	PREFIX="$(STAGING_DIR)/usr"
+
+ifeq ($(BR2_powerpc_e500mc), y)
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
