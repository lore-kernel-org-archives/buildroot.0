From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 11 Mar 2015 12:35:27 +0300
Subject: [Buildroot] [PATCH] system: add option for standalone telnetd on
	target
Message-ID: <1426066527-23021-1-git-send-email-abrodkin@synopsys.com>
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
telnet.

With this change it will be possible to get telnetd built and installed
on target with only enabling BR2_SYSTEM_STANDALONE_TELNETD option in
Buildroot configuration utility or in boards defconfig.

Note that telnetd won't auto-start on boot because of securilty concerns
- until user manually starts telnetd while connected via serial console
there's no chance for unexpected root access to the target (this is
especially true if root has no password set - which is by defult).

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |  9 +++++++++
 system/Config.in           | 24 ++++++++++++++++++++++++
 system/system.mk           | 17 +++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a3ac7e7..251de5e 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -166,6 +166,14 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 endef
 endif
 
+ifeq ($(BR2_SYSTEM_STANDALONE_TELNETD),y)
+define BUSYBOX_SET_STANDALONE_TELNETD
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TELNETD,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_TELNETD_STANDALONE,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_TELNETD_INETD_WAIT,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
 # full-blown versions of apps installed by other packages with sym/hard links.
 define BUSYBOX_NOCLOBBER_INSTALL
@@ -182,6 +190,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
+	$(BUSYBOX_SET_STANDALONE_TELNETD)
 endef
 
 define BUSYBOX_CONFIGURE_CMDS
diff --git a/system/Config.in b/system/Config.in
index 9973cc2..aa04cf5 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -309,6 +309,30 @@ config BR2_TARGET_GENERIC_GETTY_OPTIONS
 endmenu
 endif
 
+config BR2_SYSTEM_STANDALONE_TELNETD
+	bool "Enable telnet daemon on target"
+	depends on BR2_PACKAGE_BUSYBOX
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
+	  Note that telnetd won't auto-start on boot because of securilty
+	  concerns - until user manually starts telnetd while connected via
+	  serial console there's no chance for unexpected root access to the
+	  target (this is especially true if root has no password set -
+	  which is by defult).
+
+	  Say yes here if you would like to have an ability to telnet on target.
+	  If unsure, say N.
+
 config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 	bool "remount root filesystem read-write during boot"
 	default y
diff --git a/system/system.mk b/system/system.mk
index 4a1eb4a..ba0ba7b 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -16,6 +16,23 @@ endef
 TARGET_FINALIZE_HOOKS += SYSTEM_SECURETTY
 endif
 
+ifeq ($(BR2_SYSTEM_STANDALONE_TELNETD),y)
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
