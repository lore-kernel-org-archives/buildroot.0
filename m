From: unixmania at gmail.com <unixmania@gmail.com>
Date: Tue,  7 May 2019 13:51:58 -0300
Subject: [Buildroot] [RFC PATCH] package/util-linux: build libraries as a
 separate package
Message-ID: <20190507165158.10427-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The findmount and lsblk utilities need udev to work correctly but cannot
be built with udev support because the packages providing libudev (eudev
and systemd) depend on util-linux, creating a chicken-egg problem. Solve
it by means of the following changes:

- Add the util-linux-libs package, which provides libblkid, libfdisk,
  libmount, libsmartcols and libuuid. It needs a small patch to
  install the uuidd.h header, used to build the uuidd utility.
- Make util-linux depend on util-linux-libs and build only the programs.
  This requires a quite intrusive patch that modifies Makefile.am and
  some Makemodule.am files, thus requiring AUTORECONF.
- Make eudev, systemd and all other packages that originally depended on
  util-linux depend on util-linux-libs.
- Add legacy options, so defconfigs selecting the libraries by means of
  the old configs (BR2_PACKAGE_UTIL_LINUX_LIBBLKID, etc.) keep working.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=11811
Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 Config.in.legacy                              |  40 ++
 boot/gummiboot/Config.in                      |   4 +-
 boot/syslinux/Config.in                       |   4 +-
 package/Config.in                             |   1 +
 package/Config.in.host                        |   1 +
 package/abootimg/Config.in                    |   4 +-
 package/apr/apr.mk                            |   2 +-
 package/asterisk/Config.in                    |   4 +-
 package/azure-iot-sdk-c/Config.in             |   4 +-
 package/bcache-tools/Config.in                |   6 +-
 package/btrfs-progs/Config.in                 |   6 +-
 package/cryptsetup/Config.in                  |   6 +-
 package/e2fsprogs/Config.in                   |   6 +-
 package/efl/Config.in                         |   6 +-
 package/eudev/Config.in                       |   4 +-
 package/eudev/eudev.mk                        |   2 +-
 package/f2fs-tools/Config.in                  |   4 +-
 package/f2fs-tools/f2fs-tools.mk              |   2 +-
 package/fontconfig/Config.in                  |   4 +-
 package/freeswitch/Config.in                  |   4 +-
 package/gerbera/Config.in                     |   4 +-
 package/gptfdisk/Config.in                    |   4 +-
 package/gupnp/Config.in                       |   4 +-
 package/libcrossguid/Config.in                |   4 +-
 package/libglib2/Config.in                    |   4 +-
 package/libpjsip/libpjsip.mk                  |   2 +-
 package/lighttpd/lighttpd.mk                  |   2 +-
 package/lttng-babeltrace/Config.in            |   4 +-
 package/lttng-libust/Config.in                |   4 +-
 package/lttng-tools/Config.in                 |   4 +-
 package/mosquitto/mosquitto.mk                |   2 +-
 package/mtd/Config.in                         |   4 +-
 package/network-manager/Config.in             |   4 +-
 package/nilfs-utils/Config.in                 |   8 +-
 package/ntfs-3g/ntfs-3g.mk                    |   2 +-
 package/nvme/nvme.mk                          |   2 +-
 package/parted/Config.in                      |   4 +-
 package/qpid-proton/Config.in                 |   4 +-
 package/rsyslog/rsyslog.mk                    |   2 +-
 package/syslog-ng/syslog-ng.mk                |   2 +-
 package/systemd/Config.in                     |  16 +-
 package/systemd/systemd.mk                    |   2 +-
 package/taskd/Config.in                       |   4 +-
 package/tcf-agent/Config.in                   |   4 +-
 .../0001-libuuid-install-uuidd.h.patch        |  26 ++
 package/util-linux-libs/Config.in             |  47 ++
 package/util-linux-libs/Config.in.host        |  10 +
 package/util-linux-libs/util-linux-libs.hash  |   9 +
 package/util-linux-libs/util-linux-libs.mk    |  96 ++++
 .../0005-Use-installed-libraries.patch        | 432 ++++++++++++++++++
 package/util-linux/Config.in                  | 100 ++--
 package/util-linux/Config.in.host             |   2 +-
 package/util-linux/util-linux.mk              |  91 ++--
 package/wget/wget.mk                          |   2 +-
 package/xen/Config.in                         |   4 +-
 package/xfsprogs/Config.in                    |   6 +-
 package/zeromq/Config.in                      |   4 +-
 57 files changed, 841 insertions(+), 198 deletions(-)
 create mode 100644 package/util-linux-libs/0001-libuuid-install-uuidd.h.patch
 create mode 100644 package/util-linux-libs/Config.in
 create mode 100644 package/util-linux-libs/Config.in.host
 create mode 100644 package/util-linux-libs/util-linux-libs.hash
 create mode 100644 package/util-linux-libs/util-linux-libs.mk
 create mode 100644 package/util-linux/0005-Use-installed-libraries.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index ec5079da65..76bf2975bd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,46 @@ endif
 
 comment "Legacy options removed in 2019.05"
 
+config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	bool "libblkid option moved to util-linux-libs"
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
+	help
+	  The util-linux libraries are provided by the util-linux-libs
+	  package, now.
+
+config BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	bool "libfdisk option moved to util-linux-libs"
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_FDISK
+	help
+	  The util-linux libraries are provided by the util-linux-libs
+	  package, now.
+
+config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	bool "libmount option moved to util-linux-libs"
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT
+	help
+	  The util-linux libraries are provided by the util-linux-libs
+	  package, now.
+
+config BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	bool "libsmartcols option moved to util-linux-libs"
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_SMARTCOLS
+	help
+	  The util-linux libraries are provided by the util-linux-libs
+	  package, now.
+
+config BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	bool "libuuid option moved to util-linux-libs"
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
+	help
+	  The util-linux libraries are provided by the util-linux-libs
+	  package, now.
+
 config BR2_PACKAGE_LUNIT
 	bool "lunit package removed"
 	select BR2_LEGACY
diff --git a/boot/gummiboot/Config.in b/boot/gummiboot/Config.in
index 1b5c4279f7..196f1c82c1 100644
--- a/boot/gummiboot/Config.in
+++ b/boot/gummiboot/Config.in
@@ -3,8 +3,8 @@ config BR2_TARGET_GUMMIBOOT
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	select BR2_PACKAGE_GNU_EFI
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
 	help
 	  gummiboot is a simple UEFI boot manager which executes
 	  configured EFI images. The default entry is selected by a
diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 339a97f0e4..44a889ac95 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -6,8 +6,8 @@ config BR2_TARGET_SYSLINUX
 		if !BR2_TARGET_SYSLINUX_PXELINUX && \
 		   !BR2_TARGET_SYSLINUX_MBR && \
 		   !BR2_TARGET_SYSLINUX_EFI
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  The syslinux bootloader for x86 systems.
 	  This includes: syslinux, pxelinux, extlinux.
diff --git a/package/Config.in b/package/Config.in
index f592e74a99..7211133862 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2229,6 +2229,7 @@ menu "System tools"
 	source "package/tpm2-tools/Config.in"
 	source "package/tpm2-totp/Config.in"
 	source "package/unscd/Config.in"
+	source "package/util-linux-libs/Config.in"
 	source "package/util-linux/Config.in"
 	source "package/xen/Config.in"
 	source "package/xvisor/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index bc7e71882b..737ee0fce8 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -65,6 +65,7 @@ menu "Host utilities"
 	source "package/tegrarcm/Config.in.host"
 	source "package/ti-cgt-pru/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
+	source "package/util-linux-libs/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/utp_com/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
diff --git a/package/abootimg/Config.in b/package/abootimg/Config.in
index 30e5bd1fb0..e2b92b5717 100644
--- a/package/abootimg/Config.in
+++ b/package/abootimg/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_ABOOTIMG
 	bool "abootimg"
 	depends on BR2_USE_MMU	# libblkid
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
 	help
 	  Tool to manipulate Android Boot Images, either on files
 	  or directly on /dev block devices.
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 8f29e57c59..6bcb1f599d 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -57,7 +57,7 @@ else
 APR_CONF_OPTS += --disable-nonportable-atomics
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS_UUID),y)
 APR_DEPENDENCIES += util-linux
 endif
 
diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
index c52456f8fc..205e2a0c1b 100644
--- a/package/asterisk/Config.in
+++ b/package/asterisk/Config.in
@@ -12,8 +12,8 @@ config BR2_PACKAGE_ASTERISK
 	select BR2_PACKAGE_LIBILBC
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  Asterisk is an open source framework for building
 	  communications applications. Asterisk turns an ordinary
diff --git a/package/azure-iot-sdk-c/Config.in b/package/azure-iot-sdk-c/Config.in
index c554d2fb9b..da891dff33 100644
--- a/package/azure-iot-sdk-c/Config.in
+++ b/package/azure-iot-sdk-c/Config.in
@@ -5,8 +5,8 @@ config BR2_PACKAGE_AZURE_IOT_SDK_C
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  Microsoft Azure IoT Hub device SDK for C is used
 	  to connect devices running C code to Azure IoT Hub.
diff --git a/package/bcache-tools/Config.in b/package/bcache-tools/Config.in
index c8e3f6d1bf..9b247f6a99 100644
--- a/package/bcache-tools/Config.in
+++ b/package/bcache-tools/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_BCACHE_TOOLS
 	bool "bcache tools"
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_USE_MMU # util-linux (libblkid)
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
 	help
 	  Bcache is a Linux kernel block layer cache. It allows one or
 	  more fast disk drives such as flash-based solid state drives
diff --git a/package/btrfs-progs/Config.in b/package/btrfs-progs/Config.in
index 35dfc39193..6b370e8ccb 100644
--- a/package/btrfs-progs/Config.in
+++ b/package/btrfs-progs/Config.in
@@ -3,9 +3,9 @@ config BR2_PACKAGE_BTRFS_PROGS
 	depends on BR2_USE_MMU # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LZO
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	select BR2_PACKAGE_ZLIB
 	help
 	  Btrfs filesystem utilities
diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 14b897a8a8..7622b3a6f9 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -6,9 +6,9 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
 	select BR2_PACKAGE_JSON_C
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index b3d12b4a63..e9e484466d 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -1,9 +1,9 @@
 menuconfig BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
 	depends on BR2_USE_MMU # util-linux/libblkid
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  The EXT2 file system utilities.
 
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 05be5aae56..5564b6f442 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -116,10 +116,10 @@ config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 	bool "Enable libmount support (recommended)"
 	default y
 	depends on BR2_PACKAGE_EFL_EEZE
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT
 	# libblkid is part of required tools, see EFL's README.
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
 	help
 	  Libmount is used heavily inside Eeze for support of removable
 	  devices etc... and disabling this will hurt support for
diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 2220265a55..5d03bcc09e 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -5,8 +5,8 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_USE_WCHAR # needs C99 compiler
 	depends on !BR2_STATIC_LIBS # kmod
 	select BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
 	select BR2_PACKAGE_KMOD
 	help
 	  eudev is a fork of systemd-udev with the goal of obtaining
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index d88e010c28..c03c9afdf1 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -18,7 +18,7 @@ EUDEV_CONF_OPTS = \
 	--enable-kmod \
 	--enable-blkid
 
-EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
+EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs kmod
 EUDEV_PROVIDES = udev
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),)
diff --git a/package/f2fs-tools/Config.in b/package/f2fs-tools/Config.in
index e373096380..d95710cad9 100644
--- a/package/f2fs-tools/Config.in
+++ b/package/f2fs-tools/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_F2FS_TOOLS
 	bool "f2fs-tools"
 	depends on BR2_USE_WCHAR # uses wchar_t
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  Tools for Flash-Friendly File System (F2FS)
 
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index ba16218bda..988ecdaee9 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -23,7 +23,7 @@ else
 F2FS_TOOLS_CONF_OPTS += --without-selinux
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID),y)
 # util-linux is a dependency already, no need to list it again
 F2FS_TOOLS_CONF_OPTS += --with-blkid
 else
diff --git a/package/fontconfig/Config.in b/package/fontconfig/Config.in
index d274b06350..a3012e0751 100644
--- a/package/fontconfig/Config.in
+++ b/package/fontconfig/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_FONTCONFIG
 	bool "fontconfig"
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  Fontconfig is a library for configuring and customizing font
 	  access.
diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index bd961314e7..b86802fc9e 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -20,8 +20,8 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_SPEEXDSP
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TIFF
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	select BR2_PACKAGE_ZLIB
 	help
 	  FreeSWITCH is a scalable open source cross-platform
diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index e10f78b77e..b8d7e20d4d 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -10,8 +10,8 @@ config BR2_PACKAGE_GERBERA
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBUPNP18
 	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	select BR2_PACKAGE_ZLIB
 	help
 	  A free media server.
diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index 8d94d2bcf8..5f466aead7 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -4,8 +4,8 @@ comment "gptfdisk needs a toolchain w/ C++"
 config BR2_PACKAGE_GPTFDISK
 	bool "gptfdisk"
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	select BR2_PACKAGE_GPTFDISK_GDISK if \
 		!(BR2_PACKAGE_GPTFDISK_SGDISK || BR2_PACKAGE_GPTFDISK_CGDISK)
 	help
diff --git a/package/gupnp/Config.in b/package/gupnp/Config.in
index 3074a42797..01a078a8fe 100644
--- a/package/gupnp/Config.in
+++ b/package/gupnp/Config.in
@@ -6,8 +6,8 @@ config BR2_PACKAGE_GUPNP
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GSSDP
 	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  GUPnP implements the UPnP specification: resource announcement
 	  and discovery, description, control, event notification, and
diff --git a/package/libcrossguid/Config.in b/package/libcrossguid/Config.in
index 49060bc837..bd439386f1 100644
--- a/package/libcrossguid/Config.in
+++ b/package/libcrossguid/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_LIBCROSSGUID
 	bool "libcrossguid"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  Lightweight cross platform C++ GUID/UUID library
 
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index ea946ba05e..2e3c0ea406 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -7,8 +7,8 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UCP
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT
 	select BR2_PACKAGE_ZLIB
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 22b922586c..86af4adfc4 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -82,7 +82,7 @@ LIBPJSIP_CONF_OPTS += \
 	--disable-speex-codec
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS_UUID),y)
 LIBPJSIP_DEPENDENCIES += util-linux
 endif
 
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index f50a4af935..c6c31eb33d 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -55,7 +55,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIGHTTPD_WEBDAV),y)
 LIGHTTPD_DEPENDENCIES += libxml2 sqlite
 LIGHTTPD_CONF_OPTS += --with-webdav-props
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS_UUID),y)
 LIGHTTPD_CONF_OPTS += --with-webdav-locks
 LIGHTTPD_DEPENDENCIES += util-linux
 else
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index ba6b5543d9..65435a05a5 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -3,8 +3,8 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_POPT
 	help
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 8472cab7bb..4f4e01ba0f 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -6,8 +6,8 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBURCU
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  Userspace tracing library for the LTTng 2.x tracing
 	  infrastructure. It allows userspace programs to create
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 9c86cc2646..5db435405c 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -7,8 +7,8 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_POPT
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  Userspace utilities for the LTTng 2.x tracing
 	  infrastructure.
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 51c0abd0ba..2d4bf29167 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -44,7 +44,7 @@ else
 MOSQUITTO_MAKE_OPTS += WITH_SRV=no
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS_UUID),y)
 MOSQUITTO_DEPENDENCIES += util-linux
 MOSQUITTO_MAKE_OPTS += WITH_UUID=yes
 else
diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 590ca7f5ef..6c5bd079cd 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -18,8 +18,8 @@ config BR2_PACKAGE_MTD_JFFS_UTILS
 config BR2_PACKAGE_MTD_UBIFS_UTILS
 	bool
 	select BR2_PACKAGE_LZO
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	select BR2_PACKAGE_ZLIB
 
 comment "MTD tools selection"
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 2d854fe003..3744d75c06 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -13,8 +13,8 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_LIBGUDEV
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	select BR2_PACKAGE_WIRELESS_TOOLS
 	select BR2_PACKAGE_WIRELESS_TOOLS_LIB
 	select BR2_PACKAGE_READLINE
diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
index 7b239b1af5..e5cca92d48 100644
--- a/package/nilfs-utils/Config.in
+++ b/package/nilfs-utils/Config.in
@@ -2,10 +2,10 @@ config BR2_PACKAGE_NILFS_UTILS
 	bool "nilfs-utils"
 	depends on BR2_USE_MMU # util-linux libmount, libblkid
 	depends on BR2_TOOLCHAIN_HAS_THREADS # sem_open()
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT
 	help
 	  Tools for creating and managing NILFS2 filesystems.
 
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 5f23eae9c9..9d38e4803b 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -18,7 +18,7 @@ NTFS_3G_CONF_OPTS += --with-fuse=external
 NTFS_3G_DEPENDENCIES += libfuse
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS_UUID),y)
 NTFS_3G_DEPENDENCIES += util-linux
 endif
 
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 1762a756c6..e10223dd53 100644
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -11,7 +11,7 @@ NVME_LICENSE_FILES = LICENSE
 
 # Yes, LIBUUID=0 means libuuid support enabled.
 # LIBUUID=1 means libuuid support disabled.
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS_UUID),y)
 NVME_DEPENDENCIES += util-linux
 NVME_MAKE_OPTS += LIBUUID=0
 else
diff --git a/package/parted/Config.in b/package/parted/Config.in
index 9d78f0f1f9..0ae01dad67 100644
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PARTED
 	bool "parted"
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  parted, the GNU partition resizing program
 
diff --git a/package/qpid-proton/Config.in b/package/qpid-proton/Config.in
index b49a2afa7e..1936dc4e54 100644
--- a/package/qpid-proton/Config.in
+++ b/package/qpid-proton/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_QPID_PROTON
 	bool "qpid-proton"
 	depends on !BR2_STATIC_LIBS # build a shared library
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  The AMQP messaging toolkit
 
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index fcd476cee3..e034cb0381 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -52,7 +52,7 @@ else
 RSYSLOG_CONF_OPTS += --disable-pgsql
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS_UUID),y)
 RSYSLOG_DEPENDENCIES += util-linux
 RSYSLOG_CONF_OPTS += --enable-uuid
 else
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 4ac25a675b..16c8b79d63 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -60,7 +60,7 @@ else
 SYSLOG_NG_CONF_OPTS += --disable-json
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS_UUID),y)
 SYSLOG_NG_DEPENDENCIES += util-linux
 endif
 
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 92ffc7cc5a..cf9c37b0ae 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -22,14 +22,14 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	select BR2_PACKAGE_UTIL_LINUX_BINARIES
-	select BR2_PACKAGE_UTIL_LINUX_AGETTY
-	select BR2_PACKAGE_UTIL_LINUX_MOUNT
-	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
-	select BR2_PACKAGE_UTIL_LINUX_FSCK
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BINARIES
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_AGETTY
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_NOLOGIN
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_FSCK
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 	select BR2_PACKAGE_KMOD_TOOLS
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index edc4a9ecc1..757664cd32 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -15,7 +15,7 @@ SYSTEMD_DEPENDENCIES = \
 	host-intltool \
 	kmod \
 	libcap \
-	util-linux
+	util-linux-libs
 
 SYSTEMD_PROVIDES = udev
 
diff --git a/package/taskd/Config.in b/package/taskd/Config.in
index 19d123fb59..7fbd2fdd4b 100644
--- a/package/taskd/Config.in
+++ b/package/taskd/Config.in
@@ -5,8 +5,8 @@ config BR2_PACKAGE_TASKD
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_GNUTLS
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  Task management synchronization daemon.
 
diff --git a/package/tcf-agent/Config.in b/package/tcf-agent/Config.in
index 50e58642b0..e850de3ad4 100644
--- a/package/tcf-agent/Config.in
+++ b/package/tcf-agent/Config.in
@@ -3,8 +3,8 @@ config BR2_PACKAGE_TCF_AGENT
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_TCF_AGENT_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # util-linux
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  Target Communication Framework Agent is an example
 	  application using the Target Communication Framework
diff --git a/package/util-linux-libs/0001-libuuid-install-uuidd.h.patch b/package/util-linux-libs/0001-libuuid-install-uuidd.h.patch
new file mode 100644
index 0000000000..4f5438376e
--- /dev/null
+++ b/package/util-linux-libs/0001-libuuid-install-uuidd.h.patch
@@ -0,0 +1,26 @@
+From f7b77eaf6719e64c64179794f79c9d9cd0f7c778 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <unixmania@gmail.com>
+Date: Mon, 6 May 2019 19:58:51 -0300
+Subject: [PATCH] libuuid: install uuidd.h
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ libuuid/src/Makemodule.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libuuid/src/Makemodule.am b/libuuid/src/Makemodule.am
+index e58fa261c..4387666f4 100644
+--- a/libuuid/src/Makemodule.am
++++ b/libuuid/src/Makemodule.am
+@@ -6,7 +6,7 @@ test_uuid_parser_CFLAGS = $(AM_CFLAGS) -I$(ul_libuuid_incdir)
+ 
+ # includes
+ uuidincdir = $(includedir)/uuid
+-uuidinc_HEADERS = libuuid/src/uuid.h
++uuidinc_HEADERS = libuuid/src/uuid.h libuuid/src/uuidd.h
+ 
+ usrlib_exec_LTLIBRARIES += libuuid.la
+ 
+-- 
+2.20.1
+
diff --git a/package/util-linux-libs/Config.in b/package/util-linux-libs/Config.in
new file mode 100644
index 0000000000..b4240acdf0
--- /dev/null
+++ b/package/util-linux-libs/Config.in
@@ -0,0 +1,47 @@
+menuconfig BR2_PACKAGE_UTIL_LINUX_LIBS
+	bool "util-linux-libs"
+	help
+	  Various useful/essential linux libraries. The utilities are
+	  provided by the util-linux package.
+
+	  Things like mkfs, mkswap, swapon, fdisk, mount, dmesg, etc.
+	  depend on these libraries.
+
+	  http://www.kernel.org/pub/linux/utils/util-linux/
+
+if BR2_PACKAGE_UTIL_LINUX_LIBS
+
+config BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
+	bool "libblkid"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
+	help
+	  Install libblkid.
+
+config BR2_PACKAGE_UTIL_LINUX_LIBS_FDISK
+	bool "libfdisk"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
+	help
+	  Install libfdisk.
+
+config BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT
+	bool "libmount"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
+	help
+	  Install libmount.
+
+config BR2_PACKAGE_UTIL_LINUX_LIBS_SMARTCOLS
+	bool "libsmartcols"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Install libsmartcols.
+
+config BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
+	bool "libuuid"
+	help
+	  Install libuuid.
+
+endif
diff --git a/package/util-linux-libs/Config.in.host b/package/util-linux-libs/Config.in.host
new file mode 100644
index 0000000000..6268a8acc2
--- /dev/null
+++ b/package/util-linux-libs/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_UTIL_LINUX_LIBS
+	bool
+	help
+	  Various useful/essential linux libraries. The utilities are
+	  provided by the util-linux package.
+
+	  Things like mkfs, mkswap, swapon, fdisk, mount, dmesg, etc.
+	  depend on these libraries.
+
+	  http://www.kernel.org/pub/linux/utils/util-linux/
diff --git a/package/util-linux-libs/util-linux-libs.hash b/package/util-linux-libs/util-linux-libs.hash
new file mode 100644
index 0000000000..ed503a12ed
--- /dev/null
+++ b/package/util-linux-libs/util-linux-libs.hash
@@ -0,0 +1,9 @@
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.33/sha256sums.asc
+sha256 f261b9d73c35bfeeea04d26941ac47ee1df937bd3b0583e748217c1ea423658a  util-linux-2.33.tar.xz
+# License files, locally calculated
+sha256 4335620e8f478ee4dc4d26540448d39469091ef1d8e3fbbbb8bf753206ceac74  README.licensing
+sha256 9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
+sha256 ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.BSD-4-Clause-UC
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-or-later
+sha256 e53348ce276358e9997014071c5294b36a18c4b34f32f00ee57b9acce0aafd63  Documentation/licenses/COPYING.ISC
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPL-2.1-or-later
diff --git a/package/util-linux-libs/util-linux-libs.mk b/package/util-linux-libs/util-linux-libs.mk
new file mode 100644
index 0000000000..ec730203fa
--- /dev/null
+++ b/package/util-linux-libs/util-linux-libs.mk
@@ -0,0 +1,96 @@
+################################################################################
+#
+# util-linux-libs
+#
+################################################################################
+
+UTIL_LINUX_LIBS_VERSION_MAJOR = 2.33
+UTIL_LINUX_LIBS_VERSION = $(UTIL_LINUX_LIBS_VERSION_MAJOR)
+UTIL_LINUX_LIBS_SOURCE = util-linux-$(UTIL_LINUX_LIBS_VERSION).tar.xz
+UTIL_LINUX_LIBS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_LIBS_VERSION_MAJOR)
+
+# README.licensing claims that some files are GPL-2.0 only, but this is not true.
+# Some files are GPL-3.0+ but only in tests. rfkill uses an ISC-style license.
+UTIL_LINUX_LIBS_LICENSE = LGPL-2.1+ (libblkid, libfdisk, libmount, libsmartcols), BSD-3-Clause (libuuid)
+UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
+	Documentation/licenses/COPYING.BSD-3-Clause \
+	Documentation/licenses/COPYING.LGPL-2.1-or-later
+UTIL_LINUX_LIBS_INSTALL_STAGING = YES
+UTIL_LINUX_LIBS_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
+UTIL_LINUX_LIBS_AUTORECONF = YES
+UTIL_LINUX_LIBS_CONF_OPTS += \
+	--disable-rpath \
+	--disable-makeinstall-chown
+UTIL_LINUX_LIBS_LINK_LIBS = $(TARGET_NLS_LIBS)
+
+# systemd depends on util-linux so we enable systemd support
+# (which needs systemd to be installed)
+UTIL_LINUX_LIBS_CONF_OPTS += \
+	--without-systemd \
+	--with-systemdsystemunitdir=no
+
+HOST_UTIL_LINUX_LIBS_DEPENDENCIES = host-pkgconf
+HOST_UTIL_LINUX_LIBS_CONF_OPTS = --disable-makeinstall-chown
+
+# We also don't want the host-python dependency
+HOST_UTIL_LINUX_LIBS_CONF_OPTS += --without-python
+
+# Prevent the installation from attempting to move shared libraries from
+# ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
+# the same when merged usr is in use.
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+UTIL_LINUX_LIBS_CONF_OPTS += --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib
+endif
+
+# Unfortunately, the util-linux does LIBS="" at the end of its
+# configure script. So we have to pass the proper LIBS value when
+# calling the configure script to make configure tests pass properly,
+# and then pass it again at build time.
+UTIL_LINUX_LIBS_CONF_ENV += LIBS="$(UTIL_LINUX_LIBS_LINK_LIBS)"
+UTIL_LINUX_LIBS_MAKE_OPTS += LIBS="$(UTIL_LINUX_LIBS_LINK_LIBS)"
+
+# libmount optionally uses selinux
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT)$(BR2_PACKAGE_LIBSELINUX),yy)
+UTIL_LINUX_LIBS_DEPENDENCIES += libselinux
+UTIL_LINUX_LIBS_CONF_OPTS += --with-selinux
+else
+UTIL_LINUX_LIBS_CONF_OPTS += --without-selinux
+endif
+
+# Disable utilities
+UTIL_LINUX_LIBS_CONF_OPTS += \
+	--disable-all-programs \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID),--enable-libblkid,--disable-libblkid) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_FDISK),--enable-libfdisk,--disable-libfdisk) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT),--enable-libmount,--disable-libmount) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_SMARTCOLS),--enable-libsmartcols,--disable-libsmartcols) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_UUID),--enable-libuuid,--disable-libuuid)
+
+# In the host version of util-linux-libs, we only require libuuid and libmount
+# (plus libblkid as an indirect dependency of libmount). So disable libfdisk
+# and libsmartcols, unless BR2_PACKAGE_HOST_UTIL_LINUX is set.
+HOST_UTIL_LINUX_LIBS_CONF_OPTS += \
+	--enable-libblkid \
+	$(if $(BR2_PACKAGE_HOST_UTIL_LINUX),--enable-libfdisk,--disable-libfdisk) \
+	--enable-libmount \
+	$(if $(BR2_PACKAGE_HOST_UTIL_LINUX),--enable-libsmartcols,--disable-libsmartcols) \
+	--enable-libuuid \
+	--without-ncurses \
+	--without-ncursesw \
+	--without-tinfo
+
+# Install libmount Python bindings
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+UTIL_LINUX_LIBS_CONF_OPTS += --with-python
+UTIL_LINUX_LIBS_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT),y)
+UTIL_LINUX_LIBS_CONF_OPTS += --enable-pylibmount
+else
+UTIL_LINUX_LIBS_CONF_OPTS += --disable-pylibmount
+endif
+else
+UTIL_LINUX_LIBS_CONF_OPTS += --without-python
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/util-linux/0005-Use-installed-libraries.patch b/package/util-linux/0005-Use-installed-libraries.patch
new file mode 100644
index 0000000000..6a06dc2a22
--- /dev/null
+++ b/package/util-linux/0005-Use-installed-libraries.patch
@@ -0,0 +1,432 @@
+From 93b324c48d4eb9b41d81db51d76ff30eee34d2f4 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <unixmania@gmail.com>
+Date: Tue, 7 May 2019 09:04:16 -0300
+Subject: [PATCH] Use installed libraries
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ Makefile.am               | 16 ----------------
+ disk-utils/Makemodule.am  | 26 +++++++++++++-------------
+ login-utils/Makemodule.am |  2 +-
+ misc-utils/Makemodule.am  | 28 ++++++++++++++--------------
+ sys-utils/Makemodule.am   | 38 +++++++++++++++++++-------------------
+ text-utils/Makemodule.am  |  2 +-
+ 6 files changed, 48 insertions(+), 64 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e7657afe9..06ce9df4a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -17,17 +17,6 @@ LDADD = $(LTLIBINTL)
+ # Work the bug around until it is fixed:
+ dist_noinst_DATA = $(dist_man_MANS)
+ 
+-# Paths to in-tree libraries (use ul_ prefix to avoid possible collisions) Note
+-# that blkid.h, libmount.h, libfdisk.h and libsmartcols.h are generated and
+-# stored in build dirs.
+-#
+-ul_libblkid_incdir = $(top_builddir)/libblkid/src
+-ul_libmount_incdir = $(top_builddir)/libmount/src
+-ul_libsmartcols_incdir = $(top_builddir)/libsmartcols/src
+-ul_libfdisk_incdir  = $(top_builddir)/libfdisk/src
+-
+-ul_libuuid_incdir  = $(top_srcdir)/libuuid/src
+-
+ pkgconfigdir = $(usrlib_execdir)/pkgconfig
+ 
+ bashcompletiondir = @bashcompletiondir@
+@@ -77,11 +66,6 @@ EXTRA_DIST += \
+ include tools/Makemodule.am
+ include include/Makemodule.am
+ include lib/Makemodule.am
+-include libuuid/Makemodule.am
+-include libblkid/Makemodule.am
+-include libmount/Makemodule.am
+-include libsmartcols/Makemodule.am
+-include libfdisk/Makemodule.am
+ 
+ include schedutils/Makemodule.am
+ include text-utils/Makemodule.am
+diff --git a/disk-utils/Makemodule.am b/disk-utils/Makemodule.am
+index bea0ed6a6..15cc77fd9 100644
+--- a/disk-utils/Makemodule.am
++++ b/disk-utils/Makemodule.am
+@@ -55,11 +55,11 @@ mkswap_LDADD = $(LDADD) libcommon.la
+ mkswap_CFLAGS = $(AM_CFLAGS)
+ if BUILD_LIBUUID
+ mkswap_CFLAGS += -I$(ul_libuuid_incdir)
+-mkswap_LDADD += libuuid.la
++mkswap_LDADD += -luuid
+ endif
+ if BUILD_LIBBLKID
+ mkswap_CFLAGS += -I$(ul_libblkid_incdir)
+-mkswap_LDADD += libblkid.la
++mkswap_LDADD += -lblkid
+ endif
+ if HAVE_SELINUX
+ mkswap_LDADD += -lselinux
+@@ -76,10 +76,10 @@ swaplabel_SOURCES = \
+ 	include/swapprober.h
+ 
+ swaplabel_CFLAGS = $(AM_CFLAGS) -I$(ul_libblkid_incdir)
+-swaplabel_LDADD = $(LDADD) libblkid.la libcommon.la
++swaplabel_LDADD = $(LDADD) -lblkid libcommon.la
+ 
+ if BUILD_LIBUUID
+-swaplabel_LDADD += libuuid.la
++swaplabel_LDADD += -luuid
+ swaplabel_CFLAGS += -I$(ul_libuuid_incdir)
+ endif
+ endif #BUILD_SWAPLABEL
+@@ -89,7 +89,7 @@ if BUILD_FSCK
+ sbin_PROGRAMS += fsck
+ dist_man_MANS += disk-utils/fsck.8
+ fsck_SOURCES = disk-utils/fsck.c lib/monotonic.c
+-fsck_LDADD = $(LDADD) libmount.la libblkid.la libcommon.la $(REALTIME_LIBS)
++fsck_LDADD = $(LDADD) -lmount -lblkid libcommon.la $(REALTIME_LIBS)
+ fsck_CFLAGS = $(AM_CFLAGS) -I$(ul_libmount_incdir) -I$(ul_libblkid_incdir)
+ endif
+ 
+@@ -139,8 +139,8 @@ fdisk_SOURCES = \
+ 	disk-utils/fdisk-list.c \
+ 	disk-utils/fdisk-list.h
+ 
+-fdisk_LDADD = $(LDADD) libcommon.la libfdisk.la \
+-	      libsmartcols.la libtcolors.la $(READLINE_LIBS)
++fdisk_LDADD = $(LDADD) libcommon.la -lfdisk \
++	      -lsmartcols libtcolors.la $(READLINE_LIBS)
+ fdisk_CFLAGS = $(AM_CFLAGS) -I$(ul_libfdisk_incdir) -I$(ul_libsmartcols_incdir)
+ 
+ if HAVE_STATIC_FDISK
+@@ -161,8 +161,8 @@ sfdisk_SOURCES = \
+ 	disk-utils/fdisk-list.c \
+ 	disk-utils/fdisk-list.h
+ 
+-sfdisk_LDADD = $(LDADD) libcommon.la libfdisk.la \
+-	       libsmartcols.la libtcolors.la $(READLINE_LIBS)
++sfdisk_LDADD = $(LDADD) libcommon.la -lfdisk \
++	       -lsmartcols libtcolors.la $(READLINE_LIBS)
+ sfdisk_CFLAGS = $(AM_CFLAGS) -I$(ul_libfdisk_incdir) -I$(ul_libsmartcols_incdir)
+ 
+ if HAVE_STATIC_SFDISK
+@@ -181,9 +181,9 @@ dist_man_MANS += disk-utils/cfdisk.8
+ cfdisk_SOURCES = disk-utils/cfdisk.c
+ cfdisk_LDADD = \
+ 	$(LDADD) \
+-	libsmartcols.la \
++	-lsmartcols \
+ 	libcommon.la \
+-	libfdisk.la \
++	-lfdisk \
+ 	libtcolors.la
+ cfdisk_CFLAGS = \
+ 	$(AM_CFLAGS) \
+@@ -192,7 +192,7 @@ cfdisk_CFLAGS = \
+ 
+ if BUILD_LIBMOUNT
+ cfdisk_CFLAGS += -I$(ul_libmount_incdir)
+-cfdisk_LDADD += libmount.la
++cfdisk_LDADD += -lmount
+ endif
+ 
+ if HAVE_SLANG
+@@ -223,6 +223,6 @@ resizepart_LDADD = $(LDADD) libcommon.la
+ 
+ partx_SOURCES = disk-utils/partx.c
+ partx_CFLAGS = $(AM_CFLAGS) -I$(ul_libblkid_incdir) -I$(ul_libsmartcols_incdir)
+-partx_LDADD = $(LDADD) libblkid.la libcommon.la libsmartcols.la
++partx_LDADD = $(LDADD) -lblkid libcommon.la -lsmartcols
+ 
+ endif # BUILD_PARTX
+diff --git a/login-utils/Makemodule.am b/login-utils/Makemodule.am
+index aafbea307..940afc249 100644
+--- a/login-utils/Makemodule.am
++++ b/login-utils/Makemodule.am
+@@ -190,7 +190,7 @@ lslogins_SOURCES = \
+ 	login-utils/lslogins.c \
+ 	login-utils/logindefs.c \
+ 	login-utils/logindefs.h
+-lslogins_LDADD = $(LDADD) libcommon.la libsmartcols.la
++lslogins_LDADD = $(LDADD) libcommon.la -lsmartcols
+ lslogins_CFLAGS = $(AM_CFLAGS) -I$(ul_libsmartcols_incdir)
+ if HAVE_SELINUX
+ lslogins_LDADD += -lselinux
+diff --git a/misc-utils/Makemodule.am b/misc-utils/Makemodule.am
+index c44cdda67..4c108b071 100644
+--- a/misc-utils/Makemodule.am
++++ b/misc-utils/Makemodule.am
+@@ -69,7 +69,7 @@ endif
+ if BUILD_LSLOCKS
+ usrbin_exec_PROGRAMS += lslocks
+ dist_man_MANS += misc-utils/lslocks.8
+-lslocks_LDADD = $(LDADD) libcommon.la libmount.la libsmartcols.la
++lslocks_LDADD = $(LDADD) libcommon.la -lmount -lsmartcols
+ lslocks_SOURCES = misc-utils/lslocks.c
+ lslocks_CFLAGS = $(AM_CFLAGS) -I$(ul_libmount_incdir) -I$(ul_libsmartcols_incdir)
+ endif
+@@ -82,7 +82,7 @@ lsblk_SOURCES = \
+ 	misc-utils/lsblk-mnt.c \
+ 	misc-utils/lsblk-properties.c \
+ 	misc-utils/lsblk.h
+-lsblk_LDADD = $(LDADD) libblkid.la libmount.la libcommon.la libsmartcols.la
++lsblk_LDADD = $(LDADD) -lblkid -lmount libcommon.la -lsmartcols
+ lsblk_CFLAGS = $(AM_CFLAGS) -I$(ul_libblkid_incdir) -I$(ul_libmount_incdir) -I$(ul_libsmartcols_incdir)
+ if HAVE_UDEV
+ lsblk_LDADD += -ludev
+@@ -93,7 +93,7 @@ if BUILD_UUIDGEN
+ usrbin_exec_PROGRAMS += uuidgen
+ dist_man_MANS += misc-utils/uuidgen.1
+ uuidgen_SOURCES = misc-utils/uuidgen.c
+-uuidgen_LDADD = $(LDADD) libuuid.la
++uuidgen_LDADD = $(LDADD) -luuid
+ uuidgen_CFLAGS = $(AM_CFLAGS) -I$(ul_libuuid_incdir)
+ endif
+ 
+@@ -101,14 +101,14 @@ if BUILD_UUIDPARSE
+ usrbin_exec_PROGRAMS += uuidparse
+ dist_man_MANS += misc-utils/uuidparse.1
+ uuidparse_SOURCES = misc-utils/uuidparse.c
+-uuidparse_LDADD = $(LDADD) libcommon.la libuuid.la libsmartcols.la
++uuidparse_LDADD = $(LDADD) libcommon.la -luuid -lsmartcols
+ uuidparse_CFLAGS = $(AM_CFLAGS) -I$(ul_libuuid_incdir) -I$(ul_libsmartcols_incdir)
+ endif
+ 
+ if BUILD_UUIDD
+ usrsbin_exec_PROGRAMS += uuidd
+ dist_man_MANS += misc-utils/uuidd.8
+-uuidd_LDADD = $(LDADD) libuuid.la libcommon.la $(REALTIME_LIBS)
++uuidd_LDADD = $(LDADD) -luuid libcommon.la $(REALTIME_LIBS)
+ uuidd_CFLAGS = $(DAEMON_CFLAGS) $(AM_CFLAGS) -I$(ul_libuuid_incdir)
+ uuidd_LDFLAGS = $(DAEMON_LDFLAGS) $(AM_LDFLAGS)
+ uuidd_SOURCES = misc-utils/uuidd.c lib/monotonic.c lib/timer.c
+@@ -122,7 +122,7 @@ endif
+ 
+ check_PROGRAMS += test_uuidd
+ test_uuidd_SOURCES = misc-utils/test_uuidd.c
+-test_uuidd_LDADD =  $(LDADD) libcommon.la libuuid.la -lpthread
++test_uuidd_LDADD =  $(LDADD) libcommon.la -luuid -lpthread
+ test_uuidd_CFLAGS = $(AM_CFLAGS) -I$(ul_libuuid_incdir)
+ endif # BUILD_UUIDD
+ 
+@@ -136,14 +136,14 @@ if BUILD_BLKID
+ sbin_PROGRAMS += blkid
+ dist_man_MANS += misc-utils/blkid.8
+ blkid_SOURCES = misc-utils/blkid.c
+-blkid_LDADD = $(LDADD) libblkid.la libcommon.la
++blkid_LDADD = $(LDADD) -lblkid libcommon.la
+ blkid_CFLAGS = $(AM_CFLAGS) -I$(ul_libblkid_incdir)
+ 
+ if HAVE_STATIC_BLKID
+ sbin_PROGRAMS += blkid.static
+ blkid_static_SOURCES = $(blkid_SOURCES)
+ blkid_static_LDFLAGS = -all-static
+-blkid_static_LDADD = $(LDADD) libblkid.la
++blkid_static_LDADD = $(LDADD) -lblkid
+ blkid_static_CFLAGS = $(AM_CFLAGS) -I$(ul_libblkid_incdir)
+ endif
+ endif # BUILD_BLKID
+@@ -152,7 +152,7 @@ endif # BUILD_BLKID
+ if BUILD_FINDFS
+ sbin_PROGRAMS += findfs
+ dist_man_MANS += misc-utils/findfs.8
+-findfs_LDADD = $(LDADD) libblkid.la
++findfs_LDADD = $(LDADD) -lblkid
+ findfs_SOURCES = misc-utils/findfs.c
+ findfs_CFLAGS = $(AM_CFLAGS) -I$(ul_libblkid_incdir)
+ endif
+@@ -161,17 +161,17 @@ if BUILD_WIPEFS
+ sbin_PROGRAMS += wipefs
+ dist_man_MANS += misc-utils/wipefs.8
+ wipefs_SOURCES = misc-utils/wipefs.c
+-wipefs_LDADD = $(LDADD) libblkid.la libcommon.la libsmartcols.la
++wipefs_LDADD = $(LDADD) -lblkid libcommon.la -lsmartcols
+ wipefs_CFLAGS = $(AM_CFLAGS) -I$(ul_libblkid_incdir) -I$(ul_libsmartcols_incdir)
+ endif
+ 
+ if BUILD_FINDMNT
+ bin_PROGRAMS += findmnt
+ dist_man_MANS += misc-utils/findmnt.8
+-findmnt_LDADD = $(LDADD) libmount.la \
++findmnt_LDADD = $(LDADD) -lmount \
+ 		libcommon.la \
+-		libsmartcols.la \
+-		libblkid.la
++		-lsmartcols \
++		-lblkid
+ findmnt_CFLAGS = $(AM_CFLAGS) \
+ 		-I$(ul_libmount_incdir) \
+ 		-I$(ul_libsmartcols_incdir) \
+@@ -212,6 +212,6 @@ if BUILD_FINCORE
+ usrbin_exec_PROGRAMS += fincore
+ dist_man_MANS += misc-utils/fincore.1
+ fincore_SOURCES = misc-utils/fincore.c
+-fincore_LDADD = $(LDADD) libsmartcols.la libcommon.la
++fincore_LDADD = $(LDADD) -lsmartcols libcommon.la
+ fincore_CFLAGS = $(AM_CFLAGS) -I$(ul_libsmartcols_incdir)
+ endif
+diff --git a/sys-utils/Makemodule.am b/sys-utils/Makemodule.am
+index 825a7335b..7f2f4cd85 100644
+--- a/sys-utils/Makemodule.am
++++ b/sys-utils/Makemodule.am
+@@ -2,7 +2,7 @@ if BUILD_LSMEM
+ usrbin_exec_PROGRAMS += lsmem
+ dist_man_MANS += sys-utils/lsmem.1
+ lsmem_SOURCES = sys-utils/lsmem.c
+-lsmem_LDADD = $(LDADD) libcommon.la libsmartcols.la
++lsmem_LDADD = $(LDADD) libcommon.la -lsmartcols
+ lsmem_CFLAGS = $(AM_CFLAGS) -I$(ul_libsmartcols_incdir)
+ endif
+ 
+@@ -56,7 +56,7 @@ dist_man_MANS += sys-utils/lsipc.1
+ lsipc_SOURCES =	sys-utils/lsipc.c \
+ 		sys-utils/ipcutils.c \
+ 		sys-utils/ipcutils.h
+-lsipc_LDADD = $(LDADD) libcommon.la libsmartcols.la
++lsipc_LDADD = $(LDADD) libcommon.la -lsmartcols
+ lsipc_CFLAGS = $(AM_CFLAGS) -I$(ul_libsmartcols_incdir)
+ endif
+ 
+@@ -70,7 +70,7 @@ if BUILD_RFKILL
+ usrsbin_exec_PROGRAMS += rfkill
+ dist_man_MANS += sys-utils/rfkill.8
+ rfkill_SOURCES = sys-utils/rfkill.c
+-rfkill_LDADD = $(LDADD) libcommon.la libsmartcols.la
++rfkill_LDADD = $(LDADD) libcommon.la -lsmartcols
+ rfkill_CFLAGS = $(AM_CFLAGS) -I$(ul_libsmartcols_incdir)
+ endif
+ 
+@@ -97,7 +97,7 @@ if BUILD_FSTRIM
+ sbin_PROGRAMS += fstrim
+ dist_man_MANS += sys-utils/fstrim.8
+ fstrim_SOURCES = sys-utils/fstrim.c
+-fstrim_LDADD = $(LDADD) libcommon.la libmount.la
++fstrim_LDADD = $(LDADD) libcommon.la -lmount
+ fstrim_CFLAGS = $(AM_CFLAGS) -I$(ul_libmount_incdir)
+ if HAVE_SYSTEMD
+ systemdsystemunit_DATA += \
+@@ -222,7 +222,7 @@ endif # BUILD_SETARCH
+ if BUILD_EJECT
+ usrbin_exec_PROGRAMS += eject
+ eject_SOURCES =  sys-utils/eject.c lib/monotonic.c
+-eject_LDADD = $(LDADD) libmount.la libcommon.la $(REALTIME_LIBS)
++eject_LDADD = $(LDADD) -lmount libcommon.la $(REALTIME_LIBS)
+ eject_CFLAGS = $(AM_CFLAGS) -I$(ul_libmount_incdir)
+ dist_man_MANS += sys-utils/eject.1
+ endif
+@@ -232,7 +232,7 @@ if BUILD_LOSETUP
+ sbin_PROGRAMS += losetup
+ dist_man_MANS += sys-utils/losetup.8
+ losetup_SOURCES = sys-utils/losetup.c
+-losetup_LDADD = $(LDADD) libcommon.la libsmartcols.la
++losetup_LDADD = $(LDADD) libcommon.la -lsmartcols
+ losetup_CFLAGS = $(AM_CFLAGS) -I$(ul_libsmartcols_incdir)
+ 
+ if HAVE_STATIC_LOSETUP
+@@ -249,7 +249,7 @@ if BUILD_ZRAMCTL
+ sbin_PROGRAMS += zramctl
+ dist_man_MANS += sys-utils/zramctl.8
+ zramctl_SOURCES = sys-utils/zramctl.c
+-zramctl_LDADD = $(LDADD) libcommon.la libsmartcols.la
++zramctl_LDADD = $(LDADD) libcommon.la -lsmartcols
+ zramctl_CFLAGS = $(AM_CFLAGS) -I$(ul_libsmartcols_incdir)
+ endif
+ 
+@@ -258,7 +258,7 @@ if BUILD_PRLIMIT
+ usrbin_exec_PROGRAMS += prlimit
+ dist_man_MANS += sys-utils/prlimit.1
+ prlimit_SOURCES = sys-utils/prlimit.c
+-prlimit_LDADD = $(LDADD) libcommon.la libsmartcols.la
++prlimit_LDADD = $(LDADD) libcommon.la -lsmartcols
+ prlimit_CFLAGS = $(AM_CFLAGS) -I$(ul_libsmartcols_incdir)
+ endif
+ 
+@@ -267,7 +267,7 @@ if BUILD_LSNS
+ usrbin_exec_PROGRAMS += lsns
+ dist_man_MANS += sys-utils/lsns.8
+ lsns_SOURCES =	sys-utils/lsns.c
+-lsns_LDADD = $(LDADD) libcommon.la libsmartcols.la libmount.la
++lsns_LDADD = $(LDADD) libcommon.la -lsmartcols -lmount
+ lsns_CFLAGS = $(AM_CFLAGS) -I$(ul_libsmartcols_incdir) -I$(ul_libmount_incdir)
+ endif
+ 
+@@ -279,12 +279,12 @@ dist_man_MANS += \
+ 	sys-utils/fstab.5 \
+ 	sys-utils/umount.8
+ mount_SOURCES = sys-utils/mount.c
+-mount_LDADD = $(LDADD) libcommon.la libmount.la $(SELINUX_LIBS)
++mount_LDADD = $(LDADD) libcommon.la -lmount $(SELINUX_LIBS)
+ mount_CFLAGS = $(SUID_CFLAGS) $(AM_CFLAGS) -I$(ul_libmount_incdir)
+ mount_LDFLAGS = $(SUID_LDFLAGS) $(AM_LDFLAGS)
+ 
+ umount_SOURCES = sys-utils/umount.c
+-umount_LDADD = $(LDADD) libcommon.la libmount.la
++umount_LDADD = $(LDADD) libcommon.la -lmount
+ umount_CFLAGS = $(AM_CFLAGS) $(SUID_CFLAGS) -I$(ul_libmount_incdir)
+ umount_LDFLAGS = $(SUID_LDFLAGS) $(AM_LDFLAGS)
+ 
+@@ -339,10 +339,10 @@ swapon_CFLAGS = $(AM_CFLAGS) \
+ 	-I$(ul_libmount_incdir) \
+ 	-I$(ul_libsmartcols_incdir)
+ swapon_LDADD = $(LDADD) \
+-	libblkid.la \
++	-lblkid \
+ 	libcommon.la \
+-	libmount.la \
+-	libsmartcols.la
++	-lmount \
++	-lsmartcols
+ 
+ swapoff_SOURCES = \
+ 	sys-utils/swapoff.c \
+@@ -354,8 +354,8 @@ swapoff_CFLAGS = $(AM_CFLAGS) \
+ 	-I$(ul_libblkid_incdir) \
+ 	-I$(ul_libmount_incdir)
+ swapoff_LDADD = $(LDADD) \
+-	libmount.la \
+-	libblkid.la \
++	-lmount \
++	-lblkid \
+ 	libcommon.la
+ endif
+ 
+@@ -366,7 +366,7 @@ lscpu_SOURCES = \
+ 	sys-utils/lscpu.h \
+ 	sys-utils/lscpu-arm.c \
+ 	sys-utils/lscpu-dmi.c
+-lscpu_LDADD = $(LDADD) libcommon.la libsmartcols.la $(RTAS_LIBS)
++lscpu_LDADD = $(LDADD) libcommon.la -lsmartcols $(RTAS_LIBS)
+ lscpu_CFLAGS = $(AM_CFLAGS) -I$(ul_libsmartcols_incdir)
+ dist_man_MANS += sys-utils/lscpu.1
+ endif
+@@ -382,13 +382,13 @@ if BUILD_WDCTL
+ bin_PROGRAMS += wdctl
+ dist_man_MANS += sys-utils/wdctl.8
+ wdctl_SOURCES = sys-utils/wdctl.c
+-wdctl_LDADD = $(LDADD) libcommon.la libsmartcols.la
++wdctl_LDADD = $(LDADD) libcommon.la -lsmartcols
+ wdctl_CFLAGS = $(AM_CFLAGS) -I$(ul_libsmartcols_incdir)
+ endif
+ 
+ if BUILD_MOUNTPOINT
+ bin_PROGRAMS += mountpoint
+-mountpoint_LDADD = $(LDADD) libmount.la
++mountpoint_LDADD = $(LDADD) -lmount
+ mountpoint_CFLAGS = $(AM_CFLAGS) -I$(ul_libmount_incdir)
+ dist_man_MANS += sys-utils/mountpoint.1
+ mountpoint_SOURCES = sys-utils/mountpoint.c
+diff --git a/text-utils/Makemodule.am b/text-utils/Makemodule.am
+index 7478eb427..8559c1189 100644
+--- a/text-utils/Makemodule.am
++++ b/text-utils/Makemodule.am
+@@ -22,7 +22,7 @@ if BUILD_COLUMN
+ usrbin_exec_PROGRAMS += column
+ dist_man_MANS += text-utils/column.1
+ column_SOURCES = text-utils/column.c
+-column_LDADD = $(LDADD) libcommon.la libsmartcols.la
++column_LDADD = $(LDADD) libcommon.la -lsmartcols
+ column_CFLAGS = $(AM_CFLAGS) -I$(ul_libsmartcols_incdir)
+ endif
+ 
+-- 
+2.20.1
+
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index a5a137bfe0..d0a577e84e 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -9,47 +9,15 @@ menuconfig BR2_PACKAGE_UTIL_LINUX
 
 if BR2_PACKAGE_UTIL_LINUX
 
-config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	bool "libblkid"
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	help
-	  Install libblkid.
-
-config BR2_PACKAGE_UTIL_LINUX_LIBFDISK
-	bool "libfdisk"
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	help
-	  Install libfdisk.
-
-config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	bool "libmount"
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	help
-	  Install libmount.
-
-config BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
-	bool "libsmartcols"
-	depends on BR2_USE_MMU # fork()
-	help
-	  Install libsmartcols.
-
-config BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	bool "libuuid"
-	help
-	  Install libuuid.
-
 config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	bool "basic set"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
-	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_FDISK
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_SMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  Install the basic set of util-linux binaries.
 
@@ -110,9 +78,10 @@ config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 config BR2_PACKAGE_UTIL_LINUX_EJECT
 	bool "eject"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  Eject removable media
 
@@ -129,9 +98,10 @@ config BR2_PACKAGE_UTIL_LINUX_FDFORMAT
 config BR2_PACKAGE_UTIL_LINUX_FSCK
 	bool "fsck"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  Check and repair a linux filesystem
 
@@ -188,21 +158,24 @@ comment "login needs a uClibc or glibc toolchain w/ wchar, locale, dynamic libra
 config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	bool "losetup"
 	depends on BR2_USE_MMU # libsmartcols
-	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_SMARTCOLS
 	help
 	  Set up and control loop devices
 
 config BR2_PACKAGE_UTIL_LINUX_LSLOGINS
 	bool "lslogins"
 	depends on BR2_USE_MMU # libsmartcols
-	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_SMARTCOLS
 	help
 	  Display information about known users in the system
 
 config BR2_PACKAGE_UTIL_LINUX_LSMEM
 	bool "lsmem"
 	depends on BR2_USE_MMU # libsmartcols
-	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_SMARTCOLS
 	help
 	  List the ranges of available memory with their online status
 
@@ -226,18 +199,20 @@ config BR2_PACKAGE_UTIL_LINUX_MORE
 config BR2_PACKAGE_UTIL_LINUX_MOUNT
 	bool "mount/umount"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  Mount/unmount filesystems
 
 config BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
 	bool "mountpoint"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  See if a directory is a mountpoint
 
@@ -271,9 +246,10 @@ config BR2_PACKAGE_UTIL_LINUX_PG
 config BR2_PACKAGE_UTIL_LINUX_PARTX
 	bool "partition utilities"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_SMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  Partition utilities (addpart, delpart, partx)
 
@@ -295,7 +271,8 @@ config BR2_PACKAGE_UTIL_LINUX_RENAME
 config BR2_PACKAGE_UTIL_LINUX_RFKILL
 	bool "rfkill"
 	depends on BR2_USE_MMU # libsmartcols
-	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_SMARTCOLS
 	help
 	  Tool for enabling and disabling wireless devices. This new
 	  implementation is based upon, and backward compatible with,
@@ -386,7 +363,8 @@ config BR2_PACKAGE_UTIL_LINUX_UTMPDUMP
 config BR2_PACKAGE_UTIL_LINUX_UUIDD
 	bool "uuidd"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  UUID generation daemon
 
@@ -405,7 +383,8 @@ config BR2_PACKAGE_UTIL_LINUX_WALL
 config BR2_PACKAGE_UTIL_LINUX_WDCTL
 	bool "wdctl"
 	depends on BR2_USE_MMU # libsmartcols
-	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_SMARTCOLS
 	help
 	  Shows hardware watchdog status
 
@@ -417,7 +396,8 @@ config BR2_PACKAGE_UTIL_LINUX_WRITE
 config BR2_PACKAGE_UTIL_LINUX_ZRAMCTL
 	bool "zramctl"
 	depends on BR2_USE_MMU # libsmartcols
-	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_SMARTCOLS
 	help
 	  Set up and control zram devices
 
diff --git a/package/util-linux/Config.in.host b/package/util-linux/Config.in.host
index f73dc43dbc..ca2f8944f2 100644
--- a/package/util-linux/Config.in.host
+++ b/package/util-linux/Config.in.host
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_HOST_UTIL_LINUX
-	bool "host util-linux"
+	bool
 	help
 	  Various useful/essential linux libraries and utilities.
 
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index c176d364ce..d9890ea740 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,37 +4,61 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION_MAJOR = 2.33
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
-UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
-UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_VERSION = $(UTIL_LINUX_LIBS_VERSION)
+UTIL_LINUX_SOURCE = $(UTIL_LINUX_LIBS_SOURCE)
+UTIL_LINUX_SITE = $(UTIL_LINUX_LIBS_SITE)
 
 # README.licensing claims that some files are GPL-2.0 only, but this is not true.
 # Some files are GPL-3.0+ but only in tests. rfkill uses an ISC-style license.
-UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid) ISC (rfkill)
+UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount, libsmartcols), BSD-3-Clause (libuuid) ISC (rfkill)
 UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-3-Clause \
 	Documentation/licenses/COPYING.BSD-4-Clause-UC \
 	Documentation/licenses/COPYING.GPL-2.0-or-later \
 	Documentation/licenses/COPYING.ISC \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later
-UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-UTIL_LINUX_CONF_OPTS += \
+UTIL_LINUX_AUTORECONF = YES
+UTIL_LINUX_INCLUDES = \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID),-I$(STAGING_DIR)/usr/include/blkid,) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_FDISK),-I$(STAGING_DIR)/usr/include/libfdisk,) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT),-I$(STAGING_DIR)/usr/include/libmount,) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_SMARTCOLS),-I$(STAGING_DIR)/usr/include/libsmartcols,) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_UUID),-I$(STAGING_DIR)/usr/include/uuid,)
+UTIL_LINUX_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) $(UTIL_LINUX_INCLUDES)"
+UTIL_LINUX_CONF_OPTS = \
 	--disable-rpath \
 	--disable-makeinstall-chown
-UTIL_LINUX_LIBS = $(TARGET_NLS_LIBS)
+UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
 
-# system depends on util-linux so we enable systemd support
-# (which needs systemd to be installed)
-UTIL_LINUX_CONF_OPTS += \
-	--without-systemd \
-	--with-systemdsystemunitdir=no
+# udev support, provided by either eudev or systemd
+ifeq ($(BR2_PACKAGE_EUDEV),y)
+UTIL_LINUX_DEPENDENCIES += eudev
+endif
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+UTIL_LINUX_CONF_OPTS += --with-systemd --with-systemdsystemunitdir=/usr/lib/systemd/system
+UTIL_LINUX_DEPENDENCIES += systemd
+else
+UTIL_LINUX_CONF_OPTS += --without-systemd --with-systemdsystemunitdir=no
+endif
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+UTIL_LINUX_CONF_OPTS += --with-udev
+else
+UTIL_LINUX_CONF_OPTS += --without-udev
+endif
 
-HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
+HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf host-util-linux-libs
+HOST_UTIL_LINUX_INCLUDES = \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID),-I$(HOST_DIR)/include/blkid,) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_FDISK),-I$(HOST_DIR)/include/libfdisk,) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT),-I$(HOST_DIR)/include/libmount,) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_SMARTCOLS),-I$(HOST_DIR)/include/libsmartcols,) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS_UUID),-I$(HOST_DIR)/include/uuid,)
+HOST_UTIL_LINUX_CONF_ENV = CPPFLAGS="$(HOST_CPPFLAGS) $(HOST_UTIL_LINUX_INCLUDES)"
+HOST_UTIL_LINUX_CONF_OPTS = --disable-makeinstall-chown
 
 # We also don't want the host-python dependency
-HOST_UTIL_LINUX_CONF_OPTS = --without-python
+HOST_UTIL_LINUX_CONF_OPTS += --without-python
 
 # Prevent the installation from attempting to move shared libraries from
 # ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
@@ -69,8 +93,8 @@ endif
 # configure script. So we have to pass the proper LIBS value when
 # calling the configure script to make configure tests pass properly,
 # and then pass it again at build time.
-UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LIBS)"
-UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LIBS)"
+UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LINK_LIBS)"
+UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LINK_LIBS)"
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 UTIL_LINUX_DEPENDENCIES += libselinux
@@ -88,7 +112,7 @@ endif
 # Used by cramfs utils
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 
-# Used by login-utils
+# Used by login utils (chfn, chsh, login, runuser, su)
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
 
 # Disable/Enable utilities
@@ -109,11 +133,6 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCS),--enable-ipcs,--disable-ipcs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBFDISK),--enable-libfdisk,--disable-libfdisk) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),--enable-libmount,--disable-libmount) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS),--enable-libsmartcols,--disable-libsmartcols) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),--enable-libuuid,--disable-libuuid) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LINE),--enable-line,--disable-line) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGGER),--enable-logger,--disable-logger) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN),--enable-login,--disable-login) \
@@ -152,22 +171,6 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_ZRAMCTL),--enable-zramctl,--disable-zramctl)
 
-# In the host version of util-linux, we only require libuuid and
-# libmount (plus libblkid as an indirect dependency of libmount).
-# So disable all of the programs, unless BR2_PACKAGE_HOST_UTIL_LINUX is set
-
-HOST_UTIL_LINUX_CONF_OPTS += \
-	--enable-libblkid \
-	--enable-libmount \
-	--enable-libuuid \
-	--without-ncurses \
-	--without-ncursesw \
-	--without-tinfo
-
-ifeq ($(BR2_PACKAGE_HOST_UTIL_LINUX),y)
-HOST_UTIL_LINUX_CONF_OPTS += --disable-makeinstall-chown
-# disable commands that have ncurses dependency, as well as
-# other ones that are useless on the host
 HOST_UTIL_LINUX_CONF_OPTS += \
 	--disable-agetty \
 	--disable-chfn-chsh \
@@ -195,17 +198,15 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 	--disable-wdctl \
 	--disable-write \
 	--disable-zramctl
+
 # Used by cramfs utils
 HOST_UTIL_LINUX_DEPENDENCIES += host-zlib
-else
-HOST_UTIL_LINUX_CONF_OPTS += --disable-all-programs
-endif
 
 # Install libmount Python bindings
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
 UTIL_LINUX_CONF_OPTS += --with-python
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS_MOUNT),y)
 UTIL_LINUX_CONF_OPTS += --enable-pylibmount
 else
 UTIL_LINUX_CONF_OPTS += --disable-pylibmount
@@ -216,7 +217,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 UTIL_LINUX_CONF_OPTS += --with-readline
-UTIL_LINUX_LIBS += $(if $(BR2_STATIC_LIBS),-lcurses)
+UTIL_LINUX_LINK_LIBS += $(if $(BR2_STATIC_LIBS),-lcurses)
 UTIL_LINUX_DEPENDENCIES += readline
 else
 UTIL_LINUX_CONF_OPTS += --without-readline
@@ -232,7 +233,7 @@ endif
 # Install PAM configuration files
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU)$(BR2_PACKAGE_LINUX_PAM),yy)
 define UTIL_LINUX_INSTALL_PAMFILES
-	$(INSTALL) -m 0644 package/util-linux/su.pam \
+	$(INSTALL) -D -m 0644 package/util-linux/su.pam \
 		$(TARGET_DIR)/etc/pam.d/su
 	$(INSTALL) -m 0644 package/util-linux/su.pam \
 		$(TARGET_DIR)/etc/pam.d/su-l
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 7b9c3e75d9..b107f03048 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -28,7 +28,7 @@ else
 WGET_CONF_OPTS += --without-libidn
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS_UUID),y)
 WGET_DEPENDENCIES += util-linux
 endif
 
diff --git a/package/xen/Config.in b/package/xen/Config.in
index 57ab40eba8..6cee4af2a0 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -28,8 +28,8 @@ config BR2_PACKAGE_XEN_TOOLS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PIXMAN
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	help
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 024cde9fe6..0d26bb7847 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -6,9 +6,9 @@ config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_BLKID
 	help
 	  The XFS file system utilities and libraries
 
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index aeedff17b8..5092e5413b 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -5,8 +5,8 @@ config BR2_PACKAGE_ZEROMQ
 	bool "zeromq"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBS_UUID
 	help
 	  ?MQ (ZeroMQ, 0MQ, zmq) looks like an embeddable networking
 	  library but acts like a concurrency framework. It gives you
-- 
2.20.1
