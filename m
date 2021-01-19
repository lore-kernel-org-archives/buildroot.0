From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Jan 2021 22:21:25 +0100
Subject: [Buildroot] [git commit] package/sysklogd: bump to version 2.1.2
Message-ID: <20210119210228.7817A886A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a91580c1175b098fe2508ca11bfcf621ecbbe9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- fixes: sysklogd 1.6 klogd with newer glibcs: kernel messages are
  logged to user facility
- sysklogd removed klogd, functionality has been moved to syslogd
- now supports config fragments in /etc/syslog.d
- disabled sysklogd logger to not interfere with other loggers
- license has changed from GPL-2.0+ to BSD-3-Clause

Signed-off-by: Andreas Hilse <andreas.hilse@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...U_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch | 44 +++++++++++++++
 package/sysklogd/Config.in                         |  9 ++-
 package/sysklogd/S02klogd                          | 65 ----------------------
 package/sysklogd/klogd.service                     | 11 ----
 package/sysklogd/sysklogd.hash                     |  5 +-
 package/sysklogd/sysklogd.mk                       | 12 ++--
 package/sysklogd/syslog.conf                       |  2 +
 package/sysklogd/syslogd.service                   |  3 +-
 8 files changed, 61 insertions(+), 90 deletions(-)

diff --git a/package/sysklogd/0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch b/package/sysklogd/0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch
new file mode 100644
index 0000000000..684b6b3e4c
--- /dev/null
+++ b/package/sysklogd/0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch
@@ -0,0 +1,44 @@
+From 93117e58016de6f604e67263b5135adbba032367 Mon Sep 17 00:00:00 2001
+From: Joachim Wiberg <troglobit@gmail.com>
+Date: Sun, 30 Aug 2020 11:41:45 +0200
+Subject: [PATCH] Define _GNU_SOURCE, required for O_CLOEXEC on uClibc
+
+When building sysklogd on a uClibc system we must define _GNU_SOURCE to
+get O_CLOEXEC.
+
+Since _GNU_SOURCE is also required for asprintf() with GLIBC, as used by
+the pidfile() replacement function, we drop it from there and rely on
+AM_CPPFLAGS for all sources.
+
+Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
+Signed-off-by: Andreas Hilse <andreas.hilse@googlemail.com>
+---
+ lib/pidfile.c   | 1 -
+ src/Makefile.am | 2 +-
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/pidfile.c b/lib/pidfile.c
+index a26de73..886a29c 100644
+--- a/lib/pidfile.c
++++ b/lib/pidfile.c
+@@ -31,7 +31,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#define _GNU_SOURCE		/* Needed with GLIBC to get asprintf() */
+ #include <sys/stat.h>		/* utimensat() */
+ #include <sys/time.h>		/* utimensat() on *BSD */
+ #include <sys/types.h>
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 9b80a02..1909ada 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -36,7 +36,7 @@ endif
+ AM_CFLAGS             = -W -Wall -Wextra
+ AM_CFLAGS            += -Wno-unused-result -Wno-unused-parameter -fno-strict-aliasing
+ AM_CPPFLAGS           = -DSYSCONFDIR=\"@sysconfdir@\" -DRUNSTATEDIR=\"@runstatedir@\"
+-AM_CPPFLAGS          += -D_BSD_SOURCE -D_DEFAULT_SOURCE
++AM_CPPFLAGS          += -D_BSD_SOURCE -D_DEFAULT_SOURCE -D_GNU_SOURCE
+ 
+ syslogd_SOURCES       = syslogd.c syslogd.h socket.c socket.h syslog.h
+ syslogd_SOURCES      += timer.c timer.h queue.h compat.h
diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index fda58e020e..18aff091c0 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_SYSKLOGD
-	bool "syslogd & klogd"
+	bool "sysklogd"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
-	  System log daemons syslogd and klogd.
+	  The continuation of the original sysklogd package, based on
+	  the original Berkeley syslog daemon. Now with kernel
+	  logging, and log rotation built-in. It can both receive from
+	  and send to remote syslog servers. The v2.x series include
+	  extended support for RFC5424 with an alt. syslogp() API for
+	  clients.
 
 	  https://github.com/troglobit/sysklogd/
diff --git a/package/sysklogd/S02klogd b/package/sysklogd/S02klogd
deleted file mode 100644
index ba728aa99a..0000000000
--- a/package/sysklogd/S02klogd
+++ /dev/null
@@ -1,65 +0,0 @@
-#!/bin/sh
-
-DAEMON="klogd"
-PIDFILE="/var/run/$DAEMON.pid"
-
-KLOGD_ARGS=""
-
-KLOGD_RELOAD="0"
-
-# shellcheck source=/dev/null
-[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
-
-start() {
-	printf 'Starting %s: ' "$DAEMON"
-	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
-		-- $KLOGD_ARGS
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-stop() {
-	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-restart() {
-	stop
-	sleep 1
-	start
-}
-
-# SIGUSR1 makes klogd reload kernel module symbols
-# SIGUSR2 makes klogd reload static kernel symbols and kernel module symbols
-reload() {
-	printf 'Reloading %s: ' "$DAEMON"
-	start-stop-daemon -K -s "$KLOGD_RELOAD" -q -p "$PIDFILE"
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-case "$1" in
-	start|stop|restart|reload)
-		"$1";;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload}"
-		exit 1
-esac
diff --git a/package/sysklogd/klogd.service b/package/sysklogd/klogd.service
deleted file mode 100644
index b5dbb93d7d..0000000000
--- a/package/sysklogd/klogd.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=Kernel Log Daemon
-
-[Service]
-ExecStart=/sbin/klogd -n
-StandardOutput=null
-Restart=on-failure
-
-[Install]
-WantedBy=multi-user.target
-WantedBy=syslogd.service
diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 6f7ab6ece8..9f9fd192e1 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256	1e9e18564c5bba474954d55ea6e2a0e3dc1bc145d8973c5fd098b088a9be9ceb	sysklogd-1.6.tar.gz
-sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
+sha256	09fe1edca882a9ae976cdbf516786edc1629347b9507d45dc005d9d969f94702	sysklogd-2.1.2.tar.gz
+sha256	7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477	LICENSE
+sha256	569321607efe6ba0ecb820b3cb23d933e92f6ab50d2f8fcceb23fc8a43756ef0	0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 7a25d0eb6f..cd013f658c 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 1.6
+SYSKLOGD_VERSION = 2.1.2
 SYSKLOGD_SITE = $(call github,troglobit,sysklogd,v$(SYSKLOGD_VERSION))
-SYSKLOGD_LICENSE = GPL-2.0+
-SYSKLOGD_LICENSE_FILES = COPYING
+SYSKLOGD_LICENSE = BSD-3-Clause
+SYSKLOGD_LICENSE_FILES = LICENSE
 # From git
 SYSKLOGD_AUTORECONF = YES
-SYSKLOGD_CONF_OPTS = --exec-prefix=/
+SYSKLOGD_CONF_OPTS = --exec-prefix=/ --without-logger
 
 define SYSKLOGD_INSTALL_SAMPLE_CONFIG
 	$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
@@ -22,15 +22,11 @@ SYSKLOGD_POST_INSTALL_TARGET_HOOKS += SYSKLOGD_INSTALL_SAMPLE_CONFIG
 define SYSKLOGD_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/sysklogd/S01syslogd \
 		$(TARGET_DIR)/etc/init.d/S01syslogd
-	$(INSTALL) -m 755 -D package/sysklogd/S02klogd \
-		$(TARGET_DIR)/etc/init.d/S02klogd
 endef
 
 define SYSKLOGD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 $(SYSKLOGD_PKGDIR)/syslogd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/syslogd.service
-	$(INSTALL) -D -m 644 $(SYSKLOGD_PKGDIR)/klogd.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/klogd.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/sysklogd/syslog.conf b/package/sysklogd/syslog.conf
index 3184139052..411bd645ff 100644
--- a/package/sysklogd/syslog.conf
+++ b/package/sysklogd/syslog.conf
@@ -5,3 +5,5 @@ auth,authpriv.*		/var/log/auth.log
 user.*			/var/log/user.log
 
 *.emerg			*
+
+include /etc/syslog.d/*.conf
diff --git a/package/sysklogd/syslogd.service b/package/sysklogd/syslogd.service
index adaac679f2..1bf1bb3bd9 100644
--- a/package/sysklogd/syslogd.service
+++ b/package/sysklogd/syslogd.service
@@ -1,10 +1,9 @@
 [Unit]
 Description=System Logging Service
 Requires=syslog.socket
-Wants=klogd.service
 
 [Service]
-ExecStart=/sbin/syslogd -m 0 -n
+ExecStart=/sbin/syslogd -m 0 -F
 StandardOutput=null
 Restart=on-failure
 
