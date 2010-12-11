From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sat, 11 Dec 2010 17:20:32 -0600
Subject: [Buildroot] [PATCH] add package inetutils
Message-ID: <0260bedd1f27be6bf776f65145d3a40df111b2a6.1292109432.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/Config.in                                  |    3 ++
 package/inetutils/Config.in                        |   17 +++++++++
 .../inetutils/inetutils-1.8-PATH_PROCNET_DEV.patch |   14 ++++++++
 package/inetutils/inetutils.mk                     |   35 ++++++++++++++++++++
 4 files changed, 69 insertions(+), 0 deletions(-)
 create mode 100644 package/inetutils/Config.in
 create mode 100644 package/inetutils/inetutils-1.8-PATH_PROCNET_DEV.patch
 create mode 100644 package/inetutils/inetutils.mk

diff --git a/package/Config.in b/package/Config.in
index 10d8918..9acf765 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -376,6 +376,9 @@ source "package/dropbear/Config.in"
 source "package/ethtool/Config.in"
 source "package/hostapd/Config.in"
 source "package/ifplugd/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+source "package/inetutils/Config.in"
+endif
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
diff --git a/package/inetutils/Config.in b/package/inetutils/Config.in
new file mode 100644
index 0000000..6afdbc9
--- /dev/null
+++ b/package/inetutils/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_INETUTILS
+	bool "inetutils"
+	help
+	  GNU Inetutils
+
+	  This is a distribution of common networking utilities and servers.
+	  It provides apps like ftp, hostname, ping, ping6, rcp, rexec, 
+	  rlogin, rsh, talk, telnet, tftp, and traceroute
+
+config BR2_PACKAGE_INETUTILS_DISABLE_SERVERS
+	depends on BR2_PACKAGE_INETUTILS
+	bool "Don't compile servers"
+
+config BR2_PACKAGE_INETUTILS_DISABLE_CLIENTS
+	depends on BR2_PACKAGE_INETUTILS
+	bool "Don't compile clients"
+
diff --git a/package/inetutils/inetutils-1.8-PATH_PROCNET_DEV.patch b/package/inetutils/inetutils-1.8-PATH_PROCNET_DEV.patch
new file mode 100644
index 0000000..c46d1ee
--- /dev/null
+++ b/package/inetutils/inetutils-1.8-PATH_PROCNET_DEV.patch
@@ -0,0 +1,14 @@
+diff -ru inetutils-1.8.orig/ifconfig/system/linux.c inetutils-1.8/ifconfig/system/linux.c
+--- inetutils-1.8.orig/ifconfig/system/linux.c	2010-05-15 06:48:38.000000000 -0500
++++ inetutils-1.8/ifconfig/system/linux.c	2010-12-11 17:14:22.000000000 -0600
+@@ -49,6 +49,10 @@
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
diff --git a/package/inetutils/inetutils.mk b/package/inetutils/inetutils.mk
new file mode 100644
index 0000000..8fcc186
--- /dev/null
+++ b/package/inetutils/inetutils.mk
@@ -0,0 +1,35 @@
+#############################################################
+#
+# inetutils
+#
+#############################################################
+INETUTILS_VERSION = 1.8
+INETUTILS_SOURCE = inetutils-$(INETUTILS_VERSION).tar.gz
+INETUTILS_SITE = http://ftp.gnu.org/gnu/inetutils/
+
+INETUTILS_DEPENDENCIES =
+INETUTILS_CONF_OPT = --disable-syslogd --disable-logger
+
+ifeq ($(BR2_INET_IPV6),y)
+	INETUTILS_CONF_OPT += --enable-ipv6
+else
+	INETUTILS_CONF_OPT += --disable-ipv6
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+	INETUTILS_CONF_OPT += --enable-ncurses
+	INETUTILS_DEPENDENCIES += ncurses
+else
+	INETUTILS_CONF_OPT += --disable-ncurses
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_DISABLE_SERVERS),y)
+	INETUTILS_CONF_OPT += --disable-servers
+endif
+
+ifeq ($(BR2_PACKAGE_INETUTILS_DISABLE_CLIENTS),y)
+	INETUTILS_CONF_OPT += --disable-clients
+endif
+
+$(eval $(call AUTOTARGETS,package,inetutils))
+
-- 
1.7.3.2
