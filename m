From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Sep 2013 20:04:16 -0500
Subject: [Buildroot] [PATCH 02/10] sysvinit: install new cmds and fix inittab
In-Reply-To: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1378429464-12546-3-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding support for sysvinit to install reboot and poweroff commands
available in /sbin.

There is an error with sysvinit that will prevent the system from booting
if "dshm::sysinit:/bin/mkdir -p /dev/shm" is not present in the inittab.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/sysvinit/inittab     |    1 +
 package/sysvinit/sysvinit.mk |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

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
index 65cbf17..c6b75a0 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -41,12 +41,16 @@ define SYSVINIT_INSTALL_TARGET_CMDS
 	# Override Busybox's inittab with an inittab compatible with
 	# sysvinit
 	install -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
+	ln -sf /sbin/halt $(TARGET_DIR)/sbin/reboot
+	ln -sf /sbin/halt $(TARGET_DIR)/sbin/poweroff
 endef
 
 define SYSVINIT_UNINSTALL_TARGET_CMDS
 	for x in halt init shutdown; do \
 		rm -f $(TARGET_DIR)/sbin/$$x || exit 1; \
 	done
+	rm -f $(TARGET_DIR)/sbin/reboot || exit 1
+	rm -f $(TARGET_DIR)/sbin/poweroff || exit 1
 endef
 
 define SYSVINIT_CLEAN_CMDS
-- 
1.7.1
