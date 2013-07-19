From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 19 Jul 2013 18:37:52 -0500
Subject: [Buildroot] [PATCH 2/4] sunxi-mali: new package
In-Reply-To: <1374277074-14455-1-git-send-email-spenser@gillilanding.com>
References: <1374277074-14455-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1374277074-14455-3-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/Config.in                          |  2 +
 package/sunxi-mali-prop/Config.in          |  4 ++
 package/sunxi-mali-prop/sunxi-mali-prop.mk | 10 ++++
 package/sunxi-mali/Config.in               | 52 +++++++++++++++++++
 package/sunxi-mali/S80mali                 | 54 ++++++++++++++++++++
 package/sunxi-mali/egl.pc                  | 12 +++++
 package/sunxi-mali/glesv2.pc               | 12 +++++
 package/sunxi-mali/sunxi-mali.mk           | 82 ++++++++++++++++++++++++++++++
 8 files changed, 228 insertions(+)
 create mode 100644 package/sunxi-mali-prop/Config.in
 create mode 100644 package/sunxi-mali-prop/sunxi-mali-prop.mk
 create mode 100644 package/sunxi-mali/Config.in
 create mode 100644 package/sunxi-mali/S80mali
 create mode 100644 package/sunxi-mali/egl.pc
 create mode 100644 package/sunxi-mali/glesv2.pc
 create mode 100644 package/sunxi-mali/sunxi-mali.mk

diff --git a/package/Config.in b/package/Config.in
index 0ba8ee4..e49264f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -294,6 +294,8 @@ source "package/smartmontools/Config.in"
 source "package/snowball-hdmiservice/Config.in"
 source "package/sredird/Config.in"
 source "package/statserial/Config.in"
+source "package/sunxi-mali/Config.in"
+source "package/sunxi-mali-prop/Config.in"
 source "package/sysstat/Config.in"
 source "package/ti-gfx/Config.in"
 source "package/ti-utils/Config.in"
diff --git a/package/sunxi-mali-prop/Config.in b/package/sunxi-mali-prop/Config.in
new file mode 100644
index 0000000..b9efb4e
--- /dev/null
+++ b/package/sunxi-mali-prop/Config.in
@@ -0,0 +1,4 @@
+# Sunxi-mali-prop is a git submodule of sunxi-mali. To use this package
+# select the sunxi-mali option.
+config BR2_PACKAGE_SUNXI_MALI_PROP
+	bool
diff --git a/package/sunxi-mali-prop/sunxi-mali-prop.mk b/package/sunxi-mali-prop/sunxi-mali-prop.mk
new file mode 100644
index 0000000..21960e6
--- /dev/null
+++ b/package/sunxi-mali-prop/sunxi-mali-prop.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# sunxi-mali-prop
+#
+################################################################################
+
+SUNXI_MALI_PROP_VERSION = e4ced47
+SUNXI_MALI_PROP_SITE = http://github.com/linux-sunxi/sunxi-mali-proprietary/tarball/$(SUNXI_MALI_PROP_VERSION)
+
+$(eval $(generic-package))
diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
new file mode 100644
index 0000000..74b8ebc
--- /dev/null
+++ b/package/sunxi-mali/Config.in
@@ -0,0 +1,52 @@
+config BR2_PACKAGE_SUNXI_MALI
+	bool "sunxi-mali"
+	select BR2_PACKAGE_HAS_OPENGL_EGL
+	select BR2_PACKAGE_HAS_OPENGL_ES
+	# The egl/gles mali libraries are provided as a git submodule of the
+	# sunxi-mali repo and are downloaded by the sunxi-mali-prop package.
+	select BR2_PACKAGE_SUNXI_MALI_PROP
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_arm
+	help
+	  Install the ARM Mali drivers for sunxi based systems.  This driver
+	  requires either the sunxi-kernel with the ARM Mali driver enabled or
+	  the installation of the ARM Mali drivers as an external module.
+
+	  http://github.com/linux-sunxi/sunxi-mali
+
+if BR2_PACKAGE_SUNXI_MALI
+
+config BR2_PACKAGE_SUNXI_MALI_DBG
+	bool "install malitest and maliver tools"
+	help
+	  Install 3D triangle demo malitest application and the maliver application
+	  which describes the kernel module version.
+
+choice
+	prompt "Version"
+	default BR2_PACKAGE_SUNXI_MALI_R3P0
+	help
+	  Select the version of the kernel module.  For the sunxi-kernel, the
+	  appropriate version number is r3p0. For other kernels, use the maliver
+	  application to determine the appropriate version.
+
+config BR2_PACKAGE_SUNXI_MALI_R2P4
+	bool "r2p4"
+
+config BR2_PACKAGE_SUNXI_MALI_R3P0
+	bool "r3p0"
+
+config BR2_PACKAGE_SUNXI_MALI_R3P1
+	depends on BR2_ARM_EABIHF
+	bool "r3p1"
+
+comment "r3p1 requires a toolchain with hard float support"
+	depends on !BR2_ARM_EABIHF
+
+endchoice
+
+endif
+
+comment "sunxi-mali requires an eglibc/glibc based toolchain"
+	depends on BR2_arm && !BR2_TOOLCHAIN_USES_GLIBC
+
diff --git a/package/sunxi-mali/S80mali b/package/sunxi-mali/S80mali
new file mode 100644
index 0000000..a1f32df
--- /dev/null
+++ b/package/sunxi-mali/S80mali
@@ -0,0 +1,54 @@
+#!/bin/sh -e
+
+install_driver() {
+	DRIVER=$1
+	OPTS=$2
+
+	modprobe $DRIVER $OPTS
+	maj=$(awk "$$2==\"${DRIVER}\" { print $$1; }" /proc/devices)
+
+	rm -f /dev/${DRIVER}
+
+	mknod /dev/${DRIVER} c $maj 0
+	chmod 600 /dev/${DRIVER}
+}
+
+start() {
+	echo "mali: starting driver"
+
+	BITSPERPIXEL="$(fbset | awk '/geom/ {print $6}')"
+	YRES="$(fbset | awk '/geom/ {print $3}')"
+	# Set RGBA ordering to something the drivers like
+	if [ "$BITSPERPIXEL" = "32" ] ; then
+		fbset -rgba 8/16,8/8,8/0,8/24
+	fi
+	# Try to enable triple buffering when there's enough VRAM
+	fbset -vyres $(( YRES*3 ))
+
+	install_driver mali
+	install_driver ump
+}	
+
+stop() {
+	echo "mali: stopping driver"
+
+	rmmod ump
+	rmmod mali
+}
+
+case "$1" in 
+start)
+	start
+;;
+stop)
+	stop
+;;
+restart)
+	stop
+	start
+;;
+*)
+	echo "mali: Please use start, stop, or restart."
+	exit 1
+;;
+esac
diff --git a/package/sunxi-mali/egl.pc b/package/sunxi-mali/egl.pc
new file mode 100644
index 0000000..56e3990
--- /dev/null
+++ b/package/sunxi-mali/egl.pc
@@ -0,0 +1,12 @@
+prefix=/usr/
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: egl
+Description: ARM Mali implementation of EGL
+Version: 1.4
+Requires:
+Libs: -L${libdir} -lEGL -lGLESv2 -lUMP
+Cflags: -I{includedir}/EGL/ -I${includedir}
+
diff --git a/package/sunxi-mali/glesv2.pc b/package/sunxi-mali/glesv2.pc
new file mode 100644
index 0000000..4e112ee
--- /dev/null
+++ b/package/sunxi-mali/glesv2.pc
@@ -0,0 +1,12 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: glesv2
+Description: ARM Mali implementation of OpenGL ESv2
+Version: 2.0
+Requires:
+Libs: -L${libdir} -lGLESv2 -lGLES_CM -lUMP
+Cflags: -I${includedir}/GLES2
+
diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
new file mode 100644
index 0000000..cfe5a73
--- /dev/null
+++ b/package/sunxi-mali/sunxi-mali.mk
@@ -0,0 +1,82 @@
+################################################################################
+#
+# sunxi-mali
+#
+################################################################################
+
+SUNXI_MALI_VERSION = c2491fe952
+SUNXI_MALI_SITE = http://github.com/linux-sunxi/sunxi-mali/tarball/$(SUNXI_MALI_VERSION)
+
+SUNXI_MALI_INSTALL_STAGING = YES
+SUNXI_MALI_DEPENDENCIES = sunxi-mali-prop
+
+# The options below must be provided in the environment.  Providing these
+# through options overrides the value and prevents the makefiles from
+# appending to these variables.  This is used throughout the sunxi-mali build
+# system.
+# 
+# Furthermore, the -lm -dl -lpthread options are included due to a possible bug
+# in the way the linaro 2013.06 toolchain handles shared libraries.
+SUNXI_MALI_MAKE_ENV = \
+	CC="$(TARGET_CC)" \
+	CFLAGS="$(TARGET_CFLAGS) -lm -ldl -lpthread" \
+	$(TARGET_MAKE_ENV)
+
+ifeq ($(BR2_ARM_EABIHF),y)
+SUNXI_MALI_MAKE_OPTS += ABI=armhf
+else
+SUNXI_MALI_MAKE_OPTS += ABI=armel
+endif
+
+SUNXI_MALI_MAKE_OPTS += EGL_TYPE=framebuffer
+
+ifeq ($(BR2_PACKAGE_SUNXI_MALI_R2P4),y)
+SUNXI_MALI_MAKE_OPTS += VERSION=r2p4
+endif
+ifeq ($(BR2_PACKAGE_SUNXI_MALI_R3P0),y)
+SUNXI_MALI_MAKE_OPTS += VERSION=r3p0
+endif
+ifeq ($(BR2_PACKAGE_SUNXI_MALI_R3P1),y)
+SUNXI_MALI_MAKE_OPTS += VERSION=r3p1
+endif
+
+define SUNXI_MALI_GIT_SUBMODULE_FIXUP
+	rm -rf $(@D)/lib/mali
+	cp -rf $(SUNXI_MALI_PROP_SRCDIR) $(@D)/lib/mali
+endef
+
+SUNXI_MALI_PRE_CONFIGURE_HOOKS += SUNXI_MALI_GIT_SUBMODULE_FIXUP
+
+define SUNXI_MALI_BUILD_CMDS
+	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPTS) all
+	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/version/version \
+		$(@D)/version/version.c
+endef
+
+define SUNXI_MALI_INSTALL_STAGING_CMDS
+	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(SUNXI_MALI_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+	# test must be built after install because it depends on headers that are
+	# generated during the install above.
+	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPTS) test
+	$(INSTALL) -D -m 0644 package/sunxi-mali/egl.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+	$(INSTALL) -D -m 0644 package/sunxi-mali/glesv2.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
+endef
+
+define SUNXI_MALI_INSTALL_TARGET_CMDS
+	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D)/lib \
+		$(SUNXI_MALI_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+	$(if $(BR2_PACKAGE_SUNXI_MALI_DBG),
+		$(INSTALL) -m 755 $(@D)/version/version $(TARGET_DIR)/usr/bin/maliver; \
+		$(INSTALL) -m 755 $(@D)/test/test $(TARGET_DIR)/usr/bin/malitest
+	)
+endef
+
+define SUNXI_MALI_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/sunxi-mali/S80mali \
+		$(TARGET_DIR)/etc/init.d/S80mali
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
