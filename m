From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 May 2012 22:27:21 +0200
Subject: [Buildroot] [git commit] samba: bump to version 3.6.5 and
	enhancements
Message-ID: <20120531113258.4081396E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21fd343a1096a74dde30d3eeca96b98a0308ab51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump samba to version 3.6.5 with SMB2 protocol support.

Use shared popt rather than the builtin - it saves some space if you've
already got it on your target.

mount.cifs & umount.cifs have been unbundled so remove the option -
users must use cifs-tools for that.

Add recommended enhancement from bug #807 (make iconv support optional).
Optional smbd was already commited some time ago.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/samba/Config.in                       |   50 ++++++------------------
 package/samba/samba-fix-mount.cifs.patch      |   21 ----------
 package/samba/samba-getaddrinfo.patch         |   19 +++++++++
 package/samba/samba-remove-legacy-index.patch |   20 ----------
 package/samba/samba.mk                        |   34 ++++++----------
 5 files changed, 45 insertions(+), 99 deletions(-)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index a5a5c29..cebf7d9 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SAMBA
 	bool "samba"
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_POPT
 	help
 	  Provides print services to all manner of SMB/CIFS clients,
 	  including the numerous versions of Microsoft Windows
@@ -11,20 +11,23 @@ config BR2_PACKAGE_SAMBA
 	  NOTE: A complete Samba install takes over 50MB of space,
 		so choose only the components you need.
 
-menu "Samba tools selection"
-	depends on BR2_PACKAGE_SAMBA
+if BR2_PACKAGE_SAMBA
 
-config BR2_PACKAGE_SAMBA_CIFS
-	bool "cifs"
-	default y
-	depends on BR2_PACKAGE_SAMBA
+config BR2_PACKAGE_SAMBA_LIBICONV
+	bool "extended encodings (libiconv)"
+	depends on !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV
 	help
-	  Support CIFS
+	  Include libiconv support for extended conversion of filename
+	  enconding. Samba has built-in support for UTF-8, ISO-8859-1
+	  and ASCII, so this is only required if you want to support
+	  other encodings.
+
+menu "Samba tools selection"
 
 config BR2_PACKAGE_SAMBA_EVENTLOGADM
 	bool "eventlogadm"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Write Eventlog records to a tdb or perform other eventlog functions
 
@@ -43,14 +46,12 @@ comment "findsmb       - disabled (requires nmblookup, smbclient and perl)"
 config BR2_PACKAGE_SAMBA_NET
 	bool "net"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Distributed SMB/CIFS Server Management Utility
 
 config BR2_PACKAGE_SAMBA_NMBD
 	bool "nmbd"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  NetBIOS name server to provide NetBIOS over IP naming services
 	  to clients
@@ -58,7 +59,6 @@ config BR2_PACKAGE_SAMBA_NMBD
 config BR2_PACKAGE_SAMBA_NMBLOOKUP
 	bool "nmblookup"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Query NetBIOS names and map them to IP addresses in a network
 	  using NetBIOS over TCP/IP queries
@@ -66,21 +66,18 @@ config BR2_PACKAGE_SAMBA_NMBLOOKUP
 config BR2_PACKAGE_SAMBA_NTLM_AUTH
 	bool "ntlm_auth"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Helper utility that authenticates users using NT/LM authentication
 
 config BR2_PACKAGE_SAMBA_PDBEDIT
 	bool "pdbedit"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Manage the SAM database (Database of Samba Users)
 
 config BR2_PACKAGE_SAMBA_PROFILES
 	bool "profiles"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Utility that reports and changes SIDs in Windows NT registry files
 
@@ -88,7 +85,6 @@ config BR2_PACKAGE_SAMBA_RPCCLIENT
 	bool "rpcclient"
 	select BR2_PACKAGE_READLINE
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Tool for executing client side MS-RPC functions using RPC
 	  calls from a UNIX workstation.
@@ -96,7 +92,6 @@ config BR2_PACKAGE_SAMBA_RPCCLIENT
 config BR2_PACKAGE_SAMBA_SMBCACLS
 	bool "smbcacls"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Set or get ACLs on an NT file or directory names
 
@@ -104,84 +99,72 @@ config BR2_PACKAGE_SAMBA_SMBCLIENT
 	bool "smbclient"
 	select BR2_PACKAGE_READLINE
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  ftp-like client to access SMB/CIFS resources on servers
 
 config BR2_PACKAGE_SAMBA_SMBCONTROL
 	bool "smbcontrol"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Send messages to smbd, nmbd or winbindd processes
 
 config BR2_PACKAGE_SAMBA_SMBCQUOTAS
 	bool "smbcquotas"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Set or get QUOTAs of NTFS 5 shares
 
 config BR2_PACKAGE_SAMBA_SMBD
 	bool "smbd"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  The server daemon that provides filesharing and printing services
 
 config BR2_PACKAGE_SAMBA_SMBGET
 	bool "smbget"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  wget-like utility for download files over SMB
 
 config BR2_PACKAGE_SAMBA_SMBLDBTOOLS
 	bool "smbldbtools"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  ldbadd ldbdel ldbedit ldbmodify ldbrename ldbsearch tools
 
 config BR2_PACKAGE_SAMBA_SMBPASSWD
 	bool "smbpasswd"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Change a user's SMB passwd
 
 config BR2_PACKAGE_SAMBA_SMBSHARESEC
 	bool "smbsharesec"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Manipulate share permissions on SMB file shares
 
 config BR2_PACKAGE_SAMBA_SMBSPOOL
 	bool "smbspool"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Send a print file to an SMB printer
 
 config BR2_PACKAGE_SAMBA_SMBSTATUS
 	bool "smbstatus"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Report on current Samba connections
 
 config BR2_PACKAGE_SAMBA_SMBTREE
 	bool "smbtree"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  A text based smb network browser
 
 config BR2_PACKAGE_SAMBA_SWAT
 	bool "swat"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Samba Web Administration Tool
 
@@ -198,21 +181,18 @@ comment "smbtar        - disabled (requires smbclient)"
 config BR2_PACKAGE_SAMBA_TDB
 	bool "tdb"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Tools to operate on the .tdb database files
 
 config BR2_PACKAGE_SAMBA_TESTPARM
 	bool "testparm"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Check an smb.conf configuration file for internal correctness
 
 config BR2_PACKAGE_SAMBA_WINBINDD
 	bool "winbindd"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  Name Service Switch daemon for resolving names from NT servers
 
@@ -227,11 +207,9 @@ endmenu
 
 
 menu "Samba libraries selection"
-	depends on BR2_PACKAGE_SAMBA
 
 config BR2_PACKAGE_SAMBA_LIBSMBCLIENT
 	bool "libsmbclient"
-	depends on BR2_PACKAGE_SAMBA
 	help
 	  libsmbclient is a library toolset that permits applications
 	  to manipulate CIFS/SMB network resources using many of the
@@ -242,12 +220,10 @@ endmenu
 
 
 menu "Samba support selection"
-	depends on BR2_PACKAGE_SAMBA
 
 config BR2_PACKAGE_SAMBA_AVAHI
 	bool "support avahi"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	depends on BR2_PACKAGE_AVAHI_DAEMON
 	select BR2_PACKAGE_DBUS
 	help
@@ -259,7 +235,6 @@ comment "support avahi - disabled (requires avahi-daemon)"
 config BR2_PACKAGE_SAMBA_GAMIN
 	bool "support gamin"
 	default y
-	depends on BR2_PACKAGE_SAMBA
 	depends on BR2_PACKAGE_GAMIN
 	help
 	  Include support for gamin
@@ -269,3 +244,4 @@ comment "support gamin - disabled (requires gamin)"
 
 endmenu
 
+endif
diff --git a/package/samba/samba-fix-mount.cifs.patch b/package/samba/samba-fix-mount.cifs.patch
deleted file mode 100644
index 9c235ea..0000000
--- a/package/samba/samba-fix-mount.cifs.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- a/client/mount.cifs.c	2011-09-13 10:26:21.000000000 +0200
-+++ b/client/mount.cifs.c	2011-09-13 10:27:16.000000000 +0200
-@@ -39,7 +39,6 @@
- #include <mntent.h>
- #include <fcntl.h>
- #include <limits.h>
--#include <fstab.h>
- #include "mount.h"
- 
- #define MOUNT_CIFS_VERSION_MAJOR "1"
-@@ -255,6 +254,10 @@
- 	return 0;
- }
- #else /* CIFS_LEGACY_SETUID_CHECK */
-+
-+#ifndef _PATH_FSTAB
-+#define _PATH_FSTAB "/etc/fstab"
-+#endif
- static int
- check_fstab(const char *progname, char *mountpoint, char *devname,
- 	    char **options)
diff --git a/package/samba/samba-getaddrinfo.patch b/package/samba/samba-getaddrinfo.patch
new file mode 100644
index 0000000..af01299
--- /dev/null
+++ b/package/samba/samba-getaddrinfo.patch
@@ -0,0 +1,19 @@
+Patch from OpenWRT.
+Don't check for buggy getaddrinfo() assume it's safe if it's present.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/source3/configure
++++ b/source3/configure
+@@ -13285,10 +13285,7 @@ if test x"$libreplace_cv_HAVE_GETADDRINF
+ 	# see bug 5910, use our replacements if we detect
+ 	# a broken system.
+ 	if test "$cross_compiling" = yes; then :
+-  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error "cannot run test program while cross compiling
+-See \`config.log' for more details." "$LINENO" 5; }
++		$as_echo "assuming valid getaddrinfo without bug 5910" >&2
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
diff --git a/package/samba/samba-remove-legacy-index.patch b/package/samba/samba-remove-legacy-index.patch
deleted file mode 100644
index 855bca7..0000000
--- a/package/samba/samba-remove-legacy-index.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- a/source3/registry/reg_perfcount.c
-+++ b/source3/registry/reg_perfcount.c
-@@ -616,14 +616,14 @@ static bool _reg_perfcount_add_counter(P
- 	obj = NULL;
- 	memset(buf, 0, PERFCOUNT_MAX_LEN);
- 	memcpy(buf, data.dptr, data.dsize);
--	begin = index(buf, '[');
--	end = index(buf, ']');
-+	begin = strchr(buf, '[');
-+	end = strchr(buf, ']');
- 	if(begin == NULL || end == NULL)
- 		return False;
- 	start = begin+1;
- 
- 	while(start < end) {
--		stop = index(start, ',');
-+		stop = strchr(start, ',');
- 		if(stop == NULL)
- 			stop = end;
- 		*stop = '\0';
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 1203693..d7a15b3 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,21 +4,19 @@
 #
 #############################################################
 
-SAMBA_VERSION = 3.5.15
+SAMBA_VERSION = 3.6.5
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
 
-
-SAMBA_DEPENDENCIES = \
-	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
+SAMBA_DEPENDENCIES = popt \
 	$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),readline) \
 	$(if $(BR2_PACKAGE_SAMBA_SMBCLIENT),readline) \
 	$(if $(BR2_PACKAGE_SAMBA_AVAHI),avahi) \
 	$(if $(BR2_PACKAGE_SAMBA_GAMIN),gamin)
 
-
 SAMBA_CONF_ENV = \
+	ac_cv_file__proc_sys_kernel_core_pattern=yes \
 	samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
 	samba_cv_USE_SETREUID=yes \
 	samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes \
@@ -31,7 +29,6 @@ SAMBA_CONF_ENV = \
 	libreplace_cv_HAVE_IPV6=$(if $(BR2_INET_IPV6),yes,no) \
 	$(if $(BR2_PACKAGE_SAMBA_AVAHI),AVAHI_LIBS=-pthread)
 
-
 SAMBA_CONF_OPT = \
 	--localstatedir=/var \
 	--with-piddir=/var/run \
@@ -51,49 +48,38 @@ SAMBA_CONF_OPT = \
 	$(if $(BR2_PACKAGE_SAMBA_SWAT),--enable-swat,--disable-swat) \
 	\
 	--without-cluster-support \
-	--without-cifsupcall \
+	--without-dnsupdate \
+	$(if $(BR2_INET_RPC),--with-sys-quotas,--without-sys-quotas) \
 	--without-ads \
 	--without-ldap \
-	--with-included-popt \
 	--with-included-iniparser \
-	--with-libiconv=$(STAGING_DIR) \
 	\
-	$(if $(BR2_PACKAGE_SAMBA_CIFS),--with-cifsmount,--without-cifsmount) \
 	$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),--with-readline=$(STAGING_DIR)) \
 	$(if $(BR2_PACKAGE_SAMBA_SMBCLIENT),--with-readline=$(STAGING_DIR)) \
 	$(if $(BR2_PACKAGE_SAMBA_WINBINDD),--with-winbind,--without-winbind)
 
-
 SAMBA_INSTALL_TARGET_OPT = \
 	DESTDIR=$(TARGET_DIR) -C $(SAMBA_DIR)/$(SAMBA_SUBDIR) \
 	installlibs installservers installbin installscripts \
-	$(if $(BR2_PACKAGE_SAMBA_CIFS),installcifsmount) \
 	$(if $(BR2_PACKAGE_SAMBA_SWAT),installswat)
 
-
 SAMBA_UNINSTALL_TARGET_OPT = \
 	DESTDIR=$(TARGET_DIR) -C $(SAMBA_DIR)/$(SAMBA_SUBDIR) \
 	uninstalllibs uninstallservers uninstallbin uninstallscripts \
-	$(if $(BR2_PACKAGE_SAMBA_CIFS),uninstallcifsmount) \
 	$(if $(BR2_PACKAGE_SAMBA_SWAT),uninstallswat)
 
-
 # binaries to keep
 SAMBA_BINTARGETS_y = \
 	usr/sbin/smbd \
 	usr/lib/libtalloc.so \
 	usr/lib/libtdb.so
 
-
 # binaries to remove
 SAMBA_BINTARGETS_ = \
 	usr/lib/libnetapi.so* \
 	usr/lib/libsmbsharemodes.so*
 
-
 # binaries to keep or remove
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_CIFS) += usr/sbin/mount.cifs
-SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_CIFS) += usr/sbin/umount.cifs
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_EVENTLOGADM) += usr/bin/eventlogadm
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_NET) += usr/bin/net
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_NMBD) += usr/sbin/nmbd
@@ -131,7 +117,6 @@ SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_WBINFO) += usr/bin/wbinfo
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_WINBINDD) += usr/lib/libwbclient.so*
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_LIBSMBCLIENT) += usr/lib/libsmbclient.so*
 
-
 # non-binaries to remove
 SAMBA_TXTTARGETS_ = \
 	usr/include/libsmbclient.h \
@@ -141,7 +126,6 @@ SAMBA_TXTTARGETS_ = \
 	usr/include/tdb.h \
 	usr/include/wbclient.h
 
-
 # non-binaries to keep or remove
 SAMBA_TXTTARGETS_$(BR2_PACKAGE_SAMBA_FINDSMB) += usr/bin/findsmb
 SAMBA_TXTTARGETS_$(BR2_PACKAGE_SAMBA_SMBTAR) += usr/bin/smbtar
@@ -163,6 +147,14 @@ define SAMBA_REMOVE_SWAT_DOCUMENTATION
 	rm -rf $(TARGET_DIR)/usr/swat/help/welcome.html
 endef
 
+# --with-libiconv="" is to avoid detecting host libiconv and build failure
+ifeq ($(BR2_PACKAGE_SAMBA_LIBICONV),y)
+SAMBA_DEPENDENCIES += libiconv
+SAMBA_CONF_OPT += --with-libiconv=$(STAGING_DIR)
+else
+SAMBA_CONF_OPT += --with-libiconv=""
+endif
+
 ifeq ($(BR2_PACKAGE_SAMBA_SWAT),y)
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_SWAT_DOCUMENTATION
