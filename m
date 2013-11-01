From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 15:42:37 +0100
Subject: [Buildroot] [git commit] sysvinit: install new cmds and fix inittab
Message-ID: <20131104211054.C40519BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21ef3200ef9bda514f5bebe706e9768d213836ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding support for sysvinit to install reboot, poweroff, and pidof
commands available in /sbin.

Fixes bug #6620

Removed uninstall commands since they aren't used.

There is an error with sysvinit that will prevent the system from booting
if "dshm::sysinit:/bin/mkdir -p /dev/shm" is not present in the inittab.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
