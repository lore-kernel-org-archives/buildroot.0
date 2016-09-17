From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 15:34:05 +0200
Subject: [Buildroot] [git commit] xvisor: new package
Message-ID: <20160917133424.1A34481DD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e23ddf0c13e6d3b054782b86188396a0c2add1a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package provides Xvisor, an open-source type-1 hypervisor,
which aims at providing a monolithic, light-weight, portable, and
flexible virtualization solution.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
[Thomas:
 - use MKIMAGE_ARCH instead of BR2_ARCH when calling mkimage
 - use $(MKIMAGE)
 - license is GPLv2+.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 .../0001-Makefile-Fix-oldconfig-make-target.patch  | 30 +++++++++
 .../xvisor/0002-openconf-do-not-check-stdin.patch  | 58 +++++++++++++++++
 package/xvisor/Config.in                           | 58 +++++++++++++++++
 package/xvisor/xvisor.hash                         |  2 +
 package/xvisor/xvisor.mk                           | 72 ++++++++++++++++++++++
 6 files changed, 221 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 332f05d..d571b89 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1732,6 +1732,7 @@ menu "System tools"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
 	source "package/xen/Config.in"
+	source "package/xvisor/Config.in"
 endmenu
 
 menu "Text editors and viewers"
diff --git a/package/xvisor/0001-Makefile-Fix-oldconfig-make-target.patch b/package/xvisor/0001-Makefile-Fix-oldconfig-make-target.patch
new file mode 100644
index 0000000..f056625
--- /dev/null
+++ b/package/xvisor/0001-Makefile-Fix-oldconfig-make-target.patch
@@ -0,0 +1,30 @@
+From 99bbdc042ee4c92a13edcfeaf336aa755a199d0f Mon Sep 17 00:00:00 2001
+From: Anup Patel <anup@brainfault.org>
+Date: Sun, 11 Sep 2016 19:53:40 +0530
+Subject: [PATCH] Makefile: Fix oldconfig make target
+
+Use "-s" instead of "-o" option of "openconf/conf" tool because
+the "-o" option does not generate all required openconf files.
+
+Signed-off-by: Anup Patel <anup@brainfault.org>
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 149a682..e05e801 100644
+--- a/Makefile
++++ b/Makefile
+@@ -434,7 +434,7 @@ menuconfig:
+ oldconfig:
+ 	$(V)mkdir -p $(OPENCONF_TMPDIR)
+ 	$(V)$(MAKE) -C tools/openconf oldconfig
+-	./tools/openconf/conf -o $(OPENCONF_INPUT)
++	./tools/openconf/conf -s $(OPENCONF_INPUT)
+ 
+ # Rule for "make savedefconfig"
+ .PHONY: savedefconfig
+-- 
+2.4.11
+
diff --git a/package/xvisor/0002-openconf-do-not-check-stdin.patch b/package/xvisor/0002-openconf-do-not-check-stdin.patch
new file mode 100644
index 0000000..34b350d
--- /dev/null
+++ b/package/xvisor/0002-openconf-do-not-check-stdin.patch
@@ -0,0 +1,58 @@
+From 6b49c1dbe0ac43e39eec97a7e79cf5fb995747dc Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Mon, 12 Sep 2016 21:49:55 +0530
+Subject: [PATCH] openconf: do not check stdin
+
+Do not check if stdin is redirected when ask_silent is true, so the
+`yes` program can be used to answer the questions about new values.
+
+Example:
+
+  yes "" | make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- oldconfig
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Signed-off-by: Anup Patel <anup@brainfault.org>
+---
+ tools/openconf/conf.c | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/tools/openconf/conf.c b/tools/openconf/conf.c
+index a428058..711cf0b 100644
+--- a/tools/openconf/conf.c
++++ b/tools/openconf/conf.c
+@@ -65,16 +65,6 @@ static void strip(char *str)
+ 		*p-- = 0;
+ }
+ 
+-static void check_stdin(void)
+-{
+-	if (!valid_stdin) {
+-		printf("aborted!\n\n");
+-		printf("Console input/output is redirected. ");
+-		printf("Run 'make oldconfig' to update configuration.\n\n");
+-		exit(1);
+-	}
+-}
+-
+ static int conf_askvalue(struct symbol *sym, const char *def)
+ {
+ 	char *ret;
+@@ -100,7 +90,6 @@ static int conf_askvalue(struct symbol *sym, const char *def)
+ 			printf("%s\n", def);
+ 			return 0;
+ 		}
+-		check_stdin();
+ 	case ask_all:
+ 		fflush(stdout);
+ 		ret = fgets(line, 128, stdin);
+@@ -306,7 +295,6 @@ static int conf_choice(struct menu *menu)
+ 				printf("%d\n", cnt);
+ 				break;
+ 			}
+-			check_stdin();
+ 		case ask_all:
+ 			fflush(stdout);
+ 			ret = fgets(line, 128, stdin);
+-- 
+2.4.11
+
diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
new file mode 100644
index 0000000..f450f6f
--- /dev/null
+++ b/package/xvisor/Config.in
@@ -0,0 +1,58 @@
+menuconfig BR2_PACKAGE_XVISOR
+	bool "xvisor"
+	depends on BR2_USE_MMU
+	depends on BR2_arm || BR2_aarch64 || BR2_x86_64
+	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV7M
+	help
+	  Xvisor is an open-source type-1 hypervisor, which aims at providing
+	  a monolithic, light-weight, portable, and flexible virtualization
+	  solution.
+
+	  http://www.xhypervisor.org/
+
+if BR2_PACKAGE_XVISOR
+
+choice
+	prompt "Xvisor configuration"
+	default BR2_PACKAGE_XVISOR_USE_DEFCONFIG
+
+config BR2_PACKAGE_XVISOR_USE_DEFCONFIG
+	bool "Using an in-tree defconfig file"
+
+config BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG
+	bool "Using a custom (def)config file"
+
+endchoice
+
+config BR2_PACKAGE_XVISOR_DEFCONFIG
+	string "Defconfig name"
+	depends on BR2_PACKAGE_XVISOR_USE_DEFCONFIG
+	default "generic-v5" if BR2_ARM_CPU_ARMV5
+	default "generic-v6" if BR2_ARM_CPU_ARMV6
+	default "generic-v7" if BR2_ARM_CPU_ARMV7A
+	default "generic-v8" if BR2_AARCH64
+	default "x86_64_generic" if BR2_x86_64
+	help
+	  Name of the Xvisor defconfig file to use, without the
+	  trailing -defconfig. The defconfig is located in
+	  arch/<arch>/configs in the source tree.
+
+config BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG
+	help
+	  Path to the Xvisor configuration file
+
+config BR2_PACKAGE_XVISOR_CREATE_UBOOT_IMAGE
+	bool "Create U-Boot image of Xvisor"
+	depends on BR2_arm
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	help
+	  Create an image file of Xvisor loadable from Das U-Boot.
+
+config BR2_PACKAGE_XVISOR_BUILD_TEST_DTB
+	bool "Build test device-tree blobs"
+	help
+	  Build test device-tree blobs for popular boards.
+
+endif
diff --git a/package/xvisor/xvisor.hash b/package/xvisor/xvisor.hash
new file mode 100644
index 0000000..13335be
--- /dev/null
+++ b/package/xvisor/xvisor.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 9347080c3481fb8586d196dd51a580a57084bfea1bc425e89f7fa0da7170708a xvisor-0.2.8.tar.gz
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
new file mode 100644
index 0000000..a9a5dbf
--- /dev/null
+++ b/package/xvisor/xvisor.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# xvisor
+#
+################################################################################
+
+XVISOR_VERSION = 0.2.8
+XVISOR_SITE = http://www.xhypervisor.org/tarball
+XVISOR_LICENSE = GPLv2+
+XVISOR_LICENSE_FILES = COPYING
+XVISOR_INSTALL_IMAGES = YES
+XVISOR_INSTALL_TARGET = NO
+
+XVISOR_MAKE_TARGETS = all
+
+ifeq ($(BR2_PACKAGE_XVISOR_BUILD_TEST_DTB),y)
+XVISOR_MAKE_TARGETS += dtbs
+endif
+
+XVISOR_KCONFIG_DOTCONFIG = build/openconf/.config
+
+ifeq ($(BR2_PACKAGE_XVISOR_USE_DEFCONFIG),y)
+XVISOR_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_PACKAGE_XVISOR_DEFCONFIG))-defconfig
+else ifeq ($(BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG),y)
+XVISOR_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE))
+endif
+XVISOR_KCONFIG_EDITORS = menuconfig
+
+XVISOR_MAKE_ENV = \
+	ARCH=$(if $(BR2_x86_64),x86,$(BR2_ARCH)) \
+	CROSS_COMPILE=$(TARGET_CROSS)
+
+XVISOR_MAKE_OPTS = $(if $(VERBOSE),VERBOSE=1)
+
+define XVISOR_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(XVISOR_MAKE_ENV) $(MAKE) $(XVISOR_MAKE_OPTS) \
+		-C $(@D) $(XVISOR_MAKE_TARGETS)
+endef
+
+define XVISOR_INSTALL_IMAGES_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/build/vmm.bin $(BINARIES_DIR)/vmm.bin
+endef
+
+ifeq ($(BR2_PACKAGE_XVISOR_CREATE_UBOOT_IMAGE),y)
+XVISOR_DEPENDENCIES += host-uboot-tools
+define XVISOR_CREATE_UBOOT_IMAGE
+	$(MKIMAGE) -A $(MKIMAGE_ARCH) -O linux -T kernel -C none \
+		-a 0x00008000 -e 0x00008000 \
+		-n Xvisor -d $(BINARIES_DIR)/vmm.bin $(BINARIES_DIR)/uvmm.bin
+endef
+endif
+
+XVISOR_POST_INSTALL_IMAGES_HOOKS += XVISOR_CREATE_UBOOT_IMAGE
+
+# Checks to give errors that the user can understand
+ifeq ($(BR_BUILDING),y)
+
+ifeq ($(BR2_PACKAGE_XVISOR_USE_DEFCONFIG),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_XVISOR_DEFCONFIG)),)
+$(error No Xvisor defconfig name specified, check your BR2_PACKAGE_XVISOR_DEFCONFIG setting)
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG),y)
+ifeq ($(BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE),)
+$(error No Xvisor configuration file specified, check your BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE setting)
+endif
+endif
+
+endif
+
+$(eval $(kconfig-package))
