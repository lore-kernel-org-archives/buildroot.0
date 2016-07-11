From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 00:16:29 +0200
Subject: [Buildroot] [PATCH 06/12 v8] package/eudev: allow building only
	libudev
In-Reply-To: <cover.1468274498.git.yann.morin.1998@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <cd74a2f4b20ac593f3cc7aa0dc1500d20c75a3e7.1468274498.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to move the kconfig symbol for the daemon outside of the eudev
conditional block, or we would, later, ahve circular dependencies, like
so (here, with libinput converted to use libudev):

    package/udev/Config.in:1:error: recursive dependency detected!
    package/udev/Config.in:1:       symbol BR2_PACKAGE_HAS_UDEV is selected by BR2_PACKAGE_EUDEV_DAEMON
    package/eudev/Config.in:1:      symbol BR2_PACKAGE_EUDEV_DAEMON is selected by BR2_PACKAGE_EUDEV
    package/eudev/Config.in:11:     symbol BR2_PACKAGE_EUDEV is selected by BR2_PACKAGE_LIBUDEV
    package/libudev/Config.in:1:    symbol BR2_PACKAGE_LIBUDEV is selected by BR2_PACKAGE_LIBINPUT
    package/libinput/Config.in:1:   symbol BR2_PACKAGE_LIBINPUT is selected by BR2_PACKAGE_WESTON
    package/weston/Config.in:6:     symbol BR2_PACKAGE_WESTON depends on BR2_PACKAGE_HAS_UDEV

Although the chain is short, it is rather difficult to interpret.
Basically, what this means is that, by way of successive 'select' and
'depends on', we get a circular dependency. In fact, kconfig is wrong
here, since there is *no* way we could trigger this loop by enabling one
of the incriminated symbol: its dependency tracking is limited to
looking at the symbols, not whether they are negated or not (i.e. in the
chanin above, a symbol is negated, and is only valid when another is
false, thus avoiding the loop). But kconfig has no way to know that...

So, we trick it and break the loop, by moving the kconfig symbol for the
eudev daemon outside of the eudev if-block and making it promptless.

Still, for the convenience of the user, we keep a dummy udev daemon
prompt in that if-block, so that he knows the daemon is enabled.

Fix the comments on dependencies, since they are also hard-dependencies
of eudev itself.

For wchar, the reason is that configure.ac wants to check for a
C99-compliant compiler, and autoconf always emits test-code that
contains wchar_t variables, even if that's not required at all by eudev.
This is not solved by an autoreconf either, obviously.

For !static, libudev (and thus eudev) includes dlfcn.h, which only
exists in toolchains that have dynamic library support. However, eudev
does not use anything provided by dlfcn.h; removing this dependency can
be done in a follow-up change.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/eudev/Config.in | 48 +++++++++++++++++++++++++++++++++---------------
 package/eudev/eudev.mk  | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 15 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index f2d5725..b24ee02 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -1,31 +1,47 @@
+# This symbol is outside the eudev if-block, so that we do not have
+# a circular dependency in kconfig. Thus, we need the dummy symbol,
+# below, to inform the user that the daemon has indeed been enabled.
+config BR2_PACKAGE_EUDEV_DAEMON
+	bool
+	select BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_KMOD
+	# We can select this has we're sure eudev is selected when we are.
+	select BR2_PACKAGE_EUDEV_DAEMON_DUMMY
+
 config BR2_PACKAGE_EUDEV
 	bool "eudev"
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
-	depends on BR2_USE_MMU # uses fork()
-	depends on BR2_USE_WCHAR # util-linux
-	depends on !BR2_STATIC_LIBS # kmod
-	select BR2_PACKAGE_EUDEV_DAEMON
+	depends on !BR2_INIT_SYSTEMD
+	depends on BR2_USE_MMU # uses fork() (for daemon) and dlfcn.h (for libudev)
+	depends on BR2_USE_WCHAR # C99
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	help
 	  eudev is a fork of systemd-udev with the goal of obtaining better
 	  compatibility with existing software such as OpenRC and Upstart,
 	  older kernels, various toolchains and anything else required by
 	  users and various distributions.
 
+	  This option only installs the libudev library. If you want /dev
+	  to be managed with the udev daemon, see "/dev management" in the
+	  top-level menu "System configuration".
+
 	  https://wiki.gentoo.org/wiki/Project:Eudev
 
 if BR2_PACKAGE_EUDEV
 
-config BR2_PACKAGE_EUDEV_DAEMON
+comment "udev daemon needs eudev /dev management"
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+
+# See comment at top of file.
+config BR2_PACKAGE_EUDEV_DAEMON_DUMMY
 	bool "udev daemon"
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
-	select BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_KMOD
 	help
 	  Install the udev daemon.
 
-if BR2_PACKAGE_EUDEV_DAEMON
+# Use the dummy symbol for proper indentation
+if BR2_PACKAGE_EUDEV_DAEMON_DUMMY
 
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "eudev"
@@ -45,10 +61,12 @@ endif # BR2_PACKAGE_EUDEV_DAEMON
 
 endif # BR2_PACKAGE_EUDEV
 
-comment "eudev needs eudev /dev management"
-	depends on BR2_USE_MMU
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
-
 comment "eudev needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_INIT_SYSTEMD
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+
+comment "eudev incompatible with systemd init"
+	depends on BR2_USE_MMU
+	depends on BR2_INIT_SYSTEMD
+	depends on BR2_USE_WCHAR && !BR2_STATIC_LIBS
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 6c61660..a4c8ebf 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -11,6 +11,8 @@ EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_EUDEV_DAEMON),y)
+
 # mq_getattr is in librt
 EUDEV_CONF_ENV += LIBS=-lrt
 
@@ -58,4 +60,44 @@ define EUDEV_USERS
 	- - input -1 * - - - Input device group
 endef
 
+else # BR2_PACKAGE_EUDEV_DAEMON
+
+EUDEV_DEPENDENCIES = host-gperf host-pkgconf
+
+EUDEV_CONF_OPTS = \
+	--disable-manpages \
+	--disable-introspection \
+	--disable-blkid \
+	--disable-selinux \
+	--disable-kmod \
+	--disable-hwdb \
+	--disable-rule-generator
+
+# When not installing the daemon, we have to override the build and
+# install commands, to just install the library.
+
+define EUDEV_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		-C $(@D)/src/shared
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		-C $(@D)/src/libudev
+endef
+
+# Symlink udev.pc to libudev.pc for those packages that conflate the two
+# and 'Requires: udev' when they should just 'Requires: libudev'. Do the
+# symlink, to avoid patching each and all of those packages.
+# Note: nothing to install from src/shared, only from src/libudev
+define EUDEV_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		-C $(@D)/src/libudev DESTDIR=$(STAGING_DIR) install
+	ln -sf libudev.pc $(STAGING_DIR)/usr/lib/pkgconfig/udev.pc
+endef
+
+define EUDEV_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		-C $(@D)/src/libudev DESTDIR=$(TARGET_DIR) install
+endef
+
+endif # BR2_PACKAGE_EUDEV_DAEMON
+
 $(eval $(autotools-package))
-- 
2.7.4
