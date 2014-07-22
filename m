From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 22 Jul 2014 21:21:31 +0200
Subject: [Buildroot] [PATCH 1 of 2] generic packages: rename FOO_MAKE_OPTS
 into FOO_MAKE_OPT
Message-ID: <9d1a7e2626ad1d2e4b42.1406056891@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autotools infrastructure allows packages to specify FOO_MAKE_OPT and
FOO_MAKE_ENV. The generic infrastructure does not use this variable, but
some individual packages define them for use in their own BAR_CMDS.

However, some of these packages call this define FOO_MAKE_OPTS, rather than
FOO_MAKE_OPT. This is currently not a real problem, but it is inconsistent.
Moreover, the upcoming kconfig-package infrastructure will also use
FOO_MAKE_OPT, so generic packages that also use kconfig-package have no
choice but use the singular name.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 boot/uboot/uboot.mk                  |   6 +++---
 package/aircrack-ng/aircrack-ng.mk   |  10 +++++-----
 package/busybox/busybox.mk           |   8 ++++----
 package/dvb-apps/dvb-apps.mk         |   8 ++++----
 package/fmc/fmc.mk                   |   4 ++--
 package/fmlib/fmlib.mk               |   6 +++---
 package/gptfdisk/gptfdisk.mk         |   4 ++--
 package/linux-fusion/linux-fusion.mk |  20 ++++++++++----------
 package/pciutils/pciutils.mk         |   8 ++++----
 package/sunxi-mali/sunxi-mali.mk     |  20 ++++++++++----------
 package/ti-gfx/ti-gfx.mk             |  10 +++++-----
 package/trace-cmd/trace-cmd.mk       |   8 ++++----
 12 files changed, 56 insertions(+), 56 deletions(-)

diff -r e79d6f3e1d9c -r 9d1a7e2626ad boot/uboot/uboot.mk
--- a/boot/uboot/uboot.mk	Tue Mar 04 14:50:03 2014 +0000
+++ b/boot/uboot/uboot.mk	Tue Jul 22 20:45:36 2014 +0200
@@ -59,7 +59,7 @@
 UBOOT_ARCH=$(KERNEL_ARCH)
 
 UBOOT_CONFIGURE_OPTS += CONFIG_NOSOFTFLOAT=1
-UBOOT_MAKE_OPTS += \
+UBOOT_MAKE_OPT += \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 	ARCH=$(UBOOT_ARCH)
 
@@ -96,7 +96,7 @@
 
 define UBOOT_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
+		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPT)		\
 		$(UBOOT_BOARD_NAME)_config
 	@echo >> $(@D)/include/config.h
 	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(@D)/include/config.h
@@ -115,7 +115,7 @@
 
 define UBOOT_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
+		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPT) 		\
 		$(UBOOT_MAKE_TARGET)
 endef
 
diff -r e79d6f3e1d9c -r 9d1a7e2626ad package/aircrack-ng/aircrack-ng.mk
--- a/package/aircrack-ng/aircrack-ng.mk	Tue Mar 04 14:50:03 2014 +0000
+++ b/package/aircrack-ng/aircrack-ng.mk	Tue Jul 22 20:45:36 2014 +0200
@@ -11,13 +11,13 @@
 AIRCRACK_NG_DEPENDENCIES = openssl
 
 ifeq ($(BR2_PACKAGE_SQLITE),y)
-	AIRCRACK_NG_MAKE_OPTS = sqlite=true
-	AIRCRACK_NG_MAKE_OPTS += \
+	AIRCRACK_NG_MAKE_OPT = sqlite=true
+	AIRCRACK_NG_MAKE_OPT += \
 		LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB), -ldl -lpthread)"
 
 	AIRCRACK_NG_DEPENDENCIES += sqlite
 else
-	AIRCRACK_NG_MAKE_OPTS = sqlite=false
+	AIRCRACK_NG_MAKE_OPT = sqlite=false
 endif
 
 AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) -lz \
@@ -26,12 +26,12 @@
 define AIRCRACK_NG_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
 		LDFLAGS="$(AIRCRACK_NG_LDFLAGS)" \
-		-C $(@D) $(AIRCRACK_NG_MAKE_OPTS) all
+		-C $(@D) $(AIRCRACK_NG_MAKE_OPT) all
 endef
 
 define AIRCRACK_NG_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) \
-		prefix=/usr $(AIRCRACK_NG_MAKE_OPTS) install
+		prefix=/usr $(AIRCRACK_NG_MAKE_OPT) install
 endef
 
 $(eval $(generic-package))
diff -r e79d6f3e1d9c -r 9d1a7e2626ad package/busybox/busybox.mk
--- a/package/busybox/busybox.mk	Tue Mar 04 14:50:03 2014 +0000
+++ b/package/busybox/busybox.mk	Tue Jul 22 20:45:36 2014 +0200
@@ -32,7 +32,7 @@
 	$(TARGET_MAKE_ENV) \
 	CFLAGS="$(BUSYBOX_CFLAGS)" \
 	CFLAGS_busybox="$(BUSYBOX_CFLAGS_busybox)"
-BUSYBOX_MAKE_OPTS = \
+BUSYBOX_MAKE_OPT = \
 	CC="$(TARGET_CC)" \
 	ARCH=$(KERNEL_ARCH) \
 	PREFIX="$(TARGET_DIR)" \
@@ -209,11 +209,11 @@
 endef
 
 define BUSYBOX_BUILD_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D)
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPT) -C $(@D)
 endef
 
 define BUSYBOX_INSTALL_TARGET_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPT) -C $(@D) install
 	if [ ! -f $(TARGET_DIR)/usr/share/udhcpc/default.script ]; then \
 		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
 			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
@@ -227,7 +227,7 @@
 $(eval $(generic-package))
 
 busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) \
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPT) -C $(BUSYBOX_DIR) \
 		$(subst busybox-,,$@)
 	rm -f $(BUSYBOX_DIR)/.stamp_built
 	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
diff -r e79d6f3e1d9c -r 9d1a7e2626ad package/dvb-apps/dvb-apps.mk
--- a/package/dvb-apps/dvb-apps.mk	Tue Mar 04 14:50:03 2014 +0000
+++ b/package/dvb-apps/dvb-apps.mk	Tue Jul 22 20:45:36 2014 +0200
@@ -16,7 +16,7 @@
 endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-DVB_APPS_MAKE_OPTS += static=1
+DVB_APPS_MAKE_OPT += static=1
 endif
 
 DVB_APPS_INSTALL_STAGING = YES
@@ -24,15 +24,15 @@
 define DVB_APPS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) LDLIBS="$(DVB_APPS_LDLIBS)" \
 		$(MAKE) -C $(@D) CROSS_ROOT=$(STAGING_DIR) \
-		$(DVB_APPS_MAKE_OPTS)
+		$(DVB_APPS_MAKE_OPT)
 endef
 
 define DVB_APPS_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) $(DVB_APPS_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+	$(MAKE) -C $(@D) $(DVB_APPS_MAKE_OPT) DESTDIR=$(STAGING_DIR) install
 endef
 
 define DVB_APPS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(DVB_APPS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+	$(MAKE) -C $(@D) $(DVB_APPS_MAKE_OPT) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
diff -r e79d6f3e1d9c -r 9d1a7e2626ad package/fmc/fmc.mk
--- a/package/fmc/fmc.mk	Tue Mar 04 14:50:03 2014 +0000
+++ b/package/fmc/fmc.mk	Tue Jul 22 20:45:36 2014 +0200
@@ -10,7 +10,7 @@
 FMC_LICENSE_FILES = COPYING
 FMC_DEPENDENCIES = libxml2 tclap fmlib
 
-FMC_MAKE_OPTS = \
+FMC_MAKE_OPT = \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
 	FMD_USPACE_HEADER_PATH="$(STAGING_DIR)/usr/include/fmd" \
@@ -20,7 +20,7 @@
 
 define FMC_BUILD_CMDS
 	# The linking step has dependency issues so using MAKE1
-	$(TARGET_MAKE_ENV) $(MAKE1) $(FMC_MAKE_OPTS) -C $(@D)/source
+	$(TARGET_MAKE_ENV) $(MAKE1) $(FMC_MAKE_OPT) -C $(@D)/source
 endef
 
 define FMC_INSTALL_TARGET_CMDS
diff -r e79d6f3e1d9c -r 9d1a7e2626ad package/fmlib/fmlib.mk
--- a/package/fmlib/fmlib.mk	Tue Mar 04 14:50:03 2014 +0000
+++ b/package/fmlib/fmlib.mk	Tue Jul 22 20:45:36 2014 +0200
@@ -15,7 +15,7 @@
 # nothing to install to the target
 FMLIB_INSTALL_TARGET = NO
 
-FMLIB_MAKE_OPTS = \
+FMLIB_MAKE_OPT = \
 	CC="$(TARGET_CC)" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	KERNEL_SRC="$(LINUX_DIR)" \
@@ -26,11 +26,11 @@
 endif
 
 define FMLIB_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPTS) -C $(@D) libfm-$(FMLIB_ARCHTYPE).a
+	$(TARGET_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPT) -C $(@D) libfm-$(FMLIB_ARCHTYPE).a
 endef
 
 define FMLIB_INSTALL_STAGING_CMDS
-	$(FMLIB_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPTS) -C $(@D) install-libfm-$(FMLIB_ARCHTYPE)
+	$(FMLIB_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPT) -C $(@D) install-libfm-$(FMLIB_ARCHTYPE)
 endef
 
 $(eval $(generic-package))
diff -r e79d6f3e1d9c -r 9d1a7e2626ad package/gptfdisk/gptfdisk.mk
--- a/package/gptfdisk/gptfdisk.mk	Tue Mar 04 14:50:03 2014 +0000
+++ b/package/gptfdisk/gptfdisk.mk	Tue Jul 22 20:45:36 2014 +0200
@@ -23,12 +23,12 @@
 
 ifeq ($(BR2_PACKAGE_ICU),y)
     GPTFDISK_DEPENDENCIES += icu
-    GPTFDISK_MAKE_OPTS += USE_UTF16=y
+    GPTFDISK_MAKE_OPT += USE_UTF16=y
 endif
 
 define GPTFDISK_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		$(GPTFDISK_MAKE_OPTS) $(GPTFDISK_TARGETS_y)
+		$(GPTFDISK_MAKE_OPT) $(GPTFDISK_TARGETS_y)
 endef
 
 define GPTFDISK_INSTALL_TARGET_CMDS
diff -r e79d6f3e1d9c -r 9d1a7e2626ad package/linux-fusion/linux-fusion.mk
--- a/package/linux-fusion/linux-fusion.mk	Tue Mar 04 14:50:03 2014 +0000
+++ b/package/linux-fusion/linux-fusion.mk	Tue Jul 22 20:45:36 2014 +0200
@@ -14,26 +14,26 @@
 LINUX_FOR_FUSION=$(LINUX_VERSION_PROBED)
 LINUX_FUSION_ETC_DIR=$(TARGET_DIR)/etc/udev/rules.d
 
-LINUX_FUSION_MAKE_OPTS =  KERNEL_VERSION=$(LINUX_FOR_FUSION)
-LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(LINUX_DIR)
-LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(LINUX_DIR)
+LINUX_FUSION_MAKE_OPT =  KERNEL_VERSION=$(LINUX_FOR_FUSION)
+LINUX_FUSION_MAKE_OPT += KERNEL_BUILD=$(LINUX_DIR)
+LINUX_FUSION_MAKE_OPT += KERNEL_SOURCE=$(LINUX_DIR)
 
-LINUX_FUSION_MAKE_OPTS += SYSROOT=$(TARGET_DIR)
-LINUX_FUSION_MAKE_OPTS += ARCH=$(KERNEL_ARCH)
-LINUX_FUSION_MAKE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)
-LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_FOR_FUSION)/kernel
+LINUX_FUSION_MAKE_OPT += SYSROOT=$(TARGET_DIR)
+LINUX_FUSION_MAKE_OPT += ARCH=$(KERNEL_ARCH)
+LINUX_FUSION_MAKE_OPT += CROSS_COMPILE=$(TARGET_CROSS)
+LINUX_FUSION_MAKE_OPT += KERNEL_MODLIB=/lib/modules/$(LINUX_FOR_FUSION)/kernel
 
 define LINUX_FUSION_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LINUX_FUSION_MAKE_OPTS) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LINUX_FUSION_MAKE_OPT) -C $(@D)
 endef
 
 define LINUX_FUSION_INSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LINUX_FUSION_MAKE_OPTS) INSTALL_MOD_PATH=$(STAGING_DIR) -C $(@D) headers_install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LINUX_FUSION_MAKE_OPT) INSTALL_MOD_PATH=$(STAGING_DIR) -C $(@D) headers_install
 endef
 
 define LINUX_FUSION_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
-		$(LINUX_FUSION_MAKE_OPTS) \
+		$(LINUX_FUSION_MAKE_OPT) \
 		INSTALL_MOD_PATH=$(TARGET_DIR) \
 		-C $(@D) install
 	mkdir -p $(LINUX_FUSION_ETC_DIR)
diff -r e79d6f3e1d9c -r 9d1a7e2626ad package/pciutils/pciutils.mk
--- a/package/pciutils/pciutils.mk	Tue Mar 04 14:50:03 2014 +0000
+++ b/package/pciutils/pciutils.mk	Tue Jul 22 20:45:36 2014 +0200
@@ -32,7 +32,7 @@
 	PCIUTILS_SHARED=yes
 endif
 
-PCIUTILS_MAKE_OPTS = \
+PCIUTILS_MAKE_OPT = \
 	CC="$(TARGET_CC)" \
 	HOST="$(KERNEL_ARCH)-linux" \
 	OPT="$(TARGET_CFLAGS)" \
@@ -58,17 +58,17 @@
 endef
 
 define PCIUTILS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(PCIUTILS_MAKE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(PCIUTILS_MAKE_OPT) \
 		PREFIX=/usr
 endef
 
 define PCIUTILS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(PCIUTILS_MAKE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(PCIUTILS_MAKE_OPT) \
 		PREFIX=$(TARGET_DIR)/usr install install-lib install-pcilib
 endef
 
 define PCIUTILS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(PCIUTILS_MAKE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(PCIUTILS_MAKE_OPT) \
 		PREFIX=$(STAGING_DIR)/usr install install-lib install-pcilib
 endef
 
diff -r e79d6f3e1d9c -r 9d1a7e2626ad package/sunxi-mali/sunxi-mali.mk
--- a/package/sunxi-mali/sunxi-mali.mk	Tue Mar 04 14:50:03 2014 +0000
+++ b/package/sunxi-mali/sunxi-mali.mk	Tue Jul 22 20:45:36 2014 +0200
@@ -24,21 +24,21 @@
 	$(TARGET_MAKE_ENV)
 
 ifeq ($(BR2_ARM_EABIHF),y)
-SUNXI_MALI_MAKE_OPTS += ABI=armhf
+SUNXI_MALI_MAKE_OPT += ABI=armhf
 else
-SUNXI_MALI_MAKE_OPTS += ABI=armel
+SUNXI_MALI_MAKE_OPT += ABI=armel
 endif
 
-SUNXI_MALI_MAKE_OPTS += EGL_TYPE=framebuffer
+SUNXI_MALI_MAKE_OPT += EGL_TYPE=framebuffer
 
 ifeq ($(BR2_PACKAGE_SUNXI_MALI_R2P4),y)
-SUNXI_MALI_MAKE_OPTS += VERSION=r2p4
+SUNXI_MALI_MAKE_OPT += VERSION=r2p4
 endif
 ifeq ($(BR2_PACKAGE_SUNXI_MALI_R3P0),y)
-SUNXI_MALI_MAKE_OPTS += VERSION=r3p0
+SUNXI_MALI_MAKE_OPT += VERSION=r3p0
 endif
 ifeq ($(BR2_PACKAGE_SUNXI_MALI_R3P1),y)
-SUNXI_MALI_MAKE_OPTS += VERSION=r3p1
+SUNXI_MALI_MAKE_OPT += VERSION=r3p1
 endif
 
 define SUNXI_MALI_GIT_SUBMODULE_FIXUP
@@ -49,17 +49,17 @@
 SUNXI_MALI_PRE_CONFIGURE_HOOKS += SUNXI_MALI_GIT_SUBMODULE_FIXUP
 
 define SUNXI_MALI_BUILD_CMDS
-	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPTS) all
+	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPT) all
 	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/version/version \
 		$(@D)/version/version.c
 endef
 
 define SUNXI_MALI_INSTALL_STAGING_CMDS
 	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(SUNXI_MALI_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+		$(SUNXI_MALI_MAKE_OPT) DESTDIR=$(STAGING_DIR) install
 	# test must be built after install because it depends on headers that are
 	# generated during the install above.
-	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPTS) test
+	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPT) test
 	$(INSTALL) -D -m 0644 package/sunxi-mali/egl.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
 	$(INSTALL) -D -m 0644 package/sunxi-mali/glesv2.pc \
@@ -68,7 +68,7 @@
 
 define SUNXI_MALI_INSTALL_TARGET_CMDS
 	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D)/lib \
-		$(SUNXI_MALI_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+		$(SUNXI_MALI_MAKE_OPT) DESTDIR=$(TARGET_DIR) install
 	$(if $(BR2_PACKAGE_SUNXI_MALI_DBG),
 		$(INSTALL) -m 755 $(@D)/version/version $(TARGET_DIR)/usr/bin/maliver; \
 		$(INSTALL) -m 755 $(@D)/test/test $(TARGET_DIR)/usr/bin/malitest
diff -r e79d6f3e1d9c -r 9d1a7e2626ad package/ti-gfx/ti-gfx.mk
--- a/package/ti-gfx/ti-gfx.mk	Tue Mar 04 14:50:03 2014 +0000
+++ b/package/ti-gfx/ti-gfx.mk	Tue Jul 22 20:45:36 2014 +0200
@@ -50,7 +50,7 @@
 
 TI_GFX_BIN_PATH = gfx_$(TI_GFX_DEBUG_LIB)_es$(TI_GFX_OMAPES)
 
-TI_GFX_KM_MAKE_OPTS = \
+TI_GFX_KM_MAKE_OPT = \
 	$(LINUX_MAKE_FLAGS) \
 	BUILD=$(TI_GFX_DEBUG_KM) \
 	TI_PLATFORM=$(TI_GFX_PLATFORM) \
@@ -58,7 +58,7 @@
 	SUPPORT_XORG=0 \
 	KERNELDIR=$(LINUX_DIR)
 
-TI_GFX_DEMO_MAKE_OPTS = \
+TI_GFX_DEMO_MAKE_OPT = \
 	PLATFORM=LinuxARMV7 \
 	X11BUILD=0 \
 	PLAT_CC="$(TARGET_CC)" \
@@ -100,7 +100,7 @@
 endef
 
 define TI_GFX_BUILD_KM_CMDS
-	$(MAKE) $(TI_GFX_KM_MAKE_OPTS) -C $(@D)/GFX_Linux_KM all
+	$(MAKE) $(TI_GFX_KM_MAKE_OPT) -C $(@D)/GFX_Linux_KM all
 endef
 
 ifeq ($(BR2_PACKAGE_TI_GFX_DEMOS),y)
@@ -108,7 +108,7 @@
 	$(foreach demo, $(TI_GFX_DEMOS), \
 		$(TARGET_MAKE_ENV) $(MAKE1) -C \
 			$(@D)/$(TI_GFX_DEMOS_LOC)/$(demo)/$(TI_GFX_DEMOS_MAKE_LOC) \
-			$(TI_GFX_DEMO_MAKE_OPTS) all
+			$(TI_GFX_DEMO_MAKE_OPT) all
 	)
 endef
 endif
@@ -155,7 +155,7 @@
 endef
 
 define TI_GFX_INSTALL_KM_CMDS
-	$(MAKE) $(TI_GFX_KM_MAKE_OPTS) -C $(@D)/GFX_Linux_KM install
+	$(MAKE) $(TI_GFX_KM_MAKE_OPT) -C $(@D)/GFX_Linux_KM install
 endef
 
 define TI_GFX_INSTALL_BINS_CMDS
diff -r e79d6f3e1d9c -r 9d1a7e2626ad package/trace-cmd/trace-cmd.mk
--- a/package/trace-cmd/trace-cmd.mk	Tue Mar 04 14:50:03 2014 +0000
+++ b/package/trace-cmd/trace-cmd.mk	Tue Jul 22 20:45:36 2014 +0200
@@ -15,12 +15,12 @@
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 TRACE_CMD_DEPENDENCIES += python host-swig
-TRACE_CMD_MAKE_OPTS = PYTHON_VERS=python
+TRACE_CMD_MAKE_OPT = PYTHON_VERS=python
 else ifeq ($(BR2_PACKAGE_PYTHON3),y)
 TRACE_CMD_DEPENDENCIES += python3 host-swig
-TRACE_CMD_MAKE_OPTS = PYTHON_VERS=python3
+TRACE_CMD_MAKE_OPT = PYTHON_VERS=python3
 else
-TRACE_CMD_MAKE_OPTS += NO_PYTHON=1
+TRACE_CMD_MAKE_OPT += NO_PYTHON=1
 endif
 
 # trace-cmd already defines _LARGEFILE64_SOURCE when necessary,
@@ -36,7 +36,7 @@
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TRACE_CMD_CFLAGS)" \
 		CPPFLAGS="$(TRACE_CMD_CPPFLAGS)" \
-		$(TRACE_CMD_MAKE_OPTS) \
+		$(TRACE_CMD_MAKE_OPT) \
 		-C $(@D) all
 endef
 
