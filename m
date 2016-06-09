From: Dagg Stompler <daggs@gmx.com>
Date: Thu,  9 Jun 2016 10:41:19 +0300
Subject: [Buildroot] [PATCH] odroid-mali: New Package
Message-ID: <20160609074119.4288-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/Config.in                        |   1 +
 package/odroid-mali/10-odroidc2_fb.rules |   8 ++
 package/odroid-mali/Config.in            |  20 +++++
 package/odroid-mali/S50odroidc2_fb       |  20 +++++
 package/odroid-mali/odroid-mali.hash     |   3 +
 package/odroid-mali/odroid-mali.mk       |  56 ++++++++++++++
 package/odroid-mali/odroidc2_fb.service  |  14 ++++
 package/odroid-mali/odroidc2_init_fb.sh  | 125 +++++++++++++++++++++++++++++++
 8 files changed, 247 insertions(+)
 create mode 100644 package/odroid-mali/10-odroidc2_fb.rules
 create mode 100644 package/odroid-mali/Config.in
 create mode 100644 package/odroid-mali/S50odroidc2_fb
 create mode 100644 package/odroid-mali/odroid-mali.hash
 create mode 100644 package/odroid-mali/odroid-mali.mk
 create mode 100644 package/odroid-mali/odroidc2_fb.service
 create mode 100644 package/odroid-mali/odroidc2_init_fb.sh

diff --git a/package/Config.in b/package/Config.in
index 0cb2e7e..de9573e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -420,6 +420,7 @@ endif
 	source "package/nvidia-driver/Config.in"
 	source "package/nvidia-tegra23/Config.in"
 	source "package/nvme/Config.in"
+	source "package/odroid-mali/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
 	source "package/on2-8170-modules/Config.in"
diff --git a/package/odroid-mali/10-odroidc2_fb.rules b/package/odroid-mali/10-odroidc2_fb.rules
new file mode 100644
index 0000000..e0374af
--- /dev/null
+++ b/package/odroid-mali/10-odroidc2_fb.rules
@@ -0,0 +1,8 @@
+# Mali Rules
+KERNEL=="mali",SUBSYSTEM=="misc",MODE="0777"
+KERNEL=="ump",SUBSYSTEM=="ump",MODE="0777"
+
+# Misc video rules
+KERNEL=="event*", SUBSYSTEM=="input", MODE="0777"
+KERNEL=="CEC", MODE="0777"
+KERNEL=="am*", MODE="0666"
diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
new file mode 100644
index 0000000..ea93159
--- /dev/null
+++ b/package/odroid-mali/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_ODROID_MALI
+	bool "odroid-mali"
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_FBSET
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_aarch64 || BR2_arm
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
diff --git a/package/odroid-mali/S50odroidc2_fb b/package/odroid-mali/S50odroidc2_fb
new file mode 100644
index 0000000..2aae59d
--- /dev/null
+++ b/package/odroid-mali/S50odroidc2_fb
@@ -0,0 +1,20 @@
+#!/bin/sh
+#
+# Set up frame buffer
+#
+
+case "$1" in
+    start)
+        echo "Setting up display..."
+        /usr/sbin/odroidc2_init_fb.sh
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
diff --git a/package/odroid-mali/odroid-mali.hash b/package/odroid-mali/odroid-mali.hash
new file mode 100644
index 0000000..7e6859a
--- /dev/null
+++ b/package/odroid-mali/odroid-mali.hash
@@ -0,0 +1,3 @@
+# locally computed hash
+sha256 122fe75fc105fc2f7c00b7f075deca567f6a3e56b5c128b00cf3096073b96e66  odroid-mali-4a34d59cd6120db67dc11023344e382afbaf28da.tar.gz
+sha256 29d98ed4b8694b860d9289787c416faa847b0de26d36580a53add1752b4c2e9a  odroid-mali-46fe49f37e3506c6205ad8c50980eca9bfff11e3.tar.gz
diff --git a/package/odroid-mali/odroid-mali.mk b/package/odroid-mali/odroid-mali.mk
new file mode 100644
index 0000000..4ee546a
--- /dev/null
+++ b/package/odroid-mali/odroid-mali.mk
@@ -0,0 +1,56 @@
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
+ifeq ($(BR2_PACKAGE_EUDEV),y)
+	ODROID_MALI_INSTALL_UDEV_RULES = $(INSTALL) -D -m 0644 package/odroid-mali/10-odroidc2_fb.rules $(TARGET_DIR)/etc/udev/rules.d/10-odroidc2_fb.rules
+else
+	ODROID_MALI_INSTALL_UDEV_RULES =
+endif
+
+define ODROID_MALI_INSTALL_LIBS
+	mkdir -p $(1)/lib/
+	cp -aRP $(@D)/fbdev/$(ODROID_MALI_LIBS_INSTALL_ARCH)/*.so* $(1)/lib/
+endef
+
+define ODROID_MALI_INSTALL_STAGING_CMDS
+	$(call ODROID_MALI_INSTALL_LIBS,$(STAGING_DIR)/usr)
+	mkdir -p $(@D)/usr/include $(@D)/usr/lib/pkgconfig
+	cp -aRP $(@D)/fbdev/mali_headers/* $(STAGING_DIR)/usr/include
+	cp -aRP $(@D)/pkgconfig/* $(STAGING_DIR)/usr/lib/pkgconfig
+endef
+
+define ODROID_MALI_INSTALL_TARGET_CMDS
+	$(call ODROID_MALI_INSTALL_LIBS,$(TARGET_DIR)/usr)
+	$(INSTALL) -D -m 0755 package/odroid-mali/odroidc2_init_fb.sh $(TARGET_DIR)/usr/sbin/odroidc2_init_fb.sh
+	$(ODROID_MALI_INSTALL_UDEV_RULES)
+endef
+
+define ODROID_MALI_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/odroid-mali/odroidc2_fb.service $(TARGET_DIR)/usr/lib/systemd/system/odroidc2_fb.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/odroidc2_fb.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/odroidc2_fb.service
+endef
+
+define ODROID_MALI_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/odroid-mali/S50odroidc2_fb $(TARGET_DIR)/etc/init.d/S50odroidc2_fb
+endef
+
+$(eval $(generic-package))
diff --git a/package/odroid-mali/odroidc2_fb.service b/package/odroid-mali/odroidc2_fb.service
new file mode 100644
index 0000000..5a0b508
--- /dev/null
+++ b/package/odroid-mali/odroidc2_fb.service
@@ -0,0 +1,14 @@
+[Unit]
+Description="ODROID-C2 Amlogic Display Configuration"
+
+DefaultDependencies=no
+Requires=sysinit.target
+After=sysinit.target
+
+[Service]
+Type=oneshot
+ExecStart=/usr/bin/odroidc2_init_fb.sh
+
+[Install]
+WantedBy=basic.target
+WantedBy=sysinit.target
diff --git a/package/odroid-mali/odroidc2_init_fb.sh b/package/odroid-mali/odroidc2_init_fb.sh
new file mode 100644
index 0000000..c4a4c81
--- /dev/null
+++ b/package/odroid-mali/odroidc2_init_fb.sh
@@ -0,0 +1,125 @@
+#!/bin/sh
+
+for x in $(cat /proc/cmdline); do
+        case ${x} in
+                m_bpp=*) export bpp=${x#*=} ;;
+                hdmimode=*) export mode=${x#*=} ;;
+        esac
+done
+
+HPD_STATE=/sys/class/amhdmitx/amhdmitx0/hpd_state
+DISP_CAP=/sys/class/amhdmitx/amhdmitx0/disp_cap
+DISP_MODE=/sys/class/display/mode
+
+echo $mode > $DISP_MODE
+
+common_display_setup() {
+        M="0 0 $(($X - 1)) $(($Y - 1))"
+        Y_VIRT=$(($Y * 2))
+        fbset -fb /dev/fb0 -g $X $Y $X $Y_VIRT $bpp
+        echo $mode > /sys/class/display/mode
+        echo 0 > /sys/class/graphics/fb0/free_scale
+        echo 1 > /sys/class/graphics/fb0/freescale_mode
+        echo $M > /sys/class/graphics/fb0/free_scale_axis
+        echo $M > /sys/class/graphics/fb0/window_axis
+
+        echo 0 > /sys/class/graphics/fb1/free_scale
+        echo 1 > /sys/class/graphics/fb1/freescale_mode
+        if [ "$bpp" = "32" ]; then
+            echo d01068b4 0x7fc0 > /sys/kernel/debug/aml_reg/paddr
+        fi
+}
+
+case $mode in
+		480*)
+			export X=720
+			export Y=480
+			;;
+		576*)
+			export X=720
+			export Y=576
+			;;
+		720p*)
+			export X=1280
+			export Y=720
+			;;
+		1080*)
+			export X=1920
+			export Y=1080
+			;;
+		2160p*)
+			export X=3840
+			export Y=2160
+			;;
+		smpte24hz*)
+			export X=3840
+			export Y=2160
+			;;
+		640x480p60hz*)
+			export X=640
+			export Y=480
+			;;
+		800x480p60hz*)
+			export X=800
+			export Y=480
+			;;
+		800x600p60hz*)
+			export X=800
+			export Y=600
+			;;
+		1024x600p60hz*)
+			export X=1024
+			export Y=600
+			;;
+		1024x768p60hz*)
+			export X=1024
+			export Y=768
+			;;
+		1280x800p60hz*)
+			export X=1280
+			export Y=800
+			;;
+		1280x1024p60hz*)
+			export X=1280
+			export Y=1024
+			;;
+		1360x768p60hz*)
+			export X=1360
+			export Y=768
+			;;
+		1440x900p60hz*)
+			export X=1440
+			export Y=900
+			;;
+		1600x900p60hz*)
+			export X=1600
+			export Y=900
+			;;
+		1680x1050p60hz*)
+			export X=1680
+			export Y=1050
+			;;
+		1920x1200p60hz*)
+			export X=1920
+			export Y=1200
+			;;
+		2560x1080p60hz*)
+			export X=2560
+			export Y=1080
+			;;
+		2560x1440p60hz*)
+			export X=2560
+			export Y=1440
+			;;
+		2560x1600p60hz*)
+			export X=2560
+			export Y=1600
+			;;
+esac
+
+common_display_setup
+
+# Console unblack
+echo 0 > /sys/class/graphics/fb0/blank
+echo 0 > /sys/class/graphics/fb1/blank
+
-- 
2.8.3
