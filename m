From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Apr 2016 23:19:25 +0200
Subject: [Buildroot] [git commit] board/minnowboard-max: Add a X-based
	graphical defconfig
Message-ID: <20160418211944.B95E181851@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e25c603211806e5c43415dabd713c68ff11f22fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a new defconfig to build a X-based
graphical system for the Minnowboard MAX board.

  * The 'openbox' windows manager is chosen because it's simple
    and lightweigth.

  * Basic X apps are enabled (such as xrandr, xterm), so we
    can at least get a console and change video mode.

  * ALSA default configuration is provided, so HDMI audio
    works out-of-the-box.

  * OpenGL is supported.

Tested on Minnoboard Turot (which is Minnowboard Max compatible).

[Peter: drop unneeded/specific toolchain config options]
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../fs-overlay-graphical/etc/asound.conf           |  4 ++
 .../minnowboard/fs-overlay-graphical/root/.xinitrc |  1 +
 .../fs-overlay-graphical/usr/bin/startx            |  6 ++
 configs/minnowboard_max-graphical_defconfig        | 75 ++++++++++++++++++++++
 4 files changed, 86 insertions(+)

diff --git a/board/minnowboard/fs-overlay-graphical/etc/asound.conf b/board/minnowboard/fs-overlay-graphical/etc/asound.conf
new file mode 100644
index 0000000..b75b238
--- /dev/null
+++ b/board/minnowboard/fs-overlay-graphical/etc/asound.conf
@@ -0,0 +1,4 @@
+# Customize ALSA:
+# the HDMI PCM is at card=0, device=3 (i.e. hw:0,3)
+defaults.pcm.card 0
+defaults.pcm.device 3
diff --git a/board/minnowboard/fs-overlay-graphical/root/.xinitrc b/board/minnowboard/fs-overlay-graphical/root/.xinitrc
new file mode 100644
index 0000000..4274b24
--- /dev/null
+++ b/board/minnowboard/fs-overlay-graphical/root/.xinitrc
@@ -0,0 +1 @@
+exec /usr/bin/openbox-session
diff --git a/board/minnowboard/fs-overlay-graphical/usr/bin/startx b/board/minnowboard/fs-overlay-graphical/usr/bin/startx
new file mode 100755
index 0000000..6f2c949
--- /dev/null
+++ b/board/minnowboard/fs-overlay-graphical/usr/bin/startx
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# Simplified custom startx script, which starts
+# the X server on vt7.
+
+xinit -- vt7
diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
new file mode 100644
index 0000000..8634c54
--- /dev/null
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -0,0 +1,75 @@
+# Architecture
+BR2_x86_64=y
+BR2_x86_atom=y
+
+# Toolchain
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+# System configuration
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty0"
+BR2_ROOTFS_OVERLAY="board/minnowboard/fs-overlay-graphical"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="minnowboard-max"
+
+# Host packages
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Linux
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.4.config"
+
+# Bootloader
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_X86_64_EFI=y
+
+# ALSA
+BR2_PACKAGE_ALSA_UTILS=y
+BR2_PACKAGE_ALSA_UTILS_APLAY=y
+
+# OpenGL
+BR2_PACKAGE_GLMARK2=y
+BR2_PACKAGE_MESA3D_DEMOS=y
+BR2_PACKAGE_MESA3D=y
+BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
+
+# Framebuffer (just for testing purposes)
+BR2_PACKAGE_FB_TEST_APP=y
+
+# X
+BR2_PACKAGE_XORG7=y
+BR2_PACKAGE_XSERVER_XORG_SERVER=y
+BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX=y
+BR2_PACKAGE_XAPP_XINIT=y
+BR2_PACKAGE_XAPP_XRANDR=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
+BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y
+BR2_PACKAGE_XTERM=y
+BR2_PACKAGE_OPENBOX=y
+
+# Firmware
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
+
+# Libraries
+BR2_PACKAGE_IMLIB2=y
+BR2_PACKAGE_IMLIB2_JPEG=y
+BR2_PACKAGE_IMLIB2_PNG=y
+BR2_PACKAGE_STARTUP_NOTIFICATION=y
+
+# Filesystem image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
