From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 12 Oct 2007 05:34:04 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc:
	init.d
Message-ID: <20071012123404.0D5E7A681D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-12 05:34:04 -0700 (Fri, 12 Oct 2007)
New Revision: 20228

Log:
Update NGW100 skeleton

Added:
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/mdev.conf
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/shadow

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/fstab
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/group
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S00mountvirtfs
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S41inetd
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/passwd


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/fstab
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/fstab	2007-10-12 12:32:59 UTC (rev 20227)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/fstab	2007-10-12 12:34:04 UTC (rev 20228)
@@ -1,3 +1,4 @@
 # /etc/fstab: static file system information.
 #
 # <file system>	<mount pt>	<type>		<options>	<dump>	<pass>
+/dev/mtdblock3	/usr		jffs2		defaults	0	0

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/group
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/group	2007-10-12 12:32:59 UTC (rev 20227)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/group	2007-10-12 12:34:04 UTC (rev 20228)
@@ -5,7 +5,9 @@
 adm:x:4:
 tty:x:5:
 disk:x:6:
+kmem:x:9:
 wheel:x:10:root
+dialout:x:20:
 utmp:x:43:
 staff:x:50:
 www-data::51:

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S00mountvirtfs
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S00mountvirtfs	2007-10-12 12:32:59 UTC (rev 20227)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S00mountvirtfs	2007-10-12 12:34:04 UTC (rev 20228)
@@ -58,9 +58,6 @@
 	mkdir_fs /dev/pts
 	mount_fs pts /dev/pts devpts
 	mkdir_fs /dev/shm
-	# Hack to enable mouse support when using buildroot mdev
-	ln -s . /dev/input
-	ln -s . /dev/snd
 fi
 
 mount_fs config /config configfs

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S41inetd
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S41inetd	2007-10-12 12:32:59 UTC (rev 20227)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/S41inetd	2007-10-12 12:34:04 UTC (rev 20228)
@@ -2,7 +2,7 @@
 
 INETD=/usr/sbin/inetd
 
-echo -n "Starting inted: "
+echo -n "Starting inetd: "
 if [ ! -x "${INETD}" ]; then
 	echo "missing"
 	exit 1

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/mdev.conf
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/mdev.conf	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/mdev.conf	2007-10-12 12:34:04 UTC (rev 20228)
@@ -0,0 +1,49 @@
+# mdev.conf for ATNGW100
+#
+# Syntax:
+#  <regexp> <UID>:<GID> <PERM> [{@,$,*} <CMD>]
+#    @: run <CMD> after creating
+#    $: run <CMD> before removal
+#    *: like @ and $ at the same time
+#    <CMD> is run inside /dev using system()
+
+full	0:0	666
+null	0:0	777
+zero	0:0	666
+
+random	0:0	444
+urandom	0:0	444
+
+console	0:5	0600
+kmem	0:9	000
+mem	0:9	0640
+ptmx	0:5	0660
+
+sda.*	0:6	0660
+sdb.*	0:6	0660
+hda.*	0:6	0660
+hdb.*	0:6	0660
+mtd.*	0:6	0660
+mmc.*	0:6	0660
+
+# Move input devices to input directory
+event.*	0:0	0660	@(mkdir -p input&&mv $MDEV input)
+mice	0:0	0660	@(mkdir -p input&&mv $MDEV input)
+mouse.*	0:0	0660	@(mkdir -p input&&mv $MDEV input)
+
+# Move sound devices to sound directory
+pcm.*		0:101	0660	@(mkdir -p snd&&mv $MDEV snd)
+seq		0:101	0660	@(mkdir -p snd&&mv $MDEV snd)
+timer		0:101	0660	@(mkdir -p snd&&mv $MDEV snd)
+control.*	0:101	0660	@(mkdir -p snd&&mv $MDEV snd)
+
+tty	0:5	0660
+tty0.*	0:5	0660
+tty1.*	0:5	0660
+tty2.*	0:5	0660
+tty3.*	0:5	0660
+tty4.*	0:5	0660
+tty5.*	0:5	0660
+tty6.*	0:5	0660
+
+ttyS.*	0:20	640

Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/passwd
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/passwd	2007-10-12 12:32:59 UTC (rev 20227)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/passwd	2007-10-12 12:34:04 UTC (rev 20228)
@@ -1,4 +1,4 @@
-root:$1$rsjkLsTU$zdulfnYQgyKmN3e0Fiw7C1:0:0:root:/:/bin/sh
+root:x:0:0:root:/:/bin/sh
 daemon:x:1:1:daemon:/usr/sbin:/bin/sh
 bin:x:2:2:bin:/bin:/bin/sh
 sys:x:3:3:sys:/dev:/bin/sh
@@ -10,9 +10,9 @@
 operator:x:37:37:Operator:/var:/bin/sh
 haldaemon:x:68:68:hald:/:/bin/sh
 dbus:x:81:81:dbus:/var/run/dbus:/bin/sh
-ftp::50:50:Anonymous FTP user:/home/ftp:/bin/ash
+ftp:x:50:50:Anonymous FTP user:/home/ftp:/bin/ash
 dnsmasq:x:52:52:dnsmasq:/var/lib/dnsmasq:/bin/false
 sshd:x:110:65534:Operator:/var/run/sshd:/bin/false
 nobody:x:65534:65534:nobody:/nonexistent:/bin/false
-avr32:$1$iPQqCZth$aB00EMq2M101iRqQU8d4v/:500:500:Linux User,,,:/home/avr32:/bin/sh
+avr32:x:500:500:Linux User,,,:/home/avr32:/bin/sh
 default:x:1000:1000:Default non-root user:/home/default:/bin/sh

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/shadow
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/shadow	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/shadow	2007-10-12 12:34:04 UTC (rev 20228)
@@ -0,0 +1,18 @@
+root:$1$OJeedGT3$uG0eWkNhkeq0WO6Wldk1Y.:13200:0:99999:7:::
+daemon:!:13200:0:99999:7:::
+bin:!:13200:0:99999:7:::
+sys:!:13200:0:99999:7:::
+sync:!:13200:0:99999:7:::
+mail:!:13200:0:99999:7:::
+proxy:!:13200:0:99999:7:::
+www-data:!:13200:0:99999:7:::
+backup:!:13200:0:99999:7:::
+operator:!:13200:0:99999:7:::
+haldaemon:!:13200:0:99999:7:::
+dbus:!:13200:0:99999:7:::
+ftp:!:13200:0:99999:7:::
+dnsmasq:!:13200:0:99999:7:::
+sshd:!:13200:0:99999:7:::
+nobody:!:13200:0:99999:7:::
+avr32:$1$TVWxUVs7$/ze18sFeD6F26w0hgyB6M.:13200:0:99999:7:::
+default:!:13200:0:99999:7:::
