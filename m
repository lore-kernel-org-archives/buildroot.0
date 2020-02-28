From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri, 28 Feb 2020 09:18:59 +0100
Subject: [Buildroot] [PATCH] package/lvm2: lvmetad systemd integration
Message-ID: <20200228081859.4237-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pascal de Bruijn <pmjdebruijn@pcode.nl>

lvmetad is usually combined with event-based system services that
automatically run pvscan --cache on disks added or removed.  This
way, the cache is automatically updated with metadata from new disks
when they appear.  LVM udev rules and systemd services implement this
automation.  Automatic scanning is usually combined with automatic
activation.  For more information, see pvscan(8).

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/lvm2/Config.in | 14 ++++++++++++++
 package/lvm2/lvm2.mk   |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index de5b972e99..1588a45f36 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -44,6 +44,20 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 	help
 	  Install application library (liblvm2app).
 
+config BR2_PACKAGE_LVM2_LVMETAD
+	bool "install lvmetad"
+	depends on BR2_PACKAGE_SYSTEMD
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
index 43370b03bf..6b866ce92b 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -54,6 +54,14 @@ else
 LVM2_CONF_OPTS += --disable-applib
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+LVM2_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install install_systemd_units install_systemd_generators
+endif
+
+ifeq ($(BR2_PACKAGE_LVM2_LVMETAD),y)
+LVM2_CONF_OPTS += --enable-lvmetad
+endif
+
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LVM2_CONF_ENV += ac_cv_flag_HAVE_PIE=no
 endif
-- 
2.17.1
