From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 19 Dec 2013 14:38:06 -0600
Subject: [Buildroot] [PATCH v5 17/20] busybox: add option to enable SELinux
	support
In-Reply-To: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1387485489-4186-18-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Add a configure option to enable the SELinux support in the
busybox configuration from the Buildroot menuconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v4 -> v5:
  - No changes.
Changes v1 -> v4
  - Did not exist.
---
 ...ags-strip-non-l-arguments-returned-by-pkg.patch |   28 ++++++++++++++++++++
 package/busybox/Config.in                          |    3 ++
 package/busybox/busybox.mk                         |    8 +++++
 3 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/1.21.1/0004-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch

diff --git a/package/busybox/1.21.1/0004-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch b/package/busybox/1.21.1/0004-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
new file mode 100644
index 0000000..105626c
--- /dev/null
+++ b/package/busybox/1.21.1/0004-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
@@ -0,0 +1,28 @@
+From 67eb23d2be8aba3c474dac81a15b0fa11e5847b7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 25 Nov 2013 22:51:53 +0100
+Subject: [PATCH] Makefile.flags: strip non -l arguments returned by pkg-config
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.flags | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.flags b/Makefile.flags
+index 307afa7..885e323 100644
+--- a/Makefile.flags
++++ b/Makefile.flags
+@@ -141,7 +141,9 @@ ifeq ($(CONFIG_SELINUX),y)
+ SELINUX_PC_MODULES = libselinux libsepol
+ $(eval $(call pkg_check_modules,SELINUX,$(SELINUX_PC_MODULES)))
+ CPPFLAGS += $(SELINUX_CFLAGS)
+-LDLIBS += $(if $(SELINUX_LIBS),$(SELINUX_LIBS:-l%=%),$(SELINUX_PC_MODULES:lib%=%))
++LDLIBS += $(if $(SELINUX_LIBS),\
++       $(patsubst -l%,%,$(filter -l%,$(SELINUX_LIBS))),\
++       $(SELINUX_PC_MODULES:lib%=%))
+ endif
+ 
+ ifeq ($(CONFIG_EFENCE),y)
+-- 
+1.8.1.2
+
diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 8df941b..733c560 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -62,6 +62,9 @@ config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
 comment "Busybox individual binaries depends on dynamic libraries"
 	depends on BR2_PREFER_STATIC_LIB
 
+config BR2_PACKAGE_BUSYBOX_SELINUX
+	bool "Enable SELinux support"
+
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
 	help
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 98ee288..ba07a8e 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -184,6 +184,13 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_SELINUX),y)
+BUSYBOX_DEPENDENCIES += host-pkgconf libselinux libsepol
+define BUSYBOX_SET_SELINUX
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SELINUX,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
 		[ -f $(TARGET_DIR)/etc/init.d/S01logging ] || \
@@ -220,6 +227,7 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES)
+	$(BUSYBOX_SET_SELINUX)
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
 		-C $(@D) oldconfig
 endef
-- 
1.7.1
