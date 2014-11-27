From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Nov 2014 19:41:49 -0300
Subject: [Buildroot] [PATCH] skeleton: make /run a proper
	directory/filesystem
Message-ID: <1417128109-25880-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Making /var/run and /run symlinks to /tmp is bad since the underlying
tmpfs filesystem is mode 1777 which leads to possible security attack
vectors via badly owned/mask-mode pidfiles and state files residing there.

So make /run a proper directory with /var/run symlinked to it.
Eventually all startup scripts and state info should be pointed to /run
directly as per the linux fhs and good practice.

Add a tmpfs filesystem entry for /run so that busybox inittab, systemv
inittab and systemd automount mounts it there to avoid breaking the
system.

While at it fix inconsistent spacing in /etc/fstab by using tabs and
drop the "static file system information" header whatever that means.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 system/skeleton/etc/fstab  | 17 ++++++++---------
 system/skeleton/run        |  1 -
 system/skeleton/run/.empty |  0
 system/skeleton/var/run    |  2 +-
 4 files changed, 9 insertions(+), 11 deletions(-)
 delete mode 120000 system/skeleton/run
 create mode 100644 system/skeleton/run/.empty

diff --git a/system/skeleton/etc/fstab b/system/skeleton/etc/fstab
index e000aad..2b418a0 100644
--- a/system/skeleton/etc/fstab
+++ b/system/skeleton/etc/fstab
@@ -1,9 +1,8 @@
-# /etc/fstab: static file system information.
-#
-# <file system> <mount pt>     <type>	<options>         <dump> <pass>
-/dev/root       /              ext2	rw,noauto         0      1
-proc		/proc	       proc     defaults	  0	 0
-devpts		/dev/pts       devpts   defaults,gid=5,mode=620	  0	 0
-tmpfs           /dev/shm       tmpfs    mode=0777         0      0
-tmpfs           /tmp           tmpfs    mode=1777         0      0
-sysfs		/sys	       sysfs    defaults	  0	 0
+# <file system>	<mount pt>	<type>	<options>	<dump>	<pass>
+/dev/root	/		ext2	rw,noauto	0	1
+proc		/proc		proc	defaults	0	0
+devpts		/dev/pts	devpts	defaults,gid=5,mode=620	0	0
+tmpfs		/dev/shm	tmpfs	mode=0777	0	0
+tmpfs		/tmp		tmpfs	mode=1777	0	0
+tmpfs		/run		tmpfs	mode=0755,nosuid,nodev	0	0
+sysfs		/sys		sysfs	defaults	0	0
diff --git a/system/skeleton/run b/system/skeleton/run
deleted file mode 120000
index 1c2f433..0000000
--- a/system/skeleton/run
+++ /dev/null
@@ -1 +0,0 @@
-tmp
\ No newline at end of file
diff --git a/system/skeleton/run/.empty b/system/skeleton/run/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/system/skeleton/var/run b/system/skeleton/var/run
index 1431b0e..84ba55b 120000
--- a/system/skeleton/var/run
+++ b/system/skeleton/var/run
@@ -1 +1 @@
-../tmp
\ No newline at end of file
+../run
\ No newline at end of file
-- 
2.0.4
