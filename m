From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Feb 2016 10:22:33 +0100
Subject: [Buildroot] [git commit] mali-t76x: add new package
Message-ID: <20160302202753.B168F80203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=536ba133b04aa8b4991c411dcd2b76be849127ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package provides the binary user-space components for the ARM Mali
Midgard T76X GPU.

Note that this package requires a kernel with the ARM Mali Midgard GPU
Kernel Drivers enabled.

Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                |  1 +
 package/mali-t76x/Config.in      | 28 ++++++++++++++++++++++++++++
 package/mali-t76x/egl.pc         | 11 +++++++++++
 package/mali-t76x/glesv2.pc      | 11 +++++++++++
 package/mali-t76x/mali-t76x.hash |  2 ++
 package/mali-t76x/mali-t76x.mk   | 27 +++++++++++++++++++++++++++
 6 files changed, 80 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7a9ed0a..11569d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -399,6 +399,7 @@ endif
 	source "package/lshw/Config.in"
 	source "package/lsuio/Config.in"
 	source "package/lvm2/Config.in"
+	source "package/mali-t76x/Config.in"
 	source "package/mdadm/Config.in"
 	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
diff --git a/package/mali-t76x/Config.in b/package/mali-t76x/Config.in
new file mode 100644
index 0000000..6c2ae4e
--- /dev/null
+++ b/package/mali-t76x/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_MALI_T76X
+	bool "mali-t76x"
+	select BR2_PACKAGE_MESA3D_HEADERS
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_ARM_EABIHF
+	depends on BR2_arm
+	help
+	  Install the binary user-space components for the ARM Mali Midgard
+	  T76X GPU. This package requires a kernel with the ARM Mali Midgard
+	  GPU Kernel Drivers enabled.
+
+	  Source: http://malideveloper.arm.com/resources/drivers/
+
+if BR2_PACKAGE_MALI_T76X
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "mali-t76x"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "mali-t76x"
+
+endif
+
+comment "mali-t76x needs an (e)glibc toolchain with armhf enabled"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
diff --git a/package/mali-t76x/egl.pc b/package/mali-t76x/egl.pc
new file mode 100644
index 0000000..614b700
--- /dev/null
+++ b/package/mali-t76x/egl.pc
@@ -0,0 +1,11 @@
+prefix=/usr/
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: egl
+Description: ARM Mali implementation of EGL
+Version: 1.5
+Requires:
+Libs: -L${libdir} -lEGL -lGLESv2
+Cflags: -I${includedir} -DMESA_EGL_NO_X11_HEADERS
diff --git a/package/mali-t76x/glesv2.pc b/package/mali-t76x/glesv2.pc
new file mode 100644
index 0000000..5997eac
--- /dev/null
+++ b/package/mali-t76x/glesv2.pc
@@ -0,0 +1,11 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: glesv2
+Description: ARM Mali implementation of OpenGL ESv2
+Version: 2.0
+Requires:
+Libs: -L${libdir} -lGLESv2 -lGLESv1_CM
+Cflags: -I${includedir} -DMESA_EGL_NO_X11_HEADERS
diff --git a/package/mali-t76x/mali-t76x.hash b/package/mali-t76x/mali-t76x.hash
new file mode 100644
index 0000000..a754b98
--- /dev/null
+++ b/package/mali-t76x/mali-t76x.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  5a0b00438edc8066b374481d3332a43c07ec2bd3bc73265983a968970f754902  mali-t76x_r5p0-06rel0_linux_1+fbdev.tar.gz
diff --git a/package/mali-t76x/mali-t76x.mk b/package/mali-t76x/mali-t76x.mk
new file mode 100644
index 0000000..702f583
--- /dev/null
+++ b/package/mali-t76x/mali-t76x.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# mali-t76x
+#
+################################################################################
+
+MALI_T76X_VERSION = r5p0-06rel0
+MALI_T76X_SOURCE = mali-t76x_$(MALI_T76X_VERSION)_linux_1+fbdev.tar.gz
+MALI_T76X_SITE = http://malideveloper.arm.com/downloads/drivers/binary/$(MALI_T76X_VERSION)
+
+MALI_T76X_INSTALL_STAGING = YES
+MALI_T76X_PROVIDES = libegl libgles
+
+define MALI_T76X_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 755 $(@D)/*.so $(STAGING_DIR)/usr/lib/
+
+	$(INSTALL) -D -m 0644 package/mali-t76x/egl.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+	$(INSTALL) -D -m 0644 package/mali-t76x/glesv2.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
+endef
+
+define MALI_T76X_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 $(@D)/*.so $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
