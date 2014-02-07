From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Feb 2014 17:52:33 -0300
Subject: [Buildroot] [PATCH 3/4] samba: convert to choice package
In-Reply-To: <1391806354-32698-1-git-send-email-gustavo@zacarias.com.ar>
References: <1391806354-32698-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1391806354-32698-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Convert the classic samba package to a choice and move it to samba3 in
preparation for the samba4 package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba/Config.in                            | 274 ++-------------------
 package/samba/samba.mk                             | 179 +-------------
 package/samba/{ => samba3}/Config.in               |  99 +++-----
 package/samba/{ => samba3}/S91smb                  |   0
 .../samba3-0001-fix-smbd-libs-avahi.patch}         |   0
 .../samba3-0002-getaddrinfo.patch}                 |   0
 package/samba/samba3/samba3.mk                     | 181 ++++++++++++++
 package/samba/{ => samba3}/simple.conf             |   0
 8 files changed, 240 insertions(+), 493 deletions(-)
 copy package/samba/{ => samba3}/Config.in (67%)
 rename package/samba/{ => samba3}/S91smb (100%)
 rename package/samba/{samba-fix-smbd-libs-avahi.patch => samba3/samba3-0001-fix-smbd-libs-avahi.patch} (100%)
 rename package/samba/{samba-getaddrinfo.patch => samba3/samba3-0002-getaddrinfo.patch} (100%)
 create mode 100644 package/samba/samba3/samba3.mk
 rename package/samba/{ => samba3}/simple.conf (100%)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index 1469075..d11401f 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -1,270 +1,32 @@
+comment "samba needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_SAMBA
 	bool "samba"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_POPT
 	help
-	  Provides print services to all manner of SMB/CIFS clients,
-	  including the numerous versions of Microsoft Windows
-	  operating systems.
-
-	  http://www.samba.org/
-
-	  NOTE: A complete Samba install takes over 50MB of space,
-		so choose only the components you need.
-
-comment "samba needs a toolchain w/ threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	  Provides secure, stable and fast file and print services
+	  for all clients using the SMB/CIFS protocol, such as all versions
+	  of DOS and Windows, OS/2, Linux and many others.
 
 if BR2_PACKAGE_SAMBA
 
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
+choice
+	prompt "Samba version"
+	default BR2_PACKAGE_SAMBA3
 	help
-	  Tool for executing client side MS-RPC functions using RPC
-	  calls from a UNIX workstation.
+	  Select the desired samba version.
 
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
+	config BR2_PACKAGE_SAMBA3
+	bool "3.6.x"
+	select BR2_PACKAGE_POPT
 	help
-	  Include support for gamin
+	  The well-tested legacy branch.
 
-comment "support gamin - disabled (requires gamin)"
-	depends on !BR2_PACKAGE_GAMIN
-
-endmenu
+endchoice
 
 endif
+
+source "package/samba/samba3/Config.in"
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index a7b452c..33a0660 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -1,178 +1 @@
-################################################################################
-#
-# samba
-#
-################################################################################
-
-SAMBA_VERSION = 3.6.22
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
-	samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
-	samba_cv_USE_SETREUID=yes \
-	samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes \
-	samba_cv_HAVE_IFACE_IFCONF=yes \
-	samba_cv_HAVE_MMAP=yes \
-	samba_cv_HAVE_FCNTL_LOCK=yes \
-	samba_cv_HAVE_SECURE_MKSTEMP=yes \
-	samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
-	samba_cv_fpie=no \
-	libreplace_cv_HAVE_IPV6=$(if $(BR2_INET_IPV6),yes,no) \
-	$(if $(BR2_PACKAGE_SAMBA_AVAHI),AVAHI_LIBS=-pthread)
-
-SAMBA_CONF_OPT = \
-	--localstatedir=/var \
-	--with-piddir=/var/run \
-	--with-lockdir=/var/lock \
-	--with-logfilebase=/var/log \
-	--with-configdir=/etc/samba \
-	--with-privatedir=/etc/samba \
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
-SAMBA_INSTALL_TARGET_OPT = \
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
-SAMBA_CONF_OPT += --with-libiconv=$(STAGING_DIR)
-else
-SAMBA_CONF_OPT += --with-libiconv=""
-endif
-
-# Compiled debug messages by level
-SAMBA_CONF_OPT += CFLAGS="$(TARGET_CFLAGS) -DMAX_DEBUG_LEVEL=$(BR2_PACKAGE_SAMBA_MAX_DEBUGLEVEL)"
-
-ifeq ($(BR2_PACKAGE_SAMBA_SWAT),y)
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
-SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_SWAT_DOCUMENTATION
-endif
-endif
-
-define SAMBA_INSTALL_INITSCRIPTS_CONFIG
-	# install start/stop script
-	@if [ ! -f $(TARGET_DIR)/etc/init.d/S91smb ]; then \
-		$(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d/S91smb; \
-	fi
-	# install config
-	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
-		$(INSTALL) -m 0755 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
-	fi
-endef
-
-SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_INITSCRIPTS_CONFIG
-
-$(eval $(autotools-package))
+include $(sort $(wildcard package/samba/*/*.mk))
diff --git a/package/samba/Config.in b/package/samba/samba3/Config.in
similarity index 67%
copy from package/samba/Config.in
copy to package/samba/samba3/Config.in
index 1469075..74a60a3 100644
--- a/package/samba/Config.in
+++ b/package/samba/samba3/Config.in
@@ -1,25 +1,6 @@
-config BR2_PACKAGE_SAMBA
-	bool "samba"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_POPT
-	help
-	  Provides print services to all manner of SMB/CIFS clients,
-	  including the numerous versions of Microsoft Windows
-	  operating systems.
-
-	  http://www.samba.org/
-
-	  NOTE: A complete Samba install takes over 50MB of space,
-		so choose only the components you need.
-
-comment "samba needs a toolchain w/ threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-if BR2_PACKAGE_SAMBA
+if BR2_PACKAGE_SAMBA3
 
-config BR2_PACKAGE_SAMBA_MAX_DEBUGLEVEL
+config BR2_PACKAGE_SAMBA3_MAX_DEBUGLEVEL
 	int "Maximum level of compiled-in debug messages"
 	range -1 10000
 	default -1
@@ -27,7 +8,7 @@ config BR2_PACKAGE_SAMBA_MAX_DEBUGLEVEL
 	  Define the level of compiled-in debug messages.
 	  This allows for big space savings, -1 being the lowest (none).
 
-config BR2_PACKAGE_SAMBA_LIBICONV
+config BR2_PACKAGE_SAMBA3_LIBICONV
 	bool "extended encodings (libiconv)"
 	depends on !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBICONV
@@ -39,63 +20,63 @@ config BR2_PACKAGE_SAMBA_LIBICONV
 
 menu "Samba tools selection"
 
-config BR2_PACKAGE_SAMBA_EVENTLOGADM
+config BR2_PACKAGE_SAMBA3_EVENTLOGADM
 	bool "eventlogadm"
 	default y
 	help
 	  Write Eventlog records to a tdb or perform other eventlog functions
 
-config BR2_PACKAGE_SAMBA_FINDSMB
+config BR2_PACKAGE_SAMBA3_FINDSMB
 	bool "findsmb"
 	default y
-	depends on BR2_PACKAGE_SAMBA_SMBCLIENT
-	depends on BR2_PACKAGE_SAMBA_NMBLOOKUP
+	depends on BR2_PACKAGE_SAMBA3_SMBCLIENT
+	depends on BR2_PACKAGE_SAMBA3_NMBLOOKUP
 	depends on BR2_PACKAGE_PERL
 	help
 	  Script to browse network
 
 comment "findsmb       - disabled (requires nmblookup, smbclient and perl)"
-	depends on !BR2_PACKAGE_SAMBA_SMBCLIENT || !BR2_PACKAGE_SAMBA_NMBLOOKUP || !BR2_PACKAGE_PERL
+	depends on !BR2_PACKAGE_SAMBA3_SMBCLIENT || !BR2_PACKAGE_SAMBA3_NMBLOOKUP || !BR2_PACKAGE_PERL
 
-config BR2_PACKAGE_SAMBA_NET
+config BR2_PACKAGE_SAMBA3_NET
 	bool "net"
 	default y
 	help
 	  Distributed SMB/CIFS Server Management Utility
 
-config BR2_PACKAGE_SAMBA_NMBD
+config BR2_PACKAGE_SAMBA3_NMBD
 	bool "nmbd"
 	default y
 	help
 	  NetBIOS name server to provide NetBIOS over IP naming services
 	  to clients
 
-config BR2_PACKAGE_SAMBA_NMBLOOKUP
+config BR2_PACKAGE_SAMBA3_NMBLOOKUP
 	bool "nmblookup"
 	default y
 	help
 	  Query NetBIOS names and map them to IP addresses in a network
 	  using NetBIOS over TCP/IP queries
 
-config BR2_PACKAGE_SAMBA_NTLM_AUTH
+config BR2_PACKAGE_SAMBA3_NTLM_AUTH
 	bool "ntlm_auth"
 	default y
 	help
 	  Helper utility that authenticates users using NT/LM authentication
 
-config BR2_PACKAGE_SAMBA_PDBEDIT
+config BR2_PACKAGE_SAMBA3_PDBEDIT
 	bool "pdbedit"
 	default y
 	help
 	  Manage the SAM database (Database of Samba Users)
 
-config BR2_PACKAGE_SAMBA_PROFILES
+config BR2_PACKAGE_SAMBA3_PROFILES
 	bool "profiles"
 	default y
 	help
 	  Utility that reports and changes SIDs in Windows NT registry files
 
-config BR2_PACKAGE_SAMBA_RPCCLIENT
+config BR2_PACKAGE_SAMBA3_RPCCLIENT
 	bool "rpcclient"
 	select BR2_PACKAGE_READLINE
 	default y
@@ -103,124 +84,124 @@ config BR2_PACKAGE_SAMBA_RPCCLIENT
 	  Tool for executing client side MS-RPC functions using RPC
 	  calls from a UNIX workstation.
 
-config BR2_PACKAGE_SAMBA_SMBCACLS
+config BR2_PACKAGE_SAMBA3_SMBCACLS
 	bool "smbcacls"
 	default y
 	help
 	  Set or get ACLs on an NT file or directory names
 
-config BR2_PACKAGE_SAMBA_SMBCLIENT
+config BR2_PACKAGE_SAMBA3_SMBCLIENT
 	bool "smbclient"
 	select BR2_PACKAGE_READLINE
 	default y
 	help
 	  ftp-like client to access SMB/CIFS resources on servers
 
-config BR2_PACKAGE_SAMBA_SMBCONTROL
+config BR2_PACKAGE_SAMBA3_SMBCONTROL
 	bool "smbcontrol"
 	default y
 	help
 	  Send messages to smbd, nmbd or winbindd processes
 
-config BR2_PACKAGE_SAMBA_SMBCQUOTAS
+config BR2_PACKAGE_SAMBA3_SMBCQUOTAS
 	bool "smbcquotas"
 	default y
 	help
 	  Set or get QUOTAs of NTFS 5 shares
 
-config BR2_PACKAGE_SAMBA_SMBD
+config BR2_PACKAGE_SAMBA3_SMBD
 	bool "smbd"
 	default y
 	help
 	  The server daemon that provides filesharing and printing services
 
-config BR2_PACKAGE_SAMBA_SMBGET
+config BR2_PACKAGE_SAMBA3_SMBGET
 	bool "smbget"
 	default y
 	help
 	  wget-like utility for download files over SMB
 
-config BR2_PACKAGE_SAMBA_SMBLDBTOOLS
+config BR2_PACKAGE_SAMBA3_SMBLDBTOOLS
 	bool "smbldbtools"
 	default y
 	help
 	  ldbadd ldbdel ldbedit ldbmodify ldbrename ldbsearch tools
 
-config BR2_PACKAGE_SAMBA_SMBPASSWD
+config BR2_PACKAGE_SAMBA3_SMBPASSWD
 	bool "smbpasswd"
 	default y
 	help
 	  Change a user's SMB passwd
 
-config BR2_PACKAGE_SAMBA_SMBSHARESEC
+config BR2_PACKAGE_SAMBA3_SMBSHARESEC
 	bool "smbsharesec"
 	default y
 	help
 	  Manipulate share permissions on SMB file shares
 
-config BR2_PACKAGE_SAMBA_SMBSPOOL
+config BR2_PACKAGE_SAMBA3_SMBSPOOL
 	bool "smbspool"
 	default y
 	help
 	  Send a print file to an SMB printer
 
-config BR2_PACKAGE_SAMBA_SMBSTATUS
+config BR2_PACKAGE_SAMBA3_SMBSTATUS
 	bool "smbstatus"
 	default y
 	help
 	  Report on current Samba connections
 
-config BR2_PACKAGE_SAMBA_SMBTREE
+config BR2_PACKAGE_SAMBA3_SMBTREE
 	bool "smbtree"
 	default y
 	help
 	  A text based smb network browser
 
-config BR2_PACKAGE_SAMBA_SWAT
+config BR2_PACKAGE_SAMBA3_SWAT
 	bool "swat"
 	default y
 	help
 	  Samba Web Administration Tool
 
-config BR2_PACKAGE_SAMBA_SMBTA_UTIL
+config BR2_PACKAGE_SAMBA3_SMBTA_UTIL
 	bool "smbta-util"
 	default y
 	help
 	  Tool to ease the configuration of the vfs_smb_traffic_analyzer
 	  module regarding data encryption.
 
-config BR2_PACKAGE_SAMBA_SMBTAR
+config BR2_PACKAGE_SAMBA3_SMBTAR
 	bool "smbtar"
 	default y
-	depends on BR2_PACKAGE_SAMBA_SMBCLIENT
+	depends on BR2_PACKAGE_SAMBA3_SMBCLIENT
 	help
 	  tar-like script that wraps smbclient
 
 comment "smbtar        - disabled (requires smbclient)"
-	depends on !BR2_PACKAGE_SAMBA_SMBCLIENT
+	depends on !BR2_PACKAGE_SAMBA3_SMBCLIENT
 
-config BR2_PACKAGE_SAMBA_TDB
+config BR2_PACKAGE_SAMBA3_TDB
 	bool "tdb"
 	default y
 	help
 	  Tools to operate on the .tdb database files
 
-config BR2_PACKAGE_SAMBA_TESTPARM
+config BR2_PACKAGE_SAMBA3_TESTPARM
 	bool "testparm"
 	default y
 	help
 	  Check an smb.conf configuration file for internal correctness
 
-config BR2_PACKAGE_SAMBA_WINBINDD
+config BR2_PACKAGE_SAMBA3_WINBINDD
 	bool "winbindd"
 	default y
 	help
 	  Name Service Switch daemon for resolving names from NT servers
 
-config BR2_PACKAGE_SAMBA_WBINFO
+config BR2_PACKAGE_SAMBA3_WBINFO
 	bool "wbinfo"
 	default y
-	depends on BR2_PACKAGE_SAMBA_WINBINDD
+	depends on BR2_PACKAGE_SAMBA3_WINBINDD
 	help
 	  Query information from winbind daemon
 
@@ -229,7 +210,7 @@ endmenu
 
 menu "Samba libraries selection"
 
-config BR2_PACKAGE_SAMBA_LIBSMBCLIENT
+config BR2_PACKAGE_SAMBA3_LIBSMBCLIENT
 	bool "libsmbclient"
 	help
 	  libsmbclient is a library toolset that permits applications
@@ -242,7 +223,7 @@ endmenu
 
 menu "Samba support selection"
 
-config BR2_PACKAGE_SAMBA_AVAHI
+config BR2_PACKAGE_SAMBA3_AVAHI
 	bool "support avahi"
 	default y
 	depends on BR2_PACKAGE_AVAHI_DAEMON
@@ -255,7 +236,7 @@ comment "support avahi - disabled (requires avahi-daemon)"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_AVAHI_DAEMON
 
-config BR2_PACKAGE_SAMBA_GAMIN
+config BR2_PACKAGE_SAMBA3_GAMIN
 	bool "support gamin"
 	default y
 	depends on BR2_PACKAGE_GAMIN
diff --git a/package/samba/S91smb b/package/samba/samba3/S91smb
similarity index 100%
rename from package/samba/S91smb
rename to package/samba/samba3/S91smb
diff --git a/package/samba/samba-fix-smbd-libs-avahi.patch b/package/samba/samba3/samba3-0001-fix-smbd-libs-avahi.patch
similarity index 100%
rename from package/samba/samba-fix-smbd-libs-avahi.patch
rename to package/samba/samba3/samba3-0001-fix-smbd-libs-avahi.patch
diff --git a/package/samba/samba-getaddrinfo.patch b/package/samba/samba3/samba3-0002-getaddrinfo.patch
similarity index 100%
rename from package/samba/samba-getaddrinfo.patch
rename to package/samba/samba3/samba3-0002-getaddrinfo.patch
diff --git a/package/samba/samba3/samba3.mk b/package/samba/samba3/samba3.mk
new file mode 100644
index 0000000..673d737
--- /dev/null
+++ b/package/samba/samba3/samba3.mk
@@ -0,0 +1,181 @@
+################################################################################
+#
+# samba3
+#
+################################################################################
+
+SAMBA3_VERSION = 3.6.22
+SAMBA3_SITE = http://ftp.samba.org/pub/samba/stable
+SAMBA3_SOURCE = samba-$(SAMBA3_VERSION).tar.gz
+SAMBA3_SUBDIR = source3
+SAMBA3_INSTALL_STAGING = YES
+SAMBA3_LICENSE = GPLv3+
+SAMBA3_LICENSE_FILES = COPYING
+
+SAMBA3_DEPENDENCIES = popt \
+	$(if $(BR2_PACKAGE_SAMBA3_RPCCLIENT),readline) \
+	$(if $(BR2_PACKAGE_SAMBA3_SMBCLIENT),readline) \
+	$(if $(BR2_PACKAGE_SAMBA3_AVAHI),avahi) \
+	$(if $(BR2_PACKAGE_SAMBA3_GAMIN),gamin)
+
+SAMBA3_CONF_ENV = \
+	ac_cv_file__proc_sys_kernel_core_pattern=yes \
+	samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
+	samba_cv_USE_SETREUID=yes \
+	samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes \
+	samba_cv_HAVE_IFACE_IFCONF=yes \
+	samba_cv_HAVE_MMAP=yes \
+	samba_cv_HAVE_FCNTL_LOCK=yes \
+	samba_cv_HAVE_SECURE_MKSTEMP=yes \
+	samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
+	samba_cv_fpie=no \
+	libreplace_cv_HAVE_IPV6=$(if $(BR2_INET_IPV6),yes,no) \
+	$(if $(BR2_PACKAGE_SAMBA3_AVAHI),AVAHI_LIBS=-pthread)
+
+SAMBA3_CONF_OPT = \
+	--localstatedir=/var \
+	--with-piddir=/var/run \
+	--with-lockdir=/var/lock \
+	--with-logfilebase=/var/log \
+	--with-configdir=/etc/samba \
+	--with-privatedir=/etc/samba \
+	\
+	--disable-cups \
+	--enable-shared-libs \
+	--disable-pie \
+	--disable-relro \
+	--disable-dnssd \
+	\
+	$(if $(BR2_PACKAGE_SAMBA3_AVAHI),--enable-avahi,--disable-avahi) \
+	$(if $(BR2_PACKAGE_SAMBA3_GAMIN),--enable-fam,--disable-fam) \
+	$(if $(BR2_PACKAGE_SAMBA3_SWAT),--enable-swat,--disable-swat) \
+	\
+	--without-cluster-support \
+	--without-dnsupdate \
+	--with-sys-quotas \
+	--without-ads \
+	--without-ldap \
+	--with-included-iniparser \
+	\
+	$(if $(BR2_PACKAGE_SAMBA3_RPCCLIENT),--with-readline=$(STAGING_DIR)) \
+	$(if $(BR2_PACKAGE_SAMBA3_SMBCLIENT),--with-readline=$(STAGING_DIR)) \
+	$(if $(BR2_PACKAGE_SAMBA3_WINBINDD),--with-winbind,--without-winbind)
+
+SAMBA3_INSTALL_TARGET_OPT = \
+	DESTDIR=$(TARGET_DIR) -C $(SAMBA3_DIR)/$(SAMBA3_SUBDIR) \
+	installlibs installservers installbin installscripts \
+	$(if $(BR2_PACKAGE_SAMBA3_SWAT),installswat)
+
+# binaries to keep
+SAMBA3_BINTARGETS_y = \
+	usr/sbin/smbd \
+	usr/lib/libtalloc.so \
+	usr/lib/libtdb.so
+
+# binaries to remove
+SAMBA3_BINTARGETS_ = \
+	usr/lib/libnetapi.so* \
+	usr/lib/libsmbsharemodes.so*
+
+# binaries to keep or remove
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_EVENTLOGADM) += usr/bin/eventlogadm
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_NET) += usr/bin/net
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_NMBD) += usr/sbin/nmbd
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_NMBLOOKUP) += usr/bin/nmblookup
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_NTLM_AUTH) += usr/bin/ntlm_auth
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_PDBEDIT) += usr/bin/pdbedit
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_PROFILES) += usr/bin/profiles
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_RPCCLIENT) += usr/bin/rpcclient
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBCACLS) += usr/bin/smbcacls
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBCLIENT) += usr/bin/smbclient
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBCONTROL) += usr/bin/smbcontrol
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBCQUOTAS) += usr/bin/smbcquotas
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBD) += usr/sbin/smbd
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBGET) += usr/bin/smbget
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBLDBTOOLS) += usr/bin/ldbadd
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBLDBTOOLS) += usr/bin/ldbdel
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBLDBTOOLS) += usr/bin/ldbedit
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBLDBTOOLS) += usr/bin/ldbmodify
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBLDBTOOLS) += usr/bin/ldbrename
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBLDBTOOLS) += usr/bin/ldbsearch
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBPASSWD) += usr/bin/smbpasswd
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBSHARESEC) += usr/bin/sharesec
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBSPOOL) += usr/bin/smbspool
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBSTATUS) += usr/bin/smbstatus
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBTA_UTIL) += usr/bin/smbta-util
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SMBTREE) += usr/bin/smbtree
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_SWAT) += usr/sbin/swat
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_TDB) += usr/bin/tdbbackup
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_TDB) += usr/bin/tdbdump
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_TDB) += usr/bin/tdbtool
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_TESTPARM) += usr/bin/testparm
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_WINBINDD) += usr/sbin/winbindd
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_WBINFO) += usr/bin/wbinfo
+
+# libraries to keep or remove
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_WINBINDD) += usr/lib/libwbclient.so*
+SAMBA3_BINTARGETS_$(BR2_PACKAGE_SAMBA3_LIBSMBCLIENT) += usr/lib/libsmbclient.so*
+
+# non-binaries to remove
+SAMBA3_TXTTARGETS_ = \
+	usr/include/libsmbclient.h \
+	usr/include/netapi.h \
+	usr/include/smb_share_modes.h \
+	usr/include/talloc.h \
+	usr/include/tdb.h \
+	usr/include/wbclient.h
+
+# non-binaries to keep or remove
+SAMBA3_TXTTARGETS_$(BR2_PACKAGE_SAMBA3_FINDSMB) += usr/bin/findsmb
+SAMBA3_TXTTARGETS_$(BR2_PACKAGE_SAMBA3_SMBTAR) += usr/bin/smbtar
+
+define SAMBA3_REMOVE_UNNEEDED_BINARIES
+	rm -f $(addprefix $(TARGET_DIR)/, $(SAMBA3_BINTARGETS_))
+	rm -f $(addprefix $(TARGET_DIR)/, $(SAMBA3_TXTTARGETS_))
+endef
+
+SAMBA3_POST_INSTALL_TARGET_HOOKS += SAMBA3_REMOVE_UNNEEDED_BINARIES
+
+define SAMBA3_REMOVE_SWAT_DOCUMENTATION
+	# Remove the documentation
+	rm -rf $(TARGET_DIR)/usr/swat/help/manpages
+	rm -rf $(TARGET_DIR)/usr/swat/help/Samba3*
+	rm -rf $(TARGET_DIR)/usr/swat/using_samba/
+	# Removing the welcome.html file will make swat default to
+	# welcome-no-samba-doc.html
+	rm -rf $(TARGET_DIR)/usr/swat/help/welcome.html
+endef
+
+# --with-libiconv="" is to avoid detecting host libiconv and build failure
+ifeq ($(BR2_PACKAGE_SAMBA3_LIBICONV),y)
+SAMBA3_DEPENDENCIES += libiconv
+SAMBA3_CONF_OPT += --with-libiconv=$(STAGING_DIR)
+else
+SAMBA3_CONF_OPT += --with-libiconv=""
+endif
+
+# Compiled debug messages by level
+SAMBA3_CONF_OPT += CFLAGS="$(TARGET_CFLAGS) -DMAX_DEBUG_LEVEL=$(BR2_PACKAGE_SAMBA3_MAX_DEBUGLEVEL)"
+
+ifeq ($(BR2_PACKAGE_SAMBA3_SWAT),y)
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+SAMBA3_POST_INSTALL_TARGET_HOOKS += SAMBA3_REMOVE_SWAT_DOCUMENTATION
+endif
+endif
+
+define SAMBA3_INSTALL_INITSCRIPTS_CONFIG
+	# install start/stop script
+	@if [ ! -f $(TARGET_DIR)/etc/init.d/S91smb ]; then \
+		$(INSTALL) -m 0755 -D package/samba/samba3/S91smb \
+			$(TARGET_DIR)/etc/init.d/S91smb; \
+	fi
+	# install config
+	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
+		$(INSTALL) -m 0755 -D package/samba/samba3/simple.conf \
+			$(TARGET_DIR)/etc/samba/smb.conf; \
+	fi
+endef
+
+SAMBA3_POST_INSTALL_TARGET_HOOKS += SAMBA3_INSTALL_INITSCRIPTS_CONFIG
+
+$(eval $(autotools-package))
diff --git a/package/samba/simple.conf b/package/samba/samba3/simple.conf
similarity index 100%
rename from package/samba/simple.conf
rename to package/samba/samba3/simple.conf
-- 
1.8.3.2
