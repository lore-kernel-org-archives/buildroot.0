From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 15:48:15 +0200
Subject: [Buildroot] [git commit] package/tinyhttpd: remove package
Message-ID: <20200904134026.2CE7B877CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa25e78307d0cdf0abaa4bc45d708c322e3fc171
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tinyhttpd is affected by CVE-2002-1819 and is not maintained anymore
(no release since 2001) so remove it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                        |  8 ++++
 package/Config.in                       |  1 -
 package/tinyhttpd/0001-misc-fixes.patch | 80 ---------------------------------
 package/tinyhttpd/Config.in             |  9 ----
 package/tinyhttpd/S85tinyhttpd          | 32 -------------
 package/tinyhttpd/tinyhttpd.hash        |  3 --
 package/tinyhttpd/tinyhttpd.mk          | 32 -------------
 package/tinyhttpd/tinyhttpd.service     | 10 -----
 8 files changed, 8 insertions(+), 167 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index aec2633fd2..022f6a7493 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_PACKAGE_TINYHTTPD
+	bool "tinyhttpd package removed"
+	select BR2_LEGACY
+	help
+	  The tinyhttpd package was removed as it is affected by
+	  CVE-2002-1819 and is not maintained anymore (no release since
+	  2001).
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
 	bool "X.org Enable AIGLX Extension"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 3b6ced8f0f..ffabd20944 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2232,7 +2232,6 @@ endif
 	source "package/tftpd/Config.in"
 	source "package/thttpd/Config.in"
 	source "package/tinc/Config.in"
-	source "package/tinyhttpd/Config.in"
 	source "package/tinyproxy/Config.in"
 	source "package/tinyssh/Config.in"
 	source "package/tor/Config.in"
diff --git a/package/tinyhttpd/0001-misc-fixes.patch b/package/tinyhttpd/0001-misc-fixes.patch
deleted file mode 100644
index 05d6e50a70..0000000000
--- a/package/tinyhttpd/0001-misc-fixes.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-diff -ur tinyhttpd-0.1.0/httpd.c tinyhttpd-0.1.0-patched/httpd.c
---- tinyhttpd-0.1.0/httpd.c	2001-04-21 19:13:13.000000000 -0500
-+++ tinyhttpd-0.1.0-patched/httpd.c	2007-07-02 09:19:27.000000000 -0500
-@@ -4,14 +4,6 @@
-  * CSE 4344 (Network concepts), Prof. Zeigler
-  * University of Texas at Arlington
-  */
--/* This program compiles for Sparc Solaris 2.6.
-- * To compile for Linux:
-- *  1) Comment out the #include <pthread.h> line.
-- *  2) Comment out the line that defines the variable newthread.
-- *  3) Comment out the two lines that run pthread_create().
-- *  4) Uncomment the line that runs accept_request().
-- *  5) Remove -lsocket from the Makefile.
-- */
- #include <stdio.h>
- #include <sys/socket.h>
- #include <sys/types.h>
-@@ -22,7 +14,6 @@
- #include <strings.h>
- #include <string.h>
- #include <sys/stat.h>
--#include <pthread.h>
- #include <sys/wait.h>
- #include <stdlib.h>
- 
-@@ -30,7 +21,6 @@
- 
- #define SERVER_STRING "Server: jdbhttpd/0.1.0\r\n"
- 
--void accept_request(int);
- void bad_request(int);
- void cat(int, FILE *);
- void cannot_execute(int);
-@@ -102,7 +92,7 @@
-   }
-  }
- 
-- sprintf(path, "htdocs%s", url);
-+ sprintf(path, "/var/www%s", url);
-  if (path[strlen(path) - 1] == '/')
-   strcat(path, "index.html");
-  if (stat(path, &st) == -1) {
-@@ -475,11 +465,10 @@
- int main(void)
- {
-  int server_sock = -1;
-- u_short port = 0;
-+ u_short port = 80;
-  int client_sock = -1;
-  struct sockaddr_in client_name;
-  int client_name_len = sizeof(client_name);
-- pthread_t newthread;
- 
-  server_sock = startup(&port);
-  printf("httpd running on port %d\n", port);
-@@ -491,9 +480,7 @@
-                        &client_name_len);
-   if (client_sock == -1)
-    error_die("accept");
-- /* accept_request(client_sock); */
-- if (pthread_create(&newthread , NULL, accept_request, client_sock) != 0)
--   perror("pthread_create");
-+  accept_request(client_sock);
-  }
- 
-  close(server_sock);
-diff -ur tinyhttpd-0.1.0/Makefile tinyhttpd-0.1.0-patched/Makefile
---- tinyhttpd-0.1.0/Makefile	2001-04-21 17:03:39.000000000 -0500
-+++ tinyhttpd-0.1.0-patched/Makefile	2007-07-02 10:29:41.000000000 -0500
-@@ -1,7 +1,7 @@
- all: httpd
- 
- httpd: httpd.c
--	gcc -W -Wall -lsocket -lpthread -o httpd httpd.c
-+	$(CC) $(CFLAGS) $(LDFLAGS) -W -Wall -o httpd httpd.c
- 
- clean:
--	rm httpd
-+	rm -f httpd
diff --git a/package/tinyhttpd/Config.in b/package/tinyhttpd/Config.in
deleted file mode 100644
index f648bcd369..0000000000
--- a/package/tinyhttpd/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_TINYHTTPD
-	bool "tinyhttpd"
-	depends on BR2_USE_MMU # fork()
-	help
-	  A relatively simple webserver written as a school
-	  project. It is exceedingly simple, threaded and handles
-	  basic CGI scripts.
-
-	  http://sourceforge.net/projects/tinyhttpd/
diff --git a/package/tinyhttpd/S85tinyhttpd b/package/tinyhttpd/S85tinyhttpd
deleted file mode 100644
index f3f1de69bf..0000000000
--- a/package/tinyhttpd/S85tinyhttpd
+++ /dev/null
@@ -1,32 +0,0 @@
-#! /bin/sh
-
-PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
-NAME=tinyhttpd
-
-mkdir -p /var/www
-
-case "$1" in
-  start)
-	printf "Starting $NAME: "
-	$NAME > /dev/null &
-	echo "done"
-	;;
-  stop)
-	printf "Stopping $NAME: "
-	killall -9 $NAME
-	echo "done"
-	;;
-  restart)
-	printf "Restarting $NAME: "
-	killall -9 $NAME
-	sleep 1
-	$NAME > /dev/null &
-	echo "done"
-	;;
-  *)
-	echo "Usage: /etc/init.d/S85tinyhttpd {start|stop|restart}" >&2
-	exit 1
-	;;
-esac
-
-exit 0
diff --git a/package/tinyhttpd/tinyhttpd.hash b/package/tinyhttpd/tinyhttpd.hash
deleted file mode 100644
index fc8ff4ee2c..0000000000
--- a/package/tinyhttpd/tinyhttpd.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  56609b82869c80ba71b2a2af166a0bcaffe21e7412f4594e04b9a5abf733435a  tinyhttpd-0.1.0.tar.gz
-sha256  4289e6d4f7ba72672dbd45ab78a8e02babf3d6e0577eeac5b2ef6926da6f4a87  README
diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
deleted file mode 100644
index 6b3ba5f305..0000000000
--- a/package/tinyhttpd/tinyhttpd.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# tinyhttpd
-#
-################################################################################
-
-TINYHTTPD_VERSION = 0.1.0
-TINYHTTPD_SITE = http://downloads.sourceforge.net/project/tinyhttpd/tinyhttpd%20source/tinyhttpd%20$(TINYHTTPD_VERSION)
-TINYHTTPD_LICENSE = GPL
-TINYHTTPD_LICENSE_FILES = README
-
-define TINYHTTPD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
-endef
-
-define TINYHTTPD_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/httpd $(TARGET_DIR)/usr/sbin/tinyhttpd
-	mkdir -p $(TARGET_DIR)/var/www
-endef
-
-define TINYHTTPD_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/tinyhttpd/S85tinyhttpd \
-		$(TARGET_DIR)/etc/init.d/S85tinyhttpd
-endef
-
-define TINYHTTPD_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/tinyhttpd/tinyhttpd.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/tinyhttpd.service
-endef
-
-$(eval $(generic-package))
diff --git a/package/tinyhttpd/tinyhttpd.service b/package/tinyhttpd/tinyhttpd.service
deleted file mode 100644
index 0ae5bac943..0000000000
--- a/package/tinyhttpd/tinyhttpd.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Tiny HTTP daemon
-After=network.target
-
-[Service]
-ExecStart=/usr/sbin/tinyhttpd
-Restart=always
-
-[Install]
-WantedBy=multi-user.target
