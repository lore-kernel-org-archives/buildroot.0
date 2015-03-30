From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 22:30:51 +0200
Subject: [Buildroot] [git commit] package/sysdig: New package
Message-ID: <20150330203132.5E8F1817F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74fc60a267341879ca71f8eaa64a80f5b5aaf78b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sysdig is open source, system-level exploration: capture system state
and activity from a running Linux instance, then save, filter and
analyze.

[Thomas:
 - remove unneeded 0001-makefile-driver-compile-options.patch, instead
   pass KERNELDIR in the make options when building the driver, and
   pass the contents of $(LINUX_MAKE_FLAGS) directly.
 - use $(SYSDIG_BUILDDIR) instead of $(@D)/buildroot-build, so that
   the package does not depend on the package infra using specifically
   buildroot-build as the build subdirectory.
 - use $(MAKE) -C <foo> instead of cd <foo>; $(MAKE).
 - rename 0002 patch to 0001, since the 0001 patch is removed.]

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Tested-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 .../sysdig/0001-remove-dkms-module-updater.patch   |   31 ++++++++++++++++++++
 package/sysdig/Config.in                           |   20 +++++++++++++
 package/sysdig/sysdig.mk                           |   22 ++++++++++++++
 4 files changed, 74 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 566a78a..20b0cfc 100644
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
diff --git a/package/sysdig/0001-remove-dkms-module-updater.patch b/package/sysdig/0001-remove-dkms-module-updater.patch
new file mode 100644
index 0000000..8d5c99d
--- /dev/null
+++ b/package/sysdig/0001-remove-dkms-module-updater.patch
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
index 0000000..fb348ff
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
+SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF \
+	-DUSE_BUNDLED_JSONCPP=OFF
+SYSDIG_DEPENDENCIES = zlib luajit jsoncpp linux
+SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
+
+define SYSDIG_INSTALL_DRIVER
+	$(MAKE) -C $(SYSDIG_BUILDDIR) $(LINUX_MAKE_FLAGS) KERNELDIR="$(LINUX_DIR)" install_driver
+endef
+
+SYSDIG_POST_INSTALL_TARGET_HOOKS += SYSDIG_INSTALL_DRIVER
+
+$(eval $(cmake-package))
