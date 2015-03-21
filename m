From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 21 Mar 2015 20:29:38 +0200
Subject: [Buildroot] [RFC 04/11] help entries for Init system config menu
In-Reply-To: <cover.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
Message-ID: <59dd22a7e64c77244596f858948db9e3d5b3f885.1426960081.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Primary focus is on (auto-)respawning and runtime control.
Background/foreground distinction is not mentioned,
since it is not likely to mean much for users making a choice here.
---
 system/Config.in | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 9973cc2..c0ee345 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -75,15 +75,46 @@ config BR2_TARGET_GENERIC_PASSWD_METHOD
 choice
 	prompt "Init system"
 	default BR2_INIT_BUSYBOX
+	help
+	  Upon bootup, kernel spawns init and init is expected
+	  to spawn anything else.
+
+	  Buildroot can pre-configure the target filesystem
+	  so that everything necessary to start the system
+	  is done and all installed daemons are started.
+
+	  There are several possible configurations providing
+	  varying degrees of control over the spawned processes.
 
 config BR2_INIT_BUSYBOX
 	bool "BusyBox"
 	select BR2_PACKAGE_BUSYBOX
+	help
+	  Minimalistic init implementation from busybox
+	  with systemV-style init scripts.
+
+	  No runlevel support.
+	  Daemons can be stopped or restarted at runtime.
+	  Daemons are started in background using scripts
+	  from /etc/init.d, and controlled using pid files.
+	  Failed processes are not respawned.
 
 config BR2_INIT_SYSV
 	bool "systemV"
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit
 	select BR2_PACKAGE_SYSVINIT
+	help
+	  System V init, probably the best-known init
+	  implementation in Linux, with simplified SysV-style
+	  initscripts.
+
+	  Supports runlevels, but this particular configuration
+	  does not use them.
+
+	  Daemons can be stopped or restarted at runtime.
+	  Daemons are started in background using scripts
+	  from /etc/init.d, and controlled using pid files.
+	  Failed processes are not respawned.
 
 config BR2_INIT_SYSTEMD
 	bool "systemd"
@@ -98,6 +129,27 @@ config BR2_INIT_SYSTEMD
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_SYSTEMD
+	help
+	  systemd is more that just an init implementation.
+	  It is a composite package handling most aspects
+	  of system initialization and daemon supervision.
+
+	  All daemons will be started in foreground mode,
+	  configured to be respawed on failure.
+
+	  Systemd uses arbitrary-named "targets" instead
+	  of systemV-style runlevels, and allows stopping and
+	  restarting daemons at runtime using systemctl command.
+
+	  Due its pervasiveness and extensive feature range,
+	  choosing systemd shapes the rest of the system.
+	  A systemd-based buildroot will differ little
+	  from any major systemd-based Linux distribution
+	  in pretty much any aspects of the boot process,
+	  initialization, runtime configuration and process
+	  supervision.
+
+	  Beware of its large size and numerous dependencies.
 
 comment 'systemd needs an (e)glibc toolchain, headers >= 3.7'
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
@@ -105,6 +157,12 @@ comment 'systemd needs an (e)glibc toolchain, headers >= 3.7'
 
 config BR2_INIT_NONE
 	bool "None"
+	help
+	  Do not install any kind of init system.
+
+	  Make sure your initrd and/or root fs skeleton provide
+	  some executable for kernel to start, otherwise
+	  the system will panic at boot.
 
 endchoice
 
-- 
2.0.3
