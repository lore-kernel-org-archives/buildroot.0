From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Nov 2013 08:29:22 -0300
Subject: [Buildroot] [PATCH] haveged: new package
Message-ID: <1384860562-7407-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in          |  1 +
 package/haveged/Config.in  |  9 +++++++++
 package/haveged/S21haveged | 25 +++++++++++++++++++++++++
 package/haveged/haveged.mk | 17 +++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 package/haveged/Config.in
 create mode 100755 package/haveged/S21haveged
 create mode 100644 package/haveged/haveged.mk

diff --git a/package/Config.in b/package/Config.in
index e7b29b0..de4e966 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -751,6 +751,7 @@ source "package/bc/Config.in"
 source "package/collectd/Config.in"
 source "package/empty/Config.in"
 source "package/googlefontdirectory/Config.in"
+source "package/haveged/Config.in"
 source "package/mcrypt/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
diff --git a/package/haveged/Config.in b/package/haveged/Config.in
new file mode 100644
index 0000000..0e49a2d
--- /dev/null
+++ b/package/haveged/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HAVEGED
+	bool "haveged"
+	depends on BR2_USE_MMU # fork()
+	help
+	  The haveged project is an attempt to provide an easy-to-use,
+	  unpredictable random number generator based upon an adaptation
+	  of the HAVEGE algorithm.
+
+	  http://www.issihosts.com/haveged/
diff --git a/package/haveged/S21haveged b/package/haveged/S21haveged
new file mode 100755
index 0000000..f17cd29
--- /dev/null
+++ b/package/haveged/S21haveged
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+[ -x /usr/sbin/haveged ] || exit 0
+
+case "$1" in
+	start)
+		echo -n "Starting haveged: "
+		start-stop-daemon -S -x /usr/sbin/haveged -- -w 1024 -r 0
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		echo -n "Stopping haveged: "
+		start-stop-daemon -K -x /usr/sbin/haveged
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		;;
+	restart|reload)
+		$0 stop
+		$0 start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit 0
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
new file mode 100644
index 0000000..c634c54
--- /dev/null
+++ b/package/haveged/haveged.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# haveged
+#
+#############################################################
+
+HAVEGED_VERSION = 1.7c
+HAVEGED_SITE = http://www.issihosts.com/haveged
+HAVEGED_LICENSE = GPLv3+
+HAVEGED_LICENSE_FILES = COPYING
+
+define HAVEGED_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/haveged/S21haveged \
+		$(TARGET_DIR)/etc/init.d/S21haveged
+endef
+
+$(eval $(autotools-package))
-- 
1.8.3.2
