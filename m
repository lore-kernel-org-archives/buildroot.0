From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 17 Mar 2015 16:32:53 +0100
Subject: [Buildroot] [PATCH 2/2] package/sysdig: New package
In-Reply-To: <1426606373-11438-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1426606373-11438-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1426606373-11438-3-git-send-email-angelo.compagnucci@gmail.com>
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
 package/Config.in        |  1 +
 package/sysdig/Config.in | 21 +++++++++++++++++++++
 package/sysdig/sysdig.mk | 22 ++++++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 package/sysdig/Config.in
 create mode 100644 package/sysdig/sysdig.mk

diff --git a/package/Config.in b/package/Config.in
index e221deb..019d40b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -94,6 +94,7 @@ endif
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
index 0000000..73a253e
--- /dev/null
+++ b/package/sysdig/sysdig.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# sysdig
+#
+#############################################################
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
