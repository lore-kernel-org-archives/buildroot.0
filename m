From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Mar 2014 16:56:44 +0100
Subject: [Buildroot] [git commit] systemd: bump to version 212.
Message-ID: <20140327155920.0B41D9C3B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf4812c3f474624bebcbd4674afa55f2be70bbfc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also adjust the license details and refresh patches.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd-01-fix-getty-unit.patch    |   18 +-
 ...systemd-02-remove-incorrect-service-files.patch |  194 --------------------
 package/systemd/systemd.mk                         |    4 +-
 3 files changed, 11 insertions(+), 205 deletions(-)

diff --git a/package/systemd/systemd-01-fix-getty-unit.patch b/package/systemd/systemd-01-fix-getty-unit.patch
index e553ef3..8ec3bcf 100644
--- a/package/systemd/systemd-01-fix-getty-unit.patch
+++ b/package/systemd/systemd-01-fix-getty-unit.patch
@@ -4,11 +4,11 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
 
-diff -aburN systemd-210.orig/units/getty at .service.m4 systemd-210/units/getty at .service.m4
---- systemd-210.orig/units/getty at .service.m4	2013-12-18 18:21:28.000000000 +0100
-+++ systemd-210/units/getty at .service.m4	2014-03-13 10:20:10.000000000 +0100
+diff -aburN systemd-212.orig/units/getty at .service.m4 systemd-212/units/getty at .service.m4
+--- systemd-212.orig/units/getty at .service.m4	2014-01-28 11:08:51.000000000 +0100
++++ systemd-212/units/getty at .service.m4	2014-03-26 11:06:27.000000000 +0100
 @@ -27,7 +27,7 @@
-
+ 
  [Service]
  # the VT is cleared by TTYVTDisallocate
 -ExecStart=-/sbin/agetty --noclear %I $TERM
@@ -16,14 +16,14 @@ diff -aburN systemd-210.orig/units/getty at .service.m4 systemd-210/units/getty at .se
  Type=idle
  Restart=always
  RestartSec=0
-diff -aburN systemd-210.orig/units/serial-getty at .service.m4 systemd-210/units/serial-getty at .service.m4
---- systemd-210.orig/units/serial-getty at .service.m4	2014-02-24 15:38:03.000000000 +0100
-+++ systemd-210/units/serial-getty at .service.m4	2014-03-13 10:20:10.000000000 +0100
+diff -aburN systemd-212.orig/units/serial-getty at .service.m4 systemd-212/units/serial-getty at .service.m4
+--- systemd-212.orig/units/serial-getty at .service.m4	2014-03-13 18:47:24.000000000 +0100
++++ systemd-212/units/serial-getty at .service.m4	2014-03-26 11:07:01.000000000 +0100
 @@ -22,7 +22,7 @@
  IgnoreOnIsolate=yes
-
+ 
  [Service]
--ExecStart=-/sbin/agetty --keep-baud %I 115200,38400,9600 $TERM
+-ExecStart=-/sbin/agetty --keep-baud 115200,38400,9600 %I $TERM
 +ExecStart=-/sbin/getty -L %I 115200 vt100
  Type=idle
  Restart=always
diff --git a/package/systemd/systemd-02-remove-incorrect-service-files.patch b/package/systemd/systemd-02-remove-incorrect-service-files.patch
deleted file mode 100644
index 8c799ee..0000000
--- a/package/systemd/systemd-02-remove-incorrect-service-files.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-This patch removes some unwanted *.service files shipped with the tarball, in
-order to force their re-generation when building.
-
-These files contain hard-coded paths which are invalid, as systemd is
-configured with --enable-split-usr (i.e. /bin is not a link to /usr/bin).
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
-diff -aburN systemd-210.orig/rules/99-systemd.rules systemd-210/rules/99-systemd.rules
---- systemd-210.orig/rules/99-systemd.rules	2014-02-24 17:48:38.000000000 +0100
-+++ systemd-210/rules/99-systemd.rules	1970-01-01 01:00:00.000000000 +0100
-@@ -1,70 +0,0 @@
--#  This file is part of systemd.
--#
--#  systemd is free software; you can redistribute it and/or modify it
--#  under the terms of the GNU Lesser General Public License as published by
--#  the Free Software Foundation; either version 2.1 of the License, or
--#  (at your option) any later version.
--
--ACTION=="remove", GOTO="systemd_end"
--
--SUBSYSTEM=="tty", KERNEL=="tty[a-zA-Z]*|hvc*|xvc*|hvsi*|ttysclp*|sclp_line*", TAG+="systemd"
--
--KERNEL=="vport*", TAG+="systemd"
--
--SUBSYSTEM=="block", KERNEL!="ram*", TAG+="systemd"
--SUBSYSTEM=="block", KERNEL!="ram*", ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", ENV{SYSTEMD_READY}="0"
--
--# Ignore encrypted devices with no identified superblock on it, since
--# we are probably still calling mke2fs or mkswap on it.
--SUBSYSTEM=="block", KERNEL!="ram*", ENV{DM_UUID}=="CRYPT-*", ENV{ID_PART_TABLE_TYPE}=="", ENV{ID_FS_USAGE}=="", ENV{SYSTEMD_READY}="0"
--
--# Ignore raid devices that are not yet assembled and started
--SUBSYSTEM=="block", ENV{DEVTYPE}=="disk", KERNEL=="md*", TEST!="md/array_state", ENV{SYSTEMD_READY}="0"
--SUBSYSTEM=="block", ENV{DEVTYPE}=="disk", KERNEL=="md*", ATTR{md/array_state}=="|clear|inactive", ENV{SYSTEMD_READY}="0"
--
--# Ignore nbd devices in the "add" event, with "change" the nbd is ready
--ACTION=="add", SUBSYSTEM=="block", KERNEL=="nbd*", ENV{SYSTEMD_READY}="0"
--
--# We need a hardware independent way to identify network devices. We
--# use the /sys/subsystem path for this. Current vanilla kernels don't
--# actually support that hierarchy right now, however upcoming kernels
--# will. HAL and udev internally support /sys/subsystem already, hence
--# it should be safe to use this here, too. This is mostly just an
--# identification string for systemd, so whether the path actually is
--# accessible or not does not matter as long as it is unique and in the
--# filesystem namespace.
--#
--# http://cgit.freedesktop.org/systemd/systemd/tree/src/libudev/libudev-enumerate.c#n922
--
--SUBSYSTEM=="net", KERNEL!="lo", TAG+="systemd", ENV{SYSTEMD_ALIAS}+="/sys/subsystem/net/devices/$name"
--SUBSYSTEM=="bluetooth", TAG+="systemd", ENV{SYSTEMD_ALIAS}+="/sys/subsystem/bluetooth/devices/%k"
--
--SUBSYSTEM=="bluetooth", TAG+="systemd", ENV{SYSTEMD_WANTS}+="bluetooth.target"
--ENV{ID_SMARTCARD_READER}=="*?", TAG+="systemd", ENV{SYSTEMD_WANTS}+="smartcard.target"
--SUBSYSTEM=="sound", KERNEL=="card*", TAG+="systemd", ENV{SYSTEMD_WANTS}+="sound.target"
--
--SUBSYSTEM=="printer", TAG+="systemd", ENV{SYSTEMD_WANTS}+="printer.target"
--SUBSYSTEM=="usb", KERNEL=="lp*", TAG+="systemd", ENV{SYSTEMD_WANTS}+="printer.target"
--SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ENV{ID_USB_INTERFACES}=="*:0701??:*", TAG+="systemd", ENV{SYSTEMD_WANTS}+="printer.target"
--
--# Apply sysctl variables to network devices (and only to those) as they appear.
--
--ACTION=="add", SUBSYSTEM=="net", KERNEL!="lo", RUN+="/usr/lib/systemd/systemd-sysctl --prefix=/proc/sys/net/ipv4/conf/$name --prefix=/proc/sys/net/ipv4/neigh/$name --prefix=/proc/sys/net/ipv6/conf/$name --prefix=/proc/sys/net/ipv6/neigh/$name"
--
--# Pull in backlight save/restore for all backlight devices and
--# keyboard backlights
--
--SUBSYSTEM=="backlight", TAG+="systemd", IMPORT{builtin}="path_id", ENV{SYSTEMD_WANTS}+="systemd-backlight at backlight:$name.service"
--SUBSYSTEM=="leds", KERNEL=="*kbd_backlight", TAG+="systemd", IMPORT{builtin}="path_id", ENV{SYSTEMD_WANTS}+="systemd-backlight at leds:$name.service"
--
--# Pull in rfkill save/restore for all rfkill devices
--
--SUBSYSTEM=="rfkill", TAG+="systemd", IMPORT{builtin}="path_id", ENV{SYSTEMD_WANTS}+="systemd-rfkill@$name.service"
--
--# Asynchronously mount file systems implemented by these modules as
--# soon as they are loaded.
--
--SUBSYSTEM=="module", KERNEL=="fuse", TAG+="systemd", ENV{SYSTEMD_WANTS}+="sys-fs-fuse-connections.mount"
--SUBSYSTEM=="module", KERNEL=="configfs", TAG+="systemd", ENV{SYSTEMD_WANTS}+="sys-kernel-config.mount"
--
--LABEL="systemd_end"
-diff -aburN systemd-210.orig/units/emergency.service systemd-210/units/emergency.service
---- systemd-210.orig/units/emergency.service	2014-02-24 17:48:38.000000000 +0100
-+++ systemd-210/units/emergency.service	1970-01-01 01:00:00.000000000 +0100
-@@ -1,28 +0,0 @@
--#  This file is part of systemd.
--#
--#  systemd is free software; you can redistribute it and/or modify it
--#  under the terms of the GNU Lesser General Public License as published by
--#  the Free Software Foundation; either version 2.1 of the License, or
--#  (at your option) any later version.
--
--[Unit]
--Description=Emergency Shell
--Documentation=man:sulogin(8)
--DefaultDependencies=no
--Conflicts=shutdown.target
--Before=shutdown.target
--
--[Service]
--Environment=HOME=/root
--WorkingDirectory=/root
--ExecStartPre=-/bin/plymouth quit
--ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" to try again\\nto boot into default mode.'
--ExecStart=-/sbin/sulogin
--ExecStopPost=/usr/bin/systemctl --fail --no-block default
--Type=idle
--StandardInput=tty-force
--StandardOutput=inherit
--StandardError=inherit
--KillMode=process
--IgnoreSIGPIPE=no
--SendSIGHUP=yes
-diff -aburN systemd-210.orig/units/systemd-udevd.service systemd-210/units/systemd-udevd.service
---- systemd-210.orig/units/systemd-udevd.service	2014-02-24 17:48:38.000000000 +0100
-+++ systemd-210/units/systemd-udevd.service	1970-01-01 01:00:00.000000000 +0100
-@@ -1,23 +0,0 @@
--#  This file is part of systemd.
--#
--#  systemd is free software; you can redistribute it and/or modify it
--#  under the terms of the GNU Lesser General Public License as published by
--#  the Free Software Foundation; either version 2.1 of the License, or
--#  (at your option) any later version.
--
--[Unit]
--Description=udev Kernel Device Manager
--Documentation=man:systemd-udevd.service(8) man:udev(7)
--DefaultDependencies=no
--Wants=systemd-udevd-control.socket systemd-udevd-kernel.socket
--After=systemd-udevd-control.socket systemd-udevd-kernel.socket
--Before=sysinit.target
--ConditionPathIsReadWrite=/sys
--
--[Service]
--Type=notify
--OOMScoreAdjust=-1000
--Sockets=systemd-udevd-control.socket systemd-udevd-kernel.socket
--Restart=always
--RestartSec=0
--ExecStart=/usr/lib/systemd/systemd-udevd
-diff -aburN systemd-210.orig/units/systemd-udev-settle.service systemd-210/units/systemd-udev-settle.service
---- systemd-210.orig/units/systemd-udev-settle.service	2014-02-24 17:48:38.000000000 +0100
-+++ systemd-210/units/systemd-udev-settle.service	1970-01-01 01:00:00.000000000 +0100
-@@ -1,25 +0,0 @@
--#  This file is part of systemd.
--#
--#  systemd is free software; you can redistribute it and/or modify it
--#  under the terms of the GNU Lesser General Public License as published by
--#  the Free Software Foundation; either version 2.1 of the License, or
--#  (at your option) any later version.
--
--# This service can dynamically be pulled-in by legacy services which
--# cannot reliably cope with dynamic device configurations, and wrongfully
--# expect a populated /dev during bootup.
--
--[Unit]
--Description=udev Wait for Complete Device Initialization
--Documentation=man:udev(7) man:systemd-udevd.service(8)
--DefaultDependencies=no
--Wants=systemd-udevd.service
--After=systemd-udev-trigger.service
--Before=sysinit.target
--ConditionPathIsReadWrite=/sys
--
--[Service]
--Type=oneshot
--TimeoutSec=180
--RemainAfterExit=yes
--ExecStart=/usr/bin/udevadm settle
-diff -aburN systemd-210.orig/units/systemd-udev-trigger.service systemd-210/units/systemd-udev-trigger.service
---- systemd-210.orig/units/systemd-udev-trigger.service	2014-02-24 17:48:38.000000000 +0100
-+++ systemd-210/units/systemd-udev-trigger.service	1970-01-01 01:00:00.000000000 +0100
-@@ -1,20 +0,0 @@
--#  This file is part of systemd.
--#
--#  systemd is free software; you can redistribute it and/or modify it
--#  under the terms of the GNU Lesser General Public License as published by
--#  the Free Software Foundation; either version 2.1 of the License, or
--#  (at your option) any later version.
--
--[Unit]
--Description=udev Coldplug all Devices
--Documentation=man:udev(7) man:systemd-udevd.service(8)
--DefaultDependencies=no
--Wants=systemd-udevd.service
--After=systemd-udevd-kernel.socket systemd-udevd-control.socket
--Before=sysinit.target
--ConditionPathIsReadWrite=/sys
--
--[Service]
--Type=oneshot
--RemainAfterExit=yes
--ExecStart=/usr/bin/udevadm trigger --type=subsystems --action=add ; /usr/bin/udevadm trigger --type=devices --action=add
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7fea1f0..ecedfce 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 210
+SYSTEMD_VERSION = 212
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
-SYSTEMD_LICENSE = GPLv2+
+SYSTEMD_LICENSE = LGPLv2.1+; GPLv2+ for udev; MIT-like license for few source files listed in README
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 LICENSE.MIT
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
