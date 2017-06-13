From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Jun 2017 23:41:08 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/systemd: fix
	paths to runtime utilities
Message-ID: <20170613214150.3272E7FEE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aaa641f775831eb5b8c966ecd4016b08e40cc9ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

systemd's configure is looking in $PATH to find utilities that will be
needed at runtime.

Usually, those utilties, when installed on the host, will be found in
the same path they would be present on the target. For example,
/usr/bin/mount on the host would also be /usr/bin/mount on the target,
and all is find.

Except when we need to install a host variant of util-linux, which will
install mount in $(HOST_DIR), in which case systemd's configure would
find that one.

Of course, it is also very well possible that those utilities are not
installed on the host in the same location they would be on the target,
in case a user has manually installed some of those (e.g. in /usr/local/
or in /opt/)

Forcibly set the path to those utilities, as they are expected to be on
the target.

For kexec, we can set it even though we do not depend on it (yet).
systemd will appropriately test it at runtime.

For quota, we point to non-existing files, so as to catch errors at
runtime. It is to be noted that quotacheck is optional, while quotaon
does not seem to be (a service file is always installed, that uses it).

Note: utilties listed in the order they appear in configure.ac

Reported-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 68986ea30146bb00660e802c438a73ee58072365)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index f1ddfaf..ce2e9ff 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -46,10 +46,16 @@ SYSTEMD_CONF_OPTS += \
 
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-lto
 
-# Override path to kmod, used in kmod-static-nodes.service
+# Override paths to a few utilities needed at runtime, to
+# avoid finding those we would install in $(HOST_DIR).
 SYSTEMD_CONF_ENV = \
 	CFLAGS="$(SYSTEMD_CFLAGS)" \
-	ac_cv_path_KMOD=/usr/bin/kmod
+	ac_cv_path_KILL=/usr/bin/kill \
+	ac_cv_path_KMOD=/usr/bin/kmod \
+	ac_cv_path_KEXEC=/usr/sbin/kexec \
+	ac_cv_path_SULOGIN=/usr/sbin/sulogin \
+	ac_cv_path_MOUNT_PATH=/usr/bin/mount \
+	ac_cv_path_UMOUNT_PATH=/usr/bin/umount
 
 define SYSTEMD_RUN_INTLTOOLIZE
 	cd $(@D) && $(HOST_DIR)/usr/bin/intltoolize --force --automake
@@ -182,8 +188,14 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_QUOTACHECK),y)
 SYSTEMD_CONF_OPTS += --enable-quotacheck
+SYSTEMD_CONF_ENV += \
+	ac_cv_path_QUOTAON=/usr/sbin/quotaon \
+	ac_cv_path_QUOTACHECK=/usr/sbin/quotacheck
 else
 SYSTEMD_CONF_OPTS += --disable-quotacheck
+SYSTEMD_CONF_ENV += \
+	ac_cv_path_QUOTAON=/.missing \
+	ac_cv_path_QUOTACHECK=/.missing
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
