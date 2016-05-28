From: Dagg <daggs@gmx.com>
Date: Sat, 28 May 2016 22:57:16 +0300
Subject: [Buildroot] [PATCH v3] add support for odroid-mali's GL.
Message-ID: <20160528195716.7369-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this patch deprecate all previous patches with the same header and all patches with the header "allow building of odroid mali GL libs when using defconfig. - add S50display which sets the odroid mali fb."

v3 -> v2:
	- incorporate Eric Le Bihan <eric.le.bihan.dev@free.fr>
	  suggestion regarding startup script.
	- add support for arm install.
	- don't hijack openelec's source, use the provider's git repo.

v2 -> v1:
	- fix var names.

v1:
	- inital support

Signed-off-by: Dagg <daggs@gmx.com>
---
 package/odroid-mali/Config.in              |  19 ++++++
 package/odroid-mali/S50odroid-display      |  20 ++++++
 package/odroid-mali/odroid-display.service |   9 +++
 package/odroid-mali/odroid-mali.mk         |  80 ++++++++++++++++++++++
 package/odroid-mali/odroid-setup-display   | 103 +++++++++++++++++++++++++++++
 5 files changed, 231 insertions(+)
 create mode 100644 package/odroid-mali/Config.in
 create mode 100644 package/odroid-mali/S50odroid-display
 create mode 100644 package/odroid-mali/odroid-display.service
 create mode 100644 package/odroid-mali/odroid-mali.mk
 create mode 100644 package/odroid-mali/odroid-setup-display

diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
new file mode 100644
index 0000000..b65179b
--- /dev/null
+++ b/package/odroid-mali/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_ODROID_MALI
+	bool "odroid-mali"
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_FBSET
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_aarch64 || BR2_arm
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
diff --git a/package/odroid-mali/S50odroid-display b/package/odroid-mali/S50odroid-display
new file mode 100644
index 0000000..e0ac227
--- /dev/null
+++ b/package/odroid-mali/S50odroid-display
@@ -0,0 +1,20 @@
+#!/bin/sh
+#
+# Set up frame buffer
+#
+
+case "$1" in
+    start)
+        echo "Setting up display..."
+        /usr/sbin/odroid-setup-display
+        ;;
+    stop)
+        ;;
+    restart|reload)
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+esac
+
+exit $?
diff --git a/package/odroid-mali/odroid-display.service b/package/odroid-mali/odroid-display.service
new file mode 100644
index 0000000..6eaa143
--- /dev/null
+++ b/package/odroid-mali/odroid-display.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=ODROID Display
+
+[Service]
+Type=oneshot
+ExecStart=/usr/sbin/odroid-setup-display
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/odroid-mali/odroid-mali.mk b/package/odroid-mali/odroid-mali.mk
new file mode 100644
index 0000000..cc02b17
--- /dev/null
+++ b/package/odroid-mali/odroid-mali.mk
@@ -0,0 +1,80 @@
+################################################################################
+#
+# odroid-mali
+#
+################################################################################
+
+ODROID_MALI_VERSION = a9f82a34370ec6fe1bf910339226b936fa3fc8aa
+ODROID_MALI_SITE = https://github.com/hardkernel/buildroot.git
+ODROID_MALI_SITE_METHOD = git
+ODROID_MALI_LICENSE = GPL
+
+ODROID_MALI_INSTALL_STAGING = YES
+ODROID_MALI_PROVIDES = libegl libgles
+
+ifeq ($(BR2_aarch64),y)
+ODROID_MALI_LIBS_INSTALL_ARCH=arm64
+else ifeq ($(BR2_ARM_EABIHF),y)
+ODROID_MALI_LIBS_INSTALL_ARCH=eabihf
+else
+ODROID_MALI_LIBS_INSTALL_ARCH=
+endif
+
+ODROID_MALI_LIBS_INSTALL_PATH = $(@D)/package/opengl/src/lib/$(ODROID_MALI_LIBS_INSTALL_ARCH)/r5p1/m450
+
+define ODROID_MALI_INSTALL_LIBS
+	$(INSTALL) -D -m 0755 $(ODROID_MALI_LIBS_INSTALL_PATH)/libMali.so $(1)/lib
+
+	cd $(1)/lib
+	ln -sf libMali.so $(1)/lib/libEGL.so
+	ln -sf libMali.so $(1)/lib/libGLESv1_CM.so
+	ln -sf libMali.so $(1)/lib/libGLESv2.so
+
+	ln -sf libEGL.so $(1)/lib/libEGL.so.1
+	ln -sf libEGL.so $(1)/lib/libEGL.so.1.4
+	ln -sf libGLESv1_CM.so $(1)/lib/libGLESv1_CM.so.1
+	ln -sf libGLESv1_CM.so $(1)/lib/libGLESv1_CM.so.1.1
+	ln -sf libGLESv2.so $(1)/lib/libGLESv2.so.2
+	ln -sf libGLESv2.so $(1)/lib/libGLESv2.so.2.0
+endef
+
+define ODROID_MALI_INSTALL_HDRS
+	mkdir -p $(@D)/usr/include
+	cp -R $(@D)/package/opengl/src/include/* $(1)/include
+endef
+
+define ODROID_MALI_INSTALL_PCS
+	$(INSTALL) -D -m 0644 $(@D)/package/opengl/src/lib/pkgconfig/egl.pc $(1)/usr/lib/pkgconfig/egl.pc
+	$(INSTALL) -D -m 0644 $(@D)/package/opengl/src/lib/pkgconfig/glesv2.pc $(1)/usr/lib/pkgconfig/glesv2.pc
+endef
+
+define ODROID_MALI_INSTALL_TOOLS
+	$(INSTALL) -D -m 0755 package/odroid-mali/odroid-setup-display \
+		$(1)/sbin/odroid-setup-display
+endef
+
+define ODROID_MALI_INSTALL_STAGING_CMDS
+	$(call ODROID_MALI_INSTALL_LIBS,$(STAGING_DIR)/usr)
+	$(call ODROID_MALI_INSTALL_HDRS,$(STAGING_DIR)/usr)
+	$(call ODROID_MALI_INSTALL_PCS,$(STAGING_DIR)/usr)
+endef
+
+define ODROID_MALI_INSTALL_TARGET_CMDS
+	$(call ODROID_MALI_INSTALL_LIBS,$(TARGET_DIR)/usr)
+	$(call ODROID_MALI_INSTALL_TOOLS,$(TARGET_DIR)/usr)
+endef
+
+define ODROID_MALI_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/odroid-mali/odroid-display.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/odroid-display.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/odroid-display.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/odroid-display.service
+endef
+
+define ODROID_MALI_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/odroid-mali/S50odroid-display \
+		$(TARGET_DIR)/etc/init.d/S50odroid-display
+endef
+
+$(eval $(generic-package))
diff --git a/package/odroid-mali/odroid-setup-display b/package/odroid-mali/odroid-setup-display
new file mode 100644
index 0000000..68f8c6c
--- /dev/null
+++ b/package/odroid-mali/odroid-setup-display
@@ -0,0 +1,103 @@
+#!/bin/sh
+
+export mode=`cat /proc/cmdline | sed -rn 's/.+(hdmimode=)(\S+)\s.+/\2/p'`
+export bpp=`cat /proc/cmdline | sed -rn 's/.+(m_bpp=)(\S+)\s.+/\2/p'`
+
+common_display_setup() {
+	M="0 0 $(($X - 1)) $(($Y - 1))"
+	Y_VIRT=$(($Y * 2))
+	fbset -fb /dev/fb0 -g $X $Y $X $Y_VIRT $bpp
+	fbset -fb /dev/fb1 -g 32 32 32 32 32
+	echo $mode > /sys/class/display/mode
+	echo 0 > /sys/class/graphics/fb0/free_scale
+	echo 1 > /sys/class/graphics/fb0/freescale_mode
+	echo $M > /sys/class/graphics/fb0/free_scale_axis
+	echo $M > /sys/class/graphics/fb0/window_axis
+	echo 0 > /sys/class/graphics/fb1/free_scale
+}
+
+case $mode in
+	480*) 
+		export X=720 
+		export Y=480 
+		;;
+	576*)
+		export X=720
+		export Y=576
+		;;
+	720p*)
+		export X=1280
+		export Y=720
+		;;
+	1080*)
+		export X=1920
+		export Y=1080
+		;;
+	2160p*)
+		export X=3840
+		export Y=2160
+		;;
+	smpte24hz*)
+		export X=3840
+		export Y=2160
+		;;
+	640x480p60hz*)
+		export X=640
+		export Y=480
+		;;
+	800x480p60hz*)
+		export X=800
+		export Y=480
+		;;
+	800x600p60hz*)
+		export X=800
+		export Y=600
+		;;
+	1024x600p60hz*)
+		export X=1024
+		export Y=600
+		;;
+	1024x768p60hz*)
+		export X=1024
+		export Y=768
+		;;
+	1280x800p60hz*)
+		export X=1280
+		export Y=800
+		;;
+	1280x1024p60hz*)
+		export X=1280
+		export Y=1024
+		;;
+	1360x768p60hz*)
+		export X=1360
+		export Y=768
+		;;
+	1366x768p60hz*)
+		export X=1366
+		export Y=768
+		;;
+	1440x900p60hz*)
+		export X=1440
+		export Y=900
+		;;
+	1600x900p60hz*)
+		export X=1600
+		export Y=900
+		;;
+	1680x1050p60hz*)
+		export X=1680
+		export Y=1050
+		;;
+	1920x1200p60hz*)
+		export X=1920
+		export Y=1200
+		;;
+esac
+
+common_display_setup
+
+echo 0 > /sys/class/graphics/fb0/blank
+echo 0 > /sys/class/graphics/fb1/blank
+
+exit $?
-- 
2.8.3
