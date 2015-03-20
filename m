From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 20 Mar 2015 13:56:29 +0100
Subject: [Buildroot] [PATCH v5] package/sysdig: New package
Message-ID: <1426856189-8223-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sysdig is open source, system-level exploration:
capture system state and activity from a running Linux
instance, then save, filter and analyze.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v4 -> v5:
  - Adjusted to 80 columns for sysdig.mk header

Changes v3 -> v4:
  - Changed "depends on" to "select" and fixed selected packages
    dependencies.
  - moved "comment" section to the bottom

Changes v2 -> v3:
  - Changed "depends on" and "select" to simplify package

Changes v1 -> v2:
  - Changed "depends on" with "select" for dependencies (suggested by Baruch)
  - Added comment "sysdig needs a Linux kernel to be built" (suggested by Baruch)
  - Upgreded to recently released 0.1.99


 package/Config.in        |  1 +
 package/sysdig/Config.in | 21 +++++++++++++++++++++
 package/sysdig/sysdig.mk | 22 ++++++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 package/sysdig/Config.in
 create mode 100644 package/sysdig/sysdig.mk

diff --git a/package/Config.in b/package/Config.in
index fce92a8..6596292 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -95,6 +95,7 @@ endif
 	source "package/strace/Config.in"
 	source "package/stress/Config.in"
 	source "package/sysprof/Config.in"
+	source "package/sysdig/Config.in"
 	source "package/tinymembench/Config.in"
 	source "package/trace-cmd/Config.in"
 	source "package/trinity/Config.in"
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
new file mode 100644
index 0000000..5c2b070
--- /dev/null
+++ b/package/sysdig/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_SYSDIG
+	bool "sysdig"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_LIBJSON
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_INSTALL_LIBSTDCPP # libjson
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	help
+	  Sysdig is open source, system-level exploration:
+	  capture system state and activity from a running Linux instance,
+	  then save, filter and analyze.
+	  Think of it as strace + tcpdump + lsof + awesome sauce.
+	  With a little Lua cherry on top.
+
+	  http://sysdig.org
+
+comment "sysdig needs a toolchain w/ C++ and a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
new file mode 100644
index 0000000..8fea399
--- /dev/null
+++ b/package/sysdig/sysdig.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# sysdig
+#
+################################################################################
+
+SYSDIG_VERSION = 0.1.99
+SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
+SYSDIG_LICENSE = GPLv2
+SYSDIG_LICENSE_FILES = COPYING
+SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF
+SYSDIG_DEPENDENCIES = zlib luajit libjson linux
+SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
+
+define SYSDIG_INSTALL_DRIVER
+	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D)/driver modules
+	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D)/driver modules_install
+endef
+
+SYSDIG_POST_INSTALL_TARGET_HOOKS += SYSDIG_INSTALL_DRIVER
+
+$(eval $(cmake-package))
-- 
1.9.1
