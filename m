From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2020 15:50:22 +0000
Subject: [Buildroot] [Bug 12906] qt PrefixPath is wrong on 2020.05-rc1
In-Reply-To: <bug-12906-163@https.bugs.busybox.net/>
References: <bug-12906-163@https.bugs.busybox.net/>
Message-ID: <bug-12906-163-RQnlzyLqFd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12906

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Tested with the following defconfig (on Raspberry Pi 3 B+):

BR2_arm=y
BR2_cortex_a53=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_DHCP="eth0"
BR2_GENERATE_LOCALE="en_US"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
github,raspberrypi,linux,4f2a4cc501c428c940549f39d5562e60404ac4f7)/linux-4f2a4cc501c428c940549f39d5562e60404ac4f7.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus
bcm2710-rpi-cm3"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_EXAMPLES=y
BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
BR2_PACKAGE_QT5BASE_EGLFS=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
BR2_PACKAGE_QT5BASE_FONTCONFIG=y
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5QUICKCONTROLS=y
BR2_PACKAGE_QT5QUICKCONTROLS2=y
BR2_PACKAGE_QT5TOOLS=y
BR2_PACKAGE_QT5TOOLS_QTDIAG=y
BR2_PACKAGE_QT5TOOLS_QTPATHS=y
BR2_PACKAGE_QT5TOOLS_QTPLUGININFO=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_USERLAND=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

$ qtdiag
Unable to query physical screen size, defaulting to 100 dpi.
To override, set QT_QPA_EGLFS_PHYSICAL_WIDTH and QT_QPA_EGLFS_PHYSICAL_HEIGHT
(in millimeters).
QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-root'
QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-root'
Qt 5.14.2 (arm-little_endian-ilp32-eabi-hardfloat shared (dynamic) release
build; by GCC 8.4.0) on "eglfs" 
OS: Buildroot 2020.05-rc1 [linux version 4.19.113-v7]

Architecture: arm; features: Neon

Environment:

Features: QT_NO_EXCEPTIONS QT_NO_OPENSSL

Library info:
  PrefixPath: /usr
  DocumentationPath: /usr/doc
  HeadersPath: /usr/include/qt5
  LibrariesPath: /usr/lib
  LibraryExecutablesPath: /usr/libexec
  BinariesPath: /usr/bin
  PluginsPath: /usr/lib/qt/plugins
  ImportsPath: /usr/imports
  Qml2ImportsPath: /usr/qml
  ArchDataPath: /usr
  DataPath: /usr
  TranslationsPath: /usr/translations
  ExamplesPath: /usr/lib/qt/examples
  TestsPath: /usr/tests
  SettingsPath: /usr/etc/xdg
[...]

Examples e.g. quickcontrols2 gallery runs fine:

$ /usr/lib/qt/examples/quickcontrols2/gallery/gallery

The path problem existed in buildroot in some beforehand/RFC version bumps of
qt (5.13.x/5.14.1) but not since the 5.14.2 one was applied, for the beforehand
ones I used the following patch/hack:
