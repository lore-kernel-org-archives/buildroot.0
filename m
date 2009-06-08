From: Daniel Mack <daniel@caiaq.de>
Date: Mon,  8 Jun 2009 16:58:00 +0200
Subject: [Buildroot] [PATCH 2/2] Add target support for MXC based devices
In-Reply-To: <1244473080-8195-1-git-send-email-daniel@caiaq.de>
References: <1244473080-8195-1-git-send-email-daniel@caiaq.de>
Message-ID: <1244473080-8195-2-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Devices based on Freescale's MXC SoCs need some extra attention to start
the gettys from init. In particular, the /dev/ttymxc0 inode needs to be
created and added to inittab and securetty.

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 target/device/ARMLTD/Config.in                     |    4 +
 target/device/ARMLTD/Makefile.in                   |    3 +
 target/device/ARMLTD/mxc/Makefile.in               |    4 +
 target/device/ARMLTD/mxc/device_table.txt          |  176 ++++++++++++++++++++
 .../device/ARMLTD/mxc/target_skeleton/etc/inittab  |   45 +++++
 .../ARMLTD/mxc/target_skeleton/etc/securetty       |   14 ++
 6 files changed, 246 insertions(+), 0 deletions(-)
 create mode 100644 target/device/ARMLTD/mxc/Makefile.in
 create mode 100644 target/device/ARMLTD/mxc/device_table.txt
 create mode 100644 target/device/ARMLTD/mxc/target_skeleton/etc/inittab
 create mode 100644 target/device/ARMLTD/mxc/target_skeleton/etc/securetty

diff --git a/target/device/ARMLTD/Config.in b/target/device/ARMLTD/Config.in
index 66f031c..51d5069 100644
--- a/target/device/ARMLTD/Config.in
+++ b/target/device/ARMLTD/Config.in
@@ -22,12 +22,16 @@ config BR2_TARGET_ARM_INTEGRATOR_926
 config BR2_TARGET_ARM_INTEGRATOR_926_HUGE
 	bool "Integrator arm926 (Huge)"
 
+config BR2_TARGET_ARM_MXC
+	bool "Freescale MX2/MX3 based modules"
+
 endchoice
 
 config BR2_BOARD_NAME
 	string
 	default "integrator926"		if BR2_TARGET_ARM_INTEGRATOR_926
 	default "integrator926_huge"	if BR2_TARGET_ARM_INTEGRATOR_926_HUGE
+	default "freescale-mxc"		if BR2_TARGET_ARM_MXC
 
 config BR2_BOARD_PATH
 	string "Board Path"
diff --git a/target/device/ARMLTD/Makefile.in b/target/device/ARMLTD/Makefile.in
index a846ba6..23be956 100644
--- a/target/device/ARMLTD/Makefile.in
+++ b/target/device/ARMLTD/Makefile.in
@@ -4,6 +4,9 @@ BOARD_NAME=$(strip $(subst ",,$(BR2_BOARD_NAME)))
 BOARD_PATH=$(strip $(subst ",,$(BR2_BOARD_PATH)))
 #"))
 
+ifeq ($(BR2_TARGET_ARM_MXC),y)
+include target/device/ARMLTD/mxc/Makefile.in
+endif
 
 # pin some settings
 BR2_GNU_TARGET_SUFFIX:="linux-uclibcgnueabi"
diff --git a/target/device/ARMLTD/mxc/Makefile.in b/target/device/ARMLTD/mxc/Makefile.in
new file mode 100644
index 0000000..4f3d3c8
--- /dev/null
+++ b/target/device/ARMLTD/mxc/Makefile.in
@@ -0,0 +1,4 @@
+# Default target skeleton stuff, may be overridden
+TARGET_SKELETON=target/generic/target_skeleton target/device/ARMLTD/mxc/target_skeleton
+TARGET_DEVICE_TABLE=target/device/ARMLTD/mxc/device_table.txt
+
diff --git a/target/device/ARMLTD/mxc/device_table.txt b/target/device/ARMLTD/mxc/device_table.txt
new file mode 100644
index 0000000..fbc766e
--- /dev/null
+++ b/target/device/ARMLTD/mxc/device_table.txt
@@ -0,0 +1,176 @@
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
+/dev/pts	d	755	0	0	-	-	-	-	-
+/dev/shm	d	755	0	0	-	-	-	-	-
+/tmp		d	1777	0	0	-	-	-	-	-
+/etc		d	755	0	0	-	-	-	-	-
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
+/dev/mem	c	640	0	0	1	1	0	0	-
+/dev/kmem	c	640	0	0	1	2	0	0	-
+/dev/null	c	666	0	0	1	3	0	0	-
+/dev/zero	c	666	0	0	1	5	0	0	-
+/dev/random	c	666	0	0	1	8	0	0	-
+/dev/urandom	c	666	0	0	1	9	0	0	-
+/dev/ram	b	640	0	0	1	1	0	0	-
+/dev/ram	b	640	0	0	1	0	0	1	4
+/dev/loop	b	640	0	0	7	0	0	1	2
+/dev/rtc	c	640	0	0	10	135	-	-	-
+/dev/console	c	666	0	0	5	1	-	-	-
+/dev/tty	c	666	0	0	5	0	-	-	-
+/dev/tty	c	666	0	0	4	0	0	1	8
+/dev/ttyp	c	666	0	0	3	0	0	1	10
+/dev/ptyp	c       666     0       0       2       0       0       1       10
+/dev/ptmx	c	666	0	0	5	2	-	-	-
+/dev/ttyP	c	666	0	0	57	0	0	1	4
+/dev/ttyS	c	666	0	0	4	64	0	1	4
+/dev/fb		c	640	0	5	29	0	0	1	4
+#/dev/ttySA	c	666	0	0	204	5	0	1	3
+/dev/psaux	c	666	0	0	10	1	0	0	-
+#/dev/ppp	c	666	0	0	108	0	-	-	-
+/dev/ttyCPM	c	666	0	0	204	46	0	1	4
+/dev/ttyAMA	c	666	0	0	204	64	0	1	4
+/dev/ttyPSC	c	666	0	0	204	148	0	1	4
+/dev/ttyUL	c	666	0	0	204	187	0	1	4
+/dev/ttymxc	c	660	0	0	207	16	0	0	1
+
+# Input stuff
+/dev/input		d	755	0	0	-	-	-	-	-
+/dev/input/mice		c	640	0	0	13	63	0	0	-
+/dev/input/mouse	c	660	0	0	13	32	0	1	4
+/dev/input/event	c	660	0	0	13	64	0	1	4
+#/dev/input/js		c	660	0	0	13	0	0	1	4
+
+
+# MTD stuff
+/dev/mtd	c	640	0	0	90	0	0	2	4
+/dev/mtdblock	b	640	0	0	31	0	0	1	4
+
+#Tun/tap driver
+/dev/net	d	755	0	0	-	-	-	-	-
+/dev/net/tun	c	660	0	0	10	200	-	-	-
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
+/dev/hda	b	640	0	0	3	0	0	0	-
+/dev/hda	b	640	0	0	3	1	1	1	15
+/dev/hdb	b	640	0	0	3	64	0	0	-
+/dev/hdb	b	640	0	0	3	65	1	1	15
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
diff --git a/target/device/ARMLTD/mxc/target_skeleton/etc/inittab b/target/device/ARMLTD/mxc/target_skeleton/etc/inittab
new file mode 100644
index 0000000..e3540fa
--- /dev/null
+++ b/target/device/ARMLTD/mxc/target_skeleton/etc/inittab
@@ -0,0 +1,45 @@
+# /etc/inittab
+#
+# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
+#
+# Note: BusyBox init doesn't support runlevels.  The runlevels field is
+# completely ignored by BusyBox init. If you want runlevels, use
+# sysvinit.
+#
+# Format for each entry: <id>:<runlevels>:<action>:<process>
+#
+# id        == tty to run on, or empty for /dev/console
+# runlevels == ignored
+# action    == one of sysinit, respawn, askfirst, wait, and once
+# process   == program to run
+
+# Startup the system
+null::sysinit:/bin/mount -o remount,rw /
+null::sysinit:/bin/mount -t proc proc /proc
+null::sysinit:/bin/mount -a
+null::sysinit:/bin/hostname -F /etc/hostname
+null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
+null::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
+# now run any rc scripts
+::sysinit:/etc/init.d/rcS
+
+# Set up a couple of getty's
+ttymxc0::respawn:/sbin/getty 115200 ttymxc0 vt100
+
+# Put a getty on the serial port
+#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100
+
+# Logging junk
+null::sysinit:/bin/touch /var/log/messages
+null::respawn:/sbin/syslogd -n -m 0
+null::respawn:/sbin/klogd -n
+
+# Stuff to do for the 3-finger salute
+::ctrlaltdel:/sbin/reboot
+
+# Stuff to do before rebooting
+null::shutdown:/usr/bin/killall klogd
+null::shutdown:/usr/bin/killall syslogd
+null::shutdown:/bin/umount -a -r
+null::shutdown:/sbin/swapoff -a
+
diff --git a/target/device/ARMLTD/mxc/target_skeleton/etc/securetty b/target/device/ARMLTD/mxc/target_skeleton/etc/securetty
new file mode 100644
index 0000000..b7aaea4
--- /dev/null
+++ b/target/device/ARMLTD/mxc/target_skeleton/etc/securetty
@@ -0,0 +1,14 @@
+tty1
+tty2
+tty3
+tty4
+tty5
+tty6
+tty7
+tty8
+ttyS0
+ttyS1
+ttyS2
+ttyS3
+ttymxc0
+
-- 
1.6.3.1
