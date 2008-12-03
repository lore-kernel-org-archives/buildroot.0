From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 14:25:22 -0500 (EST)
Subject: [Buildroot] [PATCH] avoid mount time warnings with default skeletons
Message-ID: <alpine.LFD.2.00.0812031424510.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The busybox mount doesn't like extra flags along side with "defaults",
which in that case is redundant anyway.

Also mount /proc before remounting / read-write so /etc/mtab returns
something.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: target/generic/target_busybox_skeleton/etc/fstab
===================================================================
--- target/generic/target_busybox_skeleton/etc/fstab	(revision 24219)
+++ target/generic/target_busybox_skeleton/etc/fstab	(working copy)
@@ -1,9 +1,9 @@
 # /etc/fstab: static file system information.
 #
 # <file system> <mount pt>     <type>	<options>         <dump> <pass>
 /dev/root       /              ext2	rw,noauto         0      1
 proc		/proc	       proc     defaults	  0	 0
-devpts		/dev/pts       devpts   defaults,gid=5,mode=620	  0	 0
+devpts		/dev/pts       devpts   gid=5,mode=620	  0	 0
 tmpfs           /tmp           tmpfs    defaults          0      0
 configfs	/config	       configfs defaults	  0	 0
 sysfs		/sys	       sysfs    defaults	  0	 0
Index: target/generic/target_skeleton/etc/inittab
===================================================================
--- target/generic/target_skeleton/etc/inittab	(revision 24219)
+++ target/generic/target_skeleton/etc/inittab	(working copy)
@@ -14,8 +14,8 @@
 # process   == program to run
 
 # Startup the system
+null::sysinit:/bin/mount -t proc proc /proc
 null::sysinit:/bin/mount -o remount,rw /
-null::sysinit:/bin/mount -t proc proc /proc
 null::sysinit:/bin/mount -a
 null::sysinit:/bin/hostname -F /etc/hostname
 null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
Index: target/generic/target_skeleton/etc/fstab
===================================================================
--- target/generic/target_skeleton/etc/fstab	(revision 24219)
+++ target/generic/target_skeleton/etc/fstab	(working copy)
@@ -1,8 +1,8 @@
 # /etc/fstab: static file system information.
 #
 # <file system> <mount pt>     <type>	<options>         <dump> <pass>
 /dev/root       /              ext2	rw,noauto         0      1
 proc		/proc	       proc     defaults	  0	 0
-devpts		/dev/pts       devpts   defaults,gid=5,mode=620	  0	 0
+devpts		/dev/pts       devpts   gid=5,mode=620	  0	 0
 tmpfs           /tmp           tmpfs    defaults          0      0
 sysfs		/sys	       sysfs    defaults	  0	 0
