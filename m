From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Jun 2014 08:33:15 -0300
Subject: [Buildroot] [PATCH] openntpd: add SysV initscript and user
Message-ID: <1402486395-15125-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the _ntp user that the daemon requires to work in any way.
Add a SysV-style initscript as well, but not with '-s' (set time
immediately after startup) because it can make the boot process stall
for a few seconds if there's no proper network connectivity/dns setup.
Make ntp and openntpd mutually exclusive since they overstep each other.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openntpd/Config.in   |  4 ++--
 package/openntpd/S49ntp      | 25 +++++++++++++++++++++++++
 package/openntpd/openntpd.mk |  9 +++++++++
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100755 package/openntpd/S49ntp

diff --git a/package/openntpd/Config.in b/package/openntpd/Config.in
index 4dd9a29..a8ef807 100644
--- a/package/openntpd/Config.in
+++ b/package/openntpd/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_OPENNTPD
 	bool "openntpd"
-	# fork()
-	depends on BR2_USE_MMU
+	depends on BR2_USE_MMU # fork ()
+	depends on !BR2_PACKAGE_NTP # conflicting binaries
 	help
 	  OpenNTPD is an easy to use implementation of the Network Time
 	  Protocol. It provides the ability to sync the local clock
diff --git a/package/openntpd/S49ntp b/package/openntpd/S49ntp
new file mode 100755
index 0000000..99e0f68
--- /dev/null
+++ b/package/openntpd/S49ntp
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+[ -x /usr/sbin/ntpd ] || exit 0
+[ -f /etc/ntpd.conf ] || exit 0
+
+case "$1" in
+	start)
+		echo -n "Starting openntpd: "
+		start-stop-daemon -S -x /usr/sbin/ntpd
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		echo -n "Stopping openntpd: "
+		start-stop-daemon -K -x /usr/sbin/ntpd
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
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
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index f0e4f19..0fe6179 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -10,4 +10,13 @@ OPENNTPD_CONF_OPT = --with-builtin-arc4random --disable-strip
 OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
 OPENNTPD_LICENSE_FILES = LICENCE
 
+define OPENNTPD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/openntpd/S49ntp \
+		$(TARGET_DIR)/etc/init.d/S49ntp
+endef
+
+define OPENNTPD_USERS
+_ntp -1 _ntp -1 * - - - Network Time Protocol daemon
+endef
+
 $(eval $(autotools-package))
-- 
1.8.5.5
