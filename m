From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 13 May 2015 16:39:22 -0500
Subject: [Buildroot] [PATCH v5 09/24] busybox: selinux support
In-Reply-To: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1431553177-7280-10-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Add a configure option to enable the SELinux support in the
busybox configuration from the Buildroot menuconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

---
Changes v4 -> v5:
  - Renamed to follow patch naming convention (Matt W.)
  - Added a dependency on having threads for the busybox SELinux flag to
    ensure it does not cause libselinux to build when threads are not
    available. Also added a select for libselinux to make the linking
    apparent. (Clayton S.)
 - Add dependency on not static libs for libselinux (Clayton S.)

Changes v1 -> v4:
  - Did not exist
---
 ...ags-strip-non-l-arguments-returned-by-pkg.patch | 28 ++++++++++++++++++++++
 package/busybox/Config.in                          |  6 +++++
 package/busybox/busybox.mk                         |  9 +++++++
 3 files changed, 43 insertions(+)
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
index 275e317..a60c54b 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -35,6 +35,12 @@ comment "Busybox individual binaries depends on dynamic libraries"
 	depends on BR2_STATIC_LIBS
 	depends on BR2_bfin
 
+config BR2_PACKAGE_BUSYBOX_SELINUX
+	select BR2_PACKAGE_LIBSELINUX
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	bool "Enable SELinux support"
+
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
 	help
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index dbee100..f60e3f2 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -171,6 +171,14 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_SELINUX),y)
+BUSYBOX_DEPENDENCIES += host-pkgconf libselinux libsepol
+define BUSYBOX_SET_SELINUX
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SELINUX,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SELINUXENABLED,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
 		$(INSTALL) -m 0755 -D package/busybox/S01logging \
@@ -207,6 +215,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES)
+	$(BUSYBOX_SET_SELINUX)
 endef
 
 define BUSYBOX_CONFIGURE_CMDS
-- 
1.9.1
