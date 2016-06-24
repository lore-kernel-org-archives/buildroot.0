From: Dagg Stompler <daggs@gmx.com>
Date: Fri, 24 Jun 2016 21:22:54 +0300
Subject: [Buildroot] [PATCH 2/4 v3] odroid-mali: New Package
In-Reply-To: <20160624182256.11909-1-daggs@gmx.com>
References: <20160624182256.11909-1-daggs@gmx.com>
Message-ID: <20160624182256.11909-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v2 -> v3:
 - fix pkgconfig installation.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/Config.in                    |  1 +
 package/odroid-mali/Config.in        | 21 ++++++++++++++++++++
 package/odroid-mali/odroid-mali.hash |  3 +++
 package/odroid-mali/odroid-mali.mk   | 37 ++++++++++++++++++++++++++++++++++++
 4 files changed, 62 insertions(+)
 create mode 100644 package/odroid-mali/Config.in
 create mode 100644 package/odroid-mali/odroid-mali.hash
 create mode 100644 package/odroid-mali/odroid-mali.mk

diff --git a/package/Config.in b/package/Config.in
index 143a304..4b8ff60 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -421,6 +421,7 @@ endif
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
index 0000000..de3edc1
--- /dev/null
+++ b/package/odroid-mali/odroid-mali.hash
@@ -0,0 +1,3 @@
+# Locally computed hash
+sha256 122fe75fc105fc2f7c00b7f075deca567f6a3e56b5c128b00cf3096073b96e66  odroid-mali-4a34d59cd6120db67dc11023344e382afbaf28da.tar.gz
+sha256 29d98ed4b8694b860d9289787c416faa847b0de26d36580a53add1752b4c2e9a  odroid-mali-46fe49f37e3506c6205ad8c50980eca9bfff11e3.tar.gz
diff --git a/package/odroid-mali/odroid-mali.mk b/package/odroid-mali/odroid-mali.mk
new file mode 100644
index 0000000..ffd682c
--- /dev/null
+++ b/package/odroid-mali/odroid-mali.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# odroid-mali
+#
+################################################################################
+
+ifeq ($(BR2_aarch64),y)
+ODROID_MALI_VERSION = 4a34d59cd6120db67dc11023344e382afbaf28da
+ODROID_MALI_LIBS_INSTALL_ARCH=mali_libs
+else
+ODROID_MALI_VERSION = 46fe49f37e3506c6205ad8c50980eca9bfff11e3
+ODROID_MALI_LIBS_INSTALL_ARCH=32bit_libs
+endif
+
+ODROID_MALI_SITE = $(call github,mdrjr,c2_mali,$(ODROID_MALI_VERSION))
+ODROID_MALI_LICENSE = hardkernel
+ODROID_MALI_LICENSE_FILES = README.md
+
+ODROID_MALI_INSTALL_STAGING = YES
+ODROID_MALI_PROVIDES = libegl libgles
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
2.9.0
