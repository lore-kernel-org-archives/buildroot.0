From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 19 Mar 2019 15:01:45 -0400
Subject: [Buildroot] [PATCH 1/1] mender-grubenv: new package
Message-ID: <20190319190145.52354-1-aduskett@gmail.com>
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
the uboot-tools fw_printenv and fails to start.

Also included is an example mender_grubenv_defines which is needed
during the compilation step. This file is set up to work with qemu based
systems.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/mender-grubenv/Config.in              | 39 ++++++++++++++++
 package/mender-grubenv/mender-grubenv.hash    |  3 ++
 package/mender-grubenv/mender-grubenv.mk      | 44 +++++++++++++++++++
 package/mender-grubenv/mender_grubenv_defines | 32 ++++++++++++++
 package/mender/Config.in                      |  5 ++-
 7 files changed, 123 insertions(+), 2 deletions(-)
 create mode 100644 package/mender-grubenv/Config.in
 create mode 100644 package/mender-grubenv/mender-grubenv.hash
 create mode 100644 package/mender-grubenv/mender-grubenv.mk
 create mode 100644 package/mender-grubenv/mender_grubenv_defines

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
index 0000000000..9e849c83fe
--- /dev/null
+++ b/package/mender-grubenv/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_MENDER_GRUBENV
+	bool "mender-grubenv"
+	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # grub2
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
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
+	default package/mender-grubenv/mender_grubenv_defines
+	help
+	  Specify a path to the mender grubenv defines file.
+	  The example file sets the following:
+	  mender_rootfsa_part=2
+	  mender_rootfsb_part=3
+	  mender_kernel_root_base=/dev/vda
+	  mender_grub_storage_device=hd0
+	  kernel_imagetype=bzImage
+
+	  WARNING:
+	  Using the default mender_grubenv_defines file may cause your
+	  system to not boot properly, as it has only been tested on
+	  QEMU based systems!
+
+endif
+
+comment "mender-grubenv needs a grub2 bootloader and a toolchain w/ wchar"
+	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
+	depends on !BR2_USE_WCHAR
diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
new file mode 100644
index 0000000000..b74286d1b8
--- /dev/null
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 e50cc18a844e3fd1edef7af9224733b0338a34d51f1186ee19803ef7af1a5065 1.3.0.tar.gz
+sha256 98ed35b5a138f58164b5c0dbccd9d7f01ef4d84b9dba01e896f0a3241c50c0f7 LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
new file mode 100644
index 0000000000..fecd49d05f
--- /dev/null
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# mender-grubenv
+#
+################################################################################
+
+MENDER_GRUBENV_VERSION = 1.3.0
+MENDER_GRUBENV_SITE = https://github.com/mendersoftware/grub-mender-grubenv/archive
+MENDER_GRUBENV_SOURCE = $(MENDER_GRUBENV_VERSION).tar.gz
+MENDER_GRUBENV_LICENSE = Apache2.0
+MENDER_GRUBENV_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
+MENDER_GRUBENV_ENV_DIR = /boot/grub
+else
+MENDER_GRUBENV_ENV_DIR = /boot/efi/EFI/BOOT
+endif
+
+# These grub modules must be built for the grub scripts to work properly.
+# Without them, the system will not boot.
+MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test
+MENDER_GRUBENV_MODULES_MISSING = \
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
+		$(MENDER_GRUBENV_MANDATORY_MODULES))
+
+ifeq ($(BR2_PACKAGE_MENDER_GRUBENV),y)
+ifneq ($(MENDER_GRUBENV_MODULES_MISSING),)
+$(error The following grub2 modules must be enabled for mender-grubenv to \
+	work: $(MENDER_GRUBENV_MANDATORY_MODULES))
+endif
+endif
+
+define MENDER_GRUBENV_BUILD_CMDS
+	cp -dpfr $(call qstrip,$(BR2_PACKAGE_MENDER_GRUBENV_DEFINES)) \
+		$(@D)/mender_grubenv_defines
+	$(TARGET_MAKE_ENV) ENV_DIR=$(MENDER_GRUBENV_ENV_DIR) $(MAKE) -C $(@D)
+endef
+
+define MENDER_GRUBENV_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) ENV_DIR=$(MENDER_GRUBENV_ENV_DIR) $(MAKE) \
+		DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
diff --git a/package/mender-grubenv/mender_grubenv_defines b/package/mender-grubenv/mender_grubenv_defines
new file mode 100644
index 0000000000..6cc4d5c92e
--- /dev/null
+++ b/package/mender-grubenv/mender_grubenv_defines
@@ -0,0 +1,32 @@
+################################################################################
+# Mandatory
+################################################################################
+# Warning: This file is an example and should be customized to fit your needs!
+
+# Partition index of root filesystem A
+mender_rootfsa_part=2
+
+# Partition index of root filesystem B
+mender_rootfsb_part=3
+
+# Device file corresponding to the root filesystem partitions, without index.
+mender_kernel_root_base=/dev/vda
+
+# Name of the storage device containing root filesystem partitions in GRUB
+# format.
+mender_grub_storage_device=hd0
+
+# Type of kernel (bzImage or zImage)
+kernel_imagetype=bzImage
+
+# Type of initrd image.
+# Note: An initrd image is not strictly necessary, and the system will boot and
+#       update without a initrd image.
+initrd_imagetype=initrd.img
+
+################################################################################
+# Mandatory on ARM
+################################################################################
+
+# Basename of DTB that should be loaded by the bootloader.
+# kernel_devicetree=kernel.dtb
diff --git a/package/mender/Config.in b/package/mender/Config.in
index 5ab2304e49..a1b96656db 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -3,8 +3,9 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_UBOOT_TOOLS # runtime
-	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV # runtime
+	select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # runtime
+	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT # runtime
+	select BR2_PACKAGE_MENDER_GRUBENV if BR2_TARGET_GRUB2 # runtime
 	help
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
-- 
2.20.1
