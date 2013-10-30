From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 30 Oct 2013 17:55:32 -0500
Subject: [Buildroot] [PATCH v2 1/1] sysvinit: install new cmds and fix
	inittab
Message-ID: <1383173732-19980-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding support for sysvinit to install reboot, poweroff, and pidof
commands available in /sbin.

Fixes bug #6620

Removed uninstall commands since they aren't used.

There is an error with sysvinit that will prevent the system from booting
if "dshm::sysinit:/bin/mkdir -p /dev/shm" is not present in the inittab.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/sysvinit/inittab     |    1 +
 package/sysvinit/sysvinit.mk |   11 ++++-------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index afa0dc3..c85e75a 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -7,6 +7,7 @@ id:1:initdefault:
 proc::sysinit:/bin/mount -t proc proc /proc
 rwmo::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
 dpts::sysinit:/bin/mkdir -p /dev/pts
+dshm::sysinit:/bin/mkdir -p /dev/shm
 moun::sysinit:/bin/mount -a
 host::sysinit:/bin/hostname -F /etc/hostname
 init::sysinit:/etc/init.d/rcS
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 131c63f..07bfc6f 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -31,18 +31,15 @@ define SYSVINIT_BUILD_CMDS
 endef
 
 define SYSVINIT_INSTALL_TARGET_CMDS
-	for x in halt init shutdown; do \
+	for x in halt init shutdown killall5; do \
 		install -D -m 0755 $(@D)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
 	done
 	# Override Busybox's inittab with an inittab compatible with
 	# sysvinit
 	install -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
-endef
-
-define SYSVINIT_UNINSTALL_TARGET_CMDS
-	for x in halt init shutdown; do \
-		rm -f $(TARGET_DIR)/sbin/$$x || exit 1; \
-	done
+	ln -sf /sbin/halt $(TARGET_DIR)/sbin/reboot
+	ln -sf /sbin/halt $(TARGET_DIR)/sbin/poweroff
+	ln -sf killall5 $(TARGET_DIR)/sbin/pidof
 endef
 
 define SYSVINIT_CLEAN_CMDS
-- 
1.7.1
