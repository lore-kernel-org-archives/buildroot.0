From: Dagg Stompler <daggs@gmx.com>
Date: Sun, 24 Jul 2016 08:56:02 +0300
Subject: [Buildroot] [PATCH 2/2 v4] odroid-mali: New Package.
In-Reply-To: <20160724055602.7159-1-daggs@gmx.com>
References: <20160724055602.7159-1-daggs@gmx.com>
Message-ID: <20160724055602.7159-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v3 -> v4:
 - update repo rev to 46fe49f37e3506c6205ad8c50980eca9bfff11e3.
 - update hash
 - 32 and 64 bit flavors can now use the same repo rev.

v2 -> v3:
 - fix pkgconfig installation.

v1 -> v2:
 - added hash for 32 bits revision.
 - fix file permissions for S50odroidc2_fb and odroidc2_init_fb.sh

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/Config.in                    |  1 +
 package/odroid-mali/Config.in        | 21 +++++++++++++++++++++
 package/odroid-mali/odroid-mali.hash |  2 ++
 package/odroid-mali/odroid-mali.mk   | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 package/odroid-mali/Config.in
 create mode 100644 package/odroid-mali/odroid-mali.hash
 create mode 100644 package/odroid-mali/odroid-mali.mk

diff --git a/package/Config.in b/package/Config.in
index a7858dc..f7e7592 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -414,6 +414,7 @@ endmenu
 	source "package/nvidia-driver/Config.in"
 	source "package/nvidia-tegra23/Config.in"
 	source "package/nvme/Config.in"
+	source "package/odroid-mali/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
 	source "package/on2-8170-modules/Config.in"
diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
new file mode 100644
index 0000000..02c6ca0
--- /dev/null
+++ b/package/odroid-mali/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_ODROID_MALI
+	bool "odroid-mali"
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_FBSET
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_aarch64 || BR2_arm
+	depends on BR2_PACKAGE_ODROID_SCRIPTS
+	help
+	  Install the ARM Mali drivers for odroidc2 based systems.
+
+	  https://github.com/mdrjr/c2_mali
+
+if BR2_PACKAGE_ODROID_MALI
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "odroid-mali"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "odroid-mali"
+endif
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
index 0000000..17a7de2
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
+ODROID_MALI_LICENSE = hardkernel
+ODROID_MALI_LICENSE_FILES = README.md
+
+ODROID_MALI_INSTALL_STAGING = YES
+ODROID_MALI_PROVIDES = libegl libgles
+
+ifeq ($(BR2_aarch64),y)
+ODROID_MALI_LIBS_INSTALL_ARCH=mali_libs
+else
+ODROID_MALI_LIBS_INSTALL_ARCH=32bit_libs
+endif
+
+define ODROID_MALI_INSTALL_LIBS
+	cp -aRP $(@D)/fbdev/$(ODROID_MALI_LIBS_INSTALL_ARCH)/lib* $(1)/lib/
+endef
+
+define ODROID_MALI_INSTALL_STAGING_CMDS
+	$(call ODROID_MALI_INSTALL_LIBS,$(STAGING_DIR)/usr)
+	$(INSTALL) -d $(STAGING_DIR)/usr/lib/pkgconfig
+	$(INSTALL) -m 644 $(@D)/pkgconfig/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/
+	cp -aRP $(@D)/fbdev/mali_headers/* $(STAGING_DIR)/usr/include
+endef
+
+define ODROID_MALI_INSTALL_TARGET_CMDS
+	$(call ODROID_MALI_INSTALL_LIBS,$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
2.9.2
