From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 24 Mar 2015 22:23:02 +0200
Subject: [Buildroot] [PATCH] help entries for Init system config menu
Message-ID: <20150324202302.GA4645@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Primary focus is on (auto-)respawning and runtime control.

Systemd entry describes current state, with several daemons
configured as forking.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
Patch split from the series since it does not depend on any
of the changes there.

 system/Config.in | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 9973cc2..59c759a 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -75,15 +75,40 @@ config BR2_TARGET_GENERIC_PASSWD_METHOD
 choice
 	prompt "Init system"
 	default BR2_INIT_BUSYBOX
+	help
+	  Upon bootup, kernel spawns init and init is expected
+	  to spawn anything else.
+
+	  Buildroot supports several alternative init implementations
+	  providing varying degrees of control over the spawned processes.
 
 config BR2_INIT_BUSYBOX
 	bool "BusyBox"
 	select BR2_PACKAGE_BUSYBOX
+	help
+	  Minimalistic init implementation from busybox
+	  with systemV-style init scripts.
+
+	  Runlevels are not supported.
+
+	  Daemons are started in background using scripts
+	  from /etc/init.d. Failed processes are not respawned.
+	  Pid files provide some control over running processes.
 
 config BR2_INIT_SYSV
 	bool "systemV"
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit
 	select BR2_PACKAGE_SYSVINIT
+	help
+	  System V init, probably the best-known init implementation
+	  in Linux, with simplified SysV-style initscripts.
+
+	  Supports runlevels, but buildroot does not use them.
+	  The system boots into the default runlevel and stays there.
+
+	  Daemons are started in background using scripts
+	  from /etc/init.d. Failed processes are not respawned.
+	  Pid files provide some control over running processes.
 
 config BR2_INIT_SYSTEMD
 	bool "systemd"
@@ -98,6 +123,29 @@ config BR2_INIT_SYSTEMD
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_SYSTEMD
+	help
+	  systemd is more that just an init implementation.
+	  It is a composite package handling most aspects
+	  of system initialization and daemon supervision.
+
+	  Systemd uses arbitrary-named "targets" instead
+	  of systemV-style runlevels. Daemons may be stopped
+	  and restarted using systemctl command. If configured
+	  so, failed processes are respawned.
+
+	  Whenever possible, package-supplied service files
+	  are used. Some daemons are configured to run in
+	  foreground and some run as background processes.
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
@@ -105,6 +153,12 @@ comment 'systemd needs an (e)glibc toolchain, headers >= 3.7'
 
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
