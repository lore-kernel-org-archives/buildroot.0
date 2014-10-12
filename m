From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Oct 2014 12:52:36 +0200
Subject: [Buildroot] [PATCHv3] am335x-pru-package: new package
Message-ID: <1413111156-21061-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Frank Hunleth <fhunleth@troodon-software.com>

am335x-pru-package provides an assembler and program loader for Texas
Instrument's AM335x programmable real-time units.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v2 -> v3:
  - add missing patch file

Changes v1 -> v2:
  - build debug or release accordingly
  - create a symlink for debug libraries
  - do not build shared if PREFER_STATIC is et
  - use the 'install' rule to install both in target and staging
  - properly pass DESTDIR and PREFIX at install time
  - add missing file to host-variant build (due to version bump)
  - drop the host variant from the menu
  - bump revision
---
 package/Config.in                                  |  1 +
 .../0000-install-does-not-build.patch              | 23 +++++++
 package/am335x-pru-package/Config.in               |  7 ++
 package/am335x-pru-package/am335x-pru-package.mk   | 74 ++++++++++++++++++++++
 4 files changed, 105 insertions(+)
 create mode 100644 package/am335x-pru-package/0000-install-does-not-build.patch
 create mode 100644 package/am335x-pru-package/Config.in
 create mode 100644 package/am335x-pru-package/am335x-pru-package.mk

diff --git a/package/Config.in b/package/Config.in
index b655763..5b8ce9c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -281,6 +281,7 @@ menu "Firmware"
 endmenu
 	source "package/a10disp/Config.in"
 	source "package/acpid/Config.in"
+	source "package/am335x-pru-package/Config.in"
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
 	source "package/biosdevname/Config.in"
diff --git a/package/am335x-pru-package/0000-install-does-not-build.patch b/package/am335x-pru-package/0000-install-does-not-build.patch
new file mode 100644
index 0000000..72f398a
--- /dev/null
+++ b/package/am335x-pru-package/0000-install-does-not-build.patch
@@ -0,0 +1,23 @@
+Makefile: do not force the release build on install
+
+If we did build any of the other targets, and are just interested
+in those and not the relase one, we still want to use the 'install'
+rule, but not build (and install) the release libraries.
+
+So, remove the dependency on the 'release' target from the 'install'
+rule.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN am335x-pru-package-506e074859891a2b350eb4f5fcb451c4961410ea.orig/pru_sw/app_loader/interface/Makefile am335x-pru-package-506e074859891a2b350eb4f5fcb451c4961410ea/pru_sw/app_loader/interface/Makefile
+--- am335x-pru-package-506e074859891a2b350eb4f5fcb451c4961410ea.orig/pru_sw/app_loader/interface/Makefile	2014-08-18 00:24:36.000000000 +0200
++++ am335x-pru-package-506e074859891a2b350eb4f5fcb451c4961410ea/pru_sw/app_loader/interface/Makefile	2014-10-12 11:39:17.144682697 +0200
+@@ -38,7 +38,7 @@
+ 
+ all:	debug release sodebug sorelease
+ 
+-install: release
++install:
+ 	install -m 0755 -d $(DESTDIR)$(PREFIX)/lib
+ 	install -m 0755 -d $(DESTDIR)$(PREFIX)/include
+ 	install -m 0644 $(LIBDIR)/* $(DESTDIR)$(PREFIX)/lib
diff --git a/package/am335x-pru-package/Config.in b/package/am335x-pru-package/Config.in
new file mode 100644
index 0000000..66d7773
--- /dev/null
+++ b/package/am335x-pru-package/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_AM335X_PRU_PACKAGE
+	bool "am335x-pru-package"
+	depends on BR2_arm # only relevant for TI am335x
+	help
+	  TI AM335X PRU program loader
+
+	  https://github.com/beagleboard/am335x_pru_package
diff --git a/package/am335x-pru-package/am335x-pru-package.mk b/package/am335x-pru-package/am335x-pru-package.mk
new file mode 100644
index 0000000..1e4fc0d
--- /dev/null
+++ b/package/am335x-pru-package/am335x-pru-package.mk
@@ -0,0 +1,74 @@
+################################################################################
+#
+# am335x-pru-package
+#
+################################################################################
+
+AM335X_PRU_PACKAGE_VERSION = 506e074859891a2b350eb4f5fcb451c4961410ea
+AM335X_PRU_PACKAGE_SITE = $(call github,beagleboard,am335x_pru_package,$(AM335X_PRU_PACKAGE_VERSION))
+AM335X_PRU_PACKAGE_LICENSE = BSD-3c
+AM335X_PRU_PACKAGE_LICENSE_FILES = pru_sw/utils/LICENCE.txt
+AM335X_PRU_PACKAGE_DEPENDENCIES = host-am335x-pru-package
+AM335X_PRU_PACKAGE_INSTALL_STAGING = YES
+
+# The default 'all' rule builds everything, when we just need the library
+ifeq ($(BR2_ENABLE_DEBUG),y)
+AM335X_MAKE_TARGET = debug $(if $(BR2_PREFER_STATIC_LIB),,sodebug)
+else
+AM335X_MAKE_TARGET = release $(if $(BR2_PREFER_STATIC_LIB),,sorelease)
+endif
+
+define AM335X_PRU_PACKAGE_BUILD_CMDS
+	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" \
+		-C $(@D)/pru_sw/app_loader/interface $(AM335X_MAKE_TARGET)
+endef
+
+# 'install' installs whatever was built, and our patch removes the dependency
+# on the release build, so we can use it to install whatever we built above.
+define AM335X_PRU_PACKAGE_INSTALL_STAGING_CMDS
+	$(MAKE1) DESTDIR="$(STAGING_DIR)" PREFIX="/usr" \
+		-C $(@D)/pru_sw/app_loader/interface install
+endef
+
+define AM335X_PRU_PACKAGE_INSTALL_TARGET_CMDS
+	$(MAKE1) DESTDIR="$(TARGET_DIR)" PREFIX="/usr" \
+		-C $(@D)/pru_sw/app_loader/interface install
+endef
+
+# The debug libraries are named differently than the release ones,
+# so we must provide a symlink to still be able to link with them.
+ifeq ($(BR2_ENABLE_DEBUG),y)
+
+define AM335X_PRU_PACKAGE_LN_DEBUG_STAGING_STATIC
+	ln -sf libprussdrvd.a $(STAGING_DIR)/usr/lib/libprussdrv.a
+endef
+AM335X_PRU_PACKAGE_POST_INSTALL_STAGING_HOOKS += AM335X_PRU_PACKAGE_LN_DEBUG_STAGING_STATIC
+
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+
+define AM335X_PRU_PACKAGE_LN_DEBUG_STAGING_SHARED
+	ln -sf libprussdrvd.so $(STAGING_DIR)/usr/lib/libprussdrv.so
+endef
+AM335X_PRU_PACKAGE_POST_INSTALL_STAGING_HOOKS += AM335X_PRU_PACKAGE_LN_DEBUG_STAGING_SHARED
+
+define AM335X_PRU_PACKAGE_LN_DEBUG_TARGET
+	ln -sf libprussdrvd.so $(TARGET_DIR)/usr/lib/libprussdrv.so
+endef
+AM335X_PRU_PACKAGE_POST_INSTALL_TARGET_HOOKS += AM335X_PRU_PACKAGE_LN_DEBUG_TARGET
+
+endif # !STATIC
+
+endif # DEBUG
+
+define HOST_AM335X_PRU_PACKAGE_BUILD_CMDS
+	cd $(@D)/pru_sw/utils/pasm_source; \
+	$(HOSTCC) -Wall -D_UNIX_ pasm.c pasmpp.c pasmexp.c pasmop.c \
+		pasmdot.c pasmstruct.c pasmmacro.c path_utils.c -o ../pasm
+endef
+
+define HOST_AM335X_PRU_PACKAGE_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/pru_sw/utils/pasm $(HOST_DIR)/usr/bin/pasm
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.9.1
