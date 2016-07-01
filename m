From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:19 +0200
Subject: [Buildroot] [PATCH 19/31] package/systemd: Sort menuconfig
	alphabetically
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-19-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/Config.in | 251 ++++++++++++++++++++++++----------------------
 1 file changed, 132 insertions(+), 119 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index c6e0dcc..c1a4105 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -69,11 +69,6 @@ if BR2_PACKAGE_SYSTEMD
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
-config BR2_PACKAGE_SYSTEMD_KDBUS
-	bool "enable kdbus support"
-	help
-	  Enable kdbus support for Systemd.
-
 config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 	bool "HTTP server for journal events"
 	select BR2_PACKAGE_LIBMICROHTTPD
@@ -84,16 +79,13 @@ config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
 
-config BR2_PACKAGE_SYSTEMD_HWDB
-	bool "enable hwdb installation"
-	default y
+config BR2_PACKAGE_SYSTEMD_BACKLIGHT
+	bool "enable backlight support"
 	help
-	  Enables hardware database installation to /usr/lib/udev/hwdb.d
-
-	  Disabling this option improves first boot time (or every boot
-	  time in case of initramfs images) and saves several MB space.
+	  systemd-backlight is a service that restores the display backlight
+	  brightness at early boot and saves it at shutdown.
 
-	  https://www.freedesktop.org/software/systemd/man/hwdb.html
+	  http://www.freedesktop.org/software/systemd/man/systemd-backlight at .service.html
 
 config BR2_PACKAGE_SYSTEMD_BINFMT
 	bool "enable binfmt tool"
@@ -103,14 +95,6 @@ config BR2_PACKAGE_SYSTEMD_BINFMT
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-binfmt.service.html
 
-config BR2_PACKAGE_SYSTEMD_VCONSOLE
-	bool "enable vconsole tool"
-	help
-	  systemd-vconsole-setup is an early boot service that
-	  configures the virtual console font and console keymap.
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
-
 config BR2_PACKAGE_SYSTEMD_BOOTCHART
 	bool "enable bootchart tool"
 	help
@@ -121,33 +105,26 @@ config BR2_PACKAGE_SYSTEMD_BOOTCHART
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-bootchart.html
 
-config BR2_PACKAGE_SYSTEMD_QUOTACHECK
-	bool "enable quotacheck tools"
+config BR2_PACKAGE_SYSTEMD_COREDUMP
+	bool "enable coredump hook"
 	help
-	  systemd-quotacheck is a service responsible for file system
-	  quota checks. It is run once at boot after all necessary
-	  file systems are mounted. It is pulled in only if at least
-	  one file system has quotas enabled.
+	  systemd-coredump can be used as a helper binary by the kernel when a user
+	  space program receives a fatal signal and dumps core.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
+	  http://www.freedesktop.org/software/systemd/man/systemd-coredump.html
 
-config BR2_PACKAGE_SYSTEMD_TMPFILES
-	bool "enable tmpfiles support"
-	default y
+config BR2_PACKAGE_SYSTEMD_COMPAT
+	bool "enable compatibility libraries"
 	help
-	  systemd-tmpfiles creates, deletes, and cleans up volatile and temporary
-	  files and directories, based on the configuration file format and location
-	  specified in tmpfiles.d(5).
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
+	  Since systemd 209, the following libraries have been merged into
+	  libsystemd.so:
 
-config BR2_PACKAGE_SYSTEMD_SYSUSERS
-	bool "enable sysusers support"
-	help
-	  systemd-sysusers creates system users and groups, based on the file format
-	  and location specified in sysusers.d(5).
+	  - libsystemd-daemon
+	  - libsystemd-id128
+	  - libsystemd-journal
+	  - libsystemd-login
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-sysusers.html
+	  This option enables the installation of compatibility *.pc files.
 
 config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
 	bool "enable firstboot support"
@@ -158,45 +135,33 @@ config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-firstboot.html
 
-config BR2_PACKAGE_SYSTEMD_RANDOMSEED
-	bool "enable random-seed support"
-	help
-	  systemd-random-seed is a service that restores the random seed of the system
-	  at early boot and saves it at shutdown. Saving/restoring the random seed
-	  across boots increases the amount of available entropy early at boot.
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
-
-config BR2_PACKAGE_SYSTEMD_BACKLIGHT
-	bool "enable backlight support"
-	help
-	  systemd-backlight is a service that restores the display backlight
-	  brightness at early boot and saves it at shutdown.
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-backlight at .service.html
-
-config BR2_PACKAGE_SYSTEMD_RFKILL
-	bool "enable rfkill tools"
+config BR2_PACKAGE_SYSTEMD_HIBERNATE
+	bool "enable hibernation support"
 	help
-	  systemd-rfkill is a service that restores the RF kill switch state at early
-	  boot and saves it at shutdown.
+	  When this features is enabled, additional tools and services are built to
+	  support suspending and resuming the system.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-rfkill at .service.html
+	  http://www.freedesktop.org/software/systemd/man/systemd-sleep.html
 
-config BR2_PACKAGE_SYSTEMD_LOGIND
-	bool "enable login daemon"
+config BR2_PACKAGE_SYSTEMD_HOSTNAMED
+	bool "enable hostname daemon"
+	default y
 	help
-	  systemd-logind is a system service that manages user logins.
+	  systemd-hostnamed is a system service that may be used as a mechanism to
+	  change the system's hostname.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-logind.service.html
+	  http://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
 
-config BR2_PACKAGE_SYSTEMD_MACHINED
-	bool "enable machine daemon"
+config BR2_PACKAGE_SYSTEMD_HWDB
+	bool "enable HWDB (hardware database support)"
 	help
-	  systemd-machined is a system service that keeps track of virtual machines
-	  and containers, and processes belonging to them.
+	  The hardware database is a key-value store for associating modalias-like
+	  keys to udev-property-like values. It is used primarily by udev to add the
+	  relevant properties to matching devices, but it can also be
+	  queried directly.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-machined.service.html
+	  http://www.freedesktop.org/software/systemd/man/systemd-hwdb.html
+	  http://www.freedesktop.org/software/systemd/man/hwdb.html
 
 config BR2_PACKAGE_SYSTEMD_IMPORTD
 	bool "enable import daemon"
@@ -212,24 +177,10 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 
 	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
 
-config BR2_PACKAGE_SYSTEMD_HOSTNAMED
-	bool "enable hostname daemon"
-	default y
-	help
-	  systemd-hostnamed is a system service that may be used as a mechanism to
-	  change the system's hostname.
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
-
-config BR2_PACKAGE_SYSTEMD_TIMEDATED
-	bool "enable timedate daemon"
-	default y
+config BR2_PACKAGE_SYSTEMD_KDBUS
+	bool "enable kdbus support"
 	help
-	  systemd-timedated is a system service that may be used as a mechanism to
-	  change the system clock and timezone, as well as to enable/disable NTP
-	  time synchronization.
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-timedated.service.html
+	  Enable kdbus support for Systemd.
 
 config BR2_PACKAGE_SYSTEMD_LOCALED
 	bool "enable locale daemon"
@@ -240,23 +191,20 @@ config BR2_PACKAGE_SYSTEMD_LOCALED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-localed.service.html
 
-config BR2_PACKAGE_SYSTEMD_COREDUMP
-	bool "enable coredump hook"
+config BR2_PACKAGE_SYSTEMD_LOGIND
+	bool "enable login daemon"
 	help
-	  systemd-coredump can be used as a helper binary by the kernel when a user
-	  space program receives a fatal signal and dumps core.
+	  systemd-logind is a system service that manages user logins.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-coredump.html
+	  http://www.freedesktop.org/software/systemd/man/systemd-logind.service.html
 
-config BR2_PACKAGE_SYSTEMD_POLKIT
-	bool "enable polkit support"
-	select BR2_PACKAGE_POLKIT
+config BR2_PACKAGE_SYSTEMD_MACHINED
+	bool "enable machine daemon"
 	help
-	  If enabled, systemd is built with polkit support and policy files for its
-	  services are generated and installed. It is useful for allowing unprivileged
-	  processes to speak to systemd's many privileged processes.
+	  systemd-machined is a system service that keeps track of virtual machines
+	  and containers, and processes belonging to them.
 
-	  http://wiki.freedesktop.org/www/Software/polkit/
+	  http://www.freedesktop.org/software/systemd/man/systemd-machined.service.html
 
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
@@ -270,8 +218,77 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-networkd.html
 
+config BR2_PACKAGE_SYSTEMD_POLKIT
+	bool "enable polkit support"
+	select BR2_PACKAGE_POLKIT
+	help
+	  If enabled, systemd is built with polkit support and policy files for its
+	  services are generated and installed. It is useful for allowing unprivileged
+	  processes to speak to systemd's many privileged processes.
+
+	  http://wiki.freedesktop.org/www/Software/polkit/
+
+config BR2_PACKAGE_SYSTEMD_QUOTACHECK
+	bool "enable quotacheck tools"
+	help
+	  systemd-quotacheck is a service responsible for file system
+	  quota checks. It is run once at boot after all necessary
+	  file systems are mounted. It is pulled in only if at least
+	  one file system has quotas enabled.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
+
+config BR2_PACKAGE_SYSTEMD_RANDOMSEED
+	bool "enable random-seed support"
+	help
+	  systemd-random-seed is a service that restores the random seed of the system
+	  at early boot and saves it at shutdown. Saving/restoring the random seed
+	  across boots increases the amount of available entropy early at boot.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
+
+config BR2_PACKAGE_SYSTEMD_RFKILL
+	bool "enable rfkill tools"
+	help
+	  systemd-rfkill is a service that restores the RF kill switch state at early
+	  boot and saves it at shutdown.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-rfkill at .service.html
+
+config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
+	bool "enable SMACK support"
+	select BR2_PACKAGE_ATTR
+	select BR2_PACKAGE_SMACK
+	help
+	  Enable support for SMACK, the Simple Mandatory Access Control
+	  Kernel, a minimal approach to Access Control implemented as a kernel
+	  LSM.
+
+	  This feature requires a kernel >= 3.8.
+
+	  When this feature is enabled, Systemd mounts smackfs and manages
+	  security labels for sockets.
+
+config BR2_PACKAGE_SYSTEMD_SYSUSERS
+	bool "enable sysusers support"
+	help
+	  systemd-sysusers creates system users and groups, based on the file format
+	  and location specified in sysusers.d(5).
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-sysusers.html
+
+config BR2_PACKAGE_SYSTEMD_TIMEDATED
+	bool "enable timedate daemon"
+	default y
+	help
+	  systemd-timedated is a system service that may be used as a mechanism to
+	  change the system clock and timezone, as well as to enable/disable NTP
+	  time synchronization.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-timedated.service.html
+
 config BR2_PACKAGE_SYSTEMD_TIMESYNCD
-	bool "enable SNTP client"
+	bool "enable timesync daemon"
 	help
 	  systemd-timesyncd is a service that may be used to synchronize the
 	  local system clock with a Network Time Protocol server.
@@ -294,26 +311,22 @@ config BR2_PACKAGE_SYSTEMD_COMPAT
 
 	  This option enables the installation of compatibility *.pc files.
 
-config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
-	bool "enable SMACK support"
-	select BR2_PACKAGE_ATTR
-	select BR2_PACKAGE_SMACK
+config BR2_PACKAGE_SYSTEMD_TMPFILES
+	default y
+	bool "enable tmpfiles support"
 	help
-	  Enable support for SMACK, the Simple Mandatory Access Control
-	  Kernel, a minimal approach to Access Control implemented as a kernel
-	  LSM.
-
-	  This feature requires a kernel >= 3.8.
+	  systemd-tmpfiles creates, deletes, and cleans up volatile and temporary
+	  files and directories, based on the configuration file format and location
+	  specified in tmpfiles.d(5).
 
-	  When this feature is enabled, Systemd mounts smackfs and manages
-	  security labels for sockets.
+	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
 
-config BR2_PACKAGE_SYSTEMD_HIBERNATE
-	bool "enable hibernation support"
+config BR2_PACKAGE_SYSTEMD_VCONSOLE
+	bool "enable vconsole tool"
 	help
-	  When this features is enabled, additional tools and services are built to
-	  support suspending and resuming the system.
+	  systemd-vconsole-setup is an early boot service that
+	  configures the virtual console font and console keymap.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-sleep.html
+	  http://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
 
 endif # BR2_PACKAGE_SYSTEMD
-- 
2.8.1
