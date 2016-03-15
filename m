From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 22:45:06 +0100
Subject: [Buildroot] [git commit] samba: remove deprecated
Message-ID: <20160315214848.F25AD7FCCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bd9dbc13af7e03747f52e9d1fd52fc863696bf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's been deprecated for a year now so remove it.

[Peter: drop !samba dependency from samba4]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                             |   7 +
 package/Config.in                            |   1 -
 package/samba/0001-fix-smbd-libs-avahi.patch |  17 --
 package/samba/0002-getaddrinfo.patch         |  20 --
 package/samba/Config.in                      | 292 ---------------------------
 package/samba/S91smb                         |  81 --------
 package/samba/samba.hash                     |   2 -
 package/samba/samba.mk                       | 189 -----------------
 package/samba/simple.conf                    |  25 ---
 package/samba4/Config.in                     |   1 -
 10 files changed, 7 insertions(+), 628 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f2b05cb..828d0ac 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_PACKAGE_SAMBA
+	bool "samba"
+	select BR2_LEGACY
+	help
+	  The samba package was removed in favour of samba4 since the
+	  3.x series isn't supported by upstream any longer.
+
 config BR2_PACKAGE_KODI_WAVPACK
 	bool "wavpack"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 7128bca..16e4957 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1475,7 +1475,6 @@ endif
 	source "package/rsync/Config.in"
 	source "package/rtorrent/Config.in"
 	source "package/rtptools/Config.in"
-	source "package/samba/Config.in"
 	source "package/samba4/Config.in"
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
diff --git a/package/samba/0001-fix-smbd-libs-avahi.patch b/package/samba/0001-fix-smbd-libs-avahi.patch
deleted file mode 100644
index 6624f57..0000000
--- a/package/samba/0001-fix-smbd-libs-avahi.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Expliticly link with -lpthread if smbd is compiled with
-avahi support. Otherwise the binary will fail to run.
-
-Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
-
-diff -Nura samba-3.6.16.orig/source3/Makefile.in samba-3.6.16/source3/Makefile.in
---- samba-3.6.16.orig/source3/Makefile.in	2013-06-21 08:12:39.995871935 -0300
-+++ samba-3.6.16/source3/Makefile.in	2013-06-21 08:13:17.778103805 -0300
-@@ -1783,7 +1783,7 @@
- 		$(KRB5LIBS) $(DYNEXP) $(PRINT_LIBS) $(AUTH_LIBS) \
- 		$(ACL_LIBS) $(PASSDB_LIBS) $(LIBS) $(DNSSD_LIBS) $(AVAHI_LIBS) \
- 		$(POPT_LIBS) @SMBD_LIBS@ $(LIBTALLOC_LIBS) $(LIBTEVENT_LIBS) $(LIBTDB_LIBS) \
--		$(LIBWBCLIENT_LIBS) $(ZLIB_LIBS)
-+		$(LIBWBCLIENT_LIBS) $(ZLIB_LIBS) $(PTHREAD_LDFLAGS)
-
- bin/nmbd at EXEEXT@: $(BINARY_PREREQS) $(NMBD_OBJ) @BUILD_POPT@ $(LIBTALLOC) $(LIBTEVENT) $(LIBTDB) $(LIBWBCLIENT)
- 	@echo Linking $@
diff --git a/package/samba/0002-getaddrinfo.patch b/package/samba/0002-getaddrinfo.patch
deleted file mode 100644
index df3570c..0000000
--- a/package/samba/0002-getaddrinfo.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Patch forward-ported from OpenWRT.
-Don't check for buggy getaddrinfo() assume it's safe if it's present.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura samba-3.6.8.orig/source3/configure samba-3.6.8/source3/configure
---- samba-3.6.8.orig/source3/configure	2012-09-14 05:19:52.000000000 -0300
-+++ samba-3.6.8/source3/configure	2012-09-25 20:31:57.861743235 -0300
-@@ -13269,10 +13269,7 @@
- 	# see bug 5910, use our replacements if we detect
- 	# a broken system.
- 	if test "$cross_compiling" = yes; then :
--  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
--$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
--as_fn_error $? "cannot run test program while cross compiling
--See \`config.log' for more details" "$LINENO" 5; }
-+		$as_echo "assuming valid getaddrinfo without bug 5910" >&2
- else
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
diff --git a/package/samba/Config.in b/package/samba/Config.in
deleted file mode 100644
index 7ff8428..0000000
--- a/package/samba/Config.in
+++ /dev/null
@@ -1,292 +0,0 @@
-config BR2_PACKAGE_SAMBA
-	bool "samba"
-	depends on BR2_DEPRECATED_SINCE_2015_05
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU # fork()
-	depends on !BR2_nios2 # binary too large, relocations don't fit
-	select BR2_PACKAGE_POPT
-	help
-	  Provides secure, stable and fast file and print services
-	  for all clients using the SMB/CIFS protocol, such as all
-	  versions of DOS, Windows, OS/2, Linux and many others.
-
-	  http://www.samba.org/
-
-	  NOTE: A complete Samba install takes over 50MB of space,
-		so choose only the components you need.
-
-comment "samba needs a toolchain w/ threads"
-	depends on BR2_DEPRECATED_SINCE_2015_05
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-if BR2_PACKAGE_SAMBA
-
-config BR2_PACKAGE_SAMBA_MAX_DEBUGLEVEL
-	int "Maximum level of compiled-in debug messages"
-	range -1 10000
-	default -1
-	help
-	  Define the level of compiled-in debug messages.
-	  This allows for big space savings, -1 being the lowest (none).
-
-config BR2_PACKAGE_SAMBA_LIBICONV
-	bool "extended encodings (libiconv)"
-	depends on !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBICONV
-	help
-	  Include libiconv support for extended conversion of filename
-	  enconding. Samba has built-in support for UTF-8, ISO-8859-1
-	  and ASCII, so this is only required if you want to support
-	  other encodings.
-
-menu "Samba tools selection"
-
-config BR2_PACKAGE_SAMBA_EVENTLOGADM
-	bool "eventlogadm"
-	default y
-	help
-	  Write Eventlog records to a tdb or perform other eventlog functions
-
-config BR2_PACKAGE_SAMBA_FINDSMB
-	bool "findsmb"
-	default y
-	depends on BR2_PACKAGE_SAMBA_SMBCLIENT
-	depends on BR2_PACKAGE_SAMBA_NMBLOOKUP
-	depends on BR2_PACKAGE_PERL
-	help
-	  Script to browse network
-
-comment "findsmb       - disabled (requires nmblookup, smbclient and perl)"
-	depends on !BR2_PACKAGE_SAMBA_SMBCLIENT || !BR2_PACKAGE_SAMBA_NMBLOOKUP || !BR2_PACKAGE_PERL
-
-config BR2_PACKAGE_SAMBA_NET
-	bool "net"
-	default y
-	help
-	  Distributed SMB/CIFS Server Management Utility
-
-config BR2_PACKAGE_SAMBA_NMBD
-	bool "nmbd"
-	default y
-	help
-	  NetBIOS name server to provide NetBIOS over IP naming services
-	  to clients
-
-config BR2_PACKAGE_SAMBA_NMBLOOKUP
-	bool "nmblookup"
-	default y
-	help
-	  Query NetBIOS names and map them to IP addresses in a network
-	  using NetBIOS over TCP/IP queries
-
-config BR2_PACKAGE_SAMBA_NTLM_AUTH
-	bool "ntlm_auth"
-	default y
-	help
-	  Helper utility that authenticates users using NT/LM authentication
-
-config BR2_PACKAGE_SAMBA_PDBEDIT
-	bool "pdbedit"
-	default y
-	help
-	  Manage the SAM database (Database of Samba Users)
-
-config BR2_PACKAGE_SAMBA_PROFILES
-	bool "profiles"
-	default y
-	help
-	  Utility that reports and changes SIDs in Windows NT registry files
-
-config BR2_PACKAGE_SAMBA_RPCCLIENT
-	bool "rpcclient"
-	select BR2_PACKAGE_READLINE
-	default y
-	help
-	  Tool for executing client side MS-RPC functions using RPC
-	  calls from a UNIX workstation.
-
-config BR2_PACKAGE_SAMBA_SMBCACLS
-	bool "smbcacls"
-	default y
-	help
-	  Set or get ACLs on an NT file or directory names
-
-config BR2_PACKAGE_SAMBA_SMBCLIENT
-	bool "smbclient"
-	select BR2_PACKAGE_READLINE
-	default y
-	help
-	  ftp-like client to access SMB/CIFS resources on servers
-
-config BR2_PACKAGE_SAMBA_SMBCONTROL
-	bool "smbcontrol"
-	default y
-	help
-	  Send messages to smbd, nmbd or winbindd processes
-
-config BR2_PACKAGE_SAMBA_SMBCQUOTAS
-	bool "smbcquotas"
-	default y
-	help
-	  Set or get QUOTAs of NTFS 5 shares
-
-config BR2_PACKAGE_SAMBA_SMBD
-	bool "smbd"
-	default y
-	help
-	  The server daemon that provides filesharing and printing services
-
-config BR2_PACKAGE_SAMBA_SMBGET
-	bool "smbget"
-	default y
-	help
-	  wget-like utility for download files over SMB
-
-config BR2_PACKAGE_SAMBA_SMBLDBTOOLS
-	bool "smbldbtools"
-	default y
-	help
-	  ldbadd ldbdel ldbedit ldbmodify ldbrename ldbsearch tools
-
-config BR2_PACKAGE_SAMBA_SMBPASSWD
-	bool "smbpasswd"
-	default y
-	help
-	  Change a user's SMB passwd
-
-config BR2_PACKAGE_SAMBA_SMBSHARESEC
-	bool "smbsharesec"
-	default y
-	help
-	  Manipulate share permissions on SMB file shares
-
-config BR2_PACKAGE_SAMBA_SMBSPOOL
-	bool "smbspool"
-	default y
-	help
-	  Send a print file to an SMB printer
-
-config BR2_PACKAGE_SAMBA_SMBSTATUS
-	bool "smbstatus"
-	default y
-	help
-	  Report on current Samba connections
-
-config BR2_PACKAGE_SAMBA_SMBTREE
-	bool "smbtree"
-	default y
-	help
-	  A text based smb network browser
-
-config BR2_PACKAGE_SAMBA_SWAT
-	bool "swat"
-	default y
-	help
-	  Samba Web Administration Tool
-
-config BR2_PACKAGE_SAMBA_SMBTA_UTIL
-	bool "smbta-util"
-	default y
-	help
-	  Tool to ease the configuration of the vfs_smb_traffic_analyzer
-	  module regarding data encryption.
-
-config BR2_PACKAGE_SAMBA_SMBTAR
-	bool "smbtar"
-	default y
-	depends on BR2_PACKAGE_SAMBA_SMBCLIENT
-	help
-	  tar-like script that wraps smbclient
-
-comment "smbtar        - disabled (requires smbclient)"
-	depends on !BR2_PACKAGE_SAMBA_SMBCLIENT
-
-config BR2_PACKAGE_SAMBA_TDB
-	bool "tdb"
-	default y
-	help
-	  Tools to operate on the .tdb database files
-
-config BR2_PACKAGE_SAMBA_TESTPARM
-	bool "testparm"
-	default y
-	help
-	  Check an smb.conf configuration file for internal correctness
-
-config BR2_PACKAGE_SAMBA_WINBINDD
-	bool "winbindd"
-	default y
-	help
-	  Name Service Switch daemon for resolving names from NT servers
-
-config BR2_PACKAGE_SAMBA_WBINFO
-	bool "wbinfo"
-	default y
-	depends on BR2_PACKAGE_SAMBA_WINBINDD
-	help
-	  Query information from winbind daemon
-
-endmenu
-
-
-menu "Samba libraries selection"
-
-config BR2_PACKAGE_SAMBA_LIBSMBCLIENT
-	bool "libsmbclient"
-	help
-	  libsmbclient is a library toolset that permits applications
-	  to manipulate CIFS/SMB network resources using many of the
-	  standards POSIX functions available for manipulating local
-	  files.
-
-config BR2_PACKAGE_SAMBA_LIBNSS_WINS
-	bool "libnss_wins"
-	default y
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_PACKAGE_SAMBA_WINBINDD
-	help
-	  libnss_wins is a library that permits the Name Service Switch
-	  to resolve NetBIOS names.
-
-config BR2_PACKAGE_SAMBA_LIBNSS_WINBIND
-	bool "libnss_winbind"
-	default y
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_PACKAGE_SAMBA_WINBINDD
-	help
-	  libnss_winbind is a library that permits the Name Service
-	  Switch to resolve user and group information from a Windows
-	  NT server.
-
-endmenu
-
-
-menu "Samba support selection"
-
-config BR2_PACKAGE_SAMBA_AVAHI
-	bool "support avahi"
-	default y
-	depends on BR2_PACKAGE_AVAHI_DAEMON
-	depends on BR2_USE_MMU # dbus
-	select BR2_PACKAGE_DBUS
-	help
-	  Include support for avahi
-
-comment "support avahi - disabled (requires avahi-daemon)"
-	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_AVAHI_DAEMON
-
-config BR2_PACKAGE_SAMBA_GAMIN
-	bool "support gamin"
-	default y
-	depends on BR2_PACKAGE_GAMIN
-	help
-	  Include support for gamin
-
-comment "support gamin - disabled (requires gamin)"
-	depends on !BR2_PACKAGE_GAMIN
-
-endmenu
-
-endif
diff --git a/package/samba/S91smb b/package/samba/S91smb
deleted file mode 100755
index 64fa689..0000000
--- a/package/samba/S91smb
+++ /dev/null
@@ -1,81 +0,0 @@
-#!/bin/sh
-#
-# Stolen from RedHat FC5.
-#
-
-# Check that smb.conf exists.
-[ -f /etc/samba/smb.conf ] || exit 0
-
-# Make directories.
-mkdir -p /var/cache/samba
-mkdir -p /var/log/samba
-mkdir -p /var/lock/subsys
-mkdir -p /var/run/samba
-
-RETVAL=0
-
-start() {
-	printf "Starting SMB services: "
-	smbd -D
-	RETVAL=$?
-	echo "done"
-
-	printf "Starting NMB services: "
-	nmbd -D
-	RETVAL2=$?
-	echo "done"
-
-	[ $RETVAL -eq 0 -a $RETVAL2 -eq 0 ] && touch /var/lock/subsys/smb || \
-	   RETVAL=1
-	return $RETVAL
-}	
-
-stop() {
-	printf "Shutting down SMB services: "
-	kill -9 `pidof smbd`
-	RETVAL=$?
-	rm -f /var/run/samba/smbd.pid
-	echo "done"
-
-	printf "Shutting down NMB services: "
-	kill -9 `pidof nmbd`
-	RETVAL2=$?
-	rm -f /var/run/samba/nmbd.pid
-
-	[ $RETVAL -eq 0 -a $RETVAL2 -eq 0 ] && rm -f /var/lock/subsys/smb
-	echo "done"
-	return $RETVAL
-}	
-
-restart() {
-	stop
-	start
-}	
-
-reload() {
-        printf "Reloading smb.conf file: "
-	kill -HUP `pidof smbd`
-	RETVAL=$?
-	echo "done"
-	return $RETVAL
-}	
-
-case "$1" in
-  start)
-  	start
-	;;
-  stop)
-  	stop
-	;;
-  restart)
-  	restart
-	;;
-  reload)
-  	reload
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|reload}"
-	exit 1
-esac
-
-exit $?
diff --git a/package/samba/samba.hash b/package/samba/samba.hash
deleted file mode 100644
index 3a8581a..0000000
--- a/package/samba/samba.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256	8f2c8a7f2bd89b0dfd228ed917815852f7c625b2bc0936304ac3ed63aaf83751	samba-3.6.25.tar.gz
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
deleted file mode 100644
index 68da9d9..0000000
--- a/package/samba/samba.mk
+++ /dev/null
@@ -1,189 +0,0 @@
-################################################################################
-#
-# samba
-#
-################################################################################
-
-SAMBA_VERSION = 3.6.25
-SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
-SAMBA_SUBDIR = source3
-SAMBA_INSTALL_STAGING = YES
-SAMBA_LICENSE = GPLv3+
-SAMBA_LICENSE_FILES = COPYING
-
-SAMBA_DEPENDENCIES = popt \
-	$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),readline) \
-	$(if $(BR2_PACKAGE_SAMBA_SMBCLIENT),readline) \
-	$(if $(BR2_PACKAGE_SAMBA_AVAHI),avahi) \
-	$(if $(BR2_PACKAGE_SAMBA_GAMIN),gamin)
-
-SAMBA_CONF_ENV = \
-	ac_cv_file__proc_sys_kernel_core_pattern=yes \
-	libreplace_cv_HAVE_GETTIMEOFDAY_TZ=yes \
-	samba_cv_USE_SETREUID=yes \
-	samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes \
-	libreplace_cv_HAVE_IFACE_GETIFADDRS=yes \
-	libreplace_cv_HAVE_IFACE_IFCONF=yes \
-	libreplace_cv_HAVE_MMAP=yes \
-	samba_cv_HAVE_FCNTL_LOCK=yes \
-	libreplace_cv_HAVE_SECURE_MKSTEMP=yes \
-	samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
-	samba_cv_fpie=no \
-	libreplace_cv_HAVE_IPV6=yes \
-	$(if $(BR2_PACKAGE_SAMBA_AVAHI),AVAHI_LIBS=-pthread)
-
-SAMBA_CONF_OPTS = \
-	--with-fhs \
-	--with-piddir=/var/run/samba \
-	--with-lockdir=/var/cache/samba \
-	--with-ncalrpcdir=/var/run/ncalrpc \
-	--with-nmbdsocketdir=/var/run/nmbd \
-	\
-	--disable-cups \
-	--enable-shared-libs \
-	--disable-pie \
-	--disable-relro \
-	--disable-dnssd \
-	\
-	$(if $(BR2_PACKAGE_SAMBA_AVAHI),--enable-avahi,--disable-avahi) \
-	$(if $(BR2_PACKAGE_SAMBA_GAMIN),--enable-fam,--disable-fam) \
-	$(if $(BR2_PACKAGE_SAMBA_SWAT),--enable-swat,--disable-swat) \
-	\
-	--without-cluster-support \
-	--without-dnsupdate \
-	--with-sys-quotas \
-	--without-ads \
-	--without-ldap \
-	--with-included-iniparser \
-	\
-	$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),--with-readline=$(STAGING_DIR)) \
-	$(if $(BR2_PACKAGE_SAMBA_SMBCLIENT),--with-readline=$(STAGING_DIR)) \
-	$(if $(BR2_PACKAGE_SAMBA_WINBINDD),--with-winbind,--without-winbind)
-
-SAMBA_INSTALL_TARGET_OPTS = \
-	DESTDIR=$(TARGET_DIR) -C $(SAMBA_DIR)/$(SAMBA_SUBDIR) \
-	installlibs installservers installbin installscripts \
-	$(if $(BR2_PACKAGE_SAMBA_SWAT),installswat)
-
-# binaries to keep
-SAMBA_BINTARGETS_y = \
-	usr/sbin/smbd \
-	usr/lib/libtalloc.so \
-	usr/lib/libtdb.so
-
-# binaries to remove
-SAMBA_BINTARGETS_ = \
-	usr/lib/libnetapi.so* \
-	usr/lib/libsmbsharemodes.so*
-
-# binaries to keep or remove
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_EVENTLOGADM) += usr/bin/eventlogadm
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_NET) += usr/bin/net
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_NMBD) += usr/sbin/nmbd
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_NMBLOOKUP) += usr/bin/nmblookup
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_NTLM_AUTH) += usr/bin/ntlm_auth
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_PDBEDIT) += usr/bin/pdbedit
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_PROFILES) += usr/bin/profiles
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_RPCCLIENT) += usr/bin/rpcclient
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCACLS) += usr/bin/smbcacls
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCLIENT) += usr/bin/smbclient
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCONTROL) += usr/bin/smbcontrol
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCQUOTAS) += usr/bin/smbcquotas
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBD) += usr/sbin/smbd
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBGET) += usr/bin/smbget
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbadd
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbdel
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbedit
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbmodify
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbrename
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbsearch
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBPASSWD) += usr/bin/smbpasswd
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBSHARESEC) += usr/bin/sharesec
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBSPOOL) += usr/bin/smbspool
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBSTATUS) += usr/bin/smbstatus
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBTA_UTIL) += usr/bin/smbta-util
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBTREE) += usr/bin/smbtree
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SWAT) += usr/sbin/swat
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_TDB) += usr/bin/tdbbackup
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_TDB) += usr/bin/tdbdump
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_TDB) += usr/bin/tdbtool
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_TESTPARM) += usr/bin/testparm
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_WINBINDD) += usr/sbin/winbindd
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_WBINFO) += usr/bin/wbinfo
-
-# libraries to keep or remove
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_WINBINDD) += usr/lib/libwbclient.so*
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_LIBSMBCLIENT) += usr/lib/libsmbclient.so*
-
-# non-binaries to remove
-SAMBA_TXTTARGETS_ = \
-	usr/include/libsmbclient.h \
-	usr/include/netapi.h \
-	usr/include/smb_share_modes.h \
-	usr/include/talloc.h \
-	usr/include/tdb.h \
-	usr/include/wbclient.h
-
-# non-binaries to keep or remove
-SAMBA_TXTTARGETS_$(BR2_PACKAGE_SAMBA_FINDSMB) += usr/bin/findsmb
-SAMBA_TXTTARGETS_$(BR2_PACKAGE_SAMBA_SMBTAR) += usr/bin/smbtar
-
-define SAMBA_REMOVE_UNNEEDED_BINARIES
-	rm -f $(addprefix $(TARGET_DIR)/, $(SAMBA_BINTARGETS_))
-	rm -f $(addprefix $(TARGET_DIR)/, $(SAMBA_TXTTARGETS_))
-endef
-
-SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_UNNEEDED_BINARIES
-
-ifeq ($(BR2_PACKAGE_SAMBA_LIBNSS_WINS),y)
-define SAMBA_INSTALL_LIBNSS_WINS
-	$(INSTALL) -m 0755 -D $(@D)/nsswitch/libnss_wins.so $(TARGET_DIR)/lib/libnss_wins.so.2
-	ln -snf libnss_wins.so.2 $(TARGET_DIR)/lib/libnss_wins.so
-endef
-SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_LIBNSS_WINS
-endif
-
-ifeq ($(BR2_PACKAGE_SAMBA_LIBNSS_WINBIND),y)
-define SAMBA_INSTALL_LIBNSS_WINBIND
-	$(INSTALL) -m 0755 -D $(@D)/nsswitch/libnss_winbind.so $(TARGET_DIR)/lib/libnss_winbind.so.2
-	ln -snf libnss_winbind.so.2 $(TARGET_DIR)/lib/libnss_winbind.so
-endef
-SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_LIBNSS_WINBIND
-endif
-
-define SAMBA_REMOVE_SWAT_DOCUMENTATION
-	# Remove the documentation
-	rm -rf $(TARGET_DIR)/usr/swat/help/manpages
-	rm -rf $(TARGET_DIR)/usr/swat/help/Samba3*
-	rm -rf $(TARGET_DIR)/usr/swat/using_samba/
-	# Removing the welcome.html file will make swat default to
-	# welcome-no-samba-doc.html
-	rm -rf $(TARGET_DIR)/usr/swat/help/welcome.html
-endef
-
-# --with-libiconv="" is to avoid detecting host libiconv and build failure
-ifeq ($(BR2_PACKAGE_SAMBA_LIBICONV),y)
-SAMBA_DEPENDENCIES += libiconv
-SAMBA_CONF_OPTS += --with-libiconv=$(STAGING_DIR)
-else
-SAMBA_CONF_OPTS += --with-libiconv=""
-endif
-
-# Compiled debug messages by level
-SAMBA_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -DMAX_DEBUG_LEVEL=$(BR2_PACKAGE_SAMBA_MAX_DEBUGLEVEL)"
-
-ifeq ($(BR2_PACKAGE_SAMBA_SWAT),y)
-SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_SWAT_DOCUMENTATION
-endif
-
-define SAMBA_INSTALL_CONFIG
-	$(INSTALL) -m 0644 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf
-endef
-
-SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_CONFIG
-
-define SAMBA_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d/S91smb
-endef
-
-$(eval $(autotools-package))
diff --git a/package/samba/simple.conf b/package/samba/simple.conf
deleted file mode 100644
index c2c0c8c..0000000
--- a/package/samba/simple.conf
+++ /dev/null
@@ -1,25 +0,0 @@
-#======================= Global Settings =====================================
-[global]
-workgroup = MYGROUP
-server string = MYDATA
-max log size = 50
-security = share
-encrypt passwords = yes
-smb passwd file = /etc/samba/smbpasswd
-log file = /var/log/samba/log.smbd
-hosts allow = 127.
-interfaces = eth0 192.168.0.1/255.255.255.0
-socket options = TCP_NODELAY SO_RCVBUF=8192 SO_SNDBUF=8192
-
-#============================ Share Definitions ==============================
-idmap uid = 16777216-33554431
-idmap gid = 16777216-33554431
-template shell = /bin/false
-winbind use default domain = no
-
-[data]
-path = /data
-public = yes
-only guest = yes
-writable = yes
-printable = no
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 2503785..5ae2c36 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -6,7 +6,6 @@ comment "samba4 needs a toolchain w/ RPC, wchar, dynamic library, threads"
 
 config BR2_PACKAGE_SAMBA4
 	bool "samba4"
-	depends on !BR2_PACKAGE_SAMBA
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # e2fsprogs
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
