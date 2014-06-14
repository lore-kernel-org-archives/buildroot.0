From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 18:55:18 +0200
Subject: [Buildroot] [git commit] fmlib: new package
Message-ID: <20140614170014.8268A9CFE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68d35f7d92d40f8d470751269e6ee9e398b15a1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/fmlib/Config.in |   14 ++++++++++++++
 package/fmlib/fmlib.mk  |   36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 88705f8..b29763c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -718,6 +718,7 @@ menu "Networking"
 	source "package/cppzmq/Config.in"
 	source "package/czmq/Config.in"
 	source "package/filemq/Config.in"
+	source "package/fmlib/Config.in"
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
