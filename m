From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  3 Oct 2015 23:42:21 +0200
Subject: [Buildroot] [PATCH] skeleton: Have a portable remount RW/RO
Message-ID: <1443908541-26513-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With systemd, inittab is useless, but it's also where we stored a 'mount
-o remount ...' to toggle the rootfs ro/rw at the demand of the user.

Instead, doing a simple 'mount -a -o remount' should change the flag of
every mountpoint by reading /etc/fstab.

Therefore, we now modify /etc/fstab, which happens to be read by systemd
also and so, everyone benefits.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/busybox/inittab      | 3 +--
 package/skeleton/skeleton.mk | 8 ++++----
 package/sysvinit/inittab     | 3 +--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/busybox/inittab b/package/busybox/inittab
index b1892c1..2a6b5cf 100644
--- a/package/busybox/inittab
+++ b/package/busybox/inittab
@@ -15,10 +15,9 @@
 
 # Startup the system
 null::sysinit:/bin/mount -t proc proc /proc
-null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mkdir -p /dev/pts
 null::sysinit:/bin/mkdir -p /dev/shm
-null::sysinit:/bin/mount -a
+null::sysinit:/bin/mount -a -o remount
 null::sysinit:/bin/hostname -F /etc/hostname
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 48e7085..0409f2a 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -142,14 +142,14 @@ endif
 
 ifeq ($(BR2_INIT_BUSYBOX)$(BR2_INIT_SYSV),y)
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
-# Find commented line, if any, and remove leading '#'s
+# Find 'ro,' (avoid 'root') in the first line and change it to 'rw,'
 define SKELETON_SYSTEM_REMOUNT_RW
-	$(SED) '/^#.*-o remount,rw \/$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
+	$(SED) 0,/ro\,/{s/ro\,/rw\,/} $(TARGET_DIR)/etc/fstab
 endef
 else
-# Find uncommented line, if any, and add a leading '#'
+# Find rw on the first line and change it to ro
 define SKELETON_SYSTEM_REMOUNT_RW
-	$(SED) '/^[^#].*-o remount,rw \/$$/s~^~#~' $(TARGET_DIR)/etc/inittab
+	$(SED) 0,/rw/{s/rw/ro/} $(TARGET_DIR)/etc/fstab
 endef
 endif
 TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_REMOUNT_RW
diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index fc0c9b5..4b8cfd7 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -5,10 +5,9 @@
 id:3:initdefault:
 
 si0::sysinit:/bin/mount -t proc proc /proc
-si1::sysinit:/bin/mount -o remount,rw /
 si2::sysinit:/bin/mkdir -p /dev/pts
 si3::sysinit:/bin/mkdir -p /dev/shm
-si4::sysinit:/bin/mount -a
+si4::sysinit:/bin/mount -a -o remount
 si5::sysinit:/bin/hostname -F /etc/hostname
 si6::sysinit:/etc/init.d/rcS
 
-- 
2.5.3
