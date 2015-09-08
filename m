From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue,  8 Sep 2015 23:28:49 +0200
Subject: [Buildroot] [RFC 1/6] Move mounting /sys from fstab to inittab
In-Reply-To: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1441747734-18730-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We are going to launch mdev from inittab, to have dynamic /dev without
devtmpfs. However, mdev needs /sys to detect devices.

So, mount /sys before the place where mdev will be activated.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/busybox/inittab   |  1 +
 package/sysvinit/inittab  | 13 +++++++------
 system/skeleton/etc/fstab |  1 -
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/busybox/inittab b/package/busybox/inittab
index b1892c1..6703fc5 100644
--- a/package/busybox/inittab
+++ b/package/busybox/inittab
@@ -15,6 +15,7 @@
 
 # Startup the system
 null::sysinit:/bin/mount -t proc proc /proc
+null::sysinit:/bin/mount -t sysfs sysfs /sys
 null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mkdir -p /dev/pts
 null::sysinit:/bin/mkdir -p /dev/shm
diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index fc0c9b5..6ebf6fa 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -5,12 +5,13 @@
 id:3:initdefault:
 
 si0::sysinit:/bin/mount -t proc proc /proc
-si1::sysinit:/bin/mount -o remount,rw /
-si2::sysinit:/bin/mkdir -p /dev/pts
-si3::sysinit:/bin/mkdir -p /dev/shm
-si4::sysinit:/bin/mount -a
-si5::sysinit:/bin/hostname -F /etc/hostname
-si6::sysinit:/etc/init.d/rcS
+si1::sysinit:/bin/mount -t sysfs sysfs /sys
+si2::sysinit:/bin/mount -o remount,rw /
+si3::sysinit:/bin/mkdir -p /dev/pts
+si4::sysinit:/bin/mkdir -p /dev/shm
+si5::sysinit:/bin/mount -a
+si6::sysinit:/bin/hostname -F /etc/hostname
+si7::sysinit:/etc/init.d/rcS
 
 # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
 
diff --git a/system/skeleton/etc/fstab b/system/skeleton/etc/fstab
index 2b418a0..489f256 100644
--- a/system/skeleton/etc/fstab
+++ b/system/skeleton/etc/fstab
@@ -5,4 +5,3 @@ devpts		/dev/pts	devpts	defaults,gid=5,mode=620	0	0
 tmpfs		/dev/shm	tmpfs	mode=0777	0	0
 tmpfs		/tmp		tmpfs	mode=1777	0	0
 tmpfs		/run		tmpfs	mode=0755,nosuid,nodev	0	0
-sysfs		/sys		sysfs	defaults	0	0
-- 
1.9.1
