From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 16:16:59 +0200
Subject: [Buildroot] [git commit] mender-grubenv: new package
Message-ID: <20190610141900.AD5A48F62B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c52d4bee6c55ea13aeec8f013acdaeda8c9e519
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mender-grubenv contains the boot scripts and tools used by Mender to
integrate with the Grub2 bootloader.

The user must select the following Grub modules for this package:
loadenv, hashsum, echo, halt, gcry_sha256, and test.

Because this patch also includes a grub version of fw_printenv and fw_setenv,
package/mender/Config.in must be changed as well at the same time, because if
both uboot-tools and this package are selected, during startup, mender calls
the uboot-tools version of fw_printenv and fails to start.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Tested-by: Mirza Krak <mirza.krak@northern.tech>
Acked-by: Mirza Krak <mirza.krak@northern.tech>
[Arnout:
 - reorder depends clauses;
 - add runtime tag to grub2 dependency
 - remove wchar dependency from comment
 - only error if BR_BUILDING
 - use install instead of cp for a single file.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/mender-grubenv/Config.in           | 43 ++++++++++++++++++++++++
 package/mender-grubenv/mender-grubenv.hash |  3 ++
 package/mender-grubenv/mender-grubenv.mk   | 53 ++++++++++++++++++++++++++++++
 package/mender/Config.in                   |  4 +--
 6 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7025ac69ef..276b883213 100644
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
index f61009410d..a14736c599 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2197,6 +2197,7 @@ menu "System tools"
 	source "package/libostree/Config.in"
 	source "package/lxc/Config.in"
 	source "package/mender/Config.in"
+	source "package/mender-grubenv/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
diff --git a/package/mender-grubenv/Config.in b/package/mender-grubenv/Config.in
new file mode 100644
index 0000000000..e1c785fb44
--- /dev/null
+++ b/package/mender-grubenv/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_MENDER_GRUBENV
+	bool "mender-grubenv"
+	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_MENDER # runtime
+	# grubenv provides it's own fw_printenv.
+	depends on !BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
+	depends on BR2_TARGET_GRUB2 # runtime
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
+comment "mender-grubenv needs a grub2 bootloader"
+	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_MENDER
+	depends on !BR2_TARGET_GRUB2
+
+comment "mender-grubenv does not work with uboot-tools fw_printenv"
+	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
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
index 0000000000..c947f2ff9d
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
+ifeq ($(BR2_PACKAGE_MENDER_GRUBENV)$(BR_BUILDING),yy)
+ifneq ($(MENDER_GRUBENV_MODULES_MISSING),)
+$(error The following missing grub2 modules must be enabled for mender-grubenv \
+	to work: $(MENDER_GRUBENV_MODULES_MISSING))
+endif
+endif
+
+define MENDER_GRUBENV_CONFIGURE_CMDS
+	$(INSTALL) -m 0644 $(MENDER_GRUBENV_DEFINES) $(@D)/mender_grubenv_defines
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
index db1a5caa43..5cb3a3f2e0 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_XZ
-	select BR2_PACKAGE_UBOOT_TOOLS # runtime
-	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV # runtime
+	select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # runtime
+	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT # runtime
 	help
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
