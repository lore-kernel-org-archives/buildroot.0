From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:41 -0000
Subject: [Buildroot] [git commit branch/next] initscripts: new package
Message-ID: <20150808105631.CA7E47FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89d39fc7a392530be043bac541ade0bef746edb6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The folder init.d is currently installed by default since it's part of
our skeleton.
This patch creates a package out of it and make busybox/sysvinit depends
on it.

This way, if you chose another init, you don't end up with a useless
init.d folder.

[Thomas:
  - make the initscripts package selectable via a hidden bool
  - remove some unneeded changes in sysvinit.mk.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/busybox/busybox.mk                         |    7 +++++++
 {system/skeleton/etc => package/busybox}/inittab   |    0
 package/initscripts/Config.in                      |    4 ++++
 .../etc => package/initscripts}/init.d/S20urandom  |    0
 .../etc => package/initscripts}/init.d/S40network  |    0
 .../etc => package/initscripts}/init.d/rcK         |    0
 .../etc => package/initscripts}/init.d/rcS         |    0
 package/initscripts/initscripts.mk                 |   15 +++++++++++++++
 package/sysvinit/sysvinit.mk                       |    2 --
 system/Config.in                                   |    2 ++
 11 files changed, 29 insertions(+), 2 deletions(-)

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
index 0000000..82cbd5c
--- /dev/null
+++ b/package/initscripts/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_INITSCRIPTS
+	bool
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
index 53640a4..2460dd9 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
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
