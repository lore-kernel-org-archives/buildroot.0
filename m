From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Fri, 14 Dec 2018 19:42:44 +0800
Subject: [Buildroot] [PATCH v2 1/1] boot/systemd-boot: new package
Message-ID: <1544787764-4537-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

This is essentially the successor to gummiboot.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                              |  1 +
 boot/Config.in                          |  1 +
 boot/systemd-boot/Config.in             | 23 ++++++++++++++
 boot/systemd-boot/systemd-boot.mk       |  7 +++++
 package/meson/cross-compilation.conf.in |  1 +
 package/meson/meson.mk                  | 41 ++++++++++++++++++++++++-
 package/systemd/Config.in               | 54 +++++++++++++++++++++++++--------
 package/systemd/buildroot.conf          |  3 ++
 package/systemd/loader.conf             |  2 ++
 package/systemd/systemd.mk              | 53 ++++++++++++++++++++++++++++++--
 system/Config.in                        |  1 +
 11 files changed, 171 insertions(+), 16 deletions(-)
 create mode 100644 boot/systemd-boot/Config.in
 create mode 100644 boot/systemd-boot/systemd-boot.mk
 create mode 100644 package/systemd/buildroot.conf
 create mode 100644 package/systemd/loader.conf

diff --git a/DEVELOPERS b/DEVELOPERS
index 4192681..93599fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -995,6 +995,7 @@ F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
 
 N:	James Hilliard <james.hilliard1@gmail.com>
+F:	boot/systemd-boot/
 F:	package/python-aiodns/
 F:	package/python-aiohttp/
 F:	package/python-aiohttp-jinja2/
diff --git a/boot/Config.in b/boot/Config.in
index 8e0c8e5..5b7f606 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -16,6 +16,7 @@ source "boot/mxs-bootlets/Config.in"
 source "boot/riscv-pk/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/syslinux/Config.in"
+source "boot/systemd-boot/Config.in"
 source "boot/ts4800-mbrboot/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
diff --git a/boot/systemd-boot/Config.in b/boot/systemd-boot/Config.in
new file mode 100644
index 0000000..7c64cef
--- /dev/null
+++ b/boot/systemd-boot/Config.in
@@ -0,0 +1,23 @@
+config BR2_TARGET_SYSTEMD_BOOT
+	bool "systemd-boot"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_BUILD_SYSTEMD
+	select BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_GNU_EFI
+	help
+	  systemd-boot is a simple UEFI boot manager which executes
+	  configured EFI images. The default entry is selected by a
+	  configured pattern (glob) or an on-screen menu.
+
+	  systemd-boot operates on the EFI System Partition (ESP)
+	  only. Configuration file fragments, kernels, initrds, other
+	  EFI images need to reside on the ESP. Linux kernels need to
+	  be built with CONFIG_EFI_STUB to be able to be directly
+	  executed as an EFI image.
+
+	  See the Grub2 help text for details on preparing an EFI
+	  capable disk image using systemd-boot: the instructions are
+	  exactly the same, except that the systemd-boot configuration
+	  files will be located in /loader/ inside the EFI partition.
+
+	  https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/
\ No newline at end of file
diff --git a/boot/systemd-boot/systemd-boot.mk b/boot/systemd-boot/systemd-boot.mk
new file mode 100644
index 0000000..5854024
--- /dev/null
+++ b/boot/systemd-boot/systemd-boot.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# systemd-boot
+#
+################################################################################
+
+$(eval $(virtual-package))
diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
index 0eec740..fc8e27f 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/package/meson/cross-compilation.conf.in
@@ -11,6 +11,7 @@ strip = '@TARGET_CROSS at strip'
 pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
 
 [properties]
+needs_exe_wrapper = true
 c_args = [@TARGET_CFLAGS@]
 c_link_args = [@TARGET_LDFLAGS@]
 cpp_args = [@TARGET_CXXFLAGS@]
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index e1675c2..d9ad2fc 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -15,6 +15,45 @@ HOST_MESON_NEEDS_HOST_PYTHON = python3
 
 HOST_MESON_TARGET_ENDIAN = $(call LOWERCASE,$(BR2_ENDIAN))
 HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
+ifeq ($(BR2_arcle),y)
+HOST_MESON_TARGET_CPU_FAMILY = arc
+else ifeq ($(BR2_arceb),y)
+HOST_MESON_TARGET_CPU_FAMILY = arc
+else ifeq ($(BR2_arm),y)
+HOST_MESON_TARGET_CPU_FAMILY = arm
+else ifeq ($(BR2_armeb),y)
+HOST_MESON_TARGET_CPU_FAMILY = arm
+else ifeq ($(BR2_aarch64),y)
+HOST_MESON_TARGET_CPU_FAMILY = aarch64
+else ifeq ($(BR2_aarch64_be),y)
+HOST_MESON_TARGET_CPU_FAMILY = aarch64
+else ifeq ($(BR2_i386),y)
+HOST_MESON_TARGET_CPU_FAMILY = x86
+else ifeq ($(BR2_mips),y)
+HOST_MESON_TARGET_CPU_FAMILY = mips
+else ifeq ($(BR2_mipsel),y)
+HOST_MESON_TARGET_CPU_FAMILY = mips
+else ifeq ($(BR2_mips64),y)
+HOST_MESON_TARGET_CPU_FAMILY = mips64
+else ifeq ($(BR2_mips64el),y)
+HOST_MESON_TARGET_CPU_FAMILY = mips64
+else ifeq ($(BR2_powerpc),y)
+HOST_MESON_TARGET_CPU_FAMILY = ppc
+else ifeq ($(BR2_powerpc64),y)
+HOST_MESON_TARGET_CPU_FAMILY = ppc64
+else ifeq ($(BR2_powerpc64le),y)
+HOST_MESON_TARGET_CPU_FAMILY = ppc64
+else ifeq ($(BR2_riscv),y)
+HOST_MESON_TARGET_CPU_FAMILY = riscv32
+else ifeq ($(BR2_sparc),y)
+HOST_MESON_TARGET_CPU_FAMILY = sparc
+else ifeq ($(BR2_sparc64),y)
+HOST_MESON_TARGET_CPU_FAMILY = sparc64
+else ifeq ($(BR2_x86_64),y)
+HOST_MESON_TARGET_CPU_FAMILY = x86_64
+else
+HOST_MESON_TARGET_CPU_FAMILY = $(ARCH)
+endif
 
 HOST_MESON_SED_CFLAGS = $(if $(TARGET_CFLAGS),`printf '"%s"$(comma) ' $(TARGET_CFLAGS)`)
 HOST_MESON_SED_LDFLAGS = $(if $(TARGET_LDFLAGS),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
@@ -23,7 +62,7 @@ HOST_MESON_SED_CXXFLAGS = $(if $(TARGET_CXXFLAGS),`printf '"%s"$(comma) ' $(TARG
 define HOST_MESON_INSTALL_CROSS_CONF
 	mkdir -p $(HOST_DIR)/etc/meson
 	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
-	    -e "s%@TARGET_ARCH@%$(ARCH)%g" \
+	    -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
 	    -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
 	    -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
 	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 25f322e..c8fa786 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -7,27 +7,30 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64 || \
 		BR2_aarch64 || BR2_m68k || BR2_arc
 
+config BR2_PACKAGE_BUILD_SYSTEMD
+	bool
+
 menuconfig BR2_PACKAGE_SYSTEMD
 	bool "systemd"
-	depends on BR2_INIT_SYSTEMD
+	depends on BR2_PACKAGE_BUILD_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
-	select BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_DBUS # runtime dependency only
+	select BR2_PACKAGE_HAS_UDEV if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_DBUS if BR2_INIT_SYSTEMD # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID if BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	select BR2_PACKAGE_UTIL_LINUX_BINARIES
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES if BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
-	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
-	select BR2_PACKAGE_UTIL_LINUX_FSCK
-	select BR2_PACKAGE_KMOD
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
-	select BR2_PACKAGE_KMOD_TOOLS
-	select BR2_TARGET_TZ_INFO
-	select BR2_NEEDS_HOST_UTF8_LOCALE
+	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_UTIL_LINUX_FSCK if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_KMOD if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_INIT_SYSTEMD # kmod-tools
+	select BR2_PACKAGE_KMOD_TOOLS if BR2_INIT_SYSTEMD
+	select BR2_TARGET_TZ_INFO if BR2_INIT_SYSTEMD
+	select BR2_NEEDS_HOST_UTF8_LOCALE if BR2_INIT_SYSTEMD
 	help
 	  systemd is a system and service manager for Linux,
 	  compatible with SysV and LSB init scripts. systemd provides
@@ -76,9 +79,11 @@ if BR2_PACKAGE_SYSTEMD
 
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
+	depends on BR2_INIT_SYSTEMD
 
 config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 	bool "HTTP server for journal events"
+	depends on BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_LIBMICROHTTPD
 	help
 	  systemd-journal-gatewayd serves journal events over the
@@ -89,6 +94,7 @@ config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 
 config BR2_PACKAGE_SYSTEMD_BACKLIGHT
 	bool "enable backlight support"
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-backlight is a service that restores the display
 	  backlight brightness at early boot and saves it at shutdown.
@@ -97,6 +103,7 @@ config BR2_PACKAGE_SYSTEMD_BACKLIGHT
 
 config BR2_PACKAGE_SYSTEMD_BINFMT
 	bool "enable binfmt tool"
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-binfmt is an early boot service that registers
 	  additional binary formats for executables in the kernel.
@@ -105,6 +112,7 @@ config BR2_PACKAGE_SYSTEMD_BINFMT
 
 config BR2_PACKAGE_SYSTEMD_COREDUMP
 	bool "enable coredump hook"
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-coredump can be used as a helper binary by the
 	  kernel when a user space program receives a fatal signal and
@@ -114,6 +122,7 @@ config BR2_PACKAGE_SYSTEMD_COREDUMP
 
 config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
 	bool "enable firstboot support"
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-firstboot initializes the most basic system settings
 	  interactively on the first boot.
@@ -122,6 +131,7 @@ config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
 
 config BR2_PACKAGE_SYSTEMD_HIBERNATE
 	bool "enable hibernation support"
+	depends on BR2_INIT_SYSTEMD
 	help
 	  When this features is enabled, additional tools and services
 	  are built to support suspending and resuming the system.
@@ -131,6 +141,7 @@ config BR2_PACKAGE_SYSTEMD_HIBERNATE
 config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 	bool "enable hostname daemon"
 	default y
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-hostnamed is a system service that may be used as a
 	  mechanism to change the system's hostname.
@@ -140,6 +151,7 @@ config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 config BR2_PACKAGE_SYSTEMD_HWDB
 	bool "enable hwdb installation"
 	default y
+	depends on BR2_INIT_SYSTEMD
 	help
 	  Enables hardware database installation to /usr/lib/udev/hwdb.d
 
@@ -150,6 +162,7 @@ config BR2_PACKAGE_SYSTEMD_HWDB
 
 config BR2_PACKAGE_SYSTEMD_IMPORTD
 	bool "enable import daemon"
+	depends on BR2_INIT_SYSTEMD
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGCRYPT
@@ -166,6 +179,7 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 
 config BR2_PACKAGE_SYSTEMD_LOCALED
 	bool "enable locale daemon"
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-localed is a system service that may be used as
 	  mechanism to change the system locale settings, as well as
@@ -175,6 +189,7 @@ config BR2_PACKAGE_SYSTEMD_LOCALED
 
 config BR2_PACKAGE_SYSTEMD_LOGIND
 	bool "enable login daemon"
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-logind is a system service that manages user logins.
 
@@ -182,6 +197,7 @@ config BR2_PACKAGE_SYSTEMD_LOGIND
 
 config BR2_PACKAGE_SYSTEMD_MACHINED
 	bool "enable machine daemon"
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-machined is a system service that keeps track of
 	  virtual machines and containers, and processes belonging to
@@ -192,6 +208,7 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 	bool "enable myhostname NSS plugin"
 	default y
+	depends on BR2_INIT_SYSTEMD
 	help
 	  nss-myhostname is a plug-in module for the GNU Name Service
 	  Switch (NSS) functionality of the GNU C Library (glibc),
@@ -203,6 +220,7 @@ config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	default y
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-networkd is a system service that manages networks.
 	  It detects and configures network devices as they appear, as
@@ -215,6 +233,7 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 config BR2_PACKAGE_SYSTEMD_POLKIT
 	bool "enable polkit support"
+	depends on BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_USES_GLIBC # polkit
 	select BR2_PACKAGE_POLKIT
 	help
@@ -226,10 +245,12 @@ config BR2_PACKAGE_SYSTEMD_POLKIT
 	  http://wiki.freedesktop.org/www/Software/polkit/
 
 comment "polkit support needs a glibc toolchain"
+	depends on BR2_INIT_SYSTEMD
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_SYSTEMD_QUOTACHECK
 	bool "enable quotacheck tools"
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-quotacheck is a service responsible for file system
 	  quota checks. It is run once at boot after all necessary
@@ -240,6 +261,7 @@ config BR2_PACKAGE_SYSTEMD_QUOTACHECK
 
 config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 	bool "enable random-seed support"
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-random-seed is a service that restores the random
 	  seed of the system at early boot and saves it at
@@ -251,6 +273,7 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 config BR2_PACKAGE_SYSTEMD_RESOLVED
 	bool "enable resolve daemon"
 	default y
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-resolved is a system service that provides network
 	  name resolution to local applications. It implements a
@@ -261,6 +284,7 @@ config BR2_PACKAGE_SYSTEMD_RESOLVED
 
 config BR2_PACKAGE_SYSTEMD_RFKILL
 	bool "enable rfkill tools"
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-rfkill is a service that restores the RF kill switch
 	  state at early boot and saves it at shutdown.
@@ -269,6 +293,7 @@ config BR2_PACKAGE_SYSTEMD_RFKILL
 
 config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	bool "enable SMACK support"
+	depends on BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_ATTR
 	select BR2_PACKAGE_SMACK
 	help
@@ -283,6 +308,7 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 
 config BR2_PACKAGE_SYSTEMD_SYSUSERS
 	bool "enable sysusers support"
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-sysusers creates system users and groups, based on
 	  the file format and location specified in sysusers.d(5).
@@ -292,6 +318,7 @@ config BR2_PACKAGE_SYSTEMD_SYSUSERS
 config BR2_PACKAGE_SYSTEMD_TIMEDATED
 	bool "enable timedate daemon"
 	default y
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-timedated is a system service that may be used as a
 	  mechanism to change the system clock and timezone, as well
@@ -302,6 +329,7 @@ config BR2_PACKAGE_SYSTEMD_TIMEDATED
 config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 	bool "enable timesync daemon"
 	default y
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-timesyncd is a service that may be used to
 	  synchronize the local system clock with a Network Time
@@ -315,6 +343,7 @@ config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 config BR2_PACKAGE_SYSTEMD_TMPFILES
 	bool "enable tmpfiles support"
 	default y
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-tmpfiles creates, deletes, and cleans up volatile
 	  and temporary files and directories, based on the
@@ -325,6 +354,7 @@ config BR2_PACKAGE_SYSTEMD_TMPFILES
 
 config BR2_PACKAGE_SYSTEMD_VCONSOLE
 	bool "enable vconsole tool"
+	depends on BR2_INIT_SYSTEMD
 	help
 	  systemd-vconsole-setup is an early boot service that
 	  configures the virtual console font and console keymap.
diff --git a/package/systemd/buildroot.conf b/package/systemd/buildroot.conf
new file mode 100644
index 0000000..16d4d85
--- /dev/null
+++ b/package/systemd/buildroot.conf
@@ -0,0 +1,3 @@
+title	Buildroot
+linux	/bzImage
+options	root=/dev/sda2 rootwait console=tty1
diff --git a/package/systemd/loader.conf b/package/systemd/loader.conf
new file mode 100644
index 0000000..93b77b8
--- /dev/null
+++ b/package/systemd/loader.conf
@@ -0,0 +1,2 @@
+timeout 3
+default buildroot
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e53f0b6..b7234be 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -8,15 +8,31 @@ SYSTEMD_VERSION = 239
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
+ifeq ($(BR2_INIT_SYSTEMD),y)
 SYSTEMD_INSTALL_STAGING = YES
+else
+SYSTEMD_INSTALL_STAGING = NO
+SYSTEMD_INSTALL_TARGET = NO
+endif
+ifeq ($(BR2_TARGET_SYSTEMD_BOOT),y)
+SYSTEMD_INSTALL_IMAGES = YES
+ifeq ($(BR2_i386),y)
+SYSTEMD_IMGARCH = ia32
+else ifeq ($(BR2_x86_64),y)
+SYSTEMD_IMGARCH = x64
+endif
+endif
 SYSTEMD_DEPENDENCIES = \
 	host-gperf \
 	host-intltool \
-	kmod \
 	libcap \
 	util-linux
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+SYSTEMD_DEPENDENCIES += \
+	kmod
 SYSTEMD_PROVIDES = udev
+endif
 
 SYSTEMD_CONF_OPTS += \
 	-Drootlibdir='/usr/lib' \
@@ -24,8 +40,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dman=false \
 	-Dima=false \
 	-Dlibcryptsetup=false \
-	-Defi=false \
-	-Dgnu-efi=false \
 	-Dldconfig=false \
 	-Ddefault-dnssec=no \
 	-Dtests=false \
@@ -404,4 +418,37 @@ endef
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
+ifeq ($(BR2_TARGET_SYSTEMD_BOOT),y)
+SYSTEMD_DEPENDENCIES += gnu-efi
+SYSTEMD_CONF_OPTS += \
+	-Defi=true \
+	-Dgnu-efi=true \
+	-Defi-cc=$(TARGET_CC) \
+	-Defi-ld=$(TARGET_LD) \
+	-Defi-libdir=$(STAGING_DIR)/usr/lib \
+	-Defi-ldsdir=$(STAGING_DIR)/usr/lib \
+	-Defi-includedir=$(STAGING_DIR)/usr/include/efi \
+
+ifneq ($(BR2_INIT_SYSTEMD),y)
+define SYSTEMD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(SYSTEMD_NINJA_ENV) \
+		$(NINJA) $(NINJA_OPTS) -C $(SYSTEMD_SRCDIR)/build \
+		src/boot/efi/{systemd-boot$(SYSTEMD_IMGARCH).efi,linux$(SYSTEMD_IMGARCH).efi.stub}
+endef
+endif
+
+define SYSTEMD_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_IMGARCH).efi \
+		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_IMGARCH).efi
+	echo "boot$(SYSTEMD_IMGARCH).efi" > \
+		$(BINARIES_DIR)/efi-part/startup.nsh
+	$(INSTALL) -D -m 0644 $(SYSTEMD_PKGDIR)/loader.conf \
+		$(BINARIES_DIR)/efi-part/loader/loader.conf
+	$(INSTALL) -D -m 0644 $(SYSTEMD_PKGDIR)/buildroot.conf \
+		$(BINARIES_DIR)/efi-part/loader/entries/buildroot.conf
+endef
+else
+SYSTEMD_CONF_OPTS += -Defi=false -Dgnu-efi=false
+endif
+
 $(eval $(meson-package))
diff --git a/system/Config.in b/system/Config.in
index 9e34f11..773a2cc 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -133,6 +133,7 @@ config BR2_INIT_SYSTEMD
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_ROOTFS_MERGED_USR
+	select BR2_PACKAGE_BUILD_SYSTEMD
 	select BR2_PACKAGE_SYSTEMD
 
 comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10"
-- 
2.7.4
