From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon, 16 Jul 2007 17:23:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  tinyhttpd
Message-ID: <20070717002332.7B1D03008A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-16 17:23:31 -0700 (Mon, 16 Jul 2007)
New Revision: 19120

Log:
Add new 'tinyhttpd' package and move all other httpd servers to be disabled if the BusyBox server is being used.


Added:
   trunk/buildroot/package/tinyhttpd/
   trunk/buildroot/package/tinyhttpd/Config.in
   trunk/buildroot/package/tinyhttpd/S85tinyhttpd
   trunk/buildroot/package/tinyhttpd/tinyhttpd.mk
   trunk/buildroot/package/tinyhttpd/tinyhttpd.patch


Changeset:
Added: trunk/buildroot/package/tinyhttpd/Config.in
===================================================================
--- trunk/buildroot/package/tinyhttpd/Config.in	                        (rev 0)
+++ trunk/buildroot/package/tinyhttpd/Config.in	2007-07-17 00:23:31 UTC (rev 19120)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TINYHTTPD
+	bool "tinyhttpd"
+	default n
+	help
+	  A relatively simple webserver written as a school project. It is
+	  exceedingly simple, threaded and handles basic CGI scripts.
+		 
+	  http://sourceforge.net/projects/tinyhttpd/

Added: trunk/buildroot/package/tinyhttpd/S85tinyhttpd
===================================================================
--- trunk/buildroot/package/tinyhttpd/S85tinyhttpd	                        (rev 0)
+++ trunk/buildroot/package/tinyhttpd/S85tinyhttpd	2007-07-17 00:23:31 UTC (rev 19120)
@@ -0,0 +1,33 @@
+#! /bin/sh
+
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+NAME=tinyhttpd
+
+test -x /usr/sbin/$NAME || exit 0
+mkdir -p /var/www
+
+case "$1" in
+  start)
+	echo -n "Starting $NAME: "
+	$NAME > /dev/null &
+	echo "done"
+	;;
+  stop)
+	echo -n "Stopping $NAME: "
+	killall -9 $NAME
+	echo "done"
+	;;
+  restart)
+	echo -n "Restarting $NAME: "
+	killall -9 $NAME
+	sleep 1
+	$NAME > /dev/null &
+	echo "done"
+	;;
+  *)
+	echo "Usage: /etc/init.d/S85tinyhttpd {start|stop|restart}" >&2
+	exit 1
+	;;
+esac
+
+exit 0


Property changes on: trunk/buildroot/package/tinyhttpd/S85tinyhttpd
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/package/tinyhttpd/tinyhttpd.mk
===================================================================
--- trunk/buildroot/package/tinyhttpd/tinyhttpd.mk	                        (rev 0)
+++ trunk/buildroot/package/tinyhttpd/tinyhttpd.mk	2007-07-17 00:23:31 UTC (rev 19120)
@@ -0,0 +1,56 @@
+#############################################################
+#
+# tinyhttpd
+#
+#############################################################
+TINYHTTPD_VER:=0.1.0
+TINYHTTPD_SOURCE:=tinyhttpd-$(TINYHTTPD_VER).tar.gz
+TINYHTTPD_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tinyhttpd/$(TINYHTTPD_SOURCE)
+TINYHTTPD_DIR:=$(BUILD_DIR)/tinyhttpd-$(TINYHTTPD_VER)
+TINYHTTPD_CAT:=$(ZCAT)
+TINYHTTPD_BINARY:=httpd
+TINYHTTPD_TARGET_BINARY:=usr/sbin/tinyhttpd
+
+$(DL_DIR)/$(TINYHTTPD_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(TINYHTTPD_SITE)/$(TINYHTTPD_SOURCE)
+
+tinyhttpd-source: $(DL_DIR)/$(TINYHTTPD_SOURCE)
+
+#############################################################
+#
+# build tinyhttpd for use on the target system
+#
+#############################################################
+$(TINYHTTPD_DIR)/.unpacked: $(DL_DIR)/$(TINYHTTPD_SOURCE)
+	$(TINYHTTPD_CAT) $(DL_DIR)/$(TINYHTTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(TINYHTTPD_DIR) package/tinyhttpd/ tinyhttpd\*.patch
+	touch  $(TINYHTTPD_DIR)/.unpacked
+
+$(TINYHTTPD_DIR)/$(TINYHTTPD_BINARY): $(TINYHTTPD_DIR)/.unpacked
+	$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" $(MAKE) -C $(TINYHTTPD_DIR)
+    
+$(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY): $(TINYHTTPD_DIR)/$(TINYHTTPD_BINARY)
+	$(INSTALL) -m 0755 $(TINYHTTPD_DIR)/$(TINYHTTPD_BINARY) $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
+	$(INSTALL) -m 0755 package/tinyhttpd/S85tinyhttpd $(TARGET_DIR)/etc/init.d
+	mkdir -p $(TARGET_DIR)/var/www
+
+tinyhttpd: uclibc $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
+
+tinyhttpd-clean:
+	$(MAKE) -C $(TINYHTTPD_DIR) clean
+	@rm -f $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
+	@rm -f $(TARGET_DIR)/etc/init.d/S85tinyhttpd
+	@rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/var/www
+
+tinyhttpd-dirclean:
+	rm -rf $(TINYHTTPD_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_TINYHTTPD)),y)
+TARGETS+=tinyhttpd
+endif

Added: trunk/buildroot/package/tinyhttpd/tinyhttpd.patch
===================================================================
--- trunk/buildroot/package/tinyhttpd/tinyhttpd.patch	                        (rev 0)
+++ trunk/buildroot/package/tinyhttpd/tinyhttpd.patch	2007-07-17 00:23:31 UTC (rev 19120)
@@ -0,0 +1,80 @@
+diff -ur tinyhttpd-0.1.0/httpd.c tinyhttpd-0.1.0-patched/httpd.c
+--- tinyhttpd-0.1.0/httpd.c	2001-04-21 19:13:13.000000000 -0500
++++ tinyhttpd-0.1.0-patched/httpd.c	2007-07-02 09:19:27.000000000 -0500
+@@ -4,14 +4,6 @@
+  * CSE 4344 (Network concepts), Prof. Zeigler
+  * University of Texas at Arlington
+  */
+-/* This program compiles for Sparc Solaris 2.6.
+- * To compile for Linux:
+- *  1) Comment out the #include <pthread.h> line.
+- *  2) Comment out the line that defines the variable newthread.
+- *  3) Comment out the two lines that run pthread_create().
+- *  4) Uncomment the line that runs accept_request().
+- *  5) Remove -lsocket from the Makefile.
+- */
+ #include <stdio.h>
+ #include <sys/socket.h>
+ #include <sys/types.h>
+@@ -22,7 +14,6 @@
+ #include <strings.h>
+ #include <string.h>
+ #include <sys/stat.h>
+-#include <pthread.h>
+ #include <sys/wait.h>
+ #include <stdlib.h>
+ 
+@@ -30,7 +21,6 @@
+ 
+ #define SERVER_STRING "Server: jdbhttpd/0.1.0\r\n"
+ 
+-void accept_request(int);
+ void bad_request(int);
+ void cat(int, FILE *);
+ void cannot_execute(int);
+@@ -102,7 +92,7 @@
+   }
+  }
+ 
+- sprintf(path, "htdocs%s", url);
++ sprintf(path, "/var/www%s", url);
+  if (path[strlen(path) - 1] == '/')
+   strcat(path, "index.html");
+  if (stat(path, &st) == -1) {
+@@ -475,11 +465,10 @@
+ int main(void)
+ {
+  int server_sock = -1;
+- u_short port = 0;
++ u_short port = 80;
+  int client_sock = -1;
+  struct sockaddr_in client_name;
+  int client_name_len = sizeof(client_name);
+- pthread_t newthread;
+ 
+  server_sock = startup(&port);
+  printf("httpd running on port %d\n", port);
+@@ -491,9 +480,7 @@
+                        &client_name_len);
+   if (client_sock == -1)
+    error_die("accept");
+- /* accept_request(client_sock); */
+- if (pthread_create(&newthread , NULL, accept_request, client_sock) != 0)
+-   perror("pthread_create");
++  accept_request(client_sock);
+  }
+ 
+  close(server_sock);
+diff -ur tinyhttpd-0.1.0/Makefile tinyhttpd-0.1.0-patched/Makefile
+--- tinyhttpd-0.1.0/Makefile	2001-04-21 17:03:39.000000000 -0500
++++ tinyhttpd-0.1.0-patched/Makefile	2007-07-02 10:29:41.000000000 -0500
+@@ -1,7 +1,7 @@
+ all: httpd
+ 
+ httpd: httpd.c
+-	gcc -W -Wall -lsocket -lpthread -o httpd httpd.c
++	$(CC) $(CFLAGS) $(LDFLAGS) -W -Wall -lpthread -o httpd httpd.c
+ 
+ clean:
+-	rm httpd
++	rm -f httpd
