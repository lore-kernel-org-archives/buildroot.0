From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 26 Mar 2015 21:41:29 +0100
Subject: [Buildroot] [PATCH v10] package/sysdig: New package
Message-ID: <1427402489-28313-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sysdig is open source, system-level exploration:
capture system state and activity from a running Linux
instance, then save, filter and analyze.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                  |  1 +
 .../0001-makefile-driver-compile-options.patch     | 23 ++++++++++++++++
 .../sysdig/0002-remove-dkms-module-updater.patch   | 31 ++++++++++++++++++++++
 package/sysdig/Config.in                           | 20 ++++++++++++++
 package/sysdig/sysdig.mk                           | 24 +++++++++++++++++
 5 files changed, 99 insertions(+)
 create mode 100644 package/sysdig/0001-makefile-driver-compile-options.patch
 create mode 100644 package/sysdig/0002-remove-dkms-module-updater.patch
 create mode 100644 package/sysdig/Config.in
 create mode 100644 package/sysdig/sysdig.mk

diff --git a/package/Config.in b/package/Config.in
index e4ee95d..aaf12ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -94,6 +94,7 @@ endif
 	source "package/spidev_test/Config.in"
 	source "package/strace/Config.in"
 	source "package/stress/Config.in"
+	source "package/sysdig/Config.in"
 	source "package/sysprof/Config.in"
 	source "package/tinymembench/Config.in"
 	source "package/trace-cmd/Config.in"
diff --git a/package/sysdig/0001-makefile-driver-compile-options.patch b/package/sysdig/0001-makefile-driver-compile-options.patch
new file mode 100644
index 0000000..74c74d8
--- /dev/null
+++ b/package/sysdig/0001-makefile-driver-compile-options.patch
@@ -0,0 +1,23 @@
+Updated Makefile compile options
+
+This patch updates linux kernel module (driver) of sysdig to be
+compatible with buildroot compile flags.
+
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+
+--- a/driver/Makefile.in
++++ b/driver/Makefile.in
+@@ -6,10 +6,10 @@ KERNELDIR 		?= /lib/modules/$(shell uname -r)/build
+
+ TOP := $(shell pwd)
+ all:
+-	$(MAKE) -C $(KERNELDIR) M=$(TOP) modules
++	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(TOP) modules
+
+ clean:
+-	$(MAKE) -C $(KERNELDIR) M=$(TOP) clean
++	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(TOP) clean
+
+ install: all
+-	$(MAKE) -C $(KERNELDIR) M=$(TOP) modules_install
++	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(TOP) modules_install
diff --git a/package/sysdig/0002-remove-dkms-module-updater.patch b/package/sysdig/0002-remove-dkms-module-updater.patch
new file mode 100644
index 0000000..8d5c99d
--- /dev/null
+++ b/package/sysdig/0002-remove-dkms-module-updater.patch
@@ -0,0 +1,31 @@
+Remove DKMS module updater
+
+This patch disables the in target installation of DKMS module updater
+mechanism unneeded in buildroot.
+
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+
+--- a/driver/CMakeLists.txt
++++ b/driver/CMakeLists.txt
+@@ -39,21 +39,3 @@ add_custom_target(install_driver
+ 	WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
+ 	VERBATIM)
+ 
+-install(FILES ${CMAKE_CURRENT_BINARY_DIR}/Makefile.dkms
+-	RENAME Makefile
+-	DESTINATION "src/sysdig-${SYSDIG_VERSION}")
+-
+-install(FILES
+-	${CMAKE_CURRENT_BINARY_DIR}/dkms.conf
+-	dynamic_params_table.c
+-	event_table.c
+-	flags_table.c
+-	main.c
+-	ppm.h
+-	ppm_events.c
+-	ppm_events.h
+-	ppm_events_public.h
+-	ppm_fillers.c
+-	ppm_ringbuffer.h
+-	syscall_table.c
+-	DESTINATION "src/sysdig-${SYSDIG_VERSION}")
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
new file mode 100644
index 0000000..3d7ee67
--- /dev/null
+++ b/package/sysdig/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_SYSDIG
+	bool "sysdig"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_JSONCPP
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
+	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
new file mode 100644
index 0000000..e05124b
--- /dev/null
+++ b/package/sysdig/sysdig.mk
@@ -0,0 +1,24 @@
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
+SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF \
+	-DUSE_BUNDLED_JSONCPP=OFF
+SYSDIG_DEPENDENCIES = zlib luajit jsoncpp linux
+SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
+
+SYSDIG_MAKE_ENV = LINUX_DIR='$(LINUX_DIR)' LINUX_MAKE_FLAGS='$(LINUX_MAKE_FLAGS)'
+
+define SYSDIG_INSTALL_DRIVER
+	cd $(@D)/buildroot-build; $(MAKE) $(SYSDIG_MAKE_ENV) install_driver
+endef
+
+SYSDIG_POST_INSTALL_TARGET_HOOKS += SYSDIG_INSTALL_DRIVER
+
+$(eval $(cmake-package))
-- 
1.9.1
