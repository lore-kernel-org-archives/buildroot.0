From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 01:24:11 +0200
Subject: [Buildroot] [git commit] system/inittab: update to fix bug #7442
Message-ID: <20141024232902.1F308B0BC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bcb835b042d385bac801e00cff2f1dbacff93629
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update inittabs (skeleton/busybox & sysvinit) to remove the trailing
REMOUNT_ROOTFS_RW comment used as magic string in system/system.mk to
enable/disable remounting the root filesystem rw or not since it affects
sysvinit in doing so properly as reported in bug #7442.

Instead update the sed expressions to match clean non-commented strings
by searching for "-o remount,rw /" and checking that's the end of the
line as well to avoid affecting possibly other remounts that a user can
have in a custom inittab.

Long-term the startup block of inittab should just move to a S00sysinit
script or similar so that rcS can pick it up directly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysvinit/inittab    |    2 +-
 system/skeleton/etc/inittab |    2 +-
 system/system.mk            |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index d3de4a7..fd0d2f0 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -5,7 +5,7 @@
 id:1:initdefault:
 
 proc::sysinit:/bin/mount -t proc proc /proc
-rwmo::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
+rwmo::sysinit:/bin/mount -o remount,rw /
 dpts::sysinit:/bin/mkdir -p /dev/pts
 dshm::sysinit:/bin/mkdir -p /dev/shm
 moun::sysinit:/bin/mount -a
diff --git a/system/skeleton/etc/inittab b/system/skeleton/etc/inittab
index 85881f4..99d84e4 100644
--- a/system/skeleton/etc/inittab
+++ b/system/skeleton/etc/inittab
@@ -15,7 +15,7 @@
 
 # Startup the system
 null::sysinit:/bin/mount -t proc proc /proc
-null::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
+null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mkdir -p /dev/pts
 null::sysinit:/bin/mkdir -p /dev/shm
 null::sysinit:/bin/mount -a
diff --git a/system/system.mk b/system/system.mk
index 5802e2d..e4a3160 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -79,12 +79,12 @@ endif
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 # Find commented line, if any, and remove leading '#'s
 define SYSTEM_REMOUNT_RW
-	$(SED) '/^#.*# REMOUNT_ROOTFS_RW$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
+	$(SED) '/^#.*-o remount,rw \/$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
 endef
 else
 # Find uncommented line, if any, and add a leading '#'
 define SYSTEM_REMOUNT_RW
-	$(SED) '/^[^#].*# REMOUNT_ROOTFS_RW$$/s~^~#~' $(TARGET_DIR)/etc/inittab
+	$(SED) '/^[^#].*-o remount,rw \/$$/s~^~#~' $(TARGET_DIR)/etc/inittab
 endef
 endif
 TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_RW
