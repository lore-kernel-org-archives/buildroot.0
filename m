From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 19 Mar 2012 16:59:36 +0100
Subject: [Buildroot] [PATCH 2/6] Add the systemd package
In-Reply-To: <cover.1332172636.git.maxime.ripard@free-electrons.com>
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
Message-ID: <5edd6acafdb19b900e0bdb3eaf6f0796695ad09f.1332172636.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/Config.in                     |    1 +
 package/dbus/dbus.mk                  |    4 ++
 package/systemd/Config.in             |   19 +++++++++
 package/systemd/getty at .service        |   39 ++++++++++++++++++
 package/systemd/serial-getty at .service |   31 +++++++++++++++
 package/systemd/systemd.mk            |   69 +++++++++++++++++++++++++++++++++
 package/udev/udev.mk                  |    4 ++
 7 files changed, 167 insertions(+), 0 deletions(-)
 create mode 100644 package/systemd/Config.in
 create mode 100644 package/systemd/getty at .service
 create mode 100644 package/systemd/serial-getty at .service
 create mode 100644 package/systemd/systemd.mk

diff --git a/package/Config.in b/package/Config.in
index 8a7c9c4..c392e50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -571,6 +571,7 @@ source "package/psmisc/Config.in"
 source "package/rsyslog/Config.in"
 source "package/sysklogd/Config.in"
 source "package/sysvinit/Config.in"
+source "package/systemd/Config.in"
 endif
 source "package/util-linux/Config.in"
 source "package/dsp-tools/Config.in"
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index e18e291..0942b33 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -39,6 +39,10 @@ else
 DBUS_CONF_OPT += --without-x
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+DBUS_CONF_OPT += --with-systemdsystemunitdir=/lib/systemd/system
+endif
+
 # fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
 define DBUS_REMOVE_VAR_LIB_DBUS
 	rm -rf $(TARGET_DIR)/var/lib/dbus
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
new file mode 100644
index 0000000..d87054d
--- /dev/null
+++ b/package/systemd/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_SYSTEMD
+	bool "systemd"
+	depends on BR2_PACKAGE_UDEV
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBCAP
+	help
+	  systemd is a system and service manager for Linux, compatible with
+	  SysV and LSB init scripts. systemd provides aggressive parallelization
+	  capabilities, uses socket and D-Bus activation for starting services,
+	  offers on-demand starting of daemons, keeps track of processes using
+	  Linux cgroups, supports snapshotting and restoring of the system
+	  state, maintains mount and automount points and implements an
+	  elaborate transactional dependency-based service control logic.
+	  It can work as a drop-in replacement for sysvinit. 
+
+	  http://freedesktop.org/wiki/Software/systemd
+
+comment "systemd not available (depends on udev and dbus)"
+	depends on !BR2_PACKAGE_UDEV || !BR2_PACKAGE_DBUS
diff --git a/package/systemd/getty at .service b/package/systemd/getty at .service
new file mode 100644
index 0000000..15b3453
--- /dev/null
+++ b/package/systemd/getty at .service
@@ -0,0 +1,39 @@
+#  This file is part of systemd.
+#
+#  systemd is free software; you can redistribute it and/or modify it
+#  under the terms of the GNU General Public License as published by
+#  the Free Software Foundation; either version 2 of the License, or
+#  (at your option) any later version.
+
+[Unit]
+Description=Getty on %I
+BindTo=dev-%i.device
+After=dev-%i.device systemd-user-sessions.service plymouth-quit-wait.service
+
+# If additional gettys are spawned during boot then we should make
+# sure that this is synchronized before getty.target, even though
+# getty.target didn't actually pull it in.
+Before=getty.target
+
+[Service]
+Environment=TERM=linux
+ExecStart=-/sbin/getty -L %I 115200 vt100
+Restart=always
+RestartSec=0
+UtmpIdentifier=%I
+TTYPath=/dev/%I
+TTYReset=yes
+TTYVHangup=yes
+TTYVTDisallocate=yes
+KillMode=process
+
+# Unset locale for the console getty since the console has problems
+# displaying some internationalized messages.
+Environment=LANG= LANGUAGE= LC_CTYPE= LC_NUMERIC= LC_TIME= LC_COLLATE= LC_MONETARY= LC_MESSAGES= LC_PAPER= LC_NAME= LC_ADDRESS= LC_TELEPHONE= LC_MEASUREMENT= LC_IDENTIFICATION=
+
+# Some login implementations ignore SIGTERM, so we send SIGHUP
+# instead, to ensure that login terminates cleanly.
+KillSignal=SIGHUP
+
+[Install]
+Alias=getty.target.wants/getty at tty1.service
diff --git a/package/systemd/serial-getty at .service b/package/systemd/serial-getty at .service
new file mode 100644
index 0000000..e28ecdf
--- /dev/null
+++ b/package/systemd/serial-getty at .service
@@ -0,0 +1,31 @@
+#  This file is part of systemd.
+#
+#  systemd is free software; you can redistribute it and/or modify it
+#  under the terms of the GNU General Public License as published by
+#  the Free Software Foundation; either version 2 of the License, or
+#  (at your option) any later version.
+
+[Unit]
+Description=Serial Getty on %I
+BindTo=dev-%i.device
+After=dev-%i.device systemd-user-sessions.service plymouth-quit-wait.service
+
+# If additional gettys are spawned during boot then we should make
+# sure that this is synchronized before getty.target, even though
+# getty.target didn't actually pull it in.
+Before=getty.target
+
+[Service]
+Environment=TERM=vt100
+ExecStart=-/sbin/getty -L %I 115200 vt100
+Restart=always
+RestartSec=0
+UtmpIdentifier=%I
+TTYPath=/dev/%I
+TTYReset=yes
+TTYVHangup=yes
+KillMode=process
+
+# Some login implementations ignore SIGTERM, so we send SIGHUP
+# instead, to ensure that login terminates cleanly.
+KillSignal=SIGHUP
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
new file mode 100644
index 0000000..a20ddf4
--- /dev/null
+++ b/package/systemd/systemd.mk
@@ -0,0 +1,69 @@
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
+# Build after Busybox
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+	SYSTEMD_DEPENDENCIES += busybox
+endif
+
+SYSTEMD_CONF_OPT += \
+	--with-distro=other \
+	--disable-selinux \
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
+	--with-sysvinit-path=/etc/init.d/ \
+	--without-sysvrcd-path
+
+ifeq ($(BR2_PACKAGE_ACL),y)
+	SYSTEMD_CONF_OPT += --enable-acl
+	SYSTEMD_DEPENDENCIES += acl
+else
+	SYSTEMD_CONF_OPT += --disable-acl
+endif
+
+define SYSTEMD_INSTALL_INIT_HOOK
+	ln -fs ../bin/systemd $(TARGET_DIR)/sbin/init
+	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/halt
+	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/poweroff
+	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/reboot
+
+	mkdir -p $(TARGET_DIR)/run
+
+	ln -fs ../../../lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
+endef
+
+define SYSTEMD_INSTALL_TTY_HOOK
+	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
+	[ -f $(TARGET_DIR)/etc/systemd/system/getty at .service ] || \
+		$(INSTALL) -D package/systemd/getty at .service \
+			$(TARGET_DIR)/etc/systemd/system/
+	[ -f $(TARGET_DIR)/etc/systemd/system/serial-getty at .service ] || \
+		$(INSTALL) -D package/systemd/serial-getty at .service \
+			$(TARGET_DIR)/etc/systemd/system/
+	ln -fs ../serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
+endef
+
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
+	SYSTEMD_INSTALL_INIT_HOOK \
+	SYSTEMD_INSTALL_TTY_HOOK \
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index d445a2f..ed41511 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -35,6 +35,10 @@ UDEV_CONF_OPT +=		\
 	--disable-gudev
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+	UDEV_CONF_OPT += --with-systemdsystemunitdir=/lib/systemd/system/
+endif
+
 define UDEV_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
 endef
-- 
1.7.5.4
