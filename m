From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:28:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  vice
Message-ID: <20080306182827.4301812028A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:28:26 -0800 (Thu, 06 Mar 2008)
New Revision: 21236

Log:
added vice


Added:
   trunk/buildroot/package/vice/
   trunk/buildroot/package/vice/Config.in
   trunk/buildroot/package/vice/vice-1.22-remove-bzero.patch
   trunk/buildroot/package/vice/vice.mk


Changeset:
Added: trunk/buildroot/package/vice/Config.in
===================================================================
--- trunk/buildroot/package/vice/Config.in	                        (rev 0)
+++ trunk/buildroot/package/vice/Config.in	2008-03-06 18:28:26 UTC (rev 21236)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_VICE
+	bool "vice"
+	default n
+	help
+	  VICE is a Commodore emulator
+
+	  http://www.viceteam.org/online

Added: trunk/buildroot/package/vice/vice-1.22-remove-bzero.patch
===================================================================
--- trunk/buildroot/package/vice/vice-1.22-remove-bzero.patch	                        (rev 0)
+++ trunk/buildroot/package/vice/vice-1.22-remove-bzero.patch	2008-03-06 18:28:26 UTC (rev 21236)
@@ -0,0 +1,20 @@
+--- a/src/network.c	2007-07-15 18:49:24.000000000 -0400
++++ b/src/network.c	2008-03-01 21:29:40.000000000 -0500
+@@ -742,7 +742,7 @@ int network_start_server(void)
+ 
+ #ifdef HAVE_IPV6
+     if (netplay_ipv6) {
+-        bzero((char*)&server_addr6, sizeof(struct sockaddr_in6));
++        memset((char*)&server_addr6, 0, sizeof(struct sockaddr_in6));
+         server_addr6.sin6_port = htons(server_port);
+         server_addr6.sin6_family = PF_INET6;
+         server_addr6.sin6_addr=in6addr_any;
+@@ -853,7 +853,7 @@ int network_connect_client(void)
+     }
+ #ifdef HAVE_IPV6
+     if (netplay_ipv6) {
+-        bzero((char*)&server_addr6, sizeof(struct sockaddr_in6));
++        memset((char*)&server_addr6, 0, sizeof(struct sockaddr_in6));
+         server_addr6.sin6_port = htons(server_port);
+         server_addr6.sin6_family = PF_INET6;
+         memcpy(&server_addr6.sin6_addr, server_hostent->h_addr, server_hostent->h_length);

Added: trunk/buildroot/package/vice/vice.mk
===================================================================
--- trunk/buildroot/package/vice/vice.mk	                        (rev 0)
+++ trunk/buildroot/package/vice/vice.mk	2008-03-06 18:28:26 UTC (rev 21236)
@@ -0,0 +1,18 @@
+#############################################################
+#
+# vice
+#
+#############################################################
+VICE_VERSION = 1.22
+VICE_SOURCE = vice-$(VICE_VERSION).tar.gz
+VICE_SITE = http://www.viceteam.org/online
+VICE_AUTORECONF = NO
+VICE_INSTALL_STAGING = NO
+VICE_INSTALL_TARGET = YES
+
+VICE_CONF_OPT = --without-resid --with-alsa CFLAGS="-O0"
+
+VICE_DEPENDENCIES = uclibc 
+
+$(eval $(call AUTOTARGETS,package,vice))
+
