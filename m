From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Dec 2015 17:06:59 +0100
Subject: [Buildroot] [PATCHv2] package/inetutils: new package
Message-ID: <1451232419-17630-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Karoly Kasza <kaszak@gmail.com>

GNU Inetutils is a collection of common network programs.

Clients included:
dnsdomainname, ftp, hostname, ifconfig, logger, ping, ping6, rcp,
rexec, rlogin, rsh, talk, telnet, tftp, traceroute, whois

Servers included:
ftpd, inetd, rexecd, rlogind, rshd, syslogd, talkd, telnetd, tftpd,
uucpd

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
[yann.morin.1998 at free.fr:
  - rebase
  - update version
  - use ifeq-endif for all tools
  - ifconfig needs its special post-install hook
  - use $(foreach) to move/delete programs
  - only move programs if not using merged /usr
  - don't check before moving/deleting
  - chmod +x moved programs
  - remove IPv6 dependency
  - no 'default y'
  - add homepage
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - rebase and all the changes in the commit log

---
Note: this patch won't be applicable using pwclient, as it contains a ^L
character which makes the python xml stack barf like a student during a
spring break.
---
 package/Config.in                             |   3 +
 package/inetutils/0001-PATH_PROCNET_DEV.patch |  20 +++
 package/inetutils/Config.in                   | 161 ++++++++++++++++++++++
 package/inetutils/inetutils.hash              |   2 +
 package/inetutils/inetutils.mk                | 185 ++++++++++++++++++++++++++
 5 files changed, 371 insertions(+)
 create mode 100644 package/inetutils/0001-PATH_PROCNET_DEV.patch
 create mode 100644 package/inetutils/Config.in
 create mode 100644 package/inetutils/inetutils.hash
 create mode 100644 package/inetutils/inetutils.mk

diff --git a/package/Config.in b/package/Config.in
index dd44743..3617bd5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1329,6 +1329,9 @@ endif
 	source "package/igh-ethercat/Config.in"
 	source "package/igmpproxy/Config.in"
 	source "package/inadyn/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	source "package/inetutils/Config.in"
+endif
 	source "package/iodine/Config.in"
 	source "package/iperf/Config.in"
 	source "package/iperf3/Config.in"
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
index 0000000..ee9105f
--- /dev/null
+++ b/package/inetutils/Config.in
@@ -0,0 +1,161 @@
+menuconfig BR2_PACKAGE_INETUTILS
+	bool "inetutils"
+	depends on BR2_USE_WCHAR
+	help
+	  GNU Inetutils is a collection of common network programs.
+
+	  Clients included:
+	  dnsdomainname, ftp, hostname, ifconfig, logger, ping, ping6, rcp,
+	  rexec, rlogin, rsh, talk, telnet, tftp, traceroute, whois
+
+	  Servers included:
+	  ftpd, inetd, rexecd, rlogind, rshd, syslogd, talkd, telnetd, tftpd,
+	  uucpd
+
+	  https://www.gnu.org/software/inetutils/
+
+if BR2_PACKAGE_INETUTILS
+
+comment "Clients"
+
+config BR2_PACKAGE_INETUTILS_DNSDOMAINNAME
+	bool "dnsdomainname"
+
+comment "dnsdomainname overwrites the net-tools package's version if selected!"
+	depends on BR2_PACKAGE_INETUTILS_DNSDOMAINNAME && BR2_PACKAGE_NET_TOOLS
+
+config BR2_PACKAGE_INETUTILS_FTP
+	bool "ftp"
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
+
+comment "ping overwrites the iputils package's version if selected!"
+	depends on BR2_PACKAGE_INETUTILS_PING && BR2_PACKAGE_IPUTILS
+
+config BR2_PACKAGE_INETUTILS_PING6
+	bool "ping6"
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
+
+config BR2_PACKAGE_INETUTILS_TFTP
+	bool "tftp"
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
+comment "Servers"
+
+config BR2_PACKAGE_INETUTILS_FTPD
+	bool "ftpd"
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
index 0000000..75b094d
--- /dev/null
+++ b/package/inetutils/inetutils.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256	849d96f136effdef69548a940e3e0ec0624fc0c81265296987986a0dd36ded37	inetutils-1.9.4.tar.xz
diff --git a/package/inetutils/inetutils.mk b/package/inetutils/inetutils.mk
new file mode 100644
index 0000000..05a8be1
--- /dev/null
+++ b/package/inetutils/inetutils.mk
@@ -0,0 +1,185 @@
+################################################################################
+#
+# inetutils
+#
+################################################################################
+
+INETUTILS_VERSION = 1.9.4
+INETUTILS_SITE = $(BR2_GNU_MIRROR)/inetutils
+INETUTILS_SOURCE = inetutils-$(INETUTILS_VERSION).tar.xz
+INETUTILS_LICENSE = GPLv3
+INETUTILS_LICENSE_FILES = COPYING
+
+# libexecdir is defined to have the daemons installed in /usr/sbin instead of /usr/libexec
+INETUTILS_CONF_OPTS = --libexecdir=/usr/sbin
+
+# Disable all clients and servers by default, they'll be enabled one by one
+INETUTILS_CONF_OPTS += --disable-clients --disable-servers
+
+# inetutils' own dependency
+INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_NCURSES),ncurses)
+
+# inetutils provides these tools, it should win over them
+INETUTILS_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
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
+ifeq ($(BR2_PACKAGE_INETUTILS_DNSDOMAINNAME),y)
+INETUTILS_CONF_OPTS += --enable-dnsdomainname
+INETUTILS_USR_BINS_MOVE += dnsdomainname
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_FTP),y)
+INETUTILS_CONF_OPTS += --enable-ftp
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_HOSTNAME),y)
+INETUTILS_CONF_OPTS += --enable-hostname
+INETUTILS_USR_BINS_MOVE += hostname
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_IFCONFIG),y)
+INETUTILS_CONF_OPTS += --enable-ifconfig
+# inetutils installs ifconfig in /usr/bin but the other packages
+# install it in /sbin so we can not use the generic post-install
+# hook to move it, as it can only move /usr/sbin -> /sbin or
+# /usr/bin -> /bin .
+define INETUTILS_IFCONFIG_MOVE
+	mv -f $(TARGET_DIR)/usr/bin/ifconfig $(TARGET_DIR)/sbin/ifconfig
+endef
+INETUTILS_POST_INSTALL_TARGET_HOOKS += INETUTILS_IFCONFIG_MOVE
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_LOGGER),y)
+INETUTILS_CONF_OPTS += --enable-logger
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_PING),y)
+INETUTILS_CONF_OPTS += --enable-ping
+INETUTILS_USR_BINS_MOVE += ping
+INETUTILS_PERMISSIONS += /bin/ping f 4755 0 0 - - - - -$(sep)
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_PING6),y)
+INETUTILS_CONF_OPTS += --enable-ping6
+INETUTILS_USR_BINS_MOVE += ping6
+INETUTILS_PERMISSIONS += /bin/ping6 f 4755 0 0 - - - - -$(sep)
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_RCP),y)
+INETUTILS_CONF_OPTS += --enable-rcp
+INETUTILS_PERMISSIONS += /usr/bin/rcp f 4755 0 0 - - - - -$(sep)
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_REXEC),y)
+INETUTILS_CONF_OPTS += --enable-rexec
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_RLOGIN),y)
+INETUTILS_CONF_OPTS += --enable-rlogin
+INETUTILS_PERMISSIONS += /usr/bin/rlogin f 4755 0 0 - - - - -$(sep)
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_RSH),y)
+INETUTILS_PERMISSIONS += /usr/bin/rsh f 4755 0 0 - - - - -$(sep)
+INETUTILS_CONF_OPTS += --enable-rsh
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_TALK),y)
+INETUTILS_CONF_OPTS += --enable-talk
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_TELNET),y)
+INETUTILS_CONF_OPTS += --enable-telnet
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_TFTP),y)
+INETUTILS_CONF_OPTS += --enable-tftp
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_TRACEROUTE),y)
+INETUTILS_PERMISSIONS += /usr/bin/traceroute f 4755 0 0 - - - - -$(sep)
+INETUTILS_CONF_OPTS += --enable-traceroute
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_WHOIS),y)
+INETUTILS_CONF_OPTS += --enable-whois
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_FTPD),y)
+INETUTILS_CONF_OPTS += --enable-ftpd
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_INETD),y)
+INETUTILS_CONF_OPTS += --enable-inetd
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_REXECD),y)
+INETUTILS_CONF_OPTS += --enable-rexecd
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_RLOGIND),y)
+INETUTILS_CONF_OPTS += --enable-rlogind
+INETUTILS_DEL_OTHER += rlogind
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_RSHD),y)
+INETUTILS_CONF_OPTS += --enable-rshd
+INETUTILS_DEL_OTHER += rshd
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_SYSLOGD),y)
+INETUTILS_CONF_OPTS += --enable-syslogd
+INETUTILS_USR_SBINS_MOVE += syslogd
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_TALKD),y)
+INETUTILS_CONF_OPTS += --enable-talkd
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_TELNETD),y)
+INETUTILS_CONF_OPTS += --enable-telnetd
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_TFTPD),y)
+INETUTILS_CONF_OPTS += --enable-tftpd
+INETUTILS_DEL_OTHER += tftpd
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_UUCPD),y)
+INETUTILS_CONF_OPTS += --enable-uucpd
+endif
+
+ifneq ($(BR2_ROOTFS_MERGED_USR),y)
+
+# Move binaries to proper path (possibly overwriting other utility versions)
+define INETUTILS_MOVE_PROPER_PATH
+	$(foreach fname,$(INETUTILS_USR_BINS_MOVE),\
+		mv -f $(TARGET_DIR)/usr/bin/$(fname) $(TARGET_DIR)/bin/$(fname)$(sep)\
+		chmod +x $(TARGET_DIR)/bin/$(fname)$(sep))
+	$(foreach fname,$(INETUTILS_USR_SBINS_MOVE),\
+		mv -f $(TARGET_DIR)/usr/sbin/$(fname) $(TARGET_DIR)/sbin/$(fname)$(sep)\
+		chmod +x $(TARGET_DIR)/sbin/$(fname)$(sep))
+endef
+INETUTILS_POST_INSTALL_TARGET_HOOKS += INETUTILS_MOVE_PROPER_PATH
+
+endif # Merged /usr
+
+# Remove iputils and rshd-redone utilities to avoid multiply installed tools
+define INETUTILS_REMOVE_REDUNDANT_TOOLS
+	$(foreach fname,$(INETUTILS_DEL_OTHER),\
+		rm -f $(TARGET_DIR)/usr/sbin/in.$(fname)$(sep))
+endef
+INETUTILS_POST_INSTALL_TARGET_HOOKS += INETUTILS_REMOVE_REDUNDANT_TOOLS
+
+$(eval $(autotools-package))
-- 
1.9.1
