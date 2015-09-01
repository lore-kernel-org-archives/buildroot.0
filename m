From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 1 Sep 2015 15:53:46 +0100
Subject: [Buildroot] [PATCH] systemd: override the path for kill, sulogin,
	mount and umount
Message-ID: <1441119226-65256-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On distros where /bin and /sbin are symlinks to their counterparts in
/usr, systemd finds kill, sulogin, mount and umount under /usr/bin or
/usr/sbin. We need to override the path for those programs and set the
ones that systemd will find in Buildroot. Otherwise we will end up with
a broken systemd causing errors like this one:

[   15.152482] mount[81]: dev-mqueue.mount: Failed at step EXEC spawning
/usr/bin/mount: No such file or directory

Or this one:

emergency.service: Executing: /bin/sh -c '/usr/bin/sulogin;
/bin/systemctl --job-mode=fail --no-block default' /bin/sh:
/usr/bin/sulogin: not found

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/systemd/systemd.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b62fc08..24c4373 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -51,6 +51,16 @@ SYSTEMD_CONF_ENV = \
 	CFLAGS="$(SYSTEMD_CFLAGS)" \
 	ac_cv_path_KMOD=/usr/bin/kmod
 
+# On distros where /bin and /sbin are symlinks to their counterparts in
+# /usr, systemd finds kill, sulogin, mount and umount under /usr/bin or
+# /usr/sbin. We need to override the path for those programs and set the
+# ones that systemd will find in Buildroot.
+SYSTEMD_CONF_ENV += \
+	ac_cv_path_KILL=/bin/kill \
+	ac_cv_path_SULOGIN=/sbin/sulogin \
+	ac_cv_path_MOUNT_PATH=/bin/mount \
+	ac_cv_path_UMOUNT_PATH=/bin/umount
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_COMPAT),y)
 SYSTEMD_CONF_OPTS += --enable-compat-libs
 else
-- 
1.7.1
