From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 31 Mar 2012 23:41:49 +0200
Subject: [Buildroot] [git commit] Add the systemd package
Message-ID: <20120331215812.DCC1A9697B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4a5eed474c561557b0c21a05682ed9585c6c60a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                            |    1 +
 package/dbus/dbus.mk                         |    4 ++
 package/systemd/Config.in                    |   20 ++++++++
 package/systemd/systemd-fix-getty-unit.patch |   34 ++++++++++++++
 package/systemd/systemd.mk                   |   62 ++++++++++++++++++++++++++
 package/udev/udev.mk                         |    4 ++
 6 files changed, 125 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b394f18..e1629c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -578,6 +578,7 @@ source "package/rsyslog/Config.in"
 source "package/sysklogd/Config.in"
 source "package/sysvinit/Config.in"
 endif
+source "package/systemd/Config.in"
 source "package/util-linux/Config.in"
 source "package/dsp-tools/Config.in"
 endmenu
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
index 0000000..8df3318
--- /dev/null
+++ b/package/systemd/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_SYSTEMD
+	bool "systemd"
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_INET_IPV6
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
+comment "systemd not available (depends on /dev management with udev and ipv6 support)"
+	depends on !(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV && BR2_INET_IPV6)
diff --git a/package/systemd/systemd-fix-getty-unit.patch b/package/systemd/systemd-fix-getty-unit.patch
new file mode 100644
index 0000000..6df54b1
--- /dev/null
+++ b/package/systemd/systemd-fix-getty-unit.patch
@@ -0,0 +1,34 @@
+Prefer getty to agetty in console setup systemd units
+
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+---
+ units/getty at .service.m4        |    2 +-
+ units/serial-getty at .service.m4 |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: systemd-37/units/getty at .service.m4
+===================================================================
+--- systemd-37.orig/units/getty at .service.m4
++++ systemd-37/units/getty at .service.m4
+@@ -32,7 +32,7 @@
+ 
+ [Service]
+ Environment=TERM=linux
+-ExecStart=-/sbin/agetty %I 38400
++ExecStart=-/sbin/getty -L %I 115200 vt100
+ Restart=always
+ RestartSec=0
+ UtmpIdentifier=%I
+Index: systemd-37/units/serial-getty at .service.m4
+===================================================================
+--- systemd-37.orig/units/serial-getty at .service.m4
++++ systemd-37/units/serial-getty at .service.m4
+@@ -32,7 +32,7 @@
+ 
+ [Service]
+ Environment=TERM=vt100
+-ExecStart=-/sbin/agetty -s %I 115200,38400,9600
++ExecStart=-/sbin/getty -L %I 115200 vt100
+ Restart=always
+ RestartSec=0
+ UtmpIdentifier=%I
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
new file mode 100644
index 0000000..fc49f3c
--- /dev/null
+++ b/package/systemd/systemd.mk
@@ -0,0 +1,62 @@
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
+# Make sure that systemd will always be built after busybox so that we have
+# a consistent init setup between two builds
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
+	ln -fs ../../../../lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
+endef
+
+define SYSTEMD_INSTALL_TTY_HOOK
+	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
+	ln -fs ../../../../lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
+endef
+
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
+	SYSTEMD_INSTALL_INIT_HOOK \
+	SYSTEMD_INSTALL_TTY_HOOK \
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 85f6254..726aed6 100644
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
