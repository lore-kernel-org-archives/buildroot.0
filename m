From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 23 Nov 2011 12:30:09 +0100
Subject: [Buildroot] [PATCH 1/3] Add the systemd package
In-Reply-To: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1322047811-12933-2-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 fs/skeleton/etc/mtab       |    2 +-
 linux/linux.mk             |    2 +
 package/Config.in          |    1 +
 package/dbus/dbus.mk       |    4 +++
 package/systemd/Config.in  |   16 +++++++++++++++
 package/systemd/systemd.mk |   45 ++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 69 insertions(+), 1 deletions(-)
 create mode 100644 package/systemd/Config.in
 create mode 100644 package/systemd/systemd.mk

diff --git a/fs/skeleton/etc/mtab b/fs/skeleton/etc/mtab
index e1c2045..4c0a094 120000
--- a/fs/skeleton/etc/mtab
+++ b/fs/skeleton/etc/mtab
@@ -1 +1 @@
-../proc/mounts
\ No newline at end of file
+/proc/mounts
\ No newline at end of file
diff --git a/linux/linux.mk b/linux/linux.mk
index 5c5a1d2..22f50b4 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -149,6 +149,8 @@ define LINUX_CONFIGURE_CMDS
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
+	$(if $(BR2_INIT_SYSTEMD),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config),)
 endef
 
 # Compilation. We make sure the kernel gets rebuilt when the
diff --git a/package/Config.in b/package/Config.in
index 4b5e5d8..42ec82a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -534,6 +534,7 @@ source "package/psmisc/Config.in"
 source "package/rsyslog/Config.in"
 source "package/sysklogd/Config.in"
 source "package/sysvinit/Config.in"
+source "package/systemd/Config.in"
 endif
 source "package/util-linux/Config.in"
 source "package/dsp-tools/Config.in"
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index e18e291..f18d84a 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -39,6 +39,10 @@ else
 DBUS_CONF_OPT += --without-x
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+DBUS_CONF_OPT += --with-systemdsystemunitdir=/lib/systemd/system
+endif
+
 # fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
 define DBUS_REMOVE_VAR_LIB_DBUS
 	rm -rf $(TARGET_DIR)/var/lib/dbus
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
new file mode 100644
index 0000000..09cedb9
--- /dev/null
+++ b/package/systemd/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_SYSTEMD
+	bool "systemd"
+	depends on BR2_PACKAGE_UDEV
+	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBCAP
+	help
+	  systemd is a system and service manager for Linux, compatible with
+	  SysV and LSB init scripts. systemd provides aggressive parallelization
+	  capabilities, uses socket and D-Bus activation for starting services,
+	  offers on-demand starting of daemons, keeps track of processes using
+	  Linux cgroups, supports snapshotting and restoring of the system
+	  state, maintains mount and automount points and implements an
+	  elaborate transactional dependency-based service control logic. It can
+	  work as a drop-in replacement for sysvinit. 
+
+	  http://freedesktop.org/wiki/Software/systemd
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
new file mode 100644
index 0000000..8733ce0
--- /dev/null
+++ b/package/systemd/systemd.mk
@@ -0,0 +1,45 @@
+#############################################################
+#
+# systemd
+#
+#############################################################
+SYSTEMD_VERSION = 37
+SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
+SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.bz2
+SYSTEMD_DEPENDENCIES = \
+	host-intltool \
+	libcap \
+	udev \
+	dbus
+
+SYSTEMD_CONF_OPT = \
+	--with-distro=other \
+	--disable-selinux \
+	--disable-acl \
+	--disable-pam \
+	--disable-libcryptsetup \
+	--disable-gtk \
+	--disable-plymouth \
+	--with-rootdir=/ \
+	--with-dbuspolicydir=/etc/dbus-1/system.d \
+	--with-dbussessionservicedir=/usr/share/dbus-1/services \
+	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
+	--with-dbusinterfacedir=/usr/share/dbus-1/interfaces \
+	--with-udevrulesdir=/etc/udev/rules.d \
+
+define SYSTEMD_INSTALL_INIT_HOOK
+	ln -fs /bin/systemd $(TARGET_DIR)/sbin/init
+	ln -fs /bin/systemctl $(TARGET_DIR)/sbin/halt
+	ln -fs /bin/systemctl $(TARGET_DIR)/sbin/poweroff
+	ln -fs /bin/systemctl $(TARGET_DIR)/sbin/reboot
+endef
+
+define SYSTEMD_INSTALL_TTY_HOOK
+	ln -fs /lib/systemd/system/getty at .service $(TARGET_DIR)/etc/systemd/system/getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
+endef
+
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
+	SYSTEMD_INSTALL_INIT_HOOK \
+	SYSTEMD_INSTALL_TTY_HOOK \
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.4.1
