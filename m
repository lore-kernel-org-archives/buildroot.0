From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 25 Sep 2012 19:18:17 +0200
Subject: [Buildroot] [PATCH v8 01/11] host-qemu: new package
Message-ID: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

only user mode for the current target architecture

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in.host      |    1 +
 package/qemu/Config.in.host |   15 +++++++++++++++
 package/qemu/qemu.mk        |   43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 package/qemu/Config.in.host
 create mode 100644 package/qemu/qemu.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 79050f2..bf95a10 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -4,6 +4,7 @@ source "package/dfu-util/Config.in.host"
 source "package/lpc3250loader/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
+source "package/qemu/Config.in.host"
 source "package/sam-ba/Config.in.host"
 source "package/uboot-tools/Config.in.host"
 
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
new file mode 100644
index 0000000..379507c
--- /dev/null
+++ b/package/qemu/Config.in.host
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_HOST_QEMU
+	bool "host qemu"
+	help
+	  QEMU is a generic and open source machine emulator and virtualizer.
+
+	  In user mode emulation, QEMU runs single cross-compiled programs.
+	  Fast cross-compilation and cross-debugging are the main targets
+	  for user-mode emulation.
+
+	  In system mode emulation, QEMU emulates a full computer system,
+	  including peripherals, and handles the filesystem image generated
+	  by Buildroot.
+	  (Buildroot is shipped with many configs/qemu_*_defconfig files).
+
+	  http://qemu.org/
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
new file mode 100644
index 0000000..d727f49
--- /dev/null
+++ b/package/qemu/qemu.mk
@@ -0,0 +1,43 @@
+#############################################################
+#
+# qemu
+#
+#############################################################
+
+QEMU_VERSION = 1.2.0
+QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
+QEMU_SITE = http://wiki.qemu.org/download
+
+HOST_QEMU_DEPENDENCIES =
+
+QEMU_ARCH=$(ARCH)
+ifeq ($(QEMU_ARCH),i686)
+    QEMU_ARCH=i386
+endif
+HOST_QEMU_TARGETS=$(QEMU_ARCH)-linux-user
+
+define HOST_QEMU_CONFIGURE_CMDS
+	(cd $(@D); ./configure                          \
+		--target-list="$(HOST_QEMU_TARGETS)"    \
+		--prefix="$(HOST_DIR)/usr"              \
+		--interp-prefix=$(STAGING_DIR)          \
+		--cc="$(HOSTCC)"                        \
+		--host-cc="$(HOSTCC)"                   \
+		--extra-cflags="$(HOST_CFLAGS)"         \
+		--extra-ldflags="$(HOST_LDFLAGS)"       \
+	)
+endef
+
+define HOST_QEMU_BUILD_CMDS
+	$(MAKE) -C $(@D) all
+endef
+
+define HOST_QEMU_INSTALL_CMDS
+	$(MAKE) -C $(@D) install
+endef
+
+define HOST_QEMU_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(host-generic-package))
-- 
1.7.9.5
