From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 22:33:31 +0200
Subject: [Buildroot] [git commit branch/next] acpid: add init.d script
Message-ID: <20120811203419.B2FF997075@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=956caf62480f2cb0adada6a5a9f1e5ca3dd2b262
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/acpid/S02acpid |   22 ++++++++++++++++++++++
 package/acpid/acpid.mk |    1 +
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/acpid/S02acpid b/package/acpid/S02acpid
new file mode 100755
index 0000000..ec686d8
--- /dev/null
+++ b/package/acpid/S02acpid
@@ -0,0 +1,22 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		echo -n "Starting acpid: "
+		start-stop-daemon -S -q -m -b -p /var/run/acpid.pid --exec /usr/sbin/acpid -- -n
+		echo "done"
+		;;
+	stop)
+		echo -n "Stopping acpid: "
+		start-stop-daemon -K -q -p /var/run/acpid.pid
+		echo "done"
+		;;
+	restart)
+		"$0" stop
+		sleep 1
+		"$0" start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		;;
+esac
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index cacfb27..56f671d 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -18,6 +18,7 @@ define ACPID_INSTALL_TARGET_CMDS
 	install -D -m 644 $(@D)/acpi_listen.8 $(TARGET_DIR)/usr/share/man/man8/acpi_listen.8
 	mkdir -p $(TARGET_DIR)/etc/acpi/events
 	/bin/echo -e "event=button[ /]power\naction=/sbin/poweroff" > $(TARGET_DIR)/etc/acpi/events/powerbtn
+	$(INSTALL) -D -m 0755 package/acpid/S02acpid $(TARGET_DIR)/etc/init.d/S02acpid
 endef
 
 define ACPID_UNINSTALL_TARGET_CMDS
