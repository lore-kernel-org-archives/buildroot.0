From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 22:43:52 +0200
Subject: [Buildroot] [git commit] busybox: add watchdog daemon startup script
Message-ID: <20120506204447.76900801D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07639ff186b7b07d843f901bd2413f0b0918b687
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in   |   17 +++++++++++++++++
 package/busybox/S15watchdog |   20 ++++++++++++++++++++
 package/busybox/busybox.mk  |   15 +++++++++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index b5770eb..946134d 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -56,6 +56,23 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	  Show packages in menuconfig that are potentially also provided
 	  by busybox.
 
+config BR2_PACKAGE_BUSYBOX_WATCHDOG
+	bool "Install the watchdog daemon startup script"
+	help
+	  Install the watchdog daemon startup script,
+	  that just start at the boot the busybox watchdog daemon.
+
+if BR2_PACKAGE_BUSYBOX_WATCHDOG
+
+config BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD
+	int "Delay between reset"
+	default "5"
+	help
+	  Select the number of seconds between each
+	  reset of the watchdog (default 5)
+
+endif
+
 endif
 
 if !BR2_PACKAGE_BUSYBOX # kconfig doesn't support else
diff --git a/package/busybox/S15watchdog b/package/busybox/S15watchdog
new file mode 100644
index 0000000..7f1110c
--- /dev/null
+++ b/package/busybox/S15watchdog
@@ -0,0 +1,20 @@
+#!/bin/sh
+#
+# Start watchdog
+#
+
+case "$1" in
+ start)
+	echo "Starting watchdog..."
+	watchdog -t PERIOD /dev/watchdog
+	;;
+  stop)
+	;;
+  restart|reload)
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 59448d5..1d988f8 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -142,6 +142,19 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
 endef
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_WATCHDOG),y)
+define BUSYBOX_SET_WATCHDOG
+        $(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG,$(BUSYBOX_BUILD_CONFIG))
+endef
+define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
+	[ -f $(TARGET_DIR)/etc/init.d/S15watchdog ] || \
+		install -D -m 0755 package/busybox/S15watchdog \
+			$(TARGET_DIR)/etc/init.d/S15watchdog && \
+		sed -i s/PERIOD/$(BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD)/ \
+			$(TARGET_DIR)/etc/init.d/S15watchdog
+endef
+endif
+
 # We do this here to avoid busting a modified .config in configure
 BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
 
@@ -155,6 +168,7 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_NETKITTELNET)
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_DISABLE_MMU_APPLETS)
+	$(BUSYBOX_SET_WATCHDOG)
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
 		-C $(@D) oldconfig
 endef
@@ -172,6 +186,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
+	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 endef
 
 define BUSYBOX_UNINSTALL_TARGET_CMDS
