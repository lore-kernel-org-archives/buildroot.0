From: Andreas Hilse <andreas.hilse@googlemail.com>
Date: Wed, 12 Aug 2020 18:08:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to version 2.1.2
Message-ID: <20200812160843.24064-1-andreas.hilse@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- fixes: sysklogd 1.6 klogd with newer glibcs: kernel messages are logged to user facility
- sysklogd removed klogd, functionality has been moved to syslogd
- now supports config fragments in /etc/syslog.d
- disabled sysklogd logger to not interfere with other loggers

Signed-off-by: Andreas Hilse <andreas.hilse@googlemail.com>
---
 package/sysklogd/Config.in       |  4 +-
 package/sysklogd/S02klogd        | 65 --------------------------------
 package/sysklogd/klogd.service   | 11 ------
 package/sysklogd/sysklogd.hash   |  4 +-
 package/sysklogd/sysklogd.mk     | 12 ++----
 package/sysklogd/syslog.conf     |  2 +
 package/sysklogd/syslogd.service |  3 +-
 7 files changed, 11 insertions(+), 90 deletions(-)
 delete mode 100644 package/sysklogd/S02klogd
 delete mode 100644 package/sysklogd/klogd.service

diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index fda58e020e..996c46ffa1 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_SYSKLOGD
-	bool "syslogd & klogd"
+	bool "sysklogd"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
-	  System log daemons syslogd and klogd.
+	  System log daemon syslogd.
 
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
index 6f7ab6ece8..88ae0c745d 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	1e9e18564c5bba474954d55ea6e2a0e3dc1bc145d8973c5fd098b088a9be9ceb	sysklogd-1.6.tar.gz
-sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
+sha256	09fe1edca882a9ae976cdbf516786edc1629347b9507d45dc005d9d969f94702	sysklogd-2.1.2.tar.gz
+sha256	7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477	LICENSE
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
index 3184139052..db81da8868 100644
--- a/package/sysklogd/syslog.conf
+++ b/package/sysklogd/syslog.conf
@@ -1,5 +1,7 @@
 # /etc/syslog.conf - Configuration file for syslogd
 
+include /etc/syslog.d/*.conf
+
 auth,authpriv.*		/var/log/auth.log
 *.*;auth,authpriv.none	/var/log/messages
 user.*			/var/log/user.log
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
 
-- 
2.28.0
