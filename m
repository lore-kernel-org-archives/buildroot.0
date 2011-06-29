From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 29 Jun 2011 15:46:16 +0200
Subject: [Buildroot] [PATCH 1/6] Create and mount /dev/shm
Message-ID: <1309355181-21048-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The /dev/shm directory is neither created nor mounted as tmpfs as boot
time. This will cause troubles when using named semaphores on the
system.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 fs/skeleton/etc/fstab   |    1 +
 fs/skeleton/etc/inittab |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/fstab b/fs/skeleton/etc/fstab
index 87d9da0..a2f56ff 100644
--- a/fs/skeleton/etc/fstab
+++ b/fs/skeleton/etc/fstab
@@ -4,5 +4,6 @@
 /dev/root       /              ext2	rw,noauto         0      1
 proc		/proc	       proc     defaults	  0	 0
 devpts		/dev/pts       devpts   defaults,gid=5,mode=620	  0	 0
+tmpfs           /dev/shm       tmpfs    mode=0777         0      0
 tmpfs           /tmp           tmpfs    defaults          0      0
 sysfs		/sys	       sysfs    defaults	  0	 0
diff --git a/fs/skeleton/etc/inittab b/fs/skeleton/etc/inittab
index b1e5c16..0e50467 100644
--- a/fs/skeleton/etc/inittab
+++ b/fs/skeleton/etc/inittab
@@ -17,6 +17,7 @@
 null::sysinit:/bin/mount -t proc proc /proc
 null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mkdir -p /dev/pts
+null::sysinit:/bin/mkdir -p /dev/shm
 null::sysinit:/bin/mount -a
 null::sysinit:/bin/hostname -F /etc/hostname
 # now run any rc scripts
-- 
1.7.4.1
