From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 19 Dec 2015 11:35:44 -0300
Subject: [Buildroot] [PATCH] qemu/x86_64: add midori samples for wayland and
	x11r7
Message-ID: <1450535744-21877-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/x86_64/linux-fb.config                  |  2 +
 .../x86_64/midori_overlay/etc/X11/xinit/xinitrc    |  4 ++
 board/qemu/x86_64/midori_overlay/etc/fb.modes      |  4 ++
 .../qemu/x86_64/midori_overlay/etc/init.d/S98audio |  4 ++
 board/qemu/x86_64/midori_overlay/etc/init.d/S99gui | 12 ++++++
 board/qemu/x86_64/midori_overlay/etc/weston.ini    | 44 +++++++++++++++++++++
 .../x86_64/midori_overlay/usr/share/fluxbox/init   |  7 ++++
 .../x86_64/midori_overlay/usr/share/fluxbox/menu   | 46 ++++++++++++++++++++++
 configs/midori_wayland_x86_64_defconfig            | 33 ++++++++++++++++
 configs/midori_x11_x86_64_defconfig                | 39 ++++++++++++++++++
 10 files changed, 195 insertions(+)
 create mode 100644 board/qemu/x86_64/linux-fb.config
 create mode 100644 board/qemu/x86_64/midori_overlay/etc/X11/xinit/xinitrc
 create mode 100644 board/qemu/x86_64/midori_overlay/etc/fb.modes
 create mode 100755 board/qemu/x86_64/midori_overlay/etc/init.d/S98audio
 create mode 100755 board/qemu/x86_64/midori_overlay/etc/init.d/S99gui
 create mode 100644 board/qemu/x86_64/midori_overlay/etc/weston.ini
 create mode 100644 board/qemu/x86_64/midori_overlay/usr/share/fluxbox/init
 create mode 100644 board/qemu/x86_64/midori_overlay/usr/share/fluxbox/menu
 create mode 100644 configs/midori_wayland_x86_64_defconfig
 create mode 100644 configs/midori_x11_x86_64_defconfig

diff --git a/board/qemu/x86_64/linux-fb.config b/board/qemu/x86_64/linux-fb.config
new file mode 100644
index 0000000..6c2e1e1
--- /dev/null
+++ b/board/qemu/x86_64/linux-fb.config
@@ -0,0 +1,2 @@
+CONFIG_DRM_BOCHS=y
+CONFIG_FB_VESA=y
diff --git a/board/qemu/x86_64/midori_overlay/etc/X11/xinit/xinitrc b/board/qemu/x86_64/midori_overlay/etc/X11/xinit/xinitrc
new file mode 100644
index 0000000..6554f32
--- /dev/null
+++ b/board/qemu/x86_64/midori_overlay/etc/X11/xinit/xinitrc
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+midori http://www.buildroot.net &
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
diff --git a/board/qemu/x86_64/midori_overlay/etc/init.d/S98audio b/board/qemu/x86_64/midori_overlay/etc/init.d/S98audio
new file mode 100755
index 0000000..bc960d3
--- /dev/null
+++ b/board/qemu/x86_64/midori_overlay/etc/init.d/S98audio
@@ -0,0 +1,4 @@
+#!/bin/sh
+if [ -x /usr/bin/amixer ]; then
+  amixer set Master 100 unmute >/dev/null 2>&1
+fi
diff --git a/board/qemu/x86_64/midori_overlay/etc/init.d/S99gui b/board/qemu/x86_64/midori_overlay/etc/init.d/S99gui
new file mode 100755
index 0000000..62d70f5
--- /dev/null
+++ b/board/qemu/x86_64/midori_overlay/etc/init.d/S99gui
@@ -0,0 +1,12 @@
+#!/bin/sh
+if [ -x /usr/bin/startx ]; then
+  startx
+fi
+
+if [ -x /usr/bin/weston ]; then
+  mkdir /tmp/root
+  chmod 700 /tmp/root
+  export XDG_RUNTIME_DIR=/tmp/root
+  fbset 1024x768-60
+  openvt -c 2 -s -- weston --backend=fbdev-backend.so --config=/etc/weston.ini --tty=2 --log=/tmp/weston.log
+fi
diff --git a/board/qemu/x86_64/midori_overlay/etc/weston.ini b/board/qemu/x86_64/midori_overlay/etc/weston.ini
new file mode 100644
index 0000000..595f2e1
--- /dev/null
+++ b/board/qemu/x86_64/midori_overlay/etc/weston.ini
@@ -0,0 +1,44 @@
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
+locking=true
+animation=zoom
+startup-animation=fade
+#binding-modifier=ctrl
+#num-workspaces=6
+#cursor-theme=Obsidian
+#cursor-size=24
+
+#lockscreen-icon=/usr/share/icons/gnome/256x256/actions/lock.png
+#lockscreen=/usr/share/backgrounds/gnome/Garden.jpg
+#homescreen=/usr/share/backgrounds/gnome/Blinds.jpg
+#animation=fade
+
+[launcher]
+icon=/usr/share/icons/Adwaita/22x22/apps/utilities-terminal.png
+path=/usr/bin/weston-terminal
+
+[launcher]
+icon=/usr/share/icons/Adwaita/22x22/apps/web-browser.png
+path=/usr/bin/MiniBrowser
+
+[launcher]
+icon=/usr/share/icons/hicolor/22x22/apps/midori.png
+path=/usr/bin/midori
+
+[screensaver]
+#path=/usr/libexec/weston-screensaver
+#duration=3600
+
+[input-method]
+path=/usr/libexec/weston-keyboard
+
+[screen-share]
+command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
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
index 0000000..3009e79
--- /dev/null
+++ b/board/qemu/x86_64/midori_overlay/usr/share/fluxbox/menu
@@ -0,0 +1,46 @@
+# Generated by fluxbox-generate_menu
+#
+# If you read this it means you want to edit this file manually, so here
+# are some useful tips:
+#
+# - You can add your own menu-entries to ~/.fluxbox/usermenu
+#
+# - If you miss apps please let me know and I will add them for the next
+#   release.
+#
+# - The -r option prevents removing of empty menu entries and lines which
+#   makes things much more readable.
+#
+# - To prevent any other app from overwriting your menu
+#   you can change the menu name in ~/.fluxbox/init to:
+#     session.menuFile: ~/.fluxbox/my-menu
+[begin] (Fluxbox-1.3.7)
+[encoding] {UTF-8}
+      [exec] (midori) {midori}
+      [exec] (MiniBrowser) {MiniBrowser}
+      [exec] (xterm) {xterm}
+[submenu] (Fluxbox menu)
+      [config] (Configure)
+[submenu] (System Styles) {Choose a style...}
+      [stylesdir] (/usr/share/fluxbox/styles)
+[end]
+[submenu] (User Styles) {Choose a style...}
+      [stylesdir] (~/.fluxbox/styles)
+[end]
+      [workspaces] (Workspace List)
+[submenu] (Tools)
+      [exec] (Screenshot - JPG) {import screenshot.jpg && display -resize 50% screenshot.jpg}
+      [exec] (Screenshot - PNG) {import screenshot.png && display -resize 50% screenshot.png}
+[end]
+[submenu] (Window Managers)
+      [restart] (gnome) {gnome-session}
+[end]
+      [commanddialog] (Fluxbox Command)
+      [reconfig] (Reload config)
+      [restart] (Restart)
+      [exec] (About) {(fluxbox -v; fluxbox -info | sed 1d) | xmessage -file - -center}
+      [separator]
+      [exit] (Exit)
+[end]
+[endencoding]
+[end]
diff --git a/configs/midori_wayland_x86_64_defconfig b/configs/midori_wayland_x86_64_defconfig
new file mode 100644
index 0000000..71ff19b
--- /dev/null
+++ b/configs/midori_wayland_x86_64_defconfig
@@ -0,0 +1,33 @@
+BR2_x86_64=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_SYSTEM_DHCP="enp0s3"
+BR2_ROOTFS_OVERLAY="board/qemu/x86_64/midori_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.3.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/x86_64/linux-fb.config"
+BR2_PACKAGE_ALSA_UTILS=y
+BR2_PACKAGE_ALSA_UTILS_AMIXER=y
+BR2_PACKAGE_CANTARELL=y
+BR2_PACKAGE_INCONSOLATA=y
+BR2_PACKAGE_ADWAITA_ICON_THEME=y
+BR2_PACKAGE_HICOLOR_ICON_THEME=y
+BR2_PACKAGE_MESA3D=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+BR2_PACKAGE_WESTON=y
+BR2_PACKAGE_MIDORI=y
+BR2_PACKAGE_LIBGTK3=y
+BR2_PACKAGE_WEBKITGTK210_HTTPS=y
+BR2_PACKAGE_WEBKITGTK210_MULTIMEDIA=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS=128000
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/midori_x11_x86_64_defconfig b/configs/midori_x11_x86_64_defconfig
new file mode 100644
index 0000000..f8da49b
--- /dev/null
+++ b/configs/midori_x11_x86_64_defconfig
@@ -0,0 +1,39 @@
+BR2_x86_64=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ENABLE_LOCALE_PURGE=y
+BR2_ENABLE_LOCALE_WHITELIST="C en_US"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_SYSTEM_DHCP="enp0s3"
+BR2_ROOTFS_OVERLAY="board/qemu/x86_64/midori_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.3.config"
+BR2_PACKAGE_CANTARELL=y
+BR2_PACKAGE_INCONSOLATA=y
+BR2_PACKAGE_ADWAITA_ICON_THEME=y
+BR2_PACKAGE_HICOLOR_ICON_THEME=y
+BR2_PACKAGE_MESA3D=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+BR2_PACKAGE_XORG7=y
+BR2_PACKAGE_XSERVER_XORG_SERVER=y
+BR2_PACKAGE_XAPP_XINIT=y
+BR2_PACKAGE_XAPP_XRANDR=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
+BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS=y
+BR2_PACKAGE_XDRIVER_XF86_VIDEO_QXL=y
+BR2_PACKAGE_MIDORI=y
+BR2_PACKAGE_XTERM=y
+BR2_PACKAGE_FLUXBOX=y
+BR2_PACKAGE_LIBGTK3=y
+BR2_PACKAGE_WEBKITGTK210_HTTPS=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS=128000
+# BR2_TARGET_ROOTFS_TAR is not set
-- 
2.4.10
