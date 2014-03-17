From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Mar 2014 22:57:47 +0100
Subject: [Buildroot] [git commit] systemd: bump to version 210.
Message-ID: <20140317221234.D4D2E9BF87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0e8ff6b27cd2a77590471d122e73f34c9dd28f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps systemd to version 210. Systemd 209 introduced some majors
changes, which generated a lot of feedback and bugfixes. This lead to
version 210 a few days later.

Notable changes in 210:

- dropped dependency on libdbus in favor of internal sd-bus library.
- experimental support for kdbus.
- introduction of systemd-networkd, a simple network configuration manager.
- merge of libsystemd-*.so libraries into libsystemd.so.
- changes in Gudev API.

See NEWS file in the tarball for an exhaustive list.

Changes introduced by this bump:

- new configuration menu entry to enable systemd-networkd, which is an
  alternative to ISC dhcp and dhcpcd.
- remove EFI patch for version 208.
- update of the getty unit patch.
- new patch to remove the *.service files accidentally shipped in the
  official tarball (contain some invalid hardcoded paths) and force
  their re-generation.

[Peter: add a note that dbus is only a runtime dependency now]
Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/Config.in                          |   14 ++-
 package/systemd/systemd-01-fix-getty-unit.patch    |   18 +-
 ...efined-reference-efi_loader_get_boot_usec.patch |   29 ---
 ...systemd-02-remove-incorrect-service-files.patch |  194 ++++++++++++++++++++
 package/systemd/systemd.mk                         |   10 +-
 5 files changed, 223 insertions(+), 42 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 4f180a1..838e13e 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_SYSTEMD
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
@@ -73,4 +73,16 @@ config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
 
+config BR2_PACKAGE_SYSTEMD_NETWORKD
+	bool "enable network manager"
+	help
+	  systemd-networkd is a system service that manages networks.
+	  It detects and configures network devices as they appear, as well as
+	  creating virtual network devices.
+
+	  This simple network configuration solution is an alternative to
+	  dhcpcd or ISC dhcp.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-networkd.html
+
 endif
diff --git a/package/systemd/systemd-01-fix-getty-unit.patch b/package/systemd/systemd-01-fix-getty-unit.patch
index 166a2e5..e553ef3 100644
--- a/package/systemd/systemd-01-fix-getty-unit.patch
+++ b/package/systemd/systemd-01-fix-getty-unit.patch
@@ -4,28 +4,26 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
 
-Index: systemd-206/units/getty at .service.m4
-===================================================================
---- systemd-206.orig/units/getty at .service.m4	2013-07-22 00:43:28.000000000 +0200
-+++ systemd-206/units/getty at .service.m4	2013-09-18 10:20:17.000000000 +0200
+diff -aburN systemd-210.orig/units/getty at .service.m4 systemd-210/units/getty at .service.m4
+--- systemd-210.orig/units/getty at .service.m4	2013-12-18 18:21:28.000000000 +0100
++++ systemd-210/units/getty at .service.m4	2014-03-13 10:20:10.000000000 +0100
 @@ -27,7 +27,7 @@
 
  [Service]
  # the VT is cleared by TTYVTDisallocate
--ExecStart=-/sbin/agetty --noclear %I
+-ExecStart=-/sbin/agetty --noclear %I $TERM
 +ExecStart=-/sbin/getty -L %I 115200 vt100
  Type=idle
  Restart=always
  RestartSec=0
-Index: systemd-206/units/serial-getty at .service.m4
-===================================================================
---- systemd-206.orig/units/serial-getty at .service.m4	2013-07-22 00:43:28.000000000 +0200
-+++ systemd-206/units/serial-getty at .service.m4	2013-09-18 10:21:31.000000000 +0200
+diff -aburN systemd-210.orig/units/serial-getty at .service.m4 systemd-210/units/serial-getty at .service.m4
+--- systemd-210.orig/units/serial-getty at .service.m4	2014-02-24 15:38:03.000000000 +0100
++++ systemd-210/units/serial-getty at .service.m4	2014-03-13 10:20:10.000000000 +0100
 @@ -22,7 +22,7 @@
  IgnoreOnIsolate=yes
 
  [Service]
--ExecStart=-/sbin/agetty --keep-baud %I 115200,38400,9600
+-ExecStart=-/sbin/agetty --keep-baud %I 115200,38400,9600 $TERM
 +ExecStart=-/sbin/getty -L %I 115200 vt100
  Type=idle
  Restart=always
diff --git a/package/systemd/systemd-02-efi-fix-Undefined-reference-efi_loader_get_boot_usec.patch b/package/systemd/systemd-02-efi-fix-Undefined-reference-efi_loader_get_boot_usec.patch
deleted file mode 100644
index 84b0a1a..0000000
--- a/package/systemd/systemd-02-efi-fix-Undefined-reference-efi_loader_get_boot_usec.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 70d9b9fc0a4fa1698ff00e364c61bb875244efa1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Cristian=20Rodr=C3=ADguez?= <crrodriguez@opensuse.org>
-Date: Tue, 11 Feb 2014 09:54:49 -0300
-Subject: [PATCH] efi: fix Undefined reference efi_loader_get_boot_usec when
- EFI support is disabled
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- src/shared/boot-timestamps.c |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/shared/boot-timestamps.c b/src/shared/boot-timestamps.c
-index 9449965..d656685 100644
---- a/src/shared/boot-timestamps.c
-+++ b/src/shared/boot-timestamps.c
-@@ -40,8 +40,10 @@ int boot_timestamps(const dual_timestamp *n, dual_timestamp *firmware, dual_time
-
-         r = acpi_get_boot_usec(&x, &y);
-         if (r < 0) {
-+#ifdef ENABLE_EFI
-                 r = efi_loader_get_boot_usec(&x, &y);
-                 if (r < 0)
-+#endif
-                         return r;
-         }
-
---
-1.7.9.5
-
diff --git a/package/systemd/systemd-02-remove-incorrect-service-files.patch b/package/systemd/systemd-02-remove-incorrect-service-files.patch
new file mode 100644
index 0000000..8c799ee
--- /dev/null
+++ b/package/systemd/systemd-02-remove-incorrect-service-files.patch
@@ -0,0 +1,194 @@
+This patch removes some unwanted *.service files shipped with the tarball, in
+order to force their re-generation when building.
+
+These files contain hard-coded paths which are invalid, as systemd is
+configured with --enable-split-usr (i.e. /bin is not a link to /usr/bin).
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+diff -aburN systemd-210.orig/rules/99-systemd.rules systemd-210/rules/99-systemd.rules
+--- systemd-210.orig/rules/99-systemd.rules	2014-02-24 17:48:38.000000000 +0100
++++ systemd-210/rules/99-systemd.rules	1970-01-01 01:00:00.000000000 +0100
+@@ -1,70 +0,0 @@
+-#  This file is part of systemd.
+-#
+-#  systemd is free software; you can redistribute it and/or modify it
+-#  under the terms of the GNU Lesser General Public License as published by
+-#  the Free Software Foundation; either version 2.1 of the License, or
+-#  (at your option) any later version.
+-
+-ACTION=="remove", GOTO="systemd_end"
+-
+-SUBSYSTEM=="tty", KERNEL=="tty[a-zA-Z]*|hvc*|xvc*|hvsi*|ttysclp*|sclp_line*", TAG+="systemd"
+-
+-KERNEL=="vport*", TAG+="systemd"
+-
+-SUBSYSTEM=="block", KERNEL!="ram*", TAG+="systemd"
+-SUBSYSTEM=="block", KERNEL!="ram*", ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", ENV{SYSTEMD_READY}="0"
+-
+-# Ignore encrypted devices with no identified superblock on it, since
+-# we are probably still calling mke2fs or mkswap on it.
+-SUBSYSTEM=="block", KERNEL!="ram*", ENV{DM_UUID}=="CRYPT-*", ENV{ID_PART_TABLE_TYPE}=="", ENV{ID_FS_USAGE}=="", ENV{SYSTEMD_READY}="0"
+-
+-# Ignore raid devices that are not yet assembled and started
+-SUBSYSTEM=="block", ENV{DEVTYPE}=="disk", KERNEL=="md*", TEST!="md/array_state", ENV{SYSTEMD_READY}="0"
+-SUBSYSTEM=="block", ENV{DEVTYPE}=="disk", KERNEL=="md*", ATTR{md/array_state}=="|clear|inactive", ENV{SYSTEMD_READY}="0"
+-
+-# Ignore nbd devices in the "add" event, with "change" the nbd is ready
+-ACTION=="add", SUBSYSTEM=="block", KERNEL=="nbd*", ENV{SYSTEMD_READY}="0"
+-
+-# We need a hardware independent way to identify network devices. We
+-# use the /sys/subsystem path for this. Current vanilla kernels don't
+-# actually support that hierarchy right now, however upcoming kernels
+-# will. HAL and udev internally support /sys/subsystem already, hence
+-# it should be safe to use this here, too. This is mostly just an
+-# identification string for systemd, so whether the path actually is
+-# accessible or not does not matter as long as it is unique and in the
+-# filesystem namespace.
+-#
+-# http://cgit.freedesktop.org/systemd/systemd/tree/src/libudev/libudev-enumerate.c#n922
+-
+-SUBSYSTEM=="net", KERNEL!="lo", TAG+="systemd", ENV{SYSTEMD_ALIAS}+="/sys/subsystem/net/devices/$name"
+-SUBSYSTEM=="bluetooth", TAG+="systemd", ENV{SYSTEMD_ALIAS}+="/sys/subsystem/bluetooth/devices/%k"
+-
+-SUBSYSTEM=="bluetooth", TAG+="systemd", ENV{SYSTEMD_WANTS}+="bluetooth.target"
+-ENV{ID_SMARTCARD_READER}=="*?", TAG+="systemd", ENV{SYSTEMD_WANTS}+="smartcard.target"
+-SUBSYSTEM=="sound", KERNEL=="card*", TAG+="systemd", ENV{SYSTEMD_WANTS}+="sound.target"
+-
+-SUBSYSTEM=="printer", TAG+="systemd", ENV{SYSTEMD_WANTS}+="printer.target"
+-SUBSYSTEM=="usb", KERNEL=="lp*", TAG+="systemd", ENV{SYSTEMD_WANTS}+="printer.target"
+-SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ENV{ID_USB_INTERFACES}=="*:0701??:*", TAG+="systemd", ENV{SYSTEMD_WANTS}+="printer.target"
+-
+-# Apply sysctl variables to network devices (and only to those) as they appear.
+-
+-ACTION=="add", SUBSYSTEM=="net", KERNEL!="lo", RUN+="/usr/lib/systemd/systemd-sysctl --prefix=/proc/sys/net/ipv4/conf/$name --prefix=/proc/sys/net/ipv4/neigh/$name --prefix=/proc/sys/net/ipv6/conf/$name --prefix=/proc/sys/net/ipv6/neigh/$name"
+-
+-# Pull in backlight save/restore for all backlight devices and
+-# keyboard backlights
+-
+-SUBSYSTEM=="backlight", TAG+="systemd", IMPORT{builtin}="path_id", ENV{SYSTEMD_WANTS}+="systemd-backlight at backlight:$name.service"
+-SUBSYSTEM=="leds", KERNEL=="*kbd_backlight", TAG+="systemd", IMPORT{builtin}="path_id", ENV{SYSTEMD_WANTS}+="systemd-backlight at leds:$name.service"
+-
+-# Pull in rfkill save/restore for all rfkill devices
+-
+-SUBSYSTEM=="rfkill", TAG+="systemd", IMPORT{builtin}="path_id", ENV{SYSTEMD_WANTS}+="systemd-rfkill@$name.service"
+-
+-# Asynchronously mount file systems implemented by these modules as
+-# soon as they are loaded.
+-
+-SUBSYSTEM=="module", KERNEL=="fuse", TAG+="systemd", ENV{SYSTEMD_WANTS}+="sys-fs-fuse-connections.mount"
+-SUBSYSTEM=="module", KERNEL=="configfs", TAG+="systemd", ENV{SYSTEMD_WANTS}+="sys-kernel-config.mount"
+-
+-LABEL="systemd_end"
+diff -aburN systemd-210.orig/units/emergency.service systemd-210/units/emergency.service
+--- systemd-210.orig/units/emergency.service	2014-02-24 17:48:38.000000000 +0100
++++ systemd-210/units/emergency.service	1970-01-01 01:00:00.000000000 +0100
+@@ -1,28 +0,0 @@
+-#  This file is part of systemd.
+-#
+-#  systemd is free software; you can redistribute it and/or modify it
+-#  under the terms of the GNU Lesser General Public License as published by
+-#  the Free Software Foundation; either version 2.1 of the License, or
+-#  (at your option) any later version.
+-
+-[Unit]
+-Description=Emergency Shell
+-Documentation=man:sulogin(8)
+-DefaultDependencies=no
+-Conflicts=shutdown.target
+-Before=shutdown.target
+-
+-[Service]
+-Environment=HOME=/root
+-WorkingDirectory=/root
+-ExecStartPre=-/bin/plymouth quit
+-ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" to try again\\nto boot into default mode.'
+-ExecStart=-/sbin/sulogin
+-ExecStopPost=/usr/bin/systemctl --fail --no-block default
+-Type=idle
+-StandardInput=tty-force
+-StandardOutput=inherit
+-StandardError=inherit
+-KillMode=process
+-IgnoreSIGPIPE=no
+-SendSIGHUP=yes
+diff -aburN systemd-210.orig/units/systemd-udevd.service systemd-210/units/systemd-udevd.service
+--- systemd-210.orig/units/systemd-udevd.service	2014-02-24 17:48:38.000000000 +0100
++++ systemd-210/units/systemd-udevd.service	1970-01-01 01:00:00.000000000 +0100
+@@ -1,23 +0,0 @@
+-#  This file is part of systemd.
+-#
+-#  systemd is free software; you can redistribute it and/or modify it
+-#  under the terms of the GNU Lesser General Public License as published by
+-#  the Free Software Foundation; either version 2.1 of the License, or
+-#  (at your option) any later version.
+-
+-[Unit]
+-Description=udev Kernel Device Manager
+-Documentation=man:systemd-udevd.service(8) man:udev(7)
+-DefaultDependencies=no
+-Wants=systemd-udevd-control.socket systemd-udevd-kernel.socket
+-After=systemd-udevd-control.socket systemd-udevd-kernel.socket
+-Before=sysinit.target
+-ConditionPathIsReadWrite=/sys
+-
+-[Service]
+-Type=notify
+-OOMScoreAdjust=-1000
+-Sockets=systemd-udevd-control.socket systemd-udevd-kernel.socket
+-Restart=always
+-RestartSec=0
+-ExecStart=/usr/lib/systemd/systemd-udevd
+diff -aburN systemd-210.orig/units/systemd-udev-settle.service systemd-210/units/systemd-udev-settle.service
+--- systemd-210.orig/units/systemd-udev-settle.service	2014-02-24 17:48:38.000000000 +0100
++++ systemd-210/units/systemd-udev-settle.service	1970-01-01 01:00:00.000000000 +0100
+@@ -1,25 +0,0 @@
+-#  This file is part of systemd.
+-#
+-#  systemd is free software; you can redistribute it and/or modify it
+-#  under the terms of the GNU Lesser General Public License as published by
+-#  the Free Software Foundation; either version 2.1 of the License, or
+-#  (at your option) any later version.
+-
+-# This service can dynamically be pulled-in by legacy services which
+-# cannot reliably cope with dynamic device configurations, and wrongfully
+-# expect a populated /dev during bootup.
+-
+-[Unit]
+-Description=udev Wait for Complete Device Initialization
+-Documentation=man:udev(7) man:systemd-udevd.service(8)
+-DefaultDependencies=no
+-Wants=systemd-udevd.service
+-After=systemd-udev-trigger.service
+-Before=sysinit.target
+-ConditionPathIsReadWrite=/sys
+-
+-[Service]
+-Type=oneshot
+-TimeoutSec=180
+-RemainAfterExit=yes
+-ExecStart=/usr/bin/udevadm settle
+diff -aburN systemd-210.orig/units/systemd-udev-trigger.service systemd-210/units/systemd-udev-trigger.service
+--- systemd-210.orig/units/systemd-udev-trigger.service	2014-02-24 17:48:38.000000000 +0100
++++ systemd-210/units/systemd-udev-trigger.service	1970-01-01 01:00:00.000000000 +0100
+@@ -1,20 +0,0 @@
+-#  This file is part of systemd.
+-#
+-#  systemd is free software; you can redistribute it and/or modify it
+-#  under the terms of the GNU Lesser General Public License as published by
+-#  the Free Software Foundation; either version 2.1 of the License, or
+-#  (at your option) any later version.
+-
+-[Unit]
+-Description=udev Coldplug all Devices
+-Documentation=man:udev(7) man:systemd-udevd.service(8)
+-DefaultDependencies=no
+-Wants=systemd-udevd.service
+-After=systemd-udevd-kernel.socket systemd-udevd-control.socket
+-Before=sysinit.target
+-ConditionPathIsReadWrite=/sys
+-
+-[Service]
+-Type=oneshot
+-RemainAfterExit=yes
+-ExecStart=/usr/bin/udevadm trigger --type=subsystems --action=add ; /usr/bin/udevadm trigger --type=devices --action=add
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0ac4651..7fea1f0 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 208
+SYSTEMD_VERSION = 210
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_LICENSE = GPLv2+
@@ -13,7 +13,6 @@ SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	host-intltool \
 	libcap \
-	dbus \
 	util-linux \
 	kmod \
 	host-gperf
@@ -44,6 +43,7 @@ SYSTEMD_CONF_OPT += \
 	--disable-myhostname \
 	--disable-tcpwrap \
 	--disable-tests \
+	--disable-dbus \
 	--without-python
 
 ifeq ($(BR2_PACKAGE_ACL),y)
@@ -80,6 +80,12 @@ else
 SYSTEMD_CONF_OPT += --disable-microhttpd
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
+SYSTEMD_CONF_OPT += --enable-networkd
+else
+SYSTEMD_CONF_OPT += --disable-networkd
+endif
+
 # mq_getattr needs -lrt
 SYSTEMD_MAKE_OPT += LIBS=-lrt
 SYSTEMD_MAKE_OPT += LDFLAGS+=-ldl
