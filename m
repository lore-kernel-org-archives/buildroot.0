From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 16 Feb 2007 06:32:24 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/busybox
	target/device/x86/i386 t etc...
Message-ID: <20070216143224.7E54248564@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-16 06:32:22 -0800 (Fri, 16 Feb 2007)
New Revision: 17907

Log:
- add skeleton to use busybox and mdev for a rather small skeleton


Added:
   trunk/buildroot/target/generic/mini_device_table.txt
   trunk/buildroot/target/generic/target_busybox_skeleton/config/
   trunk/buildroot/target/generic/target_busybox_skeleton/tmp/
   trunk/buildroot/target/generic/target_busybox_skeleton/usr/
   trunk/buildroot/target/generic/target_busybox_skeleton/usr/sbin/

Modified:
   trunk/buildroot/package/busybox/Config.in
   trunk/buildroot/package/busybox/busybox.mk
   trunk/buildroot/target/device/x86/i386/busybox.config
   trunk/buildroot/target/generic/Makefile.in
   trunk/buildroot/target/generic/target_busybox_skeleton/etc/fstab
   trunk/buildroot/target/generic/target_busybox_skeleton/etc/inittab


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-02-16 13:11:04 UTC (rev 17906)
+++ trunk/buildroot/package/busybox/Config.in	2007-02-16 14:32:22 UTC (rev 17907)
@@ -74,3 +74,11 @@
 	  Do not show packages in menuconfig that are potentially provided
 	  by busybox.
 
+config BR2_PACKAGE_BUSYBOX_SKELETON
+	bool "use minimal target skeleton"
+	depends on BR2_PACKAGE_BUSYBOX
+	depends on !BR2_BUSYBOX_VERSION_1_0_1
+	help
+	  Use a minimal target skeleton. Make sure to select mdev
+	  which is used to populate /dev/.
+

Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-02-16 13:11:04 UTC (rev 17906)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-02-16 14:32:22 UTC (rev 17907)
@@ -98,6 +98,10 @@
 	$(SED) "s/^.*CONFIG_LFS.*/CONFIG_LFS=n/;" $(BUSYBOX_DIR)/.config
 	$(SED) "s/^.*FDISK_SUPPORT_LARGE_DISKS.*/FDISK_SUPPORT_LARGE_DISKS=n/;" $(BUSYBOX_DIR)/.config
 endif
+ifeq ($(BR2_PACKAGE_BUSYBOX_SKELETON),y)
+	# force mdev on
+	$(SED) "s/^.*CONFIG_MDEV.*/CONFIG_MDEV=y/" $(BUSYBOX_DIR)/.config
+endif
 	yes "" | $(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" -C $(BUSYBOX_DIR) oldconfig
 	touch $@

Modified: trunk/buildroot/target/device/x86/i386/busybox.config
===================================================================
--- trunk/buildroot/target/device/x86/i386/busybox.config	2007-02-16 13:11:04 UTC (rev 17906)
+++ trunk/buildroot/target/device/x86/i386/busybox.config	2007-02-16 14:32:22 UTC (rev 17907)
@@ -638,7 +638,7 @@
 # CONFIG_ASH_MAIL is not set
 CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
 # CONFIG_ASH_RANDOM_SUPPORT is not set
-# CONFIG_ASH_EXPAND_PRMT is not set
+CONFIG_ASH_EXPAND_PRMT=y
 # CONFIG_HUSH is not set
 # CONFIG_LASH is not set
 # CONFIG_MSH is not set

Modified: trunk/buildroot/target/generic/Makefile.in
===================================================================
--- trunk/buildroot/target/generic/Makefile.in	2007-02-16 13:11:04 UTC (rev 17906)
+++ trunk/buildroot/target/generic/Makefile.in	2007-02-16 14:32:22 UTC (rev 17907)
@@ -4,6 +4,6 @@
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_SKELETON),y)
 TARGET_SKELETON=target/generic/target_busybox_skeleton
-TARGET_DEVICE_TABLE=
+TARGET_DEVICE_TABLE=target/generic/mini_device_table.txt
 endif
 

Added: trunk/buildroot/target/generic/mini_device_table.txt
===================================================================
--- trunk/buildroot/target/generic/mini_device_table.txt	                        (rev 0)
+++ trunk/buildroot/target/generic/mini_device_table.txt	2007-02-16 14:32:22 UTC (rev 17907)
@@ -0,0 +1,174 @@
+# When building a target filesystem, it is desirable to not have to
+# become root and then run 'mknod' a thousand times.  Using a device 
+# table you can create device nodes and directories "on the fly".
+#
+# This is a sample device table file for use with genext2fs.  You can
+# do all sorts of interesting things with a device table file.  For
+# example, if you want to adjust the permissions on a particular file
+# you can just add an entry like:
+#   /sbin/foobar        f       2755    0       0       -       -       -       -       -
+# and (assuming the file /sbin/foobar exists) it will be made setuid
+# root (regardless of what its permissions are on the host filesystem.
+# Furthermore, you can use a single table entry to create a many device
+# minors.  For example, if I wanted to create /dev/hda and /dev/hda[0-15]
+# I could just use the following two table entries:
+#   /dev/hda    b       640     0       0       3       0       0       0       -
+#   /dev/hda    b       640     0       0       3       1       1       1       15
+# 
+# Device table entries take the form of:
+# <name>    <type>      <mode>  <uid>   <gid>   <major> <minor> <start> <inc>   <count>
+# where name is the file name,  type can be one of: 
+#       f       A regular file
+#       d       Directory
+#       c       Character special device file
+#       b       Block special device file
+#       p       Fifo (named pipe)
+# uid is the user id for the target file, gid is the group id for the
+# target file.  The rest of the entries (major, minor, etc) apply only 
+# to device special files.
+
+# Have fun
+# -Erik Andersen <andersen@codepoet.org>
+#
+
+#<name>		<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+/dev		d	755	0	0	-	-	-	-	-
+#/dev/pts	d	755	0	0	-	-	-	-	-
+#/dev/shm	d	755	0	0	-	-	-	-	-
+/tmp		d	1777	0	0	-	-	-	-	-
+/etc		d	755	0	0	-	-	-	-	-
+/sys		d	755	0	0	-	-	-	-	-
+/config		d	755	0	0	-	-	-	-	-
+/proc		d	755	0	0	-	-	-	-	-
+/home/default	d	2755	1000	1000	-	-	-	-	-
+#<name>					<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+/bin/busybox				f	4755	0	0	-	-	-	-	-
+/etc/shadow				f	600	0	0	-	-	-	-	-
+/etc/passwd				f	644	0	0	-	-	-	-	-
+/etc/network/if-up.d			d	755	0	0	-	-	-	-	-
+/etc/network/if-pre-up.d		d	755	0	0	-	-	-	-	-
+/etc/network/if-down.d			d	755	0	0	-	-	-	-	-
+/etc/network/if-post-down.d		d	755	0	0	-	-	-	-	-
+/usr/share/udhcpc/default.script	f	755	0	0	-	-	-	-	-
+# uncomment this to allow starting x as non-root
+#/usr/X11R6/bin/Xfbdev		f	4755	0	0	-	-	-	-	-
+# Normal system devices
+#/dev/mem	c	640	0	0	1	1	0	0	-
+#/dev/kmem	c	640	0	0	1	2	0	0	-
+#/dev/null	c	666	0	0	1	3	0	0	-
+#/dev/zero	c	666	0	0	1	5	0	0	-
+#/dev/random	c	666	0	0	1	8	0	0	-
+#/dev/urandom	c	666	0	0	1	9	0	0	-
+#/dev/ram	b	640	0	0	1	1	0	0	-
+#/dev/ram	b	640	0	0	1	0	0	1	4
+#/dev/loop	b	640	0	0	7	0	0	1	2
+#/dev/rtc	c	640	0	0	10	135	-	-	-
+/dev/console	c	666	0	0	5	1	-	-	-
+#/dev/tty	c	666	0	0	5	0	-	-	-
+#/dev/tty	c	666	0	0	4	0	0	1	8
+#/dev/ttyp	c	666	0	0	3	0	0	1	10
+#/dev/ptyp	c       666     0       0       2       0       0       1       10
+#/dev/ptmx	c	666	0	0	5	2	-	-	-
+#/dev/ttyP	c	666	0	0	57	0	0	1	4
+#/dev/ttyS	c	666	0	0	4	64	0	1	4
+#/dev/fb		c	640	0	5	29	0	0	32	4
+#/dev/ttySA	c	666	0	0	204	5	0	1	3
+#/dev/psaux	c	666	0	0	10	1	0	0	-
+#/dev/ppp	c	666	0	0	108	0	-	-	-
+
+# Input stuff
+#/dev/input		d	755	0	0	-	-	-	-	-
+#/dev/input/mice		c	640	0	0	13	63	0	0	-
+#/dev/input/mouse	c	660	0	0	13	32	0	1	4
+#/dev/input/event	c	660	0	0	13	64	0	1	4
+#/dev/input/js		c	660	0	0	13	0	0	1	4
+
+
+# MTD stuff
+#/dev/mtd	c	640	0	0	90	0	0	2	4
+#/dev/mtdblock	b	640	0	0	31	0	0	1	4
+
+#Tun/tap driver
+#/dev/net	d	755	0	0	-	-	-	-	-
+#/dev/net/tun	c	660	0	0	10	200	-	-	-
+
+# Audio stuff
+#/dev/audio	c	666	0	29	14	4	-	-	-
+#/dev/audio1	c	666	0	29	14	20	-	-	-
+#/dev/dsp	c	666	0	29	14	3	-	-	-
+#/dev/dsp1	c	666	0	29	14	19	-	-	-
+#/dev/sndstat	c	666	0	29	14	6	-	-	-
+
+# User-mode Linux stuff
+#/dev/ubda	b	640	0	0	98	0	0	0	-
+#/dev/ubda	b	640	0	0	98	1	1	1	15
+
+# IDE Devices
+#/dev/hda	b	640	0	0	3	0	0	0	-
+#/dev/hda	b	640	0	0	3	1	1	1	15
+#/dev/hdb	b	640	0	0	3	64	0	0	-
+#/dev/hdb	b	640	0	0	3	65	1	1	15
+#/dev/hdc	b	640	0	0	22	0	0	0	-
+#/dev/hdc	b	640	0	0	22	1	1	1	15
+#/dev/hdd	b	640	0	0	22	64	0	0	-
+#/dev/hdd	b	640	0	0	22	65	1	1	15
+#/dev/hde	b	640	0	0	33	0	0	0	-
+#/dev/hde	b	640	0	0	33	1	1	1	15
+#/dev/hdf	b	640	0	0	33	64	0	0	-
+#/dev/hdf	b	640	0	0	33	65	1	1	15
+#/dev/hdg	b	640	0	0	34	0	0	0	-
+#/dev/hdg	b	640	0	0	34	1	1	1	15
+#/dev/hdh	b	640	0	0	34	64	0	0	-
+#/dev/hdh	b	640	0	0	34	65	1	1	15
+
+# SCSI Devices
+#/dev/sda	b	640	0	0	8	0	0	0	-
+#/dev/sda	b	640	0	0	8	1	1	1	15
+#/dev/sdb	b	640	0	0	8	16	0	0	-
+#/dev/sdb	b	640	0	0	8	17	1	1	15
+#/dev/sdc	b	640	0	0	8	32	0	0	-
+#/dev/sdc	b	640	0	0	8	33	1	1	15
+#/dev/sdd	b	640	0	0	8	48	0	0	-
+#/dev/sdd	b	640	0	0	8	49	1	1	15
+#/dev/sde	b	640	0	0	8	64	0	0	-
+#/dev/sde	b	640	0	0	8	65	1	1	15
+#/dev/sdf	b	640	0	0	8	80	0	0	-
+#/dev/sdf	b	640	0	0	8	81	1	1	15
+#/dev/sdg	b	640	0	0	8	96	0	0	-
+#/dev/sdg	b	640	0	0	8	97	1	1	15
+#/dev/sdh	b	640	0	0	8	112	0	0	-
+#/dev/sdh	b	640	0	0	8	113	1	1	15
+#/dev/sg	c	640	0	0	21	0	0	1	15
+#/dev/scd	b	640	0	0	11	0	0	1	15
+#/dev/st	c	640	0	0	9	0	0	1	8
+#/dev/nst	c	640	0	0	9	128	0	1	8
+#/dev/st	c	640	0	0	9	32	1	1	4
+#/dev/st	c	640	0	0	9	64	1	1	4
+#/dev/st	c	640	0	0	9	96	1	1	4
+
+# Floppy disk devices
+#/dev/fd	b	640	0	0	2	0	0	1	2
+#/dev/fd0d360	b	640	0	0	2	4	0	0	-
+#/dev/fd1d360	b	640	0	0	2	5	0	0	-
+#/dev/fd0h1200	b	640	0	0	2	8	0	0	-
+#/dev/fd1h1200	b	640	0	0	2	9	0	0	-
+#/dev/fd0u1440	b	640	0	0	2	28	0	0	-
+#/dev/fd1u1440	b	640	0	0	2	29	0	0	-
+#/dev/fd0u2880	b	640	0	0	2	32	0	0	-
+#/dev/fd1u2880	b	640	0	0	2	33	0	0	-
+
+# All the proprietary cdrom devices in the world
+#/dev/aztcd	b	640	0	0	29	0	0	0	-
+#/dev/bpcd	b	640	0	0	41	0	0	0	-
+#/dev/capi20	c	640	0	0	68	0	0	1	2
+#/dev/cdu31a	b	640	0	0	15	0	0	0	-
+#/dev/cdu535	b	640	0	0	24	0	0	0	-
+#/dev/cm206cd	b	640	0	0	32	0	0	0	-
+#/dev/sjcd	b	640	0	0	18	0	0	0	-
+#/dev/sonycd	b	640	0	0	15	0	0	0	-
+#/dev/gscd	b	640	0	0	16	0	0	0	-
+#/dev/sbpcd	b	640	0	0	25	0	0	0	-
+#/dev/sbpcd	b	640	0	0	25	0	0	1	4
+#/dev/mcd	b	640	0	0	23	0	0	0	-
+#/dev/optcd	b	640	0	0	17	0	0	0	-
+

Modified: trunk/buildroot/target/generic/target_busybox_skeleton/etc/fstab
===================================================================
--- trunk/buildroot/target/generic/target_busybox_skeleton/etc/fstab	2007-02-16 13:11:04 UTC (rev 17906)
+++ trunk/buildroot/target/generic/target_busybox_skeleton/etc/fstab	2007-02-16 14:32:22 UTC (rev 17907)
@@ -5,4 +5,5 @@
 proc		/proc	       proc     defaults	  0	 0
 devpts		/dev/pts       devpts   defaults,gid=5,mode=620	  0	 0
 tmpfs           /tmp           tmpfs    defaults          0      0
-
+configfs	/config	       configfs defaults	  0	 0
+sysfs		/sys	       sysfs    defaults	  0	 0

Modified: trunk/buildroot/target/generic/target_busybox_skeleton/etc/inittab
===================================================================
--- trunk/buildroot/target/generic/target_busybox_skeleton/etc/inittab	2007-02-16 13:11:04 UTC (rev 17906)
+++ trunk/buildroot/target/generic/target_busybox_skeleton/etc/inittab	2007-02-16 14:32:22 UTC (rev 17907)
@@ -14,8 +14,14 @@
 # process   == program to run
 
 # Startup the system
+null::sysinit:/bin/mount -t proc none /proc
+null::sysinit:/bin/mount -t sysfs none /sys
+null::sysinit:/bin/mount -t tmpfs -o size=512k,mode=0755 none /dev
+null::sysinit:/bin/mkdir /dev/pts
+null::sysinit:/bin/mount -t devpts devpts /dev/pts
+null::sysinit:/bin/echo /sbin/mdev > /proc/sys/kernel/hotplug
+null::sysinit:/sbin/mdev -s
 null::sysinit:/bin/mount -o remount,rw /
-null::sysinit:/bin/mount -t proc proc /proc
 null::sysinit:/bin/mount -a
 null::sysinit:/bin/hostname -F /etc/hostname
 null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
@@ -32,7 +38,7 @@
 
 # Logging junk
 null::sysinit:/bin/touch /var/log/messages
-null::respawn:/sbin/syslogd -n -m 0
+null::respawn:/sbin/syslogd -n
 null::respawn:/sbin/klogd -n
 tty3::respawn:/usr/bin/tail -f /var/log/messages
 

Copied: trunk/buildroot/target/generic/target_busybox_skeleton/tmp (from rev 17899, trunk/buildroot/target/generic/target_skeleton/tmp)
