From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 15:49:20 +0200
Subject: [Buildroot] [PATCH 1/2] c-periphery: new package
Message-ID: <1431784161-5771-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is needed as a dependency of lua-periphery. Currently,
c-periphery is automatically cloned by lua-periphery, which causes two
problems:

 1/ It does not integrate properly with the download infrastructure of
    Buildroot, making offline builds impossible since not the entire
    source code is downloaded by Buildroot.

 2/ It does not use the latest version of c-periphery, which has some
    fixes contributed by Vicente to fix c-periphery on MIPS.

Introducing this package is needed as part of the fix for the
following build failure:

  http://autobuild.buildroot.org/results/0ad/0ad656970b3cbc84b5531b28155ba2f747715fe3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/c-periphery/Config.in      | 16 ++++++++++++++++
 package/c-periphery/c-periphery.mk | 27 +++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 package/c-periphery/Config.in
 create mode 100644 package/c-periphery/c-periphery.mk

diff --git a/package/Config.in b/package/Config.in
index af4d2b7..e0c2e2a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -811,6 +811,7 @@ menu "Graphics"
 endmenu
 
 menu "Hardware handling"
+	source "package/c-periphery/Config.in"
 	source "package/ccid/Config.in"
 	source "package/dtc/Config.in"
 	source "package/gnu-efi/Config.in"
diff --git a/package/c-periphery/Config.in b/package/c-periphery/Config.in
new file mode 100644
index 0000000..0bfb4b1
--- /dev/null
+++ b/package/c-periphery/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_C_PERIPHERY
+	bool "c-periphery"
+	help
+	  c-periphery is a set of C wrapper functions for GPIO, SPI,
+	  I2C, MMIO, and Serial peripheral I/O interface access in
+	  userspace Linux. The c-periphery wrappers simplify and
+	  consolidate the native Linux APIs to these
+	  interfaces. c-periphery is useful in embedded Linux
+	  environments (including BeagleBone, Raspberry Pi,
+	  etc. platforms) for interfacing with external
+	  peripherals. c-periphery is re-entrant, uses static
+	  allocations, has no dependencies outside the standard C
+	  library and Linux, compiles into a static library for easy
+	  integration with other projects, and is MIT licensed.
+
+	  https://github.com/vsergeev/c-periphery
diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
new file mode 100644
index 0000000..68193d7
--- /dev/null
+++ b/package/c-periphery/c-periphery.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# c-periphery
+#
+################################################################################
+
+C_PERIPHERY_VERSION = 0fdfac3264f1dce32991f4ec30d084e34b35181d
+C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,$(C_PERIPHERY_VERSION))
+C_PERIPHERY_INSTALL_STAGING = YES
+# only a static library
+C_PERIPHERY_INSTALL_TARGET = NO
+C_PERIPHERY_LICENSE = MIT
+C_PERIPHERY_LICENSE_FILES = LICENSE
+
+define C_PERIPHERY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+# There is no 'install' rule in the Makefile, so we handle things
+# manually.
+define C_PERIPHERY_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/periphery.a $(STAGING_DIR)/usr/lib/libc-periphery.a
+	mkdir -p $(STAGING_DIR)/usr/include/c-periphery/
+	cp -dpfr $(@D)/src/*.h $(STAGING_DIR)/usr/include/c-periphery/
+endef
+
+$(eval $(generic-package))
-- 
2.1.0
