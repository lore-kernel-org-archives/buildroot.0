From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 22:13:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  samba
Message-ID: <20070114061328.3F39D485CB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 22:13:27 -0800 (Sat, 13 Jan 2007)
New Revision: 17294

Log:
Add Samba to buildroot.


Added:
   trunk/buildroot/package/samba/
   trunk/buildroot/package/samba/Config.in
   trunk/buildroot/package/samba/init-samba
   trunk/buildroot/package/samba/samba-getgrouplist.patch
   trunk/buildroot/package/samba/samba.mk
   trunk/buildroot/package/samba/simple.conf


Changeset:
Added: trunk/buildroot/package/samba/Config.in
===================================================================
--- trunk/buildroot/package/samba/Config.in	                        (rev 0)
+++ trunk/buildroot/package/samba/Config.in	2007-01-14 06:13:27 UTC (rev 17294)
@@ -0,0 +1,181 @@
+config BR2_PACKAGE_SAMBA
+	bool "samba"
+	default n
+	help
+	  Provides print services to all manner of SMB/CIFS clients,
+	  including the numerous versions of Microsoft Windows
+	  operating systems.
+
+	  http://www.samba.org/
+
+	  NOTE: A complete Samba install takes close to 40MB of space,
+		so choose only the components you need.
+
+menu "Samba tools selection"
+	depends BR2_PACKAGE_SAMBA
+
+config BR2_PACKAGE_SAMBA_CIFS
+	bool "cifs"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Support CIFS
+
+config BR2_PACKAGE_SAMBA_EVENTLOGADM
+	bool "eventlogadm"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Write Eventlog records to a tdb or perform other eventlog functions
+
+config BR2_PACKAGE_SAMBA_NET
+	bool "net"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Distributed SMB/CIFS Server Management Utility
+
+config BR2_PACKAGE_SAMBA_NMBD
+	bool "nmbd"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  NetBIOS name server to provide NetBIOS over IP naming services
+	  to clients
+
+config BR2_PACKAGE_SAMBA_NMBLOOKUP
+	bool "nmblookup"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Query NetBIOS names and map them to IP addresses in a network
+	  using NetBIOS over TCP/IP queries
+
+config BR2_PACKAGE_SAMBA_NTLM_AUTH
+	bool "ntlm_auth"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Helper utility that authenticates users using NT/LM authentication
+
+config BR2_PACKAGE_SAMBA_PDBEDIT
+	bool "pdbedit"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Manage the SAM database (Database of Samba Users)
+
+config BR2_PACKAGE_SAMBA_PROFILES
+	bool "profiles"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Utility that reports and changes SIDs in Windows NT registry files
+
+config BR2_PACKAGE_SAMBA_RPCCLIENT
+	bool "rpcclient"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Tool for executing client side MS-RPC functions using RPC
+	  calls from a UNIX workstation.
+
+config BR2_PACKAGE_SAMBA_SMBCACLS
+	bool "smbcacls"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Set or get ACLs on an NT file or directory names
+
+config BR2_PACKAGE_SAMBA_SMBCLIENT
+	bool "smbclient"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  ftp-like client to access SMB/CIFS resources on servers
+
+config BR2_PACKAGE_SAMBA_SMBCONTROL
+	bool "smbcontrol"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Send messages to smbd, nmbd or winbindd processes
+
+config BR2_PACKAGE_SAMBA_SMBCQUOTAS
+	bool "smbcquotas"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Set or get QUOTAs of NTFS 5 shares
+
+config BR2_PACKAGE_SAMBA_SMBGET
+	bool "smbget"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  wget-like utility for download files over SMB
+
+config BR2_PACKAGE_SAMBA_SMBPASSWD
+	bool "smbpasswd"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Change a user's SMB passwd
+
+config BR2_PACKAGE_SAMBA_SMBSPOOL
+	bool "smbspool"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Send a print file to an SMB printer
+
+config BR2_PACKAGE_SAMBA_SMBSTATUS
+	bool "smbstatus"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Report on current Samba connections
+
+config BR2_PACKAGE_SAMBA_SMBTREE
+	bool "smbtree"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  A text based smb network browser
+
+config BR2_PACKAGE_SAMBA_SWAT
+	bool "swat"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Samba Web Administration Tool
+
+config BR2_PACKAGE_SAMBA_TDB
+	bool "tdb"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Tools to operate on the .tdb database files
+
+config BR2_PACKAGE_SAMBA_TESTPARM
+	bool "testparm"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Check an smb.conf configuration file for internal correctness
+
+config BR2_PACKAGE_SAMBA_WINBINDD
+	bool "winbindd"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Name Service Switch daemon for resolving names from NT servers
+
+config BR2_PACKAGE_SAMBA_WBINFO
+	bool "wbinfo"
+	default y
+	depends on BR2_PACKAGE_SAMBA_WINBINDD
+	help
+	  Query information from winbind daemon
+
+endmenu

Added: trunk/buildroot/package/samba/init-samba
===================================================================
--- trunk/buildroot/package/samba/init-samba	                        (rev 0)
+++ trunk/buildroot/package/samba/init-samba	2007-01-14 06:13:27 UTC (rev 17294)
@@ -0,0 +1,79 @@
+#!/bin/sh
+#
+# Stolen from RedHat FC5.
+#
+
+# Check that smb.conf exists.
+[ -f /etc/samba/smb.conf ] || exit 0
+
+# Make directories.
+mkdir -p /var/cache/samba
+mkdir -p /var/log/samba
+
+RETVAL=0
+
+start() {
+	echo -n "Starting SMB services: "
+	smbd -D
+	RETVAL=$?
+	echo "done"
+
+	echo -n "Starting NMB services: "
+	nmbd -D
+	RETVAL2=$?
+	echo "done"
+
+	[ $RETVAL -eq 0 -a $RETVAL2 -eq 0 ] && touch /var/lock/subsys/smb || \
+	   RETVAL=1
+	return $RETVAL
+}	
+
+stop() {
+	echo -n "Shutting down SMB services: "
+	kill -9 `pidof smbd`
+	RETVAL=$?
+	rm -f /var/run/smbd.pid
+	echo "done"
+
+	echo -n "Shutting down NMB services: "
+	kill -9 `pidof nmbd`
+	RETVAL2=$?
+	rm -f /var/run/nmbd.pid
+
+	[ $RETVAL -eq 0 -a $RETVAL2 -eq 0 ] && rm -f /var/lock/subsys/smb
+	echo "done"
+	return $RETVAL
+}	
+
+restart() {
+	stop
+	start
+}	
+
+reload() {
+        echo -n "Reloading smb.conf file: "
+	kill -HUP `pidof smbd`
+	RETVAL=$?
+	echo "done"
+	return $RETVAL
+}	
+
+case "$1" in
+  start)
+  	start
+	;;
+  stop)
+  	stop
+	;;
+  restart)
+  	restart
+	;;
+  reload)
+  	reload
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
+
+exit $?


Property changes on: trunk/buildroot/package/samba/init-samba
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/package/samba/samba-getgrouplist.patch
===================================================================
--- trunk/buildroot/package/samba/samba-getgrouplist.patch	                        (rev 0)
+++ trunk/buildroot/package/samba/samba-getgrouplist.patch	2007-01-14 06:13:27 UTC (rev 17294)
@@ -0,0 +1,42 @@
+diff -ur samba-3.0.23c/source/configure.in samba-3.0.23c-patched/source/configure.in
+--- samba-3.0.23c/source/configure.in	2006-07-21 11:22:57.000000000 -0500
++++ samba-3.0.23c-patched/source/configure.in	2006-11-09 10:23:26.000000000 -0600
+@@ -1399,38 +1399,6 @@
+ AC_DEFINE(HAVE_PRCTL, 1, [Whether prctl is available]),[])
+ 
+ #
+-# 
+-#
+-case "$host_os" in
+-    *linux*)
+-       # glibc <= 2.3.2 has a broken getgrouplist
+-       AC_TRY_RUN([
+-#include <unistd.h>
+-#include <sys/utsname.h>
+-main() {
+-       /* glibc up to 2.3 has a broken getgrouplist */
+-#if defined(__GLIBC__) && defined(__GLIBC_MINOR__)
+-       int libc_major = __GLIBC__;
+-       int libc_minor = __GLIBC_MINOR__;
+-
+-       if (libc_major < 2)
+-              exit(1);
+-       if ((libc_major == 2) && (libc_minor <= 3))
+-              exit(1);
+-#endif
+-       exit(0);
+-}
+-], [linux_getgrouplist_ok=yes], [linux_getgrouplist_ok=no])
+-       if test x"$linux_getgrouplist_ok" = x"yes"; then
+-          AC_DEFINE(HAVE_GETGROUPLIST, 1, [Have good getgrouplist])
+-       fi
+-       ;;
+-    *)
+-       AC_CHECK_FUNCS(getgrouplist)
+-       ;;
+-esac
+-
+-#
+ # stat64 family may need <sys/stat.h> on some systems, notably ReliantUNIX
+ #
+ 

Added: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	                        (rev 0)
+++ trunk/buildroot/package/samba/samba.mk	2007-01-14 06:13:27 UTC (rev 17294)
@@ -0,0 +1,119 @@
+#############################################################
+#
+# samba
+#
+#############################################################
+SAMBA_VER:=3.0.23d
+SAMBA_SOURCE:=samba-$(SAMBA_VER).tar.gz
+SAMBA_SITE:=ftp://us1.samba.org/pub/samba/
+SAMBA_DIR:=$(BUILD_DIR)/samba-$(SAMBA_VER)/source
+SAMBA_CAT:=$(ZCAT)
+SAMBA_BINARY:=bin/smbd
+SAMBA_TARGET_BINARY:=usr/sbin/smbd
+
+$(DL_DIR)/$(SAMBA_SOURCE):
+	$(WGET) -P $(DL_DIR) $(SAMBA_SITE)/$(SAMBA_SOURCE)
+
+$(SAMBA_DIR)/.unpacked: $(DL_DIR)/$(SAMBA_SOURCE)
+	$(SAMBA_CAT) $(DL_DIR)/$(SAMBA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh `dirname $(SAMBA_DIR)` package/samba/ samba\*.patch
+	touch $(SAMBA_DIR)/.unpacked
+
+$(SAMBA_DIR)/.configured: $(SAMBA_DIR)/.unpacked
+	(cd $(SAMBA_DIR); rm -rf config.cache; \
+		./autogen.sh; \
+		$(TARGET_CONFIGURE_OPTS) CC_FOR_BUILD="$(HOSTCC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
+		samba_cv_USE_SETREUID=yes \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--with-lockdir=/var/cache/samba \
+		--with-piddir=/var/run \
+		--with-privatedir=/etc/samba \
+		--with-logfilebase=/var/log/samba \
+		--with-configdir=/etc/samba \
+		--without-ldap \
+		--with-included-popt \
+		--with-included-iniparser \
+		--disable-cups \
+		--disable-static \
+	);
+	touch $(SAMBA_DIR)/.configured
+
+$(SAMBA_DIR)/$(SAMBA_BINARY): $(SAMBA_DIR)/.configured
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(SAMBA_DIR)
+
+SAMBA_TARGETS_ :=
+SAMBA_TARGETS_y :=
+
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_CIFS)		+= usr/sbin/mount.cifs   \
+						   usr/sbin/umount.cifs
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_EVENTLOGADM)	+= usr/bin/eventlogadm
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_NET)		+= usr/bin/net
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_NMBD)		+= usr/sbin/nmbd
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_NMBLOOKUP)	+= usr/bin/nmblookup
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_NTLM_AUTH)	+= usr/bin/ntlm_auth
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_PDBEDIT)	+= usr/bin/pdbedit
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_PROFILES)	+= usr/bin/profiles
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_RPCCLIENT)	+= usr/bin/rpcclient
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBCACLS)	+= usr/bin/smbcacls
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBCLIENT)	+= usr/bin/smbclient
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBCONTROL)	+= usr/bin/smbcontrol
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBCQUOTAS)	+= usr/bin/smbcquotas
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBGET)	+= usr/bin/smbget
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBPASSWD)	+= usr/bin/smbpasswd
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBSPOOL)	+= usr/bin/smbspool
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBSTATUS)	+= usr/bin/smbstatus
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBTREE)	+= usr/bin/smbtree
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SWAT)		+= usr/sbin/swat
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_TDB)		+= usr/bin/tdbbackup     \
+						   usr/bin/tdbdump       \
+						   usr/bin/tdbtool
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_TESTPARM)	+= usr/bin/testparm
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_WINBINDD)	+= usr/sbin/winbindd
+SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_WBINFO)	+= usr/bin/wbinfo
+
+$(TARGET_DIR)/$(SAMBA_TARGET_BINARY): $(SAMBA_DIR)/$(SAMBA_BINARY)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC)	\
+		prefix="${TARGET_DIR}/usr" \
+		BASEDIR="${TARGET_DIR}/usr" \
+		SBINDIR="${TARGET_DIR}/usr/sbin" \
+		LOCKDIR="${TARGET_DIR}/var/cache/samba" \
+		PRIVATEDIR="${TARGET_DIR}/etc/samba" \
+		CONFIGDIR="${TARGET_DIR}/etc/samba" \
+		VARDIR="${TARGET_DIR}/var/log/samba" \
+		-C $(SAMBA_DIR) installservers installbin installcifsmount
+	for file in $(SAMBA_TARGETS_) ; do \
+		rm -f $(TARGET_DIR)/$$file; \
+	done
+	$(INSTALL) -m 0755 -D package/samba/init-samba $(TARGET_DIR)/etc/init.d/S91smb
+	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ] ; then \
+		$(INSTALL) -m 0755 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
+	fi;
+	rm -rf $(TARGET_DIR)/var/cache/samba
+	rm -rf $(TARGET_DIR)/var/lib/samba
+
+samba: uclibc $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
+
+samba-clean:
+	rm -f $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
+	for file in $(SAMBA_TARGETS_y) ; do \
+		rm -f $(TARGET_DIR)/$$file; \
+	done
+	rm -f $(TARGET_DIR)/etc/init.d/S91smb
+	rm -rf $(TARGET_DIR)/etc/samba
+	-$(MAKE) -C $(SAMBA_DIR) clean
+
+samba-dirclean:
+	rm -rf $(SAMBA_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_SAMBA)),y)
+TARGETS+=samba
+endif

Added: trunk/buildroot/package/samba/simple.conf
===================================================================
--- trunk/buildroot/package/samba/simple.conf	                        (rev 0)
+++ trunk/buildroot/package/samba/simple.conf	2007-01-14 06:13:27 UTC (rev 17294)
@@ -0,0 +1,25 @@
+#======================= Global Settings =====================================
+[global]
+workgroup = MYGROUP
+server string = MYDATA
+max log size = 50
+security = share
+encrypt passwords = yes
+smb passwd file = /etc/samba/smbpasswd
+log file = /var/log/samba/log.smbd
+hosts allow = 127.
+interfaces = eth0 192.168.0.1/255.255.255.0
+socket options = TCP_NODELAY SO_RCVBUF=8192 SO_SNDBUF=8192
+
+#============================ Share Definitions ==============================
+idmap uid = 16777216-33554431
+idmap gid = 16777216-33554431
+template shell = /bin/false
+winbind use default domain = no
+
+[data]
+path = /data
+public = yes
+only guest = yes
+writable = yes
+printable = no
