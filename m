From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 26 Mar 2016 16:35:11 -0300
Subject: [Buildroot] [PATCH POC 5/5] qemu/x86_64: add midori samples for
	wayland and x11r7
In-Reply-To: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459020911-20593-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/x86_64/busybox-extras.config            |  1 +
 board/qemu/x86_64/genimage-x86_64.cfg              | 24 +++++++
 board/qemu/x86_64/grub.cfg                         | 10 +++
 board/qemu/x86_64/linux-extras.config              | 51 +++++++++++++++
 .../x86_64/midori_overlay/etc/X11/xinit/xinitrc    |  3 +
 board/qemu/x86_64/midori_overlay/etc/fb.modes      |  4 ++
 .../x86_64/midori_overlay/etc/init.d/S00rootfs     |  5 ++
 .../qemu/x86_64/midori_overlay/etc/init.d/S98audio |  6 ++
 board/qemu/x86_64/midori_overlay/etc/init.d/S99gui | 21 ++++++
 board/qemu/x86_64/midori_overlay/etc/weston.ini    | 43 ++++++++++++
 .../x86_64/midori_overlay/usr/share/fluxbox/init   |  7 ++
 .../x86_64/midori_overlay/usr/share/fluxbox/menu   | 29 +++++++++
 board/qemu/x86_64/post-image.sh                    | 20 ++++++
 board/qemu/x86_64/post-process.sh                  |  8 +++
 configs/midori_wayland_x86_64_defconfig            | 63 ++++++++++++++++++
 configs/midori_x11_x86_64_defconfig                | 76 ++++++++++++++++++++++
 16 files changed, 371 insertions(+)
 create mode 100644 board/qemu/x86_64/busybox-extras.config
 create mode 100644 board/qemu/x86_64/genimage-x86_64.cfg
 create mode 100644 board/qemu/x86_64/grub.cfg
 create mode 100644 board/qemu/x86_64/linux-extras.config
 create mode 100644 board/qemu/x86_64/midori_overlay/etc/X11/xinit/xinitrc
 create mode 100644 board/qemu/x86_64/midori_overlay/etc/fb.modes
 create mode 100755 board/qemu/x86_64/midori_overlay/etc/init.d/S00rootfs
 create mode 100755 board/qemu/x86_64/midori_overlay/etc/init.d/S98audio
 create mode 100755 board/qemu/x86_64/midori_overlay/etc/init.d/S99gui
 create mode 100644 board/qemu/x86_64/midori_overlay/etc/weston.ini
 create mode 100644 board/qemu/x86_64/midori_overlay/usr/share/fluxbox/init
 create mode 100644 board/qemu/x86_64/midori_overlay/usr/share/fluxbox/menu
 create mode 100755 board/qemu/x86_64/post-image.sh
 create mode 100755 board/qemu/x86_64/post-process.sh
 create mode 100644 configs/midori_wayland_x86_64_defconfig
 create mode 100644 configs/midori_x11_x86_64_defconfig

diff --git a/board/qemu/x86_64/busybox-extras.config b/board/qemu/x86_64/busybox-extras.config
new file mode 100644
index 0000000..7a776f9
--- /dev/null
+++ b/board/qemu/x86_64/busybox-extras.config
@@ -0,0 +1 @@
+CONFIG_RDEV=y
diff --git a/board/qemu/x86_64/genimage-x86_64.cfg b/board/qemu/x86_64/genimage-x86_64.cfg
new file mode 100644
index 0000000..ee6339b
--- /dev/null
+++ b/board/qemu/x86_64/genimage-x86_64.cfg
@@ -0,0 +1,24 @@
+image disk.img {
+
+  hdimage {
+  }
+
+  partition boot {
+    in-partition-table = "no"
+    image = "boot.img"
+    offset = 0
+    size = 512
+  }
+
+  partition grub {
+    in-partition-table = "no"
+    image = "grub.img"
+    offset = 512
+  }
+
+  partition root {
+    partition-type = 0x83
+    image = "rootfs.squashfs"
+  }
+
+}
diff --git a/board/qemu/x86_64/grub.cfg b/board/qemu/x86_64/grub.cfg
new file mode 100644
index 0000000..77385f1
--- /dev/null
+++ b/board/qemu/x86_64/grub.cfg
@@ -0,0 +1,10 @@
+set default="0"
+set timeout="5"
+
+menuentry "Private mode" {
+	linux /boot/bzImage root=/dev/sda1 rootwait console=tty1
+}
+
+menuentry "Permanent mode" {
+	linux /boot/bzImage root=/dev/sda1 rootwait console=tty1 grow_root
+}
diff --git a/board/qemu/x86_64/linux-extras.config b/board/qemu/x86_64/linux-extras.config
new file mode 100644
index 0000000..b869745
--- /dev/null
+++ b/board/qemu/x86_64/linux-extras.config
@@ -0,0 +1,51 @@
+# Filesystem support
+CONFIG_SQUASHFS=y
+
+# Ethernet drivers
+CONFIG_ATL2=y
+CONFIG_ATL1=y
+CONFIG_ATL1E=y
+CONFIG_ATL1C=y
+CONFIG_ALX=y
+CONFIG_E100=y
+CONFIG_E1000=y
+CONFIG_E1000E=y
+CONFIG_IGB=y
+
+# Video drivers
+CONFIG_DRM_BOCHS=y
+CONFIG_DRM_I915=y
+CONFIG_FB_VESA=y
+
+# Wireless drivers
+CONFIG_CFG80211=y
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=y
+CONFIG_ATH_CARDS=y
+CONFIG_ATH9K=y
+CONFIG_ATH9K_HTC=y
+CONFIG_CARL9170=y
+CONFIG_ATH10K=y
+CONFIG_ATH10K_PCI=y
+CONFIG_IWLWIFI=y
+CONFIG_IWL4965=y
+CONFIG_IWL3945=y
+CONFIG_RT2X00=y
+CONFIG_RT2800PCI=y
+CONFIG_RT73USB=y
+CONFIG_RT2800USB=y
+CONFIG_RT2800USB_RT3573=y
+CONFIG_RT2800USB_RT53XX=y
+CONFIG_RT2800USB_RT55XX=y
+CONFIG_RTL8192CE=y
+CONFIG_RTL8192SE=y
+CONFIG_RTL8192DE=y
+CONFIG_RTL8723AE=y
+CONFIG_RTL8723BE=y
+CONFIG_RTL8188EE=y
+CONFIG_RTL8192EE=y
+CONFIG_RTL8821AE=y
+CONFIG_RTL8192CU=y
+# CONFIG_RTLWIFI_DEBUG is not set
+CONFIG_RTL8XXXU=y
+# CONFIG_RTL_CARDS is not set
diff --git a/board/qemu/x86_64/midori_overlay/etc/X11/xinit/xinitrc b/board/qemu/x86_64/midori_overlay/etc/X11/xinit/xinitrc
new file mode 100644
index 0000000..a838946
--- /dev/null
+++ b/board/qemu/x86_64/midori_overlay/etc/X11/xinit/xinitrc
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+fluxbox
diff --git a/board/qemu/x86_64/midori_overlay/etc/fb.modes b/board/qemu/x86_64/midori_overlay/etc/fb.modes
new file mode 100644
index 0000000..813c51c
--- /dev/null
+++ b/board/qemu/x86_64/midori_overlay/etc/fb.modes
@@ -0,0 +1,4 @@
+mode "1024x768-60"
+	geometry 1024 768 1024 768 24
+	timings 15385 160 24 29 3 136 6
+endmode
diff --git a/board/qemu/x86_64/midori_overlay/etc/init.d/S00rootfs b/board/qemu/x86_64/midori_overlay/etc/init.d/S00rootfs
new file mode 100755
index 0000000..5079444
--- /dev/null
+++ b/board/qemu/x86_64/midori_overlay/etc/init.d/S00rootfs
@@ -0,0 +1,5 @@
+#!/bin/sh
+if [ "$1" = "start" ]; then
+# Mount a volatile root user home directory
+  mount -t tmpfs root_home /root
+fi
diff --git a/board/qemu/x86_64/midori_overlay/etc/init.d/S98audio b/board/qemu/x86_64/midori_overlay/etc/init.d/S98audio
new file mode 100755
index 0000000..7899cff
--- /dev/null
+++ b/board/qemu/x86_64/midori_overlay/etc/init.d/S98audio
@@ -0,0 +1,6 @@
+#!/bin/sh
+if [ "$1" = "start" ]; then
+  if [ -x /usr/bin/amixer ]; then
+    amixer set Master 100 unmute >/dev/null 2>&1
+  fi
+fi
diff --git a/board/qemu/x86_64/midori_overlay/etc/init.d/S99gui b/board/qemu/x86_64/midori_overlay/etc/init.d/S99gui
new file mode 100755
index 0000000..009ac15
--- /dev/null
+++ b/board/qemu/x86_64/midori_overlay/etc/init.d/S99gui
@@ -0,0 +1,21 @@
+#!/bin/sh
+if [ "$1" = "start" ]; then
+
+  # XDG setup
+  export HOME=/root
+  export UID=`id -u`
+  export XDG_RUNTIME_DIR=/run/user/${UID}
+  mkdir -p /run/user/${UID}
+  chmod 700 /run/user/${UID}
+
+  # X11
+  if [ -x /usr/bin/startx ]; then
+    startx
+  fi
+
+  # Wayland/Weston
+  if [ -x /usr/bin/weston ]; then
+    openvt -c 2 -s -- weston --backend=fbdev-backend.so --config=/etc/weston.ini --tty=2 --log=/var/log/weston.log
+  fi
+
+fi
diff --git a/board/qemu/x86_64/midori_overlay/etc/weston.ini b/board/qemu/x86_64/midori_overlay/etc/weston.ini
new file mode 100644
index 0000000..ef1015d
--- /dev/null
+++ b/board/qemu/x86_64/midori_overlay/etc/weston.ini
@@ -0,0 +1,43 @@
+[core]
+#modules=xwayland.so,cms-colord.so
+#shell=desktop-shell.so
+#gbm-format=xrgb2101010
+
+[shell]
+#background-image=/usr/share/backgrounds/gnome/Aqua.jpg
+background-color=0xff002244
+background-type=tile
+panel-color=0x90ff0000
+locking=false
+animation=zoom
+startup-animation=fade
+#binding-modifier=ctrl
+#num-workspaces=6
+#cursor-theme=Obsidian
+#cursor-size=24
+
+[launcher]
+icon=/usr/share/icons/Adwaita/22x22/apps/utilities-terminal.png
+path=/usr/bin/weston-terminal
+
+[launcher]
+icon=/usr/share/icons/Adwaita/22x22/status/network-idle.png
+path=/usr/bin/connman-gtk
+
+[launcher]
+icon=/usr/share/icons/Adwaita/22x22/apps/web-browser.png
+path=/usr/bin/MiniBrowser
+
+[launcher]
+icon=/usr/share/icons/hicolor/22x22/apps/midori.png
+path=/usr/bin/midori
+
+[launcher]
+icon=/usr/share/icons/hicolor/24x24/apps/wireshark.png
+path=/usr/bin/wireshark-gtk
+
+[input-method]
+path=/usr/libexec/weston-keyboard
+
+#[screen-share]
+#command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
diff --git a/board/qemu/x86_64/midori_overlay/usr/share/fluxbox/init b/board/qemu/x86_64/midori_overlay/usr/share/fluxbox/init
new file mode 100644
index 0000000..34e17bc
--- /dev/null
+++ b/board/qemu/x86_64/midori_overlay/usr/share/fluxbox/init
@@ -0,0 +1,7 @@
+! If you're looking for settings to configure, they won't be saved here until
+! you change something in the fluxbox configuration menu.
+
+session.menuFile:	~/.fluxbox/menu
+session.keyFile: ~/.fluxbox/keys
+session.styleFile: /usr/share/fluxbox/styles/zimek_green
+session.configVersion:	13
diff --git a/board/qemu/x86_64/midori_overlay/usr/share/fluxbox/menu b/board/qemu/x86_64/midori_overlay/usr/share/fluxbox/menu
new file mode 100644
index 0000000..6d7a439
--- /dev/null
+++ b/board/qemu/x86_64/midori_overlay/usr/share/fluxbox/menu
@@ -0,0 +1,29 @@
+[begin] (Fluxbox-1.3.7)
+[encoding] {UTF-8}
+      [exec] (connman-gtk) {connman-gtk}
+      [exec] (midori) {midori}
+      [exec] (MiniBrowser) {MiniBrowser}
+      [exec] (wireshark) {wireshark-gtk}
+      [exec] (xterm) {xterm}
+      [separator]
+      [exec] (Reboot) {/sbin/reboot}
+      [exec] (Power off) {/sbin/poweroff}
+      [separator]
+[submenu] (Fluxbox menu)
+      [config] (Configure)
+[submenu] (System Styles) {Choose a style...}
+      [stylesdir] (/usr/share/fluxbox/styles)
+[end]
+[submenu] (User Styles) {Choose a style...}
+      [stylesdir] (~/.fluxbox/styles)
+[end]
+      [workspaces] (Workspace List)
+      [commanddialog] (Fluxbox Command)
+      [reconfig] (Reload config)
+      [restart] (Restart)
+      [exec] (About) {(fluxbox -v; fluxbox -info | sed 1d) | xmessage -file - -center}
+      [separator]
+      [exit] (Exit)
+[end]
+[endencoding]
+[end]
diff --git a/board/qemu/x86_64/post-image.sh b/board/qemu/x86_64/post-image.sh
new file mode 100755
index 0000000..f04413c
--- /dev/null
+++ b/board/qemu/x86_64/post-image.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+BOARD_NAME="$(basename ${BOARD_DIR})"
+GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+# Copy grub 1st stage to output/images
+cp -f ${HOST_DIR}/usr/lib/grub/i386-pc/boot.img ${BINARIES_DIR}
+
+genimage                           \
+       --rootpath "${TARGET_DIR}"     \
+       --tmppath "${GENIMAGE_TMP}"    \
+       --inputpath "${BINARIES_DIR}"  \
+       --outputpath "${BINARIES_DIR}" \
+       --config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/qemu/x86_64/post-process.sh b/board/qemu/x86_64/post-process.sh
new file mode 100755
index 0000000..0ed22bc
--- /dev/null
+++ b/board/qemu/x86_64/post-process.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+BOARD_NAME="$(basename ${BOARD_DIR})"
+
+# Copy grub config to target
+cp -f ${BOARD_DIR}/grub.cfg ${TARGET_DIR}/boot/grub
+
diff --git a/configs/midori_wayland_x86_64_defconfig b/configs/midori_wayland_x86_64_defconfig
new file mode 100644
index 0000000..6e9c672
--- /dev/null
+++ b/configs/midori_wayland_x86_64_defconfig
@@ -0,0 +1,63 @@
+BR2_x86_64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ENABLE_LOCALE_PURGE=y
+BR2_ENABLE_LOCALE_WHITELIST="C en_US"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_ROOTFS_OVERLAY="board/qemu/x86_64/midori_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64/post-process.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/x86_64/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.6"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.5.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/x86_64/linux-extras.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/qemu/x86_64/busybox-extras.config"
+BR2_PACKAGE_ALSA_UTILS=y
+BR2_PACKAGE_ALSA_UTILS_AMIXER=y
+BR2_PACKAGE_E2FSPROGS=y
+BR2_PACKAGE_CANTARELL=y
+BR2_PACKAGE_INCONSOLATA=y
+BR2_PACKAGE_ADWAITA_ICON_THEME=y
+BR2_PACKAGE_HICOLOR_ICON_THEME=y
+BR2_PACKAGE_MESA3D=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
+BR2_PACKAGE_MESA3D_OPENGL_ES=y
+BR2_PACKAGE_WESTON=y
+BR2_PACKAGE_MIDORI=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_9=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
+BR2_PACKAGE_ACPID=y
+BR2_PACKAGE_PARTED=y
+BR2_PACKAGE_GRAPHITE2=y
+BR2_PACKAGE_LIBGTK3=y
+BR2_PACKAGE_WEBKITGTK_HTTPS=y
+BR2_PACKAGE_WEBKITGTK_MULTIMEDIA=y
+BR2_PACKAGE_ORC=y
+BR2_PACKAGE_CONNMAN_WIFI=y
+BR2_PACKAGE_CONNMAN_GTK=y
+BR2_PACKAGE_WIRESHARK=y
+BR2_TARGET_ROOTFS_SQUASHFS=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat squash4 part_msdos part_gpt normal biosdisk"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/midori_x11_x86_64_defconfig b/configs/midori_x11_x86_64_defconfig
new file mode 100644
index 0000000..e986add
--- /dev/null
+++ b/configs/midori_x11_x86_64_defconfig
@@ -0,0 +1,76 @@
+BR2_x86_64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ENABLE_LOCALE_PURGE=y
+BR2_ENABLE_LOCALE_WHITELIST="C en_US"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_ROOTFS_OVERLAY="board/qemu/x86_64/midori_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64/post-process.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/x86_64/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.6"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.5.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/x86_64/linux-extras.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/qemu/x86_64/busybox-extras.config"
+BR2_PACKAGE_ALSA_UTILS=y
+BR2_PACKAGE_ALSA_UTILS_AMIXER=y
+BR2_PACKAGE_E2FSPROGS=y
+BR2_PACKAGE_CANTARELL=y
+BR2_PACKAGE_INCONSOLATA=y
+BR2_PACKAGE_ADWAITA_ICON_THEME=y
+BR2_PACKAGE_HICOLOR_ICON_THEME=y
+BR2_PACKAGE_MESA3D=y
+BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_DRI_DRIVER_I915=y
+BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
+BR2_PACKAGE_XORG7=y
+BR2_PACKAGE_XSERVER_XORG_SERVER=y
+BR2_PACKAGE_XAPP_XINIT=y
+BR2_PACKAGE_XAPP_XRANDR=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
+BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI=y
+BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS=y
+BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y
+BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU=y
+BR2_PACKAGE_XDRIVER_XF86_VIDEO_QXL=y
+BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA=y
+BR2_PACKAGE_MIDORI=y
+BR2_PACKAGE_XTERM=y
+BR2_PACKAGE_FLUXBOX=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_9=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
+BR2_PACKAGE_ACPID=y
+BR2_PACKAGE_PARTED=y
+BR2_PACKAGE_GRAPHITE2=y
+BR2_PACKAGE_LIBGTK3=y
+BR2_PACKAGE_WEBKITGTK_HTTPS=y
+BR2_PACKAGE_WEBKITGTK_MULTIMEDIA=y
+BR2_PACKAGE_ORC=y
+BR2_PACKAGE_CONNMAN_WIFI=y
+BR2_PACKAGE_CONNMAN_GTK=y
+BR2_PACKAGE_WIRESHARK=y
+BR2_TARGET_ROOTFS_SQUASHFS=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat squash4 part_msdos part_gpt normal biosdisk"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.3
