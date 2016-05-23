From: daggs <daggs@gmx.com>
Date: Mon, 23 May 2016 20:04:04 +0200
Subject: [Buildroot] [PATCH v2 1/3] add odroid mali GL support.
Message-ID: <trinity-f6e77dc9-0801-497c-8c2c-cb39afd4c51d-1464026644265@3capp-mailcom-bs13>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg <daggs@gmx.com>

---
 package/Config.in                    |  1 +
 package/odroid-mali/Config.in        | 19 +++++++++++++
 package/odroid-mali/egl.pc           | 10 +++++++
 package/odroid-mali/glesv2.pc        | 10 +++++++
 package/odroid-mali/odroid-mali.hash |  1 +
 package/odroid-mali/odroid-mali.mk   | 53 ++++++++++++++++++++++++++++++++++++
 6 files changed, 94 insertions(+)
 create mode 100644 package/odroid-mali/Config.in
 create mode 100644 package/odroid-mali/egl.pc
 create mode 100644 package/odroid-mali/glesv2.pc
 create mode 100644 package/odroid-mali/odroid-mali.hash
 create mode 100644 package/odroid-mali/odroid-mali.mk

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..6c6a562 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -418,6 +418,7 @@ endif
 	source "package/nvidia-driver/Config.in"
 	source "package/nvidia-tegra23/Config.in"
 	source "package/nvme/Config.in"
+	source "package/odroid-mali/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
 	source "package/on2-8170-modules/Config.in"
diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
new file mode 100644
index 0000000..65b1d4f
--- /dev/null
+++ b/package/odroid-mali/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_ODROID_MALI
+	bool "odroid-mali"
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_FBSET
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_aarch64
+	help
+	  Install the ARM Mali drivers for odroid based systems.
+
+	  http://github.com/linux-odroid/odroid-mali
+
+if BR2_PACKAGE_ODROID_MALI
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "odroid-mali"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "odroid-mali"
+endif
diff --git a/package/odroid-mali/egl.pc b/package/odroid-mali/egl.pc
new file mode 100644
index 0000000..5f79b71
--- /dev/null
+++ b/package/odroid-mali/egl.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=/usr
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: egl
+Description: Amlogic implementation of EGL
+Version: 0.99
+Libs: -L${libdir} -lEGL -lGLESv2
+Cflags: -I${includedir}/ 
diff --git a/package/odroid-mali/glesv2.pc b/package/odroid-mali/glesv2.pc
new file mode 100644
index 0000000..7dfb286
--- /dev/null
+++ b/package/odroid-mali/glesv2.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=/usr
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: glesv2
+Description: Amlogic implementation of OpenGL ESv2
+Version: 0.99
+Libs: -L${libdir} -lGLESv2
+Cflags: -I${includedir}/
diff --git a/package/odroid-mali/odroid-mali.hash b/package/odroid-mali/odroid-mali.hash
new file mode 100644
index 0000000..792d30c
--- /dev/null
+++ b/package/odroid-mali/odroid-mali.hash
@@ -0,0 +1 @@
+sha256 1cddeb6990a9446339abde79ca1d01a8480b98cf107019f0847390b9549d90cc  opengl-meson-gxbb-r5p1-01rel0.tar.xz
diff --git a/package/odroid-mali/odroid-mali.mk b/package/odroid-mali/odroid-mali.mk
new file mode 100644
index 0000000..4f2e1ab
--- /dev/null
+++ b/package/odroid-mali/odroid-mali.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# odroid-mali
+#
+################################################################################
+
+ODROID_MALI_VERSION = $(ODROID_DRIVER_VERSION)
+ODROID_MALI_TARBALL = opengl-meson-gxbb-r5p1-01rel0.tar.xz
+ODROID_MALI_SITE = http://sources.openelec.tv/devel
+ODROID_MALI_SOURCE = opengl-meson-gxbb-r5p1-01rel0.tar.xz
+
+ODROID_MALI_INSTALL_STAGING = YES
+ODROID_MALI_PROVIDES = libegl libgles
+
+define ODROID_MALI_LIBS
+	$(INSTALL) -D -m 0644 $(@D)/usr/lib/libMali.so $(1)/lib
+
+	cd $(1)/lib
+	ln -s libMali.so $(1)/lib/libEGL.so
+	ln -s libMali.so $(1)/lib/libGLESv1_CM.so
+	ln -s libMali.so $(1)/lib/libGLESv2.so
+
+	ln -s libEGL.so $(1)/lib/libEGL.so.1
+	ln -s libEGL.so $(1)/lib/libEGL.so.1.4
+	ln -s libGLESv1_CM.so $(1)/lib/libGLESv1_CM.so.1
+	ln -s libGLESv1_CM.so $(1)/lib/libGLESv1_CM.so.1.1
+	ln -s libGLESv2.so $(1)/lib/libGLESv2.so.2
+	ln -s libGLESv2.so $(1)/lib/libGLESv2.so.2.0
+endef
+
+define ODROID_MALI_HDRS
+	mkdir -p $(@D)/usr/include
+	cp -R $(@D)/usr/include/* $(1)/usr/include
+endef
+
+define ODROID_MALI_PCS
+	$(INSTALL) -D -m 0644 package/odroid-mali/egl.pc $(1)/usr/lib/pkgconfig/egl.pc
+	$(INSTALL) -D -m 0644 package/odroid-mali/glesv2.pc $(1)/usr/lib/pkgconfig/glesv2.pc
+endef
+
+define ODROID_MALI_INSTALL_STAGING_CMDS
+	$(call ODROID_MALI_LIBS,$(STAGING_DIR))
+	$(call ODROID_MALI_HDRS,$(STAGING_DIR))
+	$(call ODROID_MALI_PCS,$(STAGING_DIR))
+endef
+
+define ODROID_MALI_INSTALL_CMDS
+	$(call ODROID_MALI_LIBS,$(TARGET_DIR))
+	$(call ODROID_MALI_HDRS,$(TARGET_DIR))
+	$(call ODROID_MALI_PCS,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
-- 
2.8.3
