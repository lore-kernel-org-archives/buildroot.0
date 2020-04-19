From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 22:39:58 +0200
Subject: [Buildroot] [git commit] package/lvm2: lvmetad integration
Message-ID: <20200419202551.097888F2A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9889b8ce7fcef50fb5089f6e3e84b54f730d0ca6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lvmetad is usually combined with event-based system services that
automatically run pvscan --cache on disks added or removed.  This
way, the cache is automatically updated with metadata from new disks
when they appear.  LVM udev rules and systemd services implement this
automation.  Automatic scanning is usually combined with automatic
activation.  For more information, see pvscan(8).

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lvm2/Config.in | 13 +++++++++++++
 package/lvm2/lvm2.mk   |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index de5b972e99..a41bb053b5 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -47,6 +47,19 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 comment "lvm2 application library needs a glibc or uClibc toolchain"
 	depends on BR2_TOOLCHAIN_USES_MUSL
 
+config BR2_PACKAGE_LVM2_LVMETAD
+	bool "install lvmetad"
+	select BR2_PACKAGE_LVM2_APP_LIBRARY
+	help
+	  Install lvmetad
+
+	  The lvmetad daemon caches LVM metadata so that LVM commands
+	  can read metadata from the cache rather than scanning disks.
+	  This can be an advantage because scanning disks is time
+	  consuming and may interfere with the normal work of the
+	  system.  lvmetad can be a disadvantage when disk event
+	  notifications from the system are unreliable.
+
 endif
 
 comment "lvm2 needs a toolchain w/ threads, dynamic library"
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 02c758ea08..76f800a15b 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -60,6 +60,12 @@ else
 LVM2_CONF_OPTS += --disable-applib
 endif
 
+ifeq ($(BR2_PACKAGE_LVM2_LVMETAD),y)
+LVM2_CONF_OPTS += --enable-lvmetad
+else
+LVM2_CONF_OPTS += --disable-lvmetad
+endif
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 LVM2_INSTALL_TARGET_OPTS += install_systemd_units install_systemd_generators
 endif
