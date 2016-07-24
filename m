From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 22:32:48 +0200
Subject: [Buildroot] [git commit] odroid-mali: new package
Message-ID: <20160724203316.450BA807D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55e04e8d4a81bd27a7a0559e4ff76dc3f940a43f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dagg Stompler <daggs@gmx.com>
[Thomas:
 - restrict to EABIhf for ARM, since the libraries are pre-built for
   this ABI
 - add comment about the glibc dependency
 - indicate odroid-scripts is a runtime dependency
 - remove fbset dependency]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/odroid-mali/Config.in        | 25 +++++++++++++++++++++++++
 package/odroid-mali/odroid-mali.hash |  2 ++
 package/odroid-mali/odroid-mali.mk   | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index be9b4cb..814141f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -414,6 +414,7 @@ endmenu
 	source "package/nvidia-driver/Config.in"
 	source "package/nvidia-tegra23/Config.in"
 	source "package/nvme/Config.in"
+	source "package/odroid-mali/Config.in"
 	source "package/odroid-scripts/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
new file mode 100644
index 0000000..2cd8e0d
--- /dev/null
+++ b/package/odroid-mali/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_ODROID_MALI
+	bool "odroid-mali"
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_ODROID_SCRIPTS # runtime
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_aarch64 || BR2_ARM_EABIHF
+	help
+	  Install the ARM Mali drivers for odroidc2 based systems.
+
+	  https://github.com/mdrjr/c2_mali
+
+if BR2_PACKAGE_ODROID_MALI
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "odroid-mali"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "odroid-mali"
+
+endif
+
+comment "odroid-mali needs a glibc toolchain"
+	depends on BR2_aarch64 || BR2_ARM_EABIHF
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/odroid-mali/odroid-mali.hash b/package/odroid-mali/odroid-mali.hash
new file mode 100644
index 0000000..4d24824
--- /dev/null
+++ b/package/odroid-mali/odroid-mali.hash
@@ -0,0 +1,2 @@
+# Locally computed hash
+sha256 29d98ed4b8694b860d9289787c416faa847b0de26d36580a53add1752b4c2e9a  odroid-mali-46fe49f37e3506c6205ad8c50980eca9bfff11e3.tar.gz
diff --git a/package/odroid-mali/odroid-mali.mk b/package/odroid-mali/odroid-mali.mk
new file mode 100644
index 0000000..7b8e511
--- /dev/null
+++ b/package/odroid-mali/odroid-mali.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# odroid-mali
+#
+################################################################################
+
+ODROID_MALI_VERSION = 46fe49f37e3506c6205ad8c50980eca9bfff11e3
+ODROID_MALI_SITE = $(call github,mdrjr,c2_mali,$(ODROID_MALI_VERSION))
+ODROID_MALI_LICENSE = Hardkernel EULA
+ODROID_MALI_LICENSE_FILES = README.md
+
+ODROID_MALI_INSTALL_STAGING = YES
+ODROID_MALI_PROVIDES = libegl libgles
+
+ifeq ($(BR2_aarch64),y)
+ODROID_MALI_INSTALL_ARCH = mali_libs
+else
+ODROID_MALI_INSTALL_ARCH = 32bit_libs
+endif
+
+define ODROID_MALI_INSTALL_LIBS
+	cp -dpfr $(@D)/fbdev/$(ODROID_MALI_INSTALL_ARCH)/lib* $(1)/usr/lib/
+endef
+
+define ODROID_MALI_INSTALL_STAGING_CMDS
+	$(call ODROID_MALI_INSTALL_LIBS,$(STAGING_DIR))
+	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
+	cp -dpfr $(@D)/pkgconfig/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/
+	cp -dpfr $(@D)/fbdev/mali_headers/* $(STAGING_DIR)/usr/include
+endef
+
+define ODROID_MALI_INSTALL_TARGET_CMDS
+	$(call ODROID_MALI_INSTALL_LIBS,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
