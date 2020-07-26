From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 26 Jul 2020 22:24:48 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/systemd: pre-create directories
 for services
Message-ID: <20200726202449.7108-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

various services need directories in /var when they are started,
and create them if necessary. Creating those before, allows
those services to start even if /var is read-only.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2:
-    dont use a new hook, use SYSTEMD_PERMISSIONS
-    no conditionals, but variables that are set or not
---
 package/systemd/systemd.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c49922d78f..42da1c889f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -317,12 +317,14 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
 SYSTEMD_CONF_OPTS += -Dlogind=true
+SYSTEMD_LOGIND_PERMISSIONS = /var/lib/systemd/linger d 755 0 0 - - - - -
 else
 SYSTEMD_CONF_OPTS += -Dlogind=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_MACHINED),y)
 SYSTEMD_CONF_OPTS += -Dmachined=true -Dnss-mymachines=true
+SYSTEMD_MACHINED_PERMISSIONS = /var/lib/machines d 700 0 0 - - - - -
 else
 SYSTEMD_CONF_OPTS += -Dmachined=false -Dnss-mymachines=false
 endif
@@ -336,6 +338,7 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_HOMED),y)
 SYSTEMD_CONF_OPTS += -Dhomed=true
 SYSTEMD_DEPENDENCIES += cryptsetup openssl
+SYSTEMD_HOMED_PERMISSIONS = /var/lib/systemd/home d 755 0 0 - - - - -
 else
 SYSTEMD_CONF_OPTS += -Dhomed=false
 endif
@@ -380,12 +383,14 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
 SYSTEMD_CONF_OPTS += -Dcoredump=true
 SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * - - - systemd core dump processing
+SYSTEMD_HOMED_PERMISSIONS = /var/lib/systemd/coredump d 755 0 0 - - - - -
 else
 SYSTEMD_CONF_OPTS += -Dcoredump=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_PSTORE),y)
 SYSTEMD_CONF_OPTS += -Dpstore=true
+SYSTEMD_PSTORE_PERMISSIONS = /var/lib/systemd/pstore d 755 0 0 - - - - -
 else
 SYSTEMD_CONF_OPTS += -Dpstore=false
 endif
@@ -436,6 +441,7 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPTS += -Dtimesyncd=true
 SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - systemd Time Synchronization
+SYSTEMD_TIMESYNCD_PERMISSIONS = /var/lib/systemd/timesync d 755 systemd-timesync systemd-timesync - - - - -
 else
 SYSTEMD_CONF_OPTS += -Dtimesyncd=false
 endif
@@ -503,6 +509,19 @@ define SYSTEMD_INSTALL_IMAGES_CMDS
 	$(SYSTEMD_INSTALL_BOOT_FILES)
 endef
 
+define SYSTEMD_PERMISSIONS
+	/var/spool d 755 0 0 - - - - -
+	/var/lib d 755 0 0 - - - - -
+	/var/lib/private d 700 0 0 - - - - -
+	/var/log/private d 700 0 0 - - - - -
+	/var/cache/private d 700 0 0 - - - - -
+	$(SYSTEMD_LOGIND_PERMISSIONS)
+	$(SYSTEMD_MACHINED_PERMISSIONS)
+	$(SYSTEMD_HOMED_PERMISSIONS)
+	$(SYSTEMD_PSTORE_PERMISSIONS)
+	$(SYSTEMD_TIMESYNCD_PERMISSIONS)
+endef
+
 define SYSTEMD_USERS
 	# udev user groups
 	- - input -1 * - - - Input device group
-- 
2.27.0
