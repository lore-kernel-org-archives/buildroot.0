From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 6 Apr 2015 01:04:34 +0300
Subject: [Buildroot] [RFC v2 6/6] acpid: common service startup
In-Reply-To: <cover.1428263859.git.alex.suykov@gmail.com>
References: <cover.1428263859.git.alex.suykov@gmail.com>
Message-ID: <9c1c82218442ce2cdcc19ffe75265ad71d9ca17a.1428263859.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Skipping systemd installation.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/acpid/S02acpid  | 22 ----------------------
 package/acpid/acpid.mk  |  8 +++-----
 package/acpid/acpid.run |  3 +++
 3 files changed, 6 insertions(+), 27 deletions(-)
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
index 7a6a478..44acb3d 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -9,11 +9,9 @@ ACPID_SOURCE = acpid-$(ACPID_VERSION).tar.xz
 ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
 ACPID_LICENSE = GPLv2+
 ACPID_LICENSE_FILES = COPYING
-
-define ACPID_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/acpid/S02acpid \
-		$(TARGET_DIR)/etc/init.d/S02acpid
-endef
+ifndef BR2_INIT_SYSTEMD
+ACPID_INIT_RUN = acpid.run
+endif
 
 define ACPID_SET_EVENTS
 	mkdir -p $(TARGET_DIR)/etc/acpi/events
diff --git a/package/acpid/acpid.run b/package/acpid/acpid.run
new file mode 100644
index 0000000..056e5e5
--- /dev/null
+++ b/package/acpid/acpid.run
@@ -0,0 +1,3 @@
+description: ACPI daemon
+foreground: /usr/sbin/acpid -f -n
+background: /usr/sbin/acpid -n
-- 
2.0.3
