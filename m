From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 23:00:08 +0200
Subject: [Buildroot] [PATCH 1/4] initscripts: new package
Message-ID: <1436821211-4446-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The folder init.d is currently installed by default since it's part of
our skeleton.
This patch creates a package out of it and make busybox/sysvinit depends
on it.

This way, if you chose another init, you don't end up with a useless
init.d folder.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
v4 -> v5:
    - Move inittab to their specifi packages (sysvinit and busybox)
    - Make BR2_INIT_SYSV and BR2_INIT_BUSYBOX select initscripts
    - Initscripts depends on BR2_INIT_SYSV or BR2_INIT_BUSYBOX so it
      can't be selected by anything else.
v3 -> v4:
    - Fix bug with busybox
v2 -> v3:
    - Fix rebase issues
v1 -> v2:
    - Redo the patch using git format-patch -M
---
 package/Config.in                                         |  1 +
 package/busybox/busybox.mk                                |  7 +++++++
 {system/skeleton/etc => package/busybox}/inittab          |  0
 package/initscripts/Config.in                             |  5 +++++
 .../etc => package/initscripts}/init.d/S20urandom         |  0
 .../etc => package/initscripts}/init.d/S40network         |  0
 {system/skeleton/etc => package/initscripts}/init.d/rcK   |  0
 {system/skeleton/etc => package/initscripts}/init.d/rcS   |  0
 package/initscripts/initscripts.mk                        | 15 +++++++++++++++
 package/sysvinit/sysvinit.mk                              |  6 ++----
 system/Config.in                                          |  2 ++
 11 files changed, 32 insertions(+), 4 deletions(-)
 rename {system/skeleton/etc => package/busybox}/inittab (100%)
 create mode 100644 package/initscripts/Config.in
 rename {system/skeleton/etc => package/initscripts}/init.d/S20urandom (100%)
 rename {system/skeleton/etc => package/initscripts}/init.d/S40network (100%)
 rename {system/skeleton/etc => package/initscripts}/init.d/rcK (100%)
 rename {system/skeleton/etc => package/initscripts}/init.d/rcS (100%)
 create mode 100644 package/initscripts/initscripts.mk

diff --git a/package/Config.in b/package/Config.in
index 9dbb284..0288cb0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1414,6 +1414,7 @@ endif
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/htop/Config.in"
+	source "package/initscripts/Config.in"
 	source "package/iotop/Config.in"
 	source "package/iprutils/Config.in"
 	source "package/irqbalance/Config.in"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 9289e0a..aab7f5d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -148,6 +148,12 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
 endef
 
+ifeq ($(BR2_INIT_BUSYBOX),y)
+define BUSYBOX_INSTALL_INITTAB
+	$(INSTALL) -D -m 0644 package/busybox/inittab $(TARGET_DIR)/etc/inittab
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_BUSYBOX_WATCHDOG),y)
 define BUSYBOX_SET_WATCHDOG
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG,$(BUSYBOX_BUILD_CONFIG))
@@ -205,6 +211,7 @@ endef
 
 define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
+	$(BUSYBOX_INSTALL_INITTAB)
 	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 endef
diff --git a/system/skeleton/etc/inittab b/package/busybox/inittab
similarity index 100%
rename from system/skeleton/etc/inittab
rename to package/busybox/inittab
diff --git a/package/initscripts/Config.in b/package/initscripts/Config.in
new file mode 100644
index 0000000..0c5176a
--- /dev/null
+++ b/package/initscripts/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_INITSCRIPTS
+	bool "initscripts"
+	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV
+	help
+	  The basics startup scripts for both SysV and Busybox
diff --git a/system/skeleton/etc/init.d/S20urandom b/package/initscripts/init.d/S20urandom
similarity index 100%
rename from system/skeleton/etc/init.d/S20urandom
rename to package/initscripts/init.d/S20urandom
diff --git a/system/skeleton/etc/init.d/S40network b/package/initscripts/init.d/S40network
similarity index 100%
rename from system/skeleton/etc/init.d/S40network
rename to package/initscripts/init.d/S40network
diff --git a/system/skeleton/etc/init.d/rcK b/package/initscripts/init.d/rcK
similarity index 100%
rename from system/skeleton/etc/init.d/rcK
rename to package/initscripts/init.d/rcK
diff --git a/system/skeleton/etc/init.d/rcS b/package/initscripts/init.d/rcS
similarity index 100%
rename from system/skeleton/etc/init.d/rcS
rename to package/initscripts/init.d/rcS
diff --git a/package/initscripts/initscripts.mk b/package/initscripts/initscripts.mk
new file mode 100644
index 0000000..a5d8db7
--- /dev/null
+++ b/package/initscripts/initscripts.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# initscripts
+#
+################################################################################
+
+# source included in buildroot
+INITSCRIPTS_SOURCE =
+
+define INITSCRIPTS_INSTALL_TARGET_CMDS
+	mkdir -p  $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -D -m 0755 package/initscripts/init.d/* $(TARGET_DIR)/etc/init.d/
+endef
+
+$(eval $(generic-package))
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 53640a4..56414e1 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -11,9 +11,9 @@ SYSVINIT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/
 SYSVINIT_LICENSE = GPLv2+
 SYSVINIT_LICENSE_FILES = COPYING
 
-# Override BusyBox implementations if BusyBox is enabled.
+# Override Busybox implementations if Busybox is enabled.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-SYSVINIT_DEPENDENCIES = busybox
+SYSVINIT_DEPENDENCIES += busybox
 endif
 
 define SYSVINIT_DEBIAN_PATCHES
@@ -34,8 +34,6 @@ define SYSVINIT_INSTALL_TARGET_CMDS
 	for x in halt init shutdown killall5; do \
 		$(INSTALL) -D -m 0755 $(@D)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
 	done
-	# Override BusyBox's inittab with an inittab compatible with
-	# sysvinit
 	$(INSTALL) -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
 	ln -sf /sbin/halt $(TARGET_DIR)/sbin/reboot
 	ln -sf /sbin/halt $(TARGET_DIR)/sbin/poweroff
diff --git a/system/Config.in b/system/Config.in
index b72aa17..fad829d 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -70,10 +70,12 @@ choice
 config BR2_INIT_BUSYBOX
 	bool "BusyBox"
 	select BR2_PACKAGE_BUSYBOX
+	select BR2_PACKAGE_INITSCRIPTS
 
 config BR2_INIT_SYSV
 	bool "systemV"
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit
+	select BR2_PACKAGE_INITSCRIPTS
 	select BR2_PACKAGE_SYSVINIT
 
 config BR2_INIT_SYSTEMD
-- 
2.1.4
