From: Simon Maes <simonn.maes@gmail.com>
Date: Wed,  4 May 2016 09:47:54 +0200
Subject: [Buildroot] [PATCH 1/6] qemu: add support for host-qemu-system
Message-ID: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

    Additional package configurations are:
    - Enable system or linux user-land emulation
    - Enable SDL frontend and FDT support
    - Enable Qemu debug
    - Disable stripped binary format

Signed-off-by: Simon Maes <simonn.maes@gmail.com>
---
 package/qemu/Config.in.host | 66 +++++++++++++++++++++++++++++++++++++++++++++
 package/qemu/qemu.mk        | 39 ++++++++++++++++++++++-----
 2 files changed, 99 insertions(+), 6 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index c5c3f05..71f697e 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -15,3 +15,69 @@ config BR2_PACKAGE_HOST_QEMU
 	  This option builds a user emulator for your selected architecture.
 
 	  http://www.qemu.org
+
+if BR2_PACKAGE_HOST_QEMU
+
+#
+# Configuration selection
+#
+
+comment "Emulators selection"
+
+config BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
+	bool "Enable systems emulation"
+	depends on !BR2_STATIC_LIBS # dtc
+	select BR2_PACKAGE_HOST_QEMU_FDT
+	help
+	  Say 'y' to build system emulators/virtualisers.
+	  When building the host-qemu package for system emulation,
+	  qemu will be configured to support the Target Architecture,
+	  configured in Buildroot
+
+config BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
+	bool "Enable Linux user-land emulation"
+	help
+	  Say 'y' to build Linux user-land emulators.
+
+config BR2_PACKAGE_HOST_QEMU_HAS_EMULS
+	def_bool y
+	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE || \
+		BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
+
+if BR2_PACKAGE_HOST_QEMU_HAS_EMULS
+
+comment "Frontends"
+
+config BR2_PACKAGE_HOST_QEMU_SDL
+	bool "Enable SDL frontend"
+	select BR2_PACKAGE_SDL
+	help
+	  Say 'y' to enable the SDL frontend, that is, a graphical window
+	  presenting the VM's display.
+
+comment "Misc. features"
+
+config BR2_PACKAGE_HOST_QEMU_FDT
+	bool "Enable FDT"
+	depends on !BR2_STATIC_LIBS # dtc
+	select BR2_PACKAGE_DTC
+	help
+	  Say 'y' to have QEMU capable of constructing Device Trees,
+	  and passing them to the VMs.
+
+comment "FDT support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+config BR2_PACKAGE_HOST_QEMU_DEBUG
+	bool "Enable debug"
+	help
+	  Say 'y' to enable build options for QEMU.
+
+config BR2_PACKAGE_HOST_QEMU_STRIP_BINARY
+	bool "Enable stripped binary format"
+	help
+	  Say 'y' to enable stripping of the QEMU binary.
+
+endif # BR2_PACKAGE_HOST_QEMU_HAS_EMULS
+
+endif # BR2_PACKAGE_HOST_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 522910e..0e99138 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -17,6 +17,8 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 # Host-qemu
 
 HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-pixman
+HOST_QEMU_SITE = $(QEMU_SITE)
+HOST_QEMU_SOURCE = $(QEMU_SOURCE)
 
 #       BR ARCH         qemu
 #       -------         ----
@@ -61,7 +63,6 @@ endif
 ifeq ($(HOST_QEMU_ARCH),sh4aeb)
 HOST_QEMU_ARCH = sh4eb
 endif
-HOST_QEMU_TARGETS = $(HOST_QEMU_ARCH)-linux-user
 
 ifeq ($(BR2_PACKAGE_HOST_QEMU),y)
 HOST_QEMU_HOST_SYSTEM_TYPE = $(shell uname -s)
@@ -69,10 +70,12 @@ ifneq ($(HOST_QEMU_HOST_SYSTEM_TYPE),Linux)
 $(error "qemu-user can only be used on Linux hosts")
 endif
 
-# kernel version as major*256 + minor
-HOST_QEMU_HOST_SYSTEM_VERSION = $(shell uname -r | awk -F. '{ print $$1 * 256 + $$2 }')
-HOST_QEMU_TARGET_SYSTEM_VERSION = $(shell echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) | awk -F. '{ print $$1 * 256 + $$2 }')
-HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(HOST_QEMU_TARGET_SYSTEM_VERSION) && echo OK)
+ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
+HOST_QEMU_TARGETS += $(HOST_QEMU_ARCH)-softmmu
+HOST_QEMU_OPTS += --enable-system
+else
+HOST_QEMU_OPTS += --disable-system
+endif
 
 #
 # The principle of qemu-user is that it emulates the instructions of
@@ -84,11 +87,34 @@ HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(
 # built with kernel headers that are older or the same as the kernel
 # version running on the host machine.
 #
+
+ifeq ($(BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE),y)
+HOST_QEMU_TARGETS += $(HOST_QEMU_ARCH)-linux-user
+HOST_QEMU_OPTS += --enable-linux-user
+
+# kernel version as major*256 + minor
+HOST_QEMU_HOST_SYSTEM_VERSION = $(shell uname -r | awk -F. '{ print $$1 * 256 + $$2 }')
+HOST_QEMU_TARGET_SYSTEM_VERSION = $(shell echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) | awk -F. '{ print $$1 * 256 + $$2 }')
+HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(HOST_QEMU_TARGET_SYSTEM_VERSION) && echo OK)
+
 ifeq ($(BR_BUILDING),y)
 ifneq ($(HOST_QEMU_COMPARE_VERSION),OK)
 $(error "Refusing to build qemu-user: target Linux version newer than host's.")
 endif
+
+else
+HOST_QEMU_OPTS += --disable-linux-user
+endif
 endif
+
+ifeq ($(BR2_PACKAGE_HOST_QEMU_DEBUG),y)
+HOST_QEMU_OPTS += --enable-debug
+endif
+
+ifeq ($(BR2_PACKAGE_HOST_QEMU_STRIP_BINARY),n)
+HOST_QEMU_OPTS += --disable-strip
+endif
+
 endif
 
 define HOST_QEMU_CONFIGURE_CMDS
@@ -100,7 +126,8 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--host-cc="$(HOSTCC)"                   \
 		--python=$(HOST_DIR)/usr/bin/python2    \
 		--extra-cflags="$(HOST_CFLAGS)"         \
-		--extra-ldflags="$(HOST_LDFLAGS)"
+		--extra-ldflags="$(HOST_LDFLAGS)"       \
+		$(HOST_QEMU_OPTS)
 endef
 
 define HOST_QEMU_BUILD_CMDS
-- 
2.6.2
