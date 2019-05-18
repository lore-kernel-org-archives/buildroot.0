From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 22:56:16 +0200
Subject: [Buildroot] [git commit branch/next] package/skeleton-init-openrc:
 new package
Message-ID: <20190518205047.9029F817BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a840e485d174c74bf2e4cd81ad48e184992cd3db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This basic skeleton is similar to skeleton-init-sysv.
All links in /var are same as in skeleton-init-sysv to be compatible
with current default filesystem scheme.

Exceptions:

* /dev/shm and /dev/pts dirs were removed, since they are created by
  openrc devfs service
* /etc/fstab does not need /dev/shm, /dev/pts and /sys entries
  becuse they are mounted by devfs and sysfs services respectively

Signed-off-by: Micha?? ??yszczek <michal.lyszczek@bofc.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/skeleton-init-openrc/Config.in             |  7 +++++++
 .../skeleton-init-openrc/skeleton-init-openrc.mk   | 22 ++++++++++++++++++++++
 package/skeleton-init-openrc/skeleton/dev/log      |  1 +
 package/skeleton-init-openrc/skeleton/etc/fstab    |  3 +++
 package/skeleton-init-openrc/skeleton/var/cache    |  1 +
 package/skeleton-init-openrc/skeleton/var/lib/misc |  1 +
 package/skeleton-init-openrc/skeleton/var/lock     |  1 +
 package/skeleton-init-openrc/skeleton/var/log      |  1 +
 package/skeleton-init-openrc/skeleton/var/run      |  1 +
 package/skeleton-init-openrc/skeleton/var/spool    |  1 +
 package/skeleton-init-openrc/skeleton/var/tmp      |  1 +
 13 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3b5d2faae2..59b47e38fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1616,6 +1616,7 @@ F:	board/pine64/rock64
 F:	configs/rock64_defconfig
 F:	configs/socrates_cyclone5_defconfig
 F:	package/openrc/
+F:	package/skeleton-init-openrc/
 
 N:	Michel Stempin <michel.stempin@wanadoo.fr>
 F:	board/licheepi/
diff --git a/package/Config.in b/package/Config.in
index ff07dce000..e5b26dd33f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -5,6 +5,7 @@ menu "Target packages"
 	source "package/skeleton-custom/Config.in"
 	source "package/skeleton-init-common/Config.in"
 	source "package/skeleton-init-none/Config.in"
+	source "package/skeleton-init-openrc/Config.in"
 	source "package/skeleton-init-systemd/Config.in"
 	source "package/skeleton-init-sysv/Config.in"
 
diff --git a/package/skeleton-init-openrc/Config.in b/package/skeleton-init-openrc/Config.in
new file mode 100644
index 0000000000..8f4dd17ebd
--- /dev/null
+++ b/package/skeleton-init-openrc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SKELETON_INIT_OPENRC
+	bool
+	select BR2_PACKAGE_HAS_SKELETON
+	select BR2_PACKAGE_SKELETON_INIT_COMMON
+
+config BR2_PACKAGE_PROVIDES_SKELETON
+	default "skeleton-init-openrc" if BR2_PACKAGE_SKELETON_INIT_OPENRC
diff --git a/package/skeleton-init-openrc/skeleton-init-openrc.mk b/package/skeleton-init-openrc/skeleton-init-openrc.mk
new file mode 100644
index 0000000000..5ee2192093
--- /dev/null
+++ b/package/skeleton-init-openrc/skeleton-init-openrc.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# skeleton-init-openrc
+#
+################################################################################
+
+# The skeleton can't depend on the toolchain, since all packages depends on the
+# skeleton and the toolchain is a target package, as is skeleton.
+# Hence, skeleton would depends on the toolchain and the toolchain would depend
+# on skeleton.
+SKELETON_INIT_OPENRC_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_INIT_OPENRC_ADD_SKELETON_DEPENDENCY = NO
+
+SKELETON_INIT_OPENRC_DEPENDENCIES = skeleton-init-common
+
+SKELETON_INIT_OPENRC_PROVIDES = skeleton
+
+define SKELETON_INIT_OPENRC_INSTALL_TARGET_CMDS
+	$(call SYSTEM_RSYNC,$(SKELETON_INIT_OPENRC_PKGDIR)/skeleton,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
diff --git a/package/skeleton-init-openrc/skeleton/dev/log b/package/skeleton-init-openrc/skeleton/dev/log
new file mode 120000
index 0000000000..d96b3b1cb8
--- /dev/null
+++ b/package/skeleton-init-openrc/skeleton/dev/log
@@ -0,0 +1 @@
+../tmp/log
\ No newline at end of file
diff --git a/package/skeleton-init-openrc/skeleton/etc/fstab b/package/skeleton-init-openrc/skeleton/etc/fstab
new file mode 100644
index 0000000000..3ec96cf634
--- /dev/null
+++ b/package/skeleton-init-openrc/skeleton/etc/fstab
@@ -0,0 +1,3 @@
+# <file system>	<mount pt>	<type>	<options>	<dump>	<pass>
+tmpfs		/tmp		tmpfs	mode=1777	0	0
+tmpfs		/run		tmpfs	mode=0755,nosuid,nodev	0	0
diff --git a/package/skeleton-init-openrc/skeleton/var/cache b/package/skeleton-init-openrc/skeleton/var/cache
new file mode 120000
index 0000000000..1431b0e432
--- /dev/null
+++ b/package/skeleton-init-openrc/skeleton/var/cache
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/package/skeleton-init-openrc/skeleton/var/lib/misc b/package/skeleton-init-openrc/skeleton/var/lib/misc
new file mode 120000
index 0000000000..f1fde8c107
--- /dev/null
+++ b/package/skeleton-init-openrc/skeleton/var/lib/misc
@@ -0,0 +1 @@
+../../tmp
\ No newline at end of file
diff --git a/package/skeleton-init-openrc/skeleton/var/lock b/package/skeleton-init-openrc/skeleton/var/lock
new file mode 120000
index 0000000000..1431b0e432
--- /dev/null
+++ b/package/skeleton-init-openrc/skeleton/var/lock
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/package/skeleton-init-openrc/skeleton/var/log b/package/skeleton-init-openrc/skeleton/var/log
new file mode 120000
index 0000000000..1431b0e432
--- /dev/null
+++ b/package/skeleton-init-openrc/skeleton/var/log
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/package/skeleton-init-openrc/skeleton/var/run b/package/skeleton-init-openrc/skeleton/var/run
new file mode 120000
index 0000000000..84ba55b912
--- /dev/null
+++ b/package/skeleton-init-openrc/skeleton/var/run
@@ -0,0 +1 @@
+../run
\ No newline at end of file
diff --git a/package/skeleton-init-openrc/skeleton/var/spool b/package/skeleton-init-openrc/skeleton/var/spool
new file mode 120000
index 0000000000..1431b0e432
--- /dev/null
+++ b/package/skeleton-init-openrc/skeleton/var/spool
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/package/skeleton-init-openrc/skeleton/var/tmp b/package/skeleton-init-openrc/skeleton/var/tmp
new file mode 120000
index 0000000000..1431b0e432
--- /dev/null
+++ b/package/skeleton-init-openrc/skeleton/var/tmp
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
