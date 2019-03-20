From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 20 Mar 2019 14:30:22 -0400
Subject: [Buildroot] [PATCH v2 1/1] mender-grubenv: new package
Message-ID: <20190320183022.19052-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Mender-grubenv contains the boot scripts and tools used by Mender to
integrate with the Grub2 bootloader.

The user must select the following Grub modules for this package:
loadenv, hashsum, echo, halt, gcry_sha256, and test.

Because this patch also includes a grub version of fw_printenv and fw_setenv,
package/mender/Config.in must be changed as well at the same time, because if
both uboot-tools and this package are selected, during startup, mender calls
the uboot-tools version of fw_printenv and fails to start.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
    package/meson/Config.in:
    - Remove select BR2_PACKAGE_MENDER_GRUBENV if BR2_TARGET_GRUB2 from
      package/mender/Config.in, and instead just change the uboot lines to
      conditionals.

  - package/meson-grubenv/Config.in:
    - Remove depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS (Arnout)
    - Add depends on BR2_PACKAGE_MENDER # runtime. (Arnout)
    - Add depends on !BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
    - Remove default string of package/mender-grubenv/mender_grubenv_defines
      (Arnout)
    - Add a more comprehensive help message for the
      BR2_PACKAGE_MENDER_GRUBENV_DEFINES option.
    - Add a new comment explaining that mender-grubenv does not work
      with uboot-tools fw_printenv.

  - package/meson-grubenv/meson-grubenv.mk: 
    - Use the github helper for the URL. (Arnout)
    - Change Apache2.0 to Apache-2.0.
    - Remove the MENDER_GRUBENV_SOURCE variable.
    - Add a MENDER_GRUBENV_MAKE_ENV variable. (Arnout)
    - Add a check for the MENDER_GRUBENV_DEFINES variable to see if the
      BR2_PACKAGE_MENDER_GRUBENV_DEFINES variable is blank, and if so
      set the variable to $(@D)/mender_grubenv_defines.example. (Thanks Yann.)
    - Print only the missing grub modules. (Arnout)
    - Move the copying of MENDER_GRUBENV_DEFINES to the configure step. (Arnout)
    - Use MENDER_GRUBENV_MAKE_ENV during the build and install steps. (Arnout)

  - package/meson-grubenv/meson-grubenv.hash:
    - Use mender-grubenv-1.3.0.tar.gz instead of 1.3.0.tar.gz.

 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/mender-grubenv/Config.in           | 42 +++++++++++++++++
 package/mender-grubenv/mender-grubenv.hash |  3 ++
 package/mender-grubenv/mender-grubenv.mk   | 53 ++++++++++++++++++++++
 package/mender/Config.in                   |  4 +-
 6 files changed, 102 insertions(+), 2 deletions(-)
 create mode 100644 package/mender-grubenv/Config.in
 create mode 100644 package/mender-grubenv/mender-grubenv.hash
 create mode 100644 package/mender-grubenv/mender-grubenv.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3e0ac08e11..4ab0931f4e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -50,6 +50,7 @@ F:	package/libselinux/
 F:	package/libsemanage/
 F:	package/libsepol/
 F:	package/libwebsockets/
+F:	package/mender-grubenv/
 F:	package/nginx-naxsi/
 F:	package/openjdk/
 F:	package/openjdk-bin/
diff --git a/package/Config.in b/package/Config.in
index b5321aeb49..7eb833627b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2168,6 +2168,7 @@ menu "System tools"
 	source "package/libostree/Config.in"
 	source "package/lxc/Config.in"
 	source "package/mender/Config.in"
+	source "package/mender-grubenv/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
diff --git a/package/mender-grubenv/Config.in b/package/mender-grubenv/Config.in
new file mode 100644
index 0000000000..7d5f7f0861
--- /dev/null
+++ b/package/mender-grubenv/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_MENDER_GRUBENV
+	bool "mender-grubenv"
+	depends on BR2_PACKAGE_MENDER # runtime
+	# grubenv provides it's own fw_printenv.
+	depends on !BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
+	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
+	depends on BR2_TARGET_GRUB2
+	help
+	  Contains the boot scripts and tools used by Mender to
+	  integrate with the GRUB bootloader.
+
+	  The following Grub modules must be selected for this package:
+	  loadenv hashsum echo halt gcry_sha256 test
+
+	  https://github.com/mendersoftware/grub-mender-grubenv
+
+if BR2_PACKAGE_MENDER_GRUBENV
+
+config BR2_PACKAGE_MENDER_GRUBENV_DEFINES
+	string "path to grubenv defines"
+	help
+	  Specify a path to the mender grubenv defines file.
+	  If no path is specified, the example file in the source
+	  directory will be used.
+
+	  The example file in the source directory sets the following:
+	  mender_rootfsa_part=2
+	  mender_rootfsb_part=3
+	  mender_kernel_root_base=/dev/mmcblk0p
+	  mender_grub_storage_device=hd0
+	  kernel_imagetype=bzImage
+
+endif
+
+comment "mender-grubenv needs a grub2 bootloader and a toolchain w/ wchar"
+	depends on BR2_PACKAGE_MENDER
+	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
+	depends on !BR2_TARGET_GRUB2 || !BR2_USE_WCHAR
+
+comment "mender-grubenv does not work with uboot-tools fw_printenv"
+	depends on BR2_PACKAGE_MENDER
+	depends on BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
new file mode 100644
index 0000000000..1b1eaa758a
--- /dev/null
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 e50cc18a844e3fd1edef7af9224733b0338a34d51f1186ee19803ef7af1a5065 mender-grubenv-1.3.0.tar.gz
+sha256 98ed35b5a138f58164b5c0dbccd9d7f01ef4d84b9dba01e896f0a3241c50c0f7 LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
new file mode 100644
index 0000000000..e5724d7855
--- /dev/null
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# mender-grubenv
+#
+################################################################################
+
+MENDER_GRUBENV_VERSION = 1.3.0
+MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
+MENDER_GRUBENV_LICENSE = Apache-2.0
+MENDER_GRUBENV_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
+MENDER_GRUBENV_ENV_DIR = /boot/grub
+else
+MENDER_GRUBENV_ENV_DIR = /boot/efi/EFI/BOOT
+endif
+
+MENDER_GRUBENV_MAKE_ENV = \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) \
+	ENV_DIR=$(MENDER_GRUBENV_ENV_DIR)
+
+MENDER_GRUBENV_DEFINES = \
+	$(or $(call qstrip,$(BR2_PACKAGE_MENDER_GRUBENV_DEFINES)),\
+		$(@D)/mender_grubenv_defines.example)
+
+# These grub modules must be built in for the grub scripts to work properly.
+# Without them, the system will not boot.
+MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test
+MENDER_GRUBENV_MODULES_MISSING = \
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
+		$(MENDER_GRUBENV_MANDATORY_MODULES))
+
+ifeq ($(BR2_PACKAGE_MENDER_GRUBENV),y)
+ifneq ($(MENDER_GRUBENV_MODULES_MISSING),)
+$(error The following missing grub2 modules must be enabled for mender-grubenv \
+	to work: $(MENDER_GRUBENV_MODULES_MISSING))
+endif
+endif
+
+define MENDER_GRUBENV_CONFIGURE_CMDS
+	cp -dpfr  $(MENDER_GRUBENV_DEFINES) $(@D)/mender_grubenv_defines
+endef
+
+define MENDER_GRUBENV_BUILD_CMDS
+	$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define MENDER_GRUBENV_INSTALL_TARGET_CMDS
+	$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
diff --git a/package/mender/Config.in b/package/mender/Config.in
index 5ab2304e49..0088d54008 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -3,8 +3,8 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_UBOOT_TOOLS # runtime
-	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV # runtime
+	select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # runtime
+	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT # runtime
 	help
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
-- 
2.20.1
