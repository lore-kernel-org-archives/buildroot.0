From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  3 May 2014 17:20:13 -0300
Subject: [Buildroot] [PATCH 1/3] qemu-system: new package
Message-ID: <1399148415-27648-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in.host             |  1 +
 package/qemu-system/Config.in.host | 30 ++++++++++++++++++
 package/qemu-system/qemu-system.mk | 64 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 package/qemu-system/Config.in.host
 create mode 100644 package/qemu-system/qemu-system.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index c6997e9..4faaf60 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -13,6 +13,7 @@ source "package/mtools/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/parted/Config.in.host"
+source "package/qemu-system/Config.in.host"
 source "package/sam-ba/Config.in.host"
 source "package/squashfs/Config.in.host"
 source "package/sunxi-tools/Config.in.host"
diff --git a/package/qemu-system/Config.in.host b/package/qemu-system/Config.in.host
new file mode 100644
index 0000000..b451ca6
--- /dev/null
+++ b/package/qemu-system/Config.in.host
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_HOST_QEMU_SYSTEM
+	bool "host qemu-system"
+	# Supported system target architectures
+	depends on BR2_arm || BR2_i386 || BR2_microblaze || BR2_mips \
+		|| BR2_mips64 || BR2_mips64el || BR2_mipsel || BR2_powerpc \
+		|| BR2_sh4 || BR2_sh4eb || BR2_sparc || BR2_x86_64
+	help
+	  QEMU is a generic and open source machine emulator and virtualizer.
+
+	  This option builds a system emulator for your selected architecture.
+
+	  http://www.qemu.org
+
+if BR2_PACKAGE_HOST_QEMU_SYSTEM
+
+config BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION
+	string "qemu version"
+	default "2.0.0"
+	help
+	  QEMU version to use.
+	  Sometimes the latest version is broken for some specific
+	  architecture or target machine.
+
+config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS
+	string "qemu-system command arguments"
+	help
+	  Arguments to be used for your target host-qemu-system to run
+	  via "make qemu-system-run".
+
+endif
diff --git a/package/qemu-system/qemu-system.mk b/package/qemu-system/qemu-system.mk
new file mode 100644
index 0000000..4a57c8b
--- /dev/null
+++ b/package/qemu-system/qemu-system.mk
@@ -0,0 +1,64 @@
+################################################################################
+#
+# qemu-system
+#
+################################################################################
+
+HOST_QEMU_SYSTEM_VERSION = $(call qstrip,$(BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION))
+HOST_QEMU_SYSTEM_SOURCE = qemu-$(HOST_QEMU_SYSTEM_VERSION).tar.bz2
+QEMU_SYSTEM_SITE = http://wiki.qemu-project.org/download
+QEMU_SYSTEM_LICENSE = GPLv2 LGPLv2.1 MIT BSD-3c BSD-2c Others/BSD-1c
+QEMU_SYSTEM_LICENSE_FILES = COPYING COPYING.LIB
+#??NOTE: there is no top-level license file for non-(L)GPL licenses;
+#       the non-(L)GPL license texts are specified in the affected
+#       individual source files.
+
+# host-python required to ensure we use a 2.x series since 3.x isn't supported
+HOST_QEMU_SYSTEM_DEPENDENCIES = host-flex host-bison host-libglib2 \
+	host-pixman host-pkgconf host-python host-zlib
+
+HOST_QEMU_SYSTEM_ARCH = $(ARCH)
+ifeq ($(HOST_QEMU_SYSTEM_ARCH),i486)
+	HOST_QEMU_SYSTEM_ARCH = i386
+endif
+ifeq ($(HOST_QEMU_SYSTEM_ARCH),i586)
+	HOST_QEMU_SYSTEM_ARCH = i386
+endif
+ifeq ($(HOST_QEMU_SYSTEM_ARCH),i686)
+	HOST_QEMU_SYSTEM_ARCH = i386
+endif
+ifeq ($(BR2_microblazeel),y)
+	HOST_QEMU_SYSTEM_ARCH = microblazeel
+endif
+ifeq ($(HOST_QEMU_SYSTEM_ARCH),powerpc)
+	HOST_QEMU_SYSTEM_ARCH = ppc
+endif
+HOST_QEMU_SYSTEM_TARGETS=$(HOST_QEMU_SYSTEM_ARCH)-softmmu
+
+define HOST_QEMU_SYSTEM_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure \
+		--target-list="$(HOST_QEMU_SYSTEM_TARGETS)" \
+		--prefix="$(HOST_DIR)/usr" \
+		--cc="$(HOSTCC)" \
+		--host-cc="$(HOSTCC)" \
+		--extra-cflags="$(HOST_CFLAGS)" \
+		--extra-ldflags="$(HOST_LDFLAGS)" \
+		--with-system-pixman \
+	)
+endef
+
+define HOST_QEMU_SYSTEM_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_QEMU_SYSTEM_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+$(eval $(host-generic-package))
+
+# System emulation binary used here or somewhere else
+QEMU_SYSTEM = $(HOST_DIR)/usr/bin/qemu-system-$(HOST_QEMU_SYSTEM_ARCH)
+
+qemu-system-run: all
+	$(QEMU_SYSTEM) $(call qstrip,$(BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS))
-- 
1.8.3.2
