From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Thu,  9 May 2019 00:09:27 +0200
Subject: [Buildroot] [PATCH 03/13] system/Config.in: add new init - openrc
In-Reply-To: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
References: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
Message-ID: <20190508220937.23200-3-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is very basic settings for openrc init.

* system/Config.in
  Allows to select openrc as init system (which auto selects
  openrc-skeleton and openrc package).

* package/ifupdown-scripts/Config.in
  openrc has its own service to bring up/down interfaces, so
  ifupdown-scripts should not be enabled when openrc is enabled to
  prevent service clash.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
---
 package/ifupdown-scripts/Config.in | 2 +-
 package/openrc/Config.in           | 1 +
 system/Config.in                   | 6 ++++++
 3 files changed, 8 insertions(+), 1 deletion(-)

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
index e98ed624c9..2dbcb68e99 100644
--- a/package/openrc/Config.in
+++ b/package/openrc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENRC
 	bool "OpenRC"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_INIT_OPENRC
 	help
 	  Init that works on top of pid 1 (for example openrc-init). By default
 	  it does quite a lot on startup (like setting hwclock, mounting
diff --git a/system/Config.in b/system/Config.in
index 498b56e222..808fc070f3 100644
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
@@ -98,6 +99,11 @@ config BR2_INIT_SYSV
 	select BR2_PACKAGE_INITSCRIPTS
 	select BR2_PACKAGE_SYSVINIT
 
+config BR2_INIT_OPENRC
+	bool "OpenRC"
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_OPENRC
+
 # In Buildroot, we decided not to support a split-usr when systemd is
 # used as an init system. This is a design decision, not a systemd
 # issue. Thus the select is with BR2_INIT_SYSTEMD (below) rather than
-- 
2.18.1
