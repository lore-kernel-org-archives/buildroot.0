From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 12 Mar 2015 12:31:11 +0300
Subject: [Buildroot] [PATCH v2] busybox: add option for standalone telnetd
	on target
Message-ID: <1426152671-13125-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If target has connection to the network it might be pretty useful to
have telnet connection to it instead of serial console or even in
addition to serial console.

Even though it's possible to add telnetd on target manually via:
 [a] Busybox - with "make busybox-menuconfig" and in "Networking
Utilities" select "telnetd"
 [b] xinetd

Still additional manual steps will be required to allow root login over
telnet and telnet daemon auto-start on boot.

With this change it will be possible to get telnetd built and installed
on target with only enabling BR2_SYSTEM_STANDALONE_TELNETD option in
Buildroot configuration utility or in boards defconfig.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---

Changes in v2:
 * STANDALONE_TELNETD option moved from "system" to Busybox package
 * Added auto-start script for telnet daemon
 * Added warning in Kconfig about possible Telnet security issues with mention
   of SSH to be used instead on production systems

---
 package/busybox/Config.in  | 22 ++++++++++++++++++++++
 package/busybox/S50telnet  | 20 ++++++++++++++++++++
 package/busybox/busybox.mk | 14 ++++++++++++++
 system/system.mk           | 17 +++++++++++++++++
 4 files changed, 73 insertions(+)
 create mode 100755 package/busybox/S50telnet

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index f2f2990..e9d4a3f 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -45,6 +45,28 @@ config BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD
 
 endif
 
+config BR2_PACKAGE_BUSYBOX_STANDALONE_TELNETD
+	bool "Enable telnet daemon on target"
+	depends on !BR2_PACKAGE_XINETD
+	default n
+	help
+	  By default user may interact with target via serial port if set in
+	  kernel's command line with "console" option or as a GENERIC_GETTY here
+	  in Buildroot.
+
+	  Another useful option if target is connected to the network is telnet.
+
+	  For it to work telnet daemon (telnetd) must be installed and
+	  auto-started on target during boot process.
+
+	  Say yes here if you would like to have an ability to telnet on target.
+	  If unsure, say N.
+
+	  WARNING! WARNING!
+	  Telnet connection (especially if there're users with no password)
+	  might be not safe, so on production systems please consider usage of
+	  SSH (provided by Dropbear or OpenSSH packages).
+
 endif
 
 if !BR2_PACKAGE_BUSYBOX # kconfig doesn't support else
diff --git a/package/busybox/S50telnet b/package/busybox/S50telnet
new file mode 100755
index 0000000..8888e17
--- /dev/null
+++ b/package/busybox/S50telnet
@@ -0,0 +1,20 @@
+#!/bin/sh
+#
+# Start telnet....
+#
+
+case "$1" in
+  start)
+	echo "Starting telnet..."
+	/usr/sbin/telnetd
+	;;
+  stop)
+	;;
+  restart|reload)
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 61f6a16..d80052e 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -180,6 +180,18 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_STANDALONE_TELNETD),y)
+define BUSYBOX_SET_STANDALONE_TELNETD
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TELNETD,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_TELNETD_STANDALONE,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_TELNETD_INETD_WAIT,$(BUSYBOX_BUILD_CONFIG))
+endef
+define BUSYBOX_INSTALL_TELNET_SCRIPT
+	$(INSTALL) -m 0755 -D package/busybox/S50telnet \
+		$(TARGET_DIR)/etc/init.d/S50telnet;
+endef
+endif
+
 # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
 # full-blown versions of apps installed by other packages with sym/hard links.
 define BUSYBOX_NOCLOBBER_INSTALL
@@ -198,6 +210,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
+	$(BUSYBOX_SET_STANDALONE_TELNETD)
 endef
 
 define BUSYBOX_CONFIGURE_CMDS
@@ -221,6 +234,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
+	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
 endef
 
 $(eval $(kconfig-package))
diff --git a/system/system.mk b/system/system.mk
index 4a1eb4a..7066d1f 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -16,6 +16,23 @@ endef
 TARGET_FINALIZE_HOOKS += SYSTEM_SECURETTY
 endif
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_STANDALONE_TELNETD),y)
+define SYSTEM_SECURETTY_PTS
+	grep -q 'pts/0' $(TARGET_DIR)/etc/securetty || \
+		echo 'pts/0' >> $(TARGET_DIR)/etc/securetty
+
+	grep -q 'pts/1' $(TARGET_DIR)/etc/securetty || \
+		echo 'pts/1' >> $(TARGET_DIR)/etc/securetty
+
+	grep -q 'pts/2' $(TARGET_DIR)/etc/securetty || \
+		echo 'pts/2' >> $(TARGET_DIR)/etc/securetty
+
+	grep -q 'pts/3' $(TARGET_DIR)/etc/securetty || \
+		echo 'pts/3' >> $(TARGET_DIR)/etc/securetty
+endef
+TARGET_FINALIZE_HOOKS += SYSTEM_SECURETTY_PTS
+endif
+
 ifneq ($(TARGET_GENERIC_HOSTNAME),)
 define SYSTEM_HOSTNAME
 	mkdir -p $(TARGET_DIR)/etc
-- 
2.1.0
