From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  9 Jan 2015 09:11:14 -0600
Subject: [Buildroot] [PATCH v4 13/27] busybox: selinux support
In-Reply-To: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1420816288-8750-14-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a configure option to enable the SELinux support in the
busybox configuration from the Buildroot menuconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
[Matt W:
  - Renamed to follow patch naming convention

 ...ags-strip-non-l-arguments-returned-by-pkg.patch | 28 ++++++++++++++++++++++
 package/busybox/Config.in                          |  3 +++
 package/busybox/busybox.mk                         |  8 +++++++
 3 files changed, 39 insertions(+)
 create mode 100644 package/busybox/0008-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch

diff --git a/package/busybox/0008-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch b/package/busybox/0008-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
new file mode 100644
index 0000000..105626c
--- /dev/null
+++ b/package/busybox/0008-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
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
index 2344c4e..6a0e5d1 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -33,6 +33,9 @@ config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
 comment "Busybox individual binaries depends on dynamic libraries"
 	depends on BR2_PREFER_STATIC_LIB
 
+config BR2_PACKAGE_BUSYBOX_SELINUX
+	bool "Enable SELinux support"
+
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
 	help
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 253c29a..7232996 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -193,6 +193,13 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
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
 		$(INSTALL) -m 0755 -D package/busybox/S01logging \
@@ -231,6 +238,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES)
+	$(BUSYBOX_SET_SELINUX)
 endef
 
 define BUSYBOX_CONFIGURE_CMDS
-- 
1.9.1
