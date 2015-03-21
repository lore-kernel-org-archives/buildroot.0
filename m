From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 21 Mar 2015 20:31:47 +0200
Subject: [Buildroot] [RFC 08/11] acpid: new init infrastructure
In-Reply-To: <cover.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
Message-ID: <3d7a2aced430ee1ff0379b152220ff7f196af5c8.1426960081.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Systemd has built-in support for acpi events and does not need acpid.
---
 package/acpid/S02acpid  | 22 ----------------------
 package/acpid/acpid.mk  |  5 -----
 package/acpid/acpid.run |  3 +++
 3 files changed, 3 insertions(+), 27 deletions(-)
 delete mode 100755 package/acpid/S02acpid
 create mode 100644 package/acpid/acpid.run

diff --git a/package/acpid/S02acpid b/package/acpid/S02acpid
deleted file mode 100755
index 0840305..0000000
--- a/package/acpid/S02acpid
+++ /dev/null
@@ -1,22 +0,0 @@
-#!/bin/sh
-
-case "$1" in
-	start)
-		echo -n "Starting acpid: "
-		start-stop-daemon -S -q -m -b -p /var/run/acpid.pid --exec /usr/sbin/acpid -- -n
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		;;
-	stop)
-		echo -n "Stopping acpid: "
-		start-stop-daemon -K -q -p /var/run/acpid.pid
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		;;
-	restart)
-		"$0" stop
-		sleep 1
-		"$0" start
-		;;
-	*)
-		echo "Usage: $0 {start|stop|restart}"
-		;;
-esac
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 7a6a478..61fc6c7 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -10,11 +10,6 @@ ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
 ACPID_LICENSE = GPLv2+
 ACPID_LICENSE_FILES = COPYING
 
-define ACPID_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/acpid/S02acpid \
-		$(TARGET_DIR)/etc/init.d/S02acpid
-endef
-
 define ACPID_SET_EVENTS
 	mkdir -p $(TARGET_DIR)/etc/acpi/events
 	printf "event=button[ /]power\naction=/sbin/poweroff\n" \
diff --git a/package/acpid/acpid.run b/package/acpid/acpid.run
new file mode 100644
index 0000000..79c6216
--- /dev/null
+++ b/package/acpid/acpid.run
@@ -0,0 +1,3 @@
+## ACPI daemon
+systemd -
+exec /usr/sbin/acpid -f -n
-- 
2.0.3
