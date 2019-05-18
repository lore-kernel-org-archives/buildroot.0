From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:16:04 +0200
Subject: [Buildroot] [git commit] system/Config.in: add new init - openrc
Message-ID: <20190602201234.8DEF781354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb77734d11db4a50f5e8a6757b673173f029e4e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is very basic settings for openrc init.

* system/Config.in
  Allows to select openrc as init system (which auto selects
  openrc-skeleton and openrc package).

* package/ifupdown-scripts/Config.in
  openrc has its own service to bring up/down interfaces, so
  ifupdown-scripts should not be enabled when openrc is enabled to
  prevent service clash.

Signed-off-by: Micha?? ??yszczek <michal.lyszczek@bofc.pl>
[Thomas: take into account the !BR2_STATIC_LIBS dependency]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ifupdown-scripts/Config.in |  2 +-
 package/openrc/Config.in           |  2 ++
 system/Config.in                   | 11 +++++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/ifupdown-scripts/Config.in b/package/ifupdown-scripts/Config.in
index 2f4b0d5467..4b984bc30c 100644
--- a/package/ifupdown-scripts/Config.in
+++ b/package/ifupdown-scripts/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_IFUPDOWN_SCRIPTS
 	bool "ifupdown scripts"
 	default y if BR2_ROOTFS_SKELETON_DEFAULT
-	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD
+	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD && !BR2_PACKAGE_OPENRC
 	help
 	  Set of scripts used by ifupdown (either the standalone one,
 	  or the busybox one) to bring network up, or tear it down.
diff --git a/package/openrc/Config.in b/package/openrc/Config.in
index 84c58b20c3..796858f404 100644
--- a/package/openrc/Config.in
+++ b/package/openrc/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPENRC
 	bool "openrc"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_INIT_OPENRC
 	select BR2_PACKAGE_NCURSES
 	help
 	  Init that works on top of pid 1 (for example
@@ -21,4 +22,5 @@ config BR2_PACKAGE_OPENRC
 
 comment "openrc needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_INIT_OPENRC
 	depends on BR2_STATIC_LIBS
diff --git a/system/Config.in b/system/Config.in
index 498b56e222..af7d8566d3 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -11,6 +11,7 @@ config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
 	select BR2_PACKAGE_SKELETON_INIT_SYSV if BR2_INIT_SYSV
 	select BR2_PACKAGE_SKELETON_INIT_SYSV if BR2_INIT_BUSYBOX
+	select BR2_PACKAGE_SKELETON_INIT_OPENRC if BR2_INIT_OPENRC
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_INIT_NONE
 	help
@@ -98,6 +99,16 @@ config BR2_INIT_SYSV
 	select BR2_PACKAGE_INITSCRIPTS
 	select BR2_PACKAGE_SYSVINIT
 
+config BR2_INIT_OPENRC
+	bool "OpenRC"
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_OPENRC
+
+comment "openrc needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
+
 # In Buildroot, we decided not to support a split-usr when systemd is
 # used as an init system. This is a design decision, not a systemd
 # issue. Thus the select is with BR2_INIT_SYSTEMD (below) rather than
