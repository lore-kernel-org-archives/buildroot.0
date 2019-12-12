From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Thu, 12 Dec 2019 08:53:49 +0100
Subject: [Buildroot] [PATCH v4 02/13] use host-systemctl preset all to
 enable units
In-Reply-To: <20191212075400.1499536-1-jeremy.rosen@smile.fr>
References: <20191212075400.1499536-1-jeremy.rosen@smile.fr>
Message-ID: <20191212075400.1499536-3-jeremy.rosen@smile.fr>
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

Most packages will not be affected by this change, but a few packages
were installing units without manually enabling them. Those packages
will now be automatically enabled.

The fact that those packages were not enabled is almost certainly a bug,
but it is a change of behaviour that needs to be reported

Signed-off-by:J?r?my Rosen <jeremy.rosen@smile.fr>
---
 docs/manual/adding-packages-generic.txt |   4 +
 package/systemd/80-buildroot.preset     |   5 ++
 package/systemd/Config.in               |   1 +
 package/systemd/systemd.mk              | 103 +++---------------------
 4 files changed, 22 insertions(+), 91 deletions(-)
 create mode 100644 package/systemd/80-buildroot.preset

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 86300e7460..f7f3e447f1 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -550,6 +550,10 @@ different steps of the build process.
   is when openrc is chosen as init system and +LIBFOO_INSTALL_INIT_OPENRC+
   has not been set, in such situation +LIBFOO_INSTALL_INIT_SYSV+ will
   be called, since openrc supports sysv init scripts.
+  When systemd is used as the init system, buildroot will automatically enable
+  all services using the +systemctl preset-all+ command in the final phase of
+  image building. You can add preset files to prevent a particular unit from
+  being automatically enabled by buildroot.
 
 * +LIBFOO_HELP_CMDS+ lists the actions to print the package help, which
   is included to the main +make help+ output. These commands can print
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
index 81761b33a4..c727082a1a 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -35,6 +35,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_KMOD_TOOLS
 	select BR2_TARGET_TZ_INFO
 	select BR2_NEEDS_HOST_UTF8_LOCALE
+	select BR2_PACKAGE_HOST_SYSTEMD # for systemctl preset-all, during target-finalize
 	help
 	  systemd is a system and service manager for Linux,
 	  compatible with SysV and LSB init scripts. systemd provides
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ad16b58ceb..ca3fc7121f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -52,12 +52,6 @@ endif
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
@@ -65,11 +59,6 @@ endif
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
@@ -275,11 +264,6 @@ endif
 
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
@@ -323,11 +307,6 @@ endif
 
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
@@ -342,29 +321,11 @@ endif
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
 	sed s/SYSTEMD_NETWORKD_DHCP_IFACE/$(SYSTEMD_NETWORKD_DHCP_IFACE)/ \
-		package/systemd/dhcp.network > \
+		$(SYSTEMD_PKGDIR)/dhcp.network > \
 		$(TARGET_DIR)/etc/systemd/network/dhcp.network
 endef
 endif
@@ -379,13 +340,6 @@ define SYSTEMD_INSTALL_RESOLVCONF_HOOK
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
@@ -393,15 +347,6 @@ endif
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
@@ -452,18 +397,8 @@ SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
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
@@ -471,9 +406,6 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
 endef
 
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
-	SYSTEMD_INSTALL_TARGET_CRYPTSETUP \
-	SYSTEMD_INSTALL_TARGET_MACHINED \
-	SYSTEMD_INSTALL_SOCKET_NETWORKD \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK
@@ -497,10 +429,6 @@ define SYSTEMD_USERS
 	$(SYSTEMD_TIMESYNCD_USER)
 endef
 
-define SYSTEMD_DISABLE_SERVICE_TTY1
-	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
-endef
-
 ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # systemd needs getty.service for VTs and serial-getty.service for serial ttys
 # note that console-getty.service should be used on /dev/console as it should not have dependencies
@@ -528,30 +456,23 @@ define SYSTEMD_INSTALL_SERVICE_TTY
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
+	$(INSTALL) -D -m 644 $(SYSTEMD_PKGDIR)/80-buildroot.preset $(TARGET_DIR)/usr/lib/systemd/system-preset/80-buildroot.preset
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
2.24.0
