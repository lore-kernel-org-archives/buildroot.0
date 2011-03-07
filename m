From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 22:21:25 +0100
Subject: [Buildroot] [PATCH 3/3] Allow several device tables and split in
	two parts our device table
In-Reply-To: <cover.1299532878.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299532878.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2ffd8abc0ff8eb97831b270a84f52f67e1a6158b.1299532878.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to have a device table for all directories/files and
another device table for the device files themselves. Both are needed
for static /dev, but only the first one is needed when
devtmpfs/mdev/udev are used.

We take this opportunity to move the documentation of the device table
format in a common location, package/makedevs/README.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/Config.in                        |   20 +++-
 fs/common.mk                        |   14 ++-
 package/makedevs/README             |   35 +++++++
 target/generic/device_table.txt     |  186 ++--------------------------------
 target/generic/device_table_dev.txt |  142 ++++++++++++++++++++++++++
 5 files changed, 211 insertions(+), 186 deletions(-)
 create mode 100644 package/makedevs/README
 create mode 100644 target/generic/device_table_dev.txt

diff --git a/fs/Config.in b/fs/Config.in
index 9ac3acc..636e316 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -36,13 +36,21 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 endchoice
 
 config BR2_ROOTFS_DEVICE_TABLE
-	string "Path to the device table"
-	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC
-	default "target/generic/device_table.txt"
+	string "Path to the device tables"
+	default "target/generic/device_table.txt target/generic/device_table_dev.txt" \
+		if BR2_ROOTFS_DEVICE_CREATION_STATIC
+	default "target/generic/device_table.txt" \
+		if (BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV || \
+		    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
+		    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS)
 	help
-	  Specify the location of a device table, that will be passed
-	  to the makedevs utility to create all the special device
-	  files in the target filesystem.
+	  Specify a space-separated list of device table locations,
+	  that will be passed to the makedevs utility to create all
+	  the special device files and assign correct owners and
+	  permissions on various files in the target filesystem.
+
+          See package/makedevs/README for details on the usage and
+          syntax of these files.
 
 choice
 	prompt "Root FS skeleton"
diff --git a/fs/common.mk b/fs/common.mk
index 92be00c..f105af2 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -32,7 +32,8 @@
 # macro will automatically generate a compressed filesystem image.
 
 FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
-ROOTFS_DEVICE_TABLE = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE))
+FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
+ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE))
 
 define ROOTFS_TARGET_INTERNAL
 
@@ -42,17 +43,20 @@ $(eval ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $(if $(BR2_TARGET
 $(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES)
 	@$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	$(foreach hook,$(ROOTFS_$(2)_PRE_GEN_HOOKS),$(call $(hook))$(sep))
-	rm -f $(FAKEROOT_SCRIPT)
+	rm -f $(FAKEROOT_SCRIPT) $(FULL_DEVICE_TABLE)
 	touch $(BUILD_DIR)/.fakeroot.00000
 	cat $(BUILD_DIR)/.fakeroot* > $(FAKEROOT_SCRIPT)
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
-ifneq ($(ROOTFS_DEVICE_TABLE),)
-	echo "$(HOST_DIR)/usr/bin/makedevs -d $(ROOTFS_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+ifneq ($(ROOTFS_DEVICE_TABLES),)
+	for devtable in $(ROOTFS_DEVICE_TABLES) ; do \
+		cat $$$${devtable} >> $(FULL_DEVICE_TABLE) ; \
+	done
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 endif
 	echo "$(ROOTFS_$(2)_CMD)" >> $(FAKEROOT_SCRIPT)
 	chmod a+x $(FAKEROOT_SCRIPT)
 	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
-	- at rm -f $(FAKEROOT_SCRIPT)
+	- at rm -f $(FAKEROOT_SCRIPT) $(FULL_DEVICE_TABLE)
 	$(foreach hook,$(ROOTFS_$(2)_POST_GEN_HOOKS),$(call $(hook))$(sep))
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 	gzip -9 -c $$@ > $$@.gz
diff --git a/package/makedevs/README b/package/makedevs/README
new file mode 100644
index 0000000..6c54052
--- /dev/null
+++ b/package/makedevs/README
@@ -0,0 +1,35 @@
+When building a target filesystem, it is desirable to not have to
+become root and then run 'mknod' a thousand times.  Using a device
+table you can create device nodes and directories "on the fly".
+
+You can do all sorts of interesting things with a device table file.
+For example, if you want to adjust the permissions on a particular
+file you can just add an entry like:
+
+  /sbin/foobar        f       2755    0       0       -       -       -       -       -
+
+and (assuming the file /sbin/foobar exists) it will be made setuid
+root (regardless of what its permissions are on the host filesystem.
+
+Furthermore, you can use a single table entry to create a many device
+minors.  For example, if I wanted to create /dev/hda and
+/dev/hda[0-15] I could just use the following two table entries:
+
+  /dev/hda    b       640     0       0       3       0       0       0       -
+  /dev/hda    b       640     0       0       3       1       1       1       15
+
+Device table entries take the form of:
+
+<name>    <type>      <mode>  <uid>   <gid>   <major> <minor> <start> <inc>   <count>
+
+where name is the file name,  type can be one of:
+
+      f       A regular file
+      d       Directory
+      c       Character special device file
+      b       Block special device file
+      p       Fifo (named pipe)
+
+uid is the user id for the target file, gid is the group id for the
+target file.  The rest of the entries (major, minor, etc) apply only
+to device special files.
diff --git a/target/generic/device_table.txt b/target/generic/device_table.txt
index 15132f9..12f35b2 100644
--- a/target/generic/device_table.txt
+++ b/target/generic/device_table.txt
@@ -1,44 +1,15 @@
-# When building a target filesystem, it is desirable to not have to
-# become root and then run 'mknod' a thousand times.  Using a device 
-# table you can create device nodes and directories "on the fly".
+# See package/makedevs/README for details
 #
-# This is a sample device table file for use with genext2fs.  You can
-# do all sorts of interesting things with a device table file.  For
-# example, if you want to adjust the permissions on a particular file
-# you can just add an entry like:
-#   /sbin/foobar        f       2755    0       0       -       -       -       -       -
-# and (assuming the file /sbin/foobar exists) it will be made setuid
-# root (regardless of what its permissions are on the host filesystem.
-# Furthermore, you can use a single table entry to create a many device
-# minors.  For example, if I wanted to create /dev/hda and /dev/hda[0-15]
-# I could just use the following two table entries:
-#   /dev/hda    b       640     0       0       3       0       0       0       -
-#   /dev/hda    b       640     0       0       3       1       1       1       15
-# 
-# Device table entries take the form of:
-# <name>    <type>      <mode>  <uid>   <gid>   <major> <minor> <start> <inc>   <count>
-# where name is the file name,  type can be one of: 
-#       f       A regular file
-#       d       Directory
-#       c       Character special device file
-#       b       Block special device file
-#       p       Fifo (named pipe)
-# uid is the user id for the target file, gid is the group id for the
-# target file.  The rest of the entries (major, minor, etc) apply only 
-# to device special files.
-
-# Have fun
-# -Erik Andersen <andersen@codepoet.org>
+# This device table is used to assign proper ownership and permissions
+# on various files. It doesn't create any device file, as it is used
+# in both static device configurations (where /dev/ is static) and in
+# dynamic configurations (where devtmpfs, mdev or udev are used).
 #
-
-#<name>		<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
-/dev		d	755	0	0	-	-	-	-	-
-/dev/pts	d	755	0	0	-	-	-	-	-
-/dev/shm	d	755	0	0	-	-	-	-	-
-/tmp		d	1777	0	0	-	-	-	-	-
-/etc		d	755	0	0	-	-	-	-	-
-/home/default	d	2755	1000	1000	-	-	-	-	-
-#<name>					<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+# <name>				<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+/dev					d	755	0	0	-	-	-	-	-
+/tmp					d	1777	0	0	-	-	-	-	-
+/etc					d	755	0	0	-	-	-	-	-
+/home/default				d	2755	1000	1000	-	-	-	-	-
 /bin/busybox				f	4755	0	0	-	-	-	-	-
 /etc/shadow				f	600	0	0	-	-	-	-	-
 /etc/passwd				f	644	0	0	-	-	-	-	-
@@ -48,139 +19,4 @@
 /etc/network/if-post-down.d		d	755	0	0	-	-	-	-	-
 /usr/share/udhcpc/default.script	f	755	0	0	-	-	-	-	-
 # uncomment this to allow starting x as non-root
-#/usr/X11R6/bin/Xfbdev		f	4755	0	0	-	-	-	-	-
-# Normal system devices
-/dev/mem	c	640	0	0	1	1	0	0	-
-/dev/kmem	c	640	0	0	1	2	0	0	-
-/dev/null	c	666	0	0	1	3	0	0	-
-/dev/zero	c	666	0	0	1	5	0	0	-
-/dev/random	c	666	0	0	1	8	0	0	-
-/dev/urandom	c	666	0	0	1	9	0	0	-
-/dev/ram	b	640	0	0	1	1	0	0	-
-/dev/ram	b	640	0	0	1	0	0	1	4
-/dev/loop	b	640	0	0	7	0	0	1	2
-/dev/rtc	c	640	0	0	10	135	-	-	-
-/dev/console	c	666	0	0	5	1	-	-	-
-/dev/tty	c	666	0	0	5	0	-	-	-
-/dev/tty	c	666	0	0	4	0	0	1	8
-/dev/ttyp	c	666	0	0	3	0	0	1	10
-/dev/ptyp	c       666     0       0       2       0       0       1       10
-/dev/ptmx	c	666	0	0	5	2	-	-	-
-/dev/ttyP	c	666	0	0	57	0	0	1	4
-/dev/ttyS	c	666	0	0	4	64	0	1	4
-/dev/fb		c	640	0	5	29	0	0	1	4
-#/dev/ttySA	c	666	0	0	204	5	0	1	3
-/dev/psaux	c	666	0	0	10	1	0	0	-
-#/dev/ppp	c	666	0	0	108	0	-	-	-
-/dev/ttyAM	c	666	0	0	204	16	0	1	3
-/dev/ttyCPM	c	666	0	0	204	46	0	1	4
-/dev/ttyAMA	c	666	0	0	204	64	0	1	4
-/dev/ttySAC	c	666	0	0	204	64	0	1	4
-/dev/ttyPSC	c	666	0	0	204	148	0	1	4
-/dev/ttyUL	c	666	0	0	204	187	0	1	4
-/dev/ttymxc	c	666	0	0	207	16	0	1	3
-
-# Input stuff
-/dev/input		d	755	0	0	-	-	-	-	-
-/dev/input/mice		c	640	0	0	13	63	0	0	-
-/dev/input/mouse	c	660	0	0	13	32	0	1	4
-/dev/input/event	c	660	0	0	13	64	0	1	4
-#/dev/input/js		c	660	0	0	13	0	0	1	4
-
-
-# MTD stuff
-/dev/mtd	c	640	0	0	90	0	0	2	4
-/dev/mtdblock	b	640	0	0	31	0	0	1	4
-
-#Tun/tap driver
-/dev/net	d	755	0	0	-	-	-	-	-
-/dev/net/tun	c	660	0	0	10	200	-	-	-
-
-# Audio stuff
-#/dev/audio	c	666	0	29	14	4	-	-	-
-#/dev/audio1	c	666	0	29	14	20	-	-	-
-#/dev/dsp	c	666	0	29	14	3	-	-	-
-#/dev/dsp1	c	666	0	29	14	19	-	-	-
-#/dev/sndstat	c	666	0	29	14	6	-	-	-
-
-# User-mode Linux stuff
-#/dev/ubda	b	640	0	0	98	0	0	0	-
-#/dev/ubda	b	640	0	0	98	1	1	1	15
-
-# IDE Devices
-/dev/hda	b	640	0	0	3	0	0	0	-
-/dev/hda	b	640	0	0	3	1	1	1	15
-/dev/hdb	b	640	0	0	3	64	0	0	-
-/dev/hdb	b	640	0	0	3	65	1	1	15
-#/dev/hdc	b	640	0	0	22	0	0	0	-
-#/dev/hdc	b	640	0	0	22	1	1	1	15
-#/dev/hdd	b	640	0	0	22	64	0	0	-
-#/dev/hdd	b	640	0	0	22	65	1	1	15
-#/dev/hde	b	640	0	0	33	0	0	0	-
-#/dev/hde	b	640	0	0	33	1	1	1	15
-#/dev/hdf	b	640	0	0	33	64	0	0	-
-#/dev/hdf	b	640	0	0	33	65	1	1	15
-#/dev/hdg	b	640	0	0	34	0	0	0	-
-#/dev/hdg	b	640	0	0	34	1	1	1	15
-#/dev/hdh	b	640	0	0	34	64	0	0	-
-#/dev/hdh	b	640	0	0	34	65	1	1	15
-
-# SCSI Devices
-/dev/sda	b	640	0	0	8	0	0	0	-
-/dev/sda	b	640	0	0	8	1	1	1	15
-/dev/sdb	b	640	0	0	8	16	0	0	-
-/dev/sdb	b	640	0	0	8	17	1	1	15
-#/dev/sdc	b	640	0	0	8	32	0	0	-
-#/dev/sdc	b	640	0	0	8	33	1	1	15
-#/dev/sdd	b	640	0	0	8	48	0	0	-
-#/dev/sdd	b	640	0	0	8	49	1	1	15
-#/dev/sde	b	640	0	0	8	64	0	0	-
-#/dev/sde	b	640	0	0	8	65	1	1	15
-#/dev/sdf	b	640	0	0	8	80	0	0	-
-#/dev/sdf	b	640	0	0	8	81	1	1	15
-#/dev/sdg	b	640	0	0	8	96	0	0	-
-#/dev/sdg	b	640	0	0	8	97	1	1	15
-#/dev/sdh	b	640	0	0	8	112	0	0	-
-#/dev/sdh	b	640	0	0	8	113	1	1	15
-#/dev/sg	c	640	0	0	21	0	0	1	15
-#/dev/scd	b	640	0	0	11	0	0	1	15
-#/dev/st	c	640	0	0	9	0	0	1	8
-#/dev/nst	c	640	0	0	9	128	0	1	8
-#/dev/st	c	640	0	0	9	32	1	1	4
-#/dev/st	c	640	0	0	9	64	1	1	4
-#/dev/st	c	640	0	0	9	96	1	1	4
-
-# USB block devices (ub driver)
-/dev/uba	b	640	0	0	180	0	0	0	-
-/dev/uba	b	640	0	0	180	1	1	1	6
-/dev/ubb	b	640	0	0	180	8	0	0	-
-/dev/ubb	b	640	0	0	180	65	1	1	6
-
-# Floppy disk devices
-#/dev/fd	b	640	0	0	2	0	0	1	2
-#/dev/fd0d360	b	640	0	0	2	4	0	0	-
-#/dev/fd1d360	b	640	0	0	2	5	0	0	-
-#/dev/fd0h1200	b	640	0	0	2	8	0	0	-
-#/dev/fd1h1200	b	640	0	0	2	9	0	0	-
-#/dev/fd0u1440	b	640	0	0	2	28	0	0	-
-#/dev/fd1u1440	b	640	0	0	2	29	0	0	-
-#/dev/fd0u2880	b	640	0	0	2	32	0	0	-
-#/dev/fd1u2880	b	640	0	0	2	33	0	0	-
-
-# All the proprietary cdrom devices in the world
-#/dev/aztcd	b	640	0	0	29	0	0	0	-
-#/dev/bpcd	b	640	0	0	41	0	0	0	-
-#/dev/capi20	c	640	0	0	68	0	0	1	2
-#/dev/cdu31a	b	640	0	0	15	0	0	0	-
-#/dev/cdu535	b	640	0	0	24	0	0	0	-
-#/dev/cm206cd	b	640	0	0	32	0	0	0	-
-#/dev/sjcd	b	640	0	0	18	0	0	0	-
-#/dev/sonycd	b	640	0	0	15	0	0	0	-
-#/dev/gscd	b	640	0	0	16	0	0	0	-
-#/dev/sbpcd	b	640	0	0	25	0	0	0	-
-#/dev/sbpcd	b	640	0	0	25	0	0	1	4
-#/dev/mcd	b	640	0	0	23	0	0	0	-
-#/dev/optcd	b	640	0	0	17	0	0	0	-
-
-# I2C device nodes
-/dev/i2c-	c	666	0	0	89	0	0	1	4
+#/usr/X11R6/bin/Xfbdev		     	f	4755	0	0	-	-	-	-	-
diff --git a/target/generic/device_table_dev.txt b/target/generic/device_table_dev.txt
new file mode 100644
index 0000000..0890a47
--- /dev/null
+++ b/target/generic/device_table_dev.txt
@@ -0,0 +1,142 @@
+# See package/makedevs/README for details
+#
+# This device table is used only to create device files when a static
+# device configuration is used (entries in /dev are static).
+#
+# <name>	<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+
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
+/dev/ttyAM	c	666	0	0	204	16	0	1	3
+/dev/ttyCPM	c	666	0	0	204	46	0	1	4
+/dev/ttyAMA	c	666	0	0	204	64	0	1	4
+/dev/ttySAC	c	666	0	0	204	64	0	1	4
+/dev/ttyPSC	c	666	0	0	204	148	0	1	4
+/dev/ttyUL	c	666	0	0	204	187	0	1	4
+/dev/ttymxc	c	666	0	0	207	16	0	1	3
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
+/dev/sda	b	640	0	0	8	0	0	0	-
+/dev/sda	b	640	0	0	8	1	1	1	15
+/dev/sdb	b	640	0	0	8	16	0	0	-
+/dev/sdb	b	640	0	0	8	17	1	1	15
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
+# USB block devices (ub driver)
+/dev/uba	b	640	0	0	180	0	0	0	-
+/dev/uba	b	640	0	0	180	1	1	1	6
+/dev/ubb	b	640	0	0	180	8	0	0	-
+/dev/ubb	b	640	0	0	180	65	1	1	6
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
+# I2C device nodes
+/dev/i2c-	c	666	0	0	89	0	0	1	4
-- 
1.7.0.4
