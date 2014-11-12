From: Karoly Kasza <kaszak@gmail.com>
Date: Wed, 12 Nov 2014 15:22:58 +0100
Subject: [Buildroot] [PATCH v2] inetutils: new package
Message-ID: <1415802178-37048-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GNU Inetutils is a collection of common network programs.
Clients included:
dnsdomainname, ftp, hostname, ifconfig, logger, ping, ping6, rcp,
rexec, rlogin, rsh, talk, telnet, tftp, traceroute, whois
Servers included:
ftpd, inetd, rexecd, rlogind, rshd, syslogd, talkd, telnetd, tftpd,
uucpd

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---

Changes v1 -> v2:
  - Changed selections to individual in a menuconfig in Config.in
  - Added all possible package dependencies
  - Fixed install path of various binaries, no utility redundancy
  - Added setuid bit installation where required

 package/Config.in                             |    3 +
 package/inetutils/0001-PATH_PROCNET_DEV.patch |   20 +++
 package/inetutils/Config.in                   |  172 +++++++++++++++++++++++++
 package/inetutils/inetutils.hash              |    2 +
 package/inetutils/inetutils.mk                |  103 +++++++++++++++
 5 files changed, 300 insertions(+)
 create mode 100644 package/inetutils/0001-PATH_PROCNET_DEV.patch
 create mode 100644 package/inetutils/Config.in
 create mode 100644 package/inetutils/inetutils.hash
 create mode 100644 package/inetutils/inetutils.mk

diff --git a/package/Config.in b/package/Config.in
index 28cf703..8f6148c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1017,6 +1017,9 @@ endif
 	source "package/igh-ethercat/Config.in"
 	source "package/igmpproxy/Config.in"
 	source "package/inadyn/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	source "package/inetutils/Config.in"
+endif
 	source "package/iperf/Config.in"
 	source "package/iproute2/Config.in"
 	source "package/ipsec-tools/Config.in"
diff --git a/package/inetutils/0001-PATH_PROCNET_DEV.patch b/package/inetutils/0001-PATH_PROCNET_DEV.patch
new file mode 100644
index 0000000..e987253
--- /dev/null
+++ b/package/inetutils/0001-PATH_PROCNET_DEV.patch
@@ -0,0 +1,20 @@
+Fix missing #define
+
+Original patch from:
+http://repository.timesys.com/buildsources/i/inetutils/inetutils-1.9.1/inetutils-1.9.1-PATH_PROCNET_DEV.patch
+
+Signed-off-by: Karoly Kasza <kaszak@gmail.com>
+
+--- inetutils-1.9.2.orig/ifconfig/system/linux.c	2014-11-01 18:18:20.279765742 +0100
++++ inetutils-1.9.2/ifconfig/system/linux.c	2014-11-01 18:18:28.000000000 +0100
+@@ -50,6 +50,10 @@
+ #include "../ifconfig.h"
+ 
+ 
++#ifndef PATH_PROCNET_DEV
++  #define PATH_PROCNET_DEV "/proc/net/dev"
++#endif
++
+ /* ARPHRD stuff.  */
+ 
+ static void
diff --git a/package/inetutils/Config.in b/package/inetutils/Config.in
new file mode 100644
index 0000000..8f57320
--- /dev/null
+++ b/package/inetutils/Config.in
@@ -0,0 +1,172 @@
+menuconfig BR2_PACKAGE_INETUTILS
+	bool "inetutils"
+	depends on BR2_USE_WCHAR
+	help
+	  GNU Inetutils is a collection of common network programs.
+	  Clients included:
+	  dnsdomainname, ftp, hostname, ifconfig, logger, ping, ping6, rcp,
+	  rexec, rlogin, rsh, talk, telnet, tftp, traceroute, whois
+	  Servers included:
+	  ftpd, inetd, rexecd, rlogind, rshd, syslogd, talkd, telnetd, tftpd,
+	  uucpd
+
+if BR2_PACKAGE_INETUTILS
+
+config BR2_PACKAGE_INETUTILS_DNSDOMAINNAME
+	bool "dnsdomainname"
+
+comment "dnsdomainname overwrites the net-tools package's version if selected!"
+	depends on BR2_PACKAGE_INETUTILS_DNSDOMAINNAME && BR2_PACKAGE_NET_TOOLS
+
+config BR2_PACKAGE_INETUTILS_FTP
+	bool "ftp"
+	default y
+
+config BR2_PACKAGE_INETUTILS_HOSTNAME
+	bool "hostname"
+
+comment "hostname overwrites the net-tools package's version if selected!"
+	depends on BR2_PACKAGE_INETUTILS_HOSTNAME && BR2_PACKAGE_NET_TOOLS
+
+config BR2_PACKAGE_INETUTILS_IFCONFIG
+	bool "ifconfig"
+
+comment "ifconfig overwrites the net-tools package's version if selected!"
+	depends on BR2_PACKAGE_INETUTILS_IFCONFIG && BR2_PACKAGE_NET_TOOLS
+
+config BR2_PACKAGE_INETUTILS_LOGGER
+	bool "logger"
+
+config BR2_PACKAGE_INETUTILS_PING
+	bool "ping"
+	depends on BR2_INET_IPV6
+
+comment "ping needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
+
+comment "ping overwrites the iputils package's version if selected!"
+	depends on BR2_PACKAGE_INETUTILS_PING && BR2_PACKAGE_IPUTILS
+
+config BR2_PACKAGE_INETUTILS_PING6
+	bool "ping6"
+	depends on BR2_INET_IPV6
+
+comment "ping6 needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
+
+comment "ping6 overwrites the iputils package's version if selected!"
+	depends on BR2_PACKAGE_INETUTILS_PING6 && BR2_PACKAGE_IPUTILS
+
+config BR2_PACKAGE_INETUTILS_RCP
+	bool "rcp"
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+
+comment "rcp needs a toolchain w/ RPC"
+	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+
+config BR2_PACKAGE_INETUTILS_REXEC
+	bool "rexec"
+
+config BR2_PACKAGE_INETUTILS_RLOGIN
+	bool "rlogin"
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+
+comment "rlogin needs a toolchain w/ RPC"
+	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+
+comment "rlogin overwrites the rsh-redone package's version if selected!"
+	depends on BR2_PACKAGE_INETUTILS_RLOGIN && BR2_PACKAGE_RSH_REDONE_RLOGIN
+
+config BR2_PACKAGE_INETUTILS_RSH
+	bool "rsh"
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+
+comment "rsh needs a toolchain w/ RPC"
+	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+
+comment "rsh overwrites the rsh-redone package's version if selected!"
+	depends on BR2_PACKAGE_INETUTILS_RSH && BR2_PACKAGE_RSH_REDONE_RSH
+
+config BR2_PACKAGE_INETUTILS_TALK
+	bool "talk"
+	select BR2_PACKAGE_NCURSES
+
+config BR2_PACKAGE_INETUTILS_TELNET
+	bool "telnet"
+	default y
+
+config BR2_PACKAGE_INETUTILS_TFTP
+	bool "tftp"
+	default y
+
+config BR2_PACKAGE_INETUTILS_TRACEROUTE
+	bool "traceroute"
+
+config BR2_PACKAGE_INETUTILS_WHOIS
+	bool "whois"
+
+comment "whois overwrites the whois package's version if selected!"
+	depends on BR2_PACKAGE_INETUTILS_WHOIS && BR2_PACKAGE_WHOIS
+
+config BR2_PACKAGE_INETUTILS_FTPD
+	bool "ftpd"
+	depends on BR2_INET_IPV6
+
+comment "ftpd needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
+
+config BR2_PACKAGE_INETUTILS_INETD
+	bool "inetd"
+
+config BR2_PACKAGE_INETUTILS_REXECD
+	bool "rexecd"
+
+config BR2_PACKAGE_INETUTILS_RLOGIND
+	bool "rlogind"
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+
+comment "rlogind needs a toolchain w/ RPC"
+	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+
+comment "rlogind overwrites the rsh-redone package's version if selected!"
+	depends on BR2_PACKAGE_INETUTILS_RLOGIND && BR2_PACKAGE_RSH_REDONE_RLOGIND
+
+config BR2_PACKAGE_INETUTILS_RSHD
+	bool "rshd"
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+
+comment "rshd needs a toolchain w/ RPC"
+	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+
+comment "rshd overwrites the rsh-redone package's version if selected!"
+	depends on BR2_PACKAGE_INETUTILS_RSHD && BR2_PACKAGE_RSH_REDONE_RSHD
+
+config BR2_PACKAGE_INETUTILS_SYSLOGD
+	bool "syslogd"
+	depends on BR2_INET_IPV6
+
+comment "syslogd needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
+
+comment "syslogd overwrites the sysklogd package's version if selected!"
+	depends on BR2_PACKAGE_INETUTILS_SYSLOGD && BR2_PACKAGE_SYSKLOGD
+
+config BR2_PACKAGE_INETUTILS_TALKD
+	bool "talkd"
+
+config BR2_PACKAGE_INETUTILS_TELNETD
+	bool "telnetd"
+
+config BR2_PACKAGE_INETUTILS_TFTPD
+	bool "tftpd"
+
+comment "tftpd overwrites the iputils package's version if selected!"
+	depends on BR2_PACKAGE_INETUTILS_TFTPD && BR2_PACKAGE_IPUTILS
+
+config BR2_PACKAGE_INETUTILS_UUCPD
+	bool "uucpd"
+
+endif
+
+comment "inetutils needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/inetutils/inetutils.hash b/package/inetutils/inetutils.hash
new file mode 100644
index 0000000..6c1205e
--- /dev/null
+++ b/package/inetutils/inetutils.hash
@@ -0,0 +1,2 @@
+# calculated after checking PGP signature (signed by ams at gnu.org)
+sha256	e3783372540772bbadd6aa2c90f8a75511db4e7d40bbfa37ffdb1bc7a9697f3e	inetutils-1.9.2.tar.xz
diff --git a/package/inetutils/inetutils.mk b/package/inetutils/inetutils.mk
new file mode 100644
index 0000000..fa8f967
--- /dev/null
+++ b/package/inetutils/inetutils.mk
@@ -0,0 +1,103 @@
+################################################################################
+#
+# inetutils
+#
+################################################################################
+
+INETUTILS_VERSION = 1.9.2
+INETUTILS_SITE = $(BR2_GNU_MIRROR)/inetutils
+INETUTILS_SOURCE = inetutils-$(INETUTILS_VERSION).tar.xz
+INETUTILS_LICENSE = GPLv3
+INETUTILS_LICENSE_FILES = COPYING
+
+define INETUTILS_PERMISSIONS
+/bin/ping			f 4755 0 0 - - - - -
+/bin/ping6			f 4755 0 0 - - - - -
+/usr/bin/rlogin			f 4755 0 0 - - - - -
+/usr/bin/rsh			f 4755 0 0 - - - - -
+/usr/bin/rcp			f 4755 0 0 - - - - -
+/usr/bin/traceroute		f 4755 0 0 - - - - -
+endef
+
+INETUTILS_CONF_OPTS += --libexecdir=/usr/sbin --disable-clients --disable-servers
+
+INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
+INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_NCURSES),ncurses)
+INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_NET_TOOLS),net-tools)
+INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_IPUTILS),iputils)
+INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_RSH_REDONE),rsh-redone)
+INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_SYSKLOGD),sysklogd)
+INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_WHOIS),whois)
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+INETUTILS_CONF_OPTS += --with-pam
+INETUTILS_DEPENDENCIES += linux-pam
+else
+INETUTILS_CONF_OPTS += --without-pam
+endif
+
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_DNSDOMAINNAME),--enable-dnsdomainname)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_FTP),--enable-ftp)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_HOSTNAME),--enable-hostname)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_IFCONFIG),--enable-ifconfig)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_LOGGER),--enable-logger)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_PING),--enable-ping)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_PING6),--enable-ping6)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RCP),--enable-rcp)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_REXEC),--enable-rexec)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RLOGIN),--enable-rlogin)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RSH),--enable-rsh)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TALK),--enable-talk)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TELNET),--enable-telnet)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TFTP),--enable-tftp)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TRACEROUTE),--enable-traceroute)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_WHOIS),--enable-whois)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_FTPD),--enable-ftpd)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_INETD),--enable-inetd)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_REXECD),--enable-rexecd)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RLOGIND),--enable-rlogind)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_RSHD),--enable-rshd)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_SYSLOGD),--enable-syslogd)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TALKD),--enable-talkd)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TELNETD),--enable-telnetd)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_TFTPD),--enable-tftpd)
+INETUTILS_CONF_OPTS += $(if $(BR2_PACKAGE_INETUTILS_UUCPD),--enable-uucpd)
+
+# Move binaries to proper path (possibly overwriting other utility versions)
+define INETUTILS_MOVE_PROPER_PATH
+	if [ -e $(TARGET_DIR)/usr/bin/dnsdomainname ]; then \
+		mv -f $(TARGET_DIR)/usr/bin/dnsdomainname $(TARGET_DIR)/bin/dnsdomainname; \
+	fi;
+	if [ -e $(TARGET_DIR)/usr/bin/ping ]; then \
+		mv -f $(TARGET_DIR)/usr/bin/ping $(TARGET_DIR)/bin/ping; \
+	fi;
+	if [ -e $(TARGET_DIR)/usr/bin/ping6 ]; then \
+		mv -f $(TARGET_DIR)/usr/bin/ping6 $(TARGET_DIR)/bin/ping6; \
+	fi;
+	if [ -e $(TARGET_DIR)/usr/bin/hostname ]; then \
+		mv -f $(TARGET_DIR)/usr/bin/hostname $(TARGET_DIR)/bin/hostname; \
+	fi;
+	if [ -e $(TARGET_DIR)/usr/sbin/syslogd ]; then \
+		mv -f $(TARGET_DIR)/usr/sbin/syslogd $(TARGET_DIR)/sbin/syslogd; \
+	fi;
+	if [ -e $(TARGET_DIR)/usr/bin/ifconfig ]; then \
+		mv -f $(TARGET_DIR)/usr/bin/ifconfig $(TARGET_DIR)/sbin/ifconfig; \
+	fi;
+endef
+
+# Remove iputils and rsd-redone utilities to avoid redundancy
+define INETUTILS_REMOVE_REDUNDANT_TOOLS
+	if [ -e $(TARGET_DIR)/usr/sbin/in.rlogind ] && [ -e $(TARGET_DIR)/usr/sbin/rlogind ]; then \
+		rm $(TARGET_DIR)/usr/sbin/in.rlogind; \
+	fi;
+	if [ -e $(TARGET_DIR)/usr/sbin/in.rshd ] && [ -e $(TARGET_DIR)/usr/sbin/rshd ]; then \
+		rm $(TARGET_DIR)/usr/sbin/in.rshd; \
+	fi;
+	if [ -e $(TARGET_DIR)/usr/sbin/in.tftpd ] && [ -e $(TARGET_DIR)/usr/sbin/tftpd ]; then \
+		rm $(TARGET_DIR)/usr/sbin/in.tftpd; \
+	fi;
+endef
+
+INETUTILS_POST_INSTALL_TARGET_HOOKS += INETUTILS_MOVE_PROPER_PATH INETUTILS_REMOVE_REDUNDANT_TOOLS
+
+$(eval $(autotools-package))
-- 
1.7.10.4
