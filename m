From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jul 2011 15:27:52 +0200
Subject: [Buildroot] [git commit] uboot-tools: add fw_printenv,
	rename to uboot-tools
Message-ID: <20110718132853.E76C68AC5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7a2fa1f8db5c2e627a4b939862af5f938fcfc359
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move fw_printenv / fw_setenv options from the uboot bootloader build to
the uboot-mkimage package, and rename it to uboot-tools.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in                               |    5 --
 boot/uboot/uboot.mk                                |   19 -------
 linux/linux.mk                                     |    2 +-
 package/Config.in                                  |    2 +-
 package/uboot-mkimage/Config.in                    |    7 ---
 package/uboot-mkimage/uboot-mkimage.mk             |   31 -----------
 package/uboot-tools/Config.in                      |   23 ++++++++
 .../uboot-tools-2011.03-drop-configh.patch}        |    0
 ...ot-tools-2011.03-hostcflags-override-fix.patch} |    0
 package/uboot-tools/uboot-tools.mk                 |   55 ++++++++++++++++++++
 10 files changed, 80 insertions(+), 64 deletions(-)
 delete mode 100644 package/uboot-mkimage/Config.in
 delete mode 100644 package/uboot-mkimage/uboot-mkimage.mk
 create mode 100644 package/uboot-tools/Config.in
 rename package/{uboot-mkimage/uboot-mkimage-2011.03-drop-configh.patch => uboot-tools/uboot-tools-2011.03-drop-configh.patch} (100%)
 rename package/{uboot-mkimage/uboot-mkimage-2011.03-hostcflags-override-fix.patch => uboot-tools/uboot-tools-2011.03-hostcflags-override-fix.patch} (100%)
 create mode 100644 package/uboot-tools/uboot-tools.mk

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 070533e..a0b2bfc 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -91,11 +91,6 @@ config BR2_TARGET_UBOOT_FORMAT_LDR
 
 endchoice
 
-config BR2_TARGET_UBOOT_TOOL_ENV
-	bool "fw_printenv tool in target"
-	help
-	  Install fw_printenv / fw_setenv tools in target.
-
 menuconfig BR2_TARGET_UBOOT_NETWORK
 	bool "Network Settings"
 	default y
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 0610e4c..1425579 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -78,35 +78,16 @@ define UBOOT_CONFIGURE_CMDS
 	@echo "#endif /* __BR2_ADDED_CONFIG_H */" >> $(@D)/include/config.h
 endef
 
-ifeq ($(BR2_TARGET_UBOOT_TOOL_ENV),y)
-define UBOOT_BUILD_TARGET_ENV_UTILS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) HOSTCC="$(TARGET_CC)" -C $(@D) env
-endef
-endif
-
 define UBOOT_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
 		$(UBOOT_MAKE_TARGET)
-	$(UBOOT_BUILD_TARGET_ENV_UTILS)
 endef
 
 define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
 endef
 
-ifeq ($(BR2_TARGET_UBOOT_TOOL_ENV),y)
-define UBOOT_INSTALL_TARGET_ENV_UTILS
-	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv \
-		$(TARGET_DIR)/usr/sbin/fw_printenv
-	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
-endef
-endif
-
-define UBOOT_INSTALL_TARGET_CMDS
-	$(UBOOT_INSTALL_TARGET_ENV_UTILS)
-endef
-
 $(eval $(call GENTARGETS,boot,uboot))
 
 ifeq ($(BR2_TARGET_UBOOT),y)
diff --git a/linux/linux.mk b/linux/linux.mk
index bdd8bb3..e6cf01a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -54,7 +54,7 @@ LINUX_IMAGE_NAME=vmImage
 else
 LINUX_IMAGE_NAME=uImage
 endif
-LINUX_DEPENDENCIES+=host-uboot-mkimage
+LINUX_DEPENDENCIES+=host-uboot-tools
 else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
 LINUX_IMAGE_NAME=bzImage
 else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
diff --git a/package/Config.in b/package/Config.in
index db730ec..a01f8d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -206,7 +206,7 @@ source "package/sredird/Config.in"
 source "package/sshfs/Config.in"
 source "package/statserial/Config.in"
 source "package/sysstat/Config.in"
-source "package/uboot-mkimage/Config.in"
+source "package/uboot-tools/Config.in"
 source "package/udev/Config.in"
 source "package/usb_modeswitch/Config.in"
 source "package/usbmount/Config.in"
diff --git a/package/uboot-mkimage/Config.in b/package/uboot-mkimage/Config.in
deleted file mode 100644
index e1dec53..0000000
--- a/package/uboot-mkimage/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_UBOOT_MKIMAGE
-	bool "uboot-mkimage"
-	help
-	  The mkimage tool from Das U-Boot bootloader, which allows
-	  generation of U-Boot images in various formats.
-
-	  http://www.denx.de/wiki/U-Boot/WebHome
diff --git a/package/uboot-mkimage/uboot-mkimage.mk b/package/uboot-mkimage/uboot-mkimage.mk
deleted file mode 100644
index d8a8fbb..0000000
--- a/package/uboot-mkimage/uboot-mkimage.mk
+++ /dev/null
@@ -1,31 +0,0 @@
-UBOOT_MKIMAGE_VERSION = 2011.03
-UBOOT_MKIMAGE_SOURCE  = u-boot-$(UBOOT_MKIMAGE_VERSION).tar.bz2
-UBOOT_MKIMAGE_SITE    = ftp://ftp.denx.de/pub/u-boot
-
-define UBOOT_MKIMAGE_BUILD_CMDS
-	$(MAKE) -C $(@D) 			\
-		HOSTCC="$(TARGET_CC)"		\
-		HOSTCFLAGS="$(TARGET_CFLAGS)"	\
-		HOSTLDFLAGS="$(TARGET_LDFLAGS)"	\
-		HOSTSTRIP=true			\
-		tools
-endef
-
-define UBOOT_MKIMAGE_INSTALL_CMDS
-	install -m 0755 -D $(@D)/tools/mkimage $(TARGET_DIR)/usr/bin
-endef
-
-define HOST_UBOOT_MKIMAGE_BUILD_CMDS
-	$(MAKE) -C $(@D) 			\
-		HOSTCC="$(HOSTCC)"		\
-		HOSTCFLAGS="$(HOST_CFLAGS)"	\
-		HOSTLDFLAGS="$(HOST_LDFLAGS)"	\
-		tools
-endef
-
-define HOST_UBOOT_MKIMAGE_INSTALL_CMDS
-	install -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin
-endef
-
-$(eval $(call GENTARGETS,package,uboot-mkimage))
-$(eval $(call GENTARGETS,package,uboot-mkimage,host))
diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
new file mode 100644
index 0000000..f197391
--- /dev/null
+++ b/package/uboot-tools/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_UBOOT_TOOLS
+	bool "u-boot tools"
+	help
+	  Companion tools for Das U-Boot bootloader.
+
+	  http://www.denx.de/wiki/U-Boot/WebHome
+
+if BR2_PACKAGE_UBOOT_TOOLS
+
+config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
+	bool "mkimage"
+	help
+	  The mkimage tool from Das U-Boot bootloader, which allows
+	  generation of U-Boot images in various formats.
+
+config BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
+	bool "fw_printenv"
+	help
+	  The fw_printenv / fw_setenv tools from Das U-Boot
+	  bootloader, which allows access to the U-Boot environment
+	  from Linux.
+
+endif
diff --git a/package/uboot-mkimage/uboot-mkimage-2011.03-drop-configh.patch b/package/uboot-tools/uboot-tools-2011.03-drop-configh.patch
similarity index 100%
rename from package/uboot-mkimage/uboot-mkimage-2011.03-drop-configh.patch
rename to package/uboot-tools/uboot-tools-2011.03-drop-configh.patch
diff --git a/package/uboot-mkimage/uboot-mkimage-2011.03-hostcflags-override-fix.patch b/package/uboot-tools/uboot-tools-2011.03-hostcflags-override-fix.patch
similarity index 100%
rename from package/uboot-mkimage/uboot-mkimage-2011.03-hostcflags-override-fix.patch
rename to package/uboot-tools/uboot-tools-2011.03-hostcflags-override-fix.patch
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
new file mode 100644
index 0000000..b9e0f21
--- /dev/null
+++ b/package/uboot-tools/uboot-tools.mk
@@ -0,0 +1,55 @@
+UBOOT_TOOLS_VERSION = 2011.03
+UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
+UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
+
+define UBOOT_TOOLS_BUILD_CMDS
+	$(MAKE) -C $(@D) 			\
+		HOSTCC="$(TARGET_CC)"		\
+		HOSTCFLAGS="$(TARGET_CFLAGS)"	\
+		HOSTLDFLAGS="$(TARGET_LDFLAGS)"	\
+		HOSTSTRIP=true			\
+		tools env
+endef
+
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE),y)
+define UBOOT_TOOLS_INSTALL_MKIMAGE
+	install -m 0755 -D $(@D)/tools/mkimage $(TARGET_DIR)/usr/bin
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV),y)
+define UBOOT_TOOLS_INSTALL_FWPRINTENV
+	install -m 0755 -D $(@D)/tools/env/fw_printenv $(TARGET_DIR)/usr/sbin
+	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
+endef
+endif
+
+define UBOOT_TOOLS_INSTALL_TARGET_CMDS
+	$(UBOOT_TOOLS_INSTALL_MKIMAGE)
+	$(UBOOT_TOOLS_INSTALL_FWPRINTENV)
+endef
+
+define UBOOT_TOOLS_UNINSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR)/,\
+		usr/bin/mkimage usr/sbin/fw_printenv usr/sbin/fw_setenv)
+endef
+
+
+define BUSYBOX_UNINSTALL_TARGET_CMDS
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) uninstall
+endef
+
+define HOST_UBOOT_TOOLS_BUILD_CMDS
+	$(MAKE1) -C $(@D) 			\
+		HOSTCC="$(HOSTCC)"		\
+		HOSTCFLAGS="$(HOST_CFLAGS)"	\
+		HOSTLDFLAGS="$(HOST_LDFLAGS)"	\
+		tools
+endef
+
+define HOST_UBOOT_TOOLS_INSTALL_CMDS
+	install -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin
+endef
+
+$(eval $(call GENTARGETS,package,uboot-tools))
+$(eval $(call GENTARGETS,package,uboot-tools,host))
-- 
1.7.3.4
