From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sun,  3 Nov 2019 17:56:27 +0100
Subject: [Buildroot] [PATCH 02/15] use host-systemctl preset all to enable
 units
In-Reply-To: <20191103165640.21819-1-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
Message-ID: <20191103165640.21819-3-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

since v234 upstream recommands using systemctl preset-all to enable units.
* add a buildroot specific preset file
* use that file to disable getty at tty1
* make systemd depend on host-systemd
* remove all link-creating code that systemd does for us.

This does not change how other systemd-enabled packages work.

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/systemd/80-buildroot.preset |   5 ++
 package/systemd/Config.in           |   1 +
 package/systemd/systemd.mk          | 102 ++++------------------------
 3 files changed, 18 insertions(+), 90 deletions(-)
 create mode 100644 package/systemd/80-buildroot.preset

diff --git a/package/systemd/80-buildroot.preset b/package/systemd/80-buildroot.preset
new file mode 100644
index 0000000000..4074901cbd
--- /dev/null
+++ b/package/systemd/80-buildroot.preset
@@ -0,0 +1,5 @@
+# Higher priority than systemd presets
+
+# by default systemd enables a getty on tty1
+# we don't want that because tty1 may not exist
+disable getty at .service
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index aef39abe27..58c7696d65 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -35,6 +35,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_KMOD_TOOLS
 	select BR2_TARGET_TZ_INFO
 	select BR2_NEEDS_HOST_UTF8_LOCALE
+	select BR2_PACKAGE_HOST_SYSTEMD
 	help
 	  systemd is a system and service manager for Linux,
 	  compatible with SysV and LSB init scripts. systemd provides
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1e4f706517..d4680cd225 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -12,6 +12,7 @@ SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	host-gperf \
+	host-systemd \
 	kmod \
 	libcap \
 	util-linux \
@@ -51,12 +52,6 @@ endif
 ifeq ($(BR2_PACKAGE_AUDIT),y)
 SYSTEMD_DEPENDENCIES += audit
 SYSTEMD_CONF_OPTS += -Daudit=true
-define SYSTEMD_INSTALL_SERVICE_AUDIT
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/auditd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/auditd.service
-endef
-
 else
 SYSTEMD_CONF_OPTS += -Daudit=false
 endif
@@ -64,11 +59,6 @@ endif
 ifeq ($(BR2_PACKAGE_CRYPTSETUP),y)
 SYSTEMD_DEPENDENCIES += cryptsetup
 SYSTEMD_CONF_OPTS += -Dlibcryptsetup=true
-define SYSTEMD_INSTALL_TARGET_CRYPTSETUP
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/remote-cryptsetup.target \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/remote-cryptsetup.target
-endef
 else
 SYSTEMD_CONF_OPTS += -Dlibcryptsetup=false
 endif
@@ -269,11 +259,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_MACHINED),y)
 SYSTEMD_CONF_OPTS += -Dmachined=true
-define SYSTEMD_INSTALL_TARGET_MACHINED
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../lib/systemd/system/machines.target \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/machines.target
-endef
 else
 SYSTEMD_CONF_OPTS += -Dmachined=false
 endif
@@ -317,11 +302,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_PSTORE),y)
 SYSTEMD_CONF_OPTS += -Dpstore=true
-define SYSTEMD_INSTALL_SERVICE_PSTORE
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/systemd-remount-fs.service.wants
-	ln -sf ../../../../lib/systemd/system/systemd-pstore.service \
-		$(TARGET_DIR)/etc/systemd/system/systemd-remount-fs.service.wants/systemd-pstore.service
-endef
 else
 SYSTEMD_CONF_OPTS += -Dpstore=false
 endif
@@ -336,24 +316,6 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
 SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - Network Manager
-define SYSTEMD_INSTALL_SOCKET_NETWORKD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
-	ln -sf ../../../../lib/systemd/system/systemd-networkd.socket \
-		$(TARGET_DIR)/etc/systemd/system/sockets.target.wants/systemd-networkd.socket
-endef
-define SYSTEMD_INSTALL_SERVICE_NETWORKD
-	ln -sf ../../../lib/systemd/system/systemd-networkd.service \
-		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.network1.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../lib/systemd/system/systemd-networkd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/systemd-networkd.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/network-online.target.wants
-	ln -sf ../../../../lib/systemd/system/systemd-networkd-wait-online.service \
-		$(TARGET_DIR)/etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/network-pre.target.wants
-	ln -sf ../../../../lib/systemd/system/systemd-network-generator.service \
-		$(TARGET_DIR)/etc/systemd/system/network-pre.target.wants/systemd-network-generator.service
-endef
 SYSTEMD_NETWORKD_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
 ifneq ($(SYSTEMD_NETWORKD_DHCP_IFACE),)
 define SYSTEMD_INSTALL_NETWORK_CONFS
@@ -373,13 +335,6 @@ define SYSTEMD_INSTALL_RESOLVCONF_HOOK
 endef
 SYSTEMD_CONF_OPTS += -Dresolve=true
 SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
-define SYSTEMD_INSTALL_SERVICE_RESOLVED
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../lib/systemd/system/systemd-resolved.service \
-		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.resolve1.service
-	ln -sf ../../../../lib/systemd/system/systemd-resolved.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/systemd-resolved.service
-endef
 else
 SYSTEMD_CONF_OPTS += -Dresolve=false
 endif
@@ -387,15 +342,6 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPTS += -Dtimesyncd=true
 SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
-define SYSTEMD_INSTALL_SERVICE_TIMESYNCD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
-	ln -sf ../../../../lib/systemd/system/systemd-timesyncd.service \
-		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service
-	ln -sf ../../../../lib/systemd/system/systemd-time-wait-sync.service \
-		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/systemd-time-wait-sync.service
-	ln -sf ../../../lib/systemd/system/systemd-timesyncd.service \
-		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.timesync1.service
-endef
 else
 SYSTEMD_CONF_OPTS += -Dtimesyncd=false
 endif
@@ -446,18 +392,8 @@ SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
 endif
 
 define SYSTEMD_INSTALL_INIT_HOOK
-	ln -fs ../lib/systemd/systemd $(TARGET_DIR)/sbin/init
-	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/halt
-	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/poweroff
-	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/reboot
-	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/shutdown
-	ln -fs ../../../lib/systemd/system/multi-user.target \
-		$(TARGET_DIR)/etc/systemd/system/default.target
-	ln -fs ../../../lib/systemd/system/reboot.target \
-		$(TARGET_DIR)/etc/systemd/system/ctrl-alt-del.target
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../lib/systemd/system/remote-fs.target \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/remote-fs.target
+	ln -fs multi-user.target \
+		$(TARGET_DIR)/usr/lib/systemd/system/default.target
 endef
 
 define SYSTEMD_INSTALL_MACHINEID_HOOK
@@ -465,9 +401,6 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
 endef
 
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
-	SYSTEMD_INSTALL_TARGET_CRYPTSETUP \
-	SYSTEMD_INSTALL_TARGET_MACHINED \
-	SYSTEMD_INSTALL_SOCKET_NETWORKD \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK
@@ -491,10 +424,6 @@ define SYSTEMD_USERS
 	$(SYSTEMD_TIMESYNCD_USER)
 endef
 
-define SYSTEMD_DISABLE_SERVICE_TTY1
-	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
-endef
-
 ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # systemd needs getty.service for VTs and serial-getty.service for serial ttys
 # note that console-getty.service should be used on /dev/console as it should not have dependencies
@@ -522,30 +451,23 @@ define SYSTEMD_INSTALL_SERVICE_TTY
 endef
 endif
 
-define SYSTEMD_INSTALL_SERVICE_AUTOVT
-	ln -sf ../../../lib/systemd/system/getty at .service \
-		$(TARGET_DIR)/lib/systemd/system/autovt at .service
-endef
 
-define SYSTEMD_INSTALL_SERVICE_BOOT_CHECK
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/boot-complete.target.requires
-	ln -sf ../../../../lib/systemd/system/systemd-boot-check-no-failures.service \
-		$(TARGET_DIR)/etc/systemd/system/boot-complete.target.requires/systemd-boot-check-no-failures.service
+define SYSTEMD_INSTALL_PRESET
+	$(INSTALL) -D -m 644 package/systemd/80-buildroot.preset $(TARGET_DIR)/usr/lib/systemd/system-preset/80-buildroot.preset
 endef
 
 define SYSTEMD_INSTALL_INIT_SYSTEMD
-	$(SYSTEMD_DISABLE_SERVICE_TTY1)
+	$(SYSTEMD_INSTALL_PRESET)
 	$(SYSTEMD_INSTALL_SERVICE_TTY)
-	$(SYSTEMD_INSTALL_SERVICE_AUTOVT)
-	$(SYSTEMD_INSTALL_SERVICE_RESOLVED)
-	$(SYSTEMD_INSTALL_SERVICE_TIMESYNCD)
 	$(SYSTEMD_INSTALL_NETWORK_CONFS)
-	$(SYSTEMD_INSTALL_SERVICE_PSTORE)
-	$(SYSTEMD_INSTALL_SERVICE_NETWORKD)
-	$(SYSTEMD_INSTALL_SERVICE_AUDIT)
-	$(SYSTEMD_INSTALL_SERVICE_BOOT_CHECK)
 endef
 
+define SYSTEMD_PRESET_ALL
+	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
+endef
+SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_PRESET_ALL
+
+
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
-- 
2.24.0.rc1
