From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Mon,  2 Mar 2020 08:49:50 +0100
Subject: [Buildroot] [PATCH 2/2] package/lvm2: lvmetad integration
Message-ID: <20200302074950.4710-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lvmetad is usually combined with event-based system services that
automatically run pvscan --cache on disks added or removed.  This
way, the cache is automatically updated with metadata from new disks
when they appear.  LVM udev rules and systemd services implement this
automation.  Automatic scanning is usually combined with automatic
activation.  For more information, see pvscan(8).

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/lvm2/Config.in | 13 +++++++++++++
 package/lvm2/lvm2.mk   |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index de5b972e99..af8b718b10 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -44,6 +44,19 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 	help
 	  Install application library (liblvm2app).
 
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
 comment "lvm2 application library needs a glibc or uClibc toolchain"
 	depends on BR2_TOOLCHAIN_USES_MUSL
 
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
-- 
2.17.1
