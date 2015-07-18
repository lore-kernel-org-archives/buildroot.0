From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 14:55:45 +0200
Subject: [Buildroot] [git commit] busybox: selinux support
Message-ID: <20150718130508.D15FD81D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b0b3dc5612a012dd29293bee0cd848aa1b7c0b7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a configure option to enable the SELinux support in the
busybox configuration from the Buildroot menuconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ags-strip-non-l-arguments-returned-by-pkg.patch |   28 ++++++++++++++++++++
 package/busybox/Config.in                          |   18 ++++++++++++
 package/busybox/busybox.mk                         |    9 ++++++
 3 files changed, 55 insertions(+), 0 deletions(-)

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
index 6847a60..25f72de 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -32,6 +32,24 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	  Show packages in menuconfig that are potentially also provided
 	  by busybox.
 
+config BR2_PACKAGE_BUSYBOX_SELINUX
+	select BR2_PACKAGE_LIBSELINUX
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	bool "Enable SELinux support"
+	help
+	  Enable SELinux support in BusyBox. Please note that
+	  depending on your BusyBox configuration and the SELinux
+	  policy implementation, you may want to also enable
+	  BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES.
+
+	  For instance, if your BusyBox configuration only uses a
+	  couple of minor BusyBox features, such as simple command
+	  line utilities, the symlinked version of BusyBox can be used
+	  to save space. If BusyBox provides more features, such as
+	  crond, then individual binaries have to be enabled for the
+	  SELinux type transitions to occur properly.
+
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
 	help
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 6b2abca..65ce7ef 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -141,6 +141,14 @@ define BUSYBOX_SET_INIT
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
@@ -199,6 +207,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
+	$(BUSYBOX_SET_SELINUX)
 endef
 
 define BUSYBOX_CONFIGURE_CMDS
