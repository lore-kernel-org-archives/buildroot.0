From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Mon,  6 Oct 2008 12:53:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20081006195330.4A0D23C7C4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-10-06 12:53:29 -0700 (Mon, 06 Oct 2008)
New Revision: 23607

Log:
samba.mk:
-force some performance enhancing autoconf options
-run 'installscripts' so findsmb and smbtar are installed
-samba binaires were segfaulting with uclibc 0.9.29
 when not using: samba_cv_fpie=no.  Force it.

Config.in:
-create configure options for findsmb and smbtar

S91smb:
-create dir (/var/lock/subsys) that is referenced
 later in script


Modified:
   trunk/buildroot/package/samba/Config.in
   trunk/buildroot/package/samba/S91smb
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/Config.in
===================================================================
--- trunk/buildroot/package/samba/Config.in	2008-10-06 19:20:58 UTC (rev 23606)
+++ trunk/buildroot/package/samba/Config.in	2008-10-06 19:53:29 UTC (rev 23607)
@@ -27,6 +27,18 @@
 	help
 	  Write Eventlog records to a tdb or perform other eventlog functions
 
+config BR2_PACKAGE_SAMBA_FINDSMB
+	bool "findsmb"
+	default y
+	depends on BR2_PACKAGE_SAMBA_SMBCLIENT
+	depends on BR2_PACKAGE_SAMBA_NMBLOOKUP
+	depends on BR2_PACKAGE_MICROPERL
+	help
+	  Script to browse network
+
+comment "findsmb       - disabled (requires nmblookup, smbclient and perl)"
+	depends on !BR2_PACKAGE_SAMBA_SMBCLIENT || !BR2_PACKAGE_SAMBA_NMBLOOKUP || !BR2_PACKAGE_MICROPERL
+
 config BR2_PACKAGE_SAMBA_NET
 	bool "net"
 	default y
@@ -149,6 +161,16 @@
 	help
 	  Samba Web Administration Tool
 
+config BR2_PACKAGE_SAMBA_SMBTAR
+	bool "smbtar"
+	default y
+	depends on BR2_PACKAGE_SAMBA_SMBCLIENT
+	help
+	  tar-like script that wraps smbclient
+
+comment "smbtar        - disabled (requires smbclient)"
+	depends on !BR2_PACKAGE_SAMBA_SMBCLIENT
+
 config BR2_PACKAGE_SAMBA_TDB
 	bool "tdb"
 	default y

Modified: trunk/buildroot/package/samba/S91smb
===================================================================
--- trunk/buildroot/package/samba/S91smb	2008-10-06 19:20:58 UTC (rev 23606)
+++ trunk/buildroot/package/samba/S91smb	2008-10-06 19:53:29 UTC (rev 23607)
@@ -9,6 +9,7 @@
 # Make directories.
 mkdir -p /var/cache/samba
 mkdir -p /var/log/samba
+mkdir -p /var/lock/subsys
 
 RETVAL=0
 

Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2008-10-06 19:20:58 UTC (rev 23606)
+++ trunk/buildroot/package/samba/samba.mk	2008-10-06 19:53:29 UTC (rev 23607)
@@ -29,6 +29,10 @@
 		samba_cv_USE_SETREUID=yes \
 		samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes \
 		samba_cv_HAVE_IFACE_IFCONF=yes \
+		samba_cv_HAVE_MMAP=yes \
+		samba_cv_HAVE_FCNTL_LOCK=yes \
+		samba_cv_HAVE_SECURE_MKSTEMP=yes \
+		samba_cv_fpie=no \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -58,6 +62,7 @@
 SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_CIFS) += usr/sbin/mount.cifs \
 						   usr/sbin/umount.cifs
 SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_EVENTLOGADM) += usr/bin/eventlogadm
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_FINDSMB) += usr/bin/findsmb
 SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_NET) += usr/bin/net
 SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_NMBD) += usr/sbin/nmbd
 SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_NMBLOOKUP) += usr/bin/nmblookup
@@ -73,6 +78,7 @@
 SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBPASSWD) += usr/bin/smbpasswd
 SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBSPOOL) += usr/bin/smbspool
 SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBSTATUS) += usr/bin/smbstatus
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBTAR) += usr/bin/smbtar
 SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBTREE) += usr/bin/smbtree
 SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SWAT) += usr/sbin/swat
 SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_TDB) += usr/bin/tdbbackup \
@@ -91,7 +97,7 @@
 		PRIVATEDIR="${TARGET_DIR}/etc/samba" \
 		CONFIGDIR="${TARGET_DIR}/etc/samba" \
 		VARDIR="${TARGET_DIR}/var/log/samba" \
-		-C $(SAMBA_DIR) installservers installbin installcifsmount
+		-C $(SAMBA_DIR) installservers installbin installcifsmount installscripts
 	for file in $(SAMBA_TARGETS_); do \
 		rm -f $(TARGET_DIR)/$$file; \
 	done
