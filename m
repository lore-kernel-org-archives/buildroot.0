From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Jan 2015 10:35:21 -0300
Subject: [Buildroot] [PATCH] olsr: bump to version 0.6.8
Message-ID: <1421847321-6463-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:

* Add hash file
* Rename patch to new naming convention
* Revamp/cleanup initscript
* Install sample config to the correct location

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...nfig.patch => 0001-configurable-ldconfig.patch} |  0
 package/olsr/S50olsr                               | 26 ++++++++++++----------
 package/olsr/olsr.hash                             |  2 ++
 package/olsr/olsr.mk                               |  9 ++++----
 4 files changed, 21 insertions(+), 16 deletions(-)
 rename package/olsr/{olsr-configurable-ldconfig.patch => 0001-configurable-ldconfig.patch} (100%)
 create mode 100644 package/olsr/olsr.hash

diff --git a/package/olsr/olsr-configurable-ldconfig.patch b/package/olsr/0001-configurable-ldconfig.patch
similarity index 100%
rename from package/olsr/olsr-configurable-ldconfig.patch
rename to package/olsr/0001-configurable-ldconfig.patch
diff --git a/package/olsr/S50olsr b/package/olsr/S50olsr
index 9f052da..b79aa79 100755
--- a/package/olsr/S50olsr
+++ b/package/olsr/S50olsr
@@ -1,21 +1,23 @@
 #!/bin/sh
-#
-# Starts OLSRD daemon
-#
 
 case "$1" in
   start)
-  	echo "Starting OLSRd daemon: "
-	/usr/sbin/olsrd -d 0
-	;;
+    echo -n "Starting oslrd daemon: "
+    start-stop-daemon -S -q -x /usr/sbin/olsrd -- -d 0 -pidfile /run/olsrd.pid
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+    ;;
   stop)
-  	echo "Stopping OLSRd daemon: "
-	killall olsrd
-	;;
+    echo -n "Stopping olsrd daemon: "
+    start-stop-daemon -K -q -p /run/olsrd.pid
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+    ;;
+  restart)
+    $0 stop
+    $0 start
+    ;;
   *)
-	echo "Usage: $0 {start|stop}"
-	exit 1
+    echo "Usage: $0 {start|stop|restart}"
+    exit 1
 esac
 
 exit $?
-
diff --git a/package/olsr/olsr.hash b/package/olsr/olsr.hash
new file mode 100644
index 0000000..5b8abc7
--- /dev/null
+++ b/package/olsr/olsr.hash
@@ -0,0 +1,2 @@
+# From http://www.olsr.org/releases/0.6/SHA256SUM-0.6.8
+sha256	692de2eb144f0be2e1dfc5dc5275b6c61b80af080e8f733e0b26b6a860442d27	olsrd-0.6.8.tar.bz2
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 539386d..7e28b1e 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OLSR_VERSION_MAJOR = 0.6
-OLSR_VERSION = $(OLSR_VERSION_MAJOR).6.2
+OLSR_VERSION = $(OLSR_VERSION_MAJOR).8
 OLSR_SOURCE = olsrd-$(OLSR_VERSION).tar.bz2
 OLSR_SITE = http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
 OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
@@ -31,12 +31,13 @@ define OLSR_INSTALL_TARGET_CMDS
 			LDCONFIG=/bin/true DESTDIR=$(TARGET_DIR) \
 			prefix="/usr" install ; \
 	done
-	test -r $(TARGET_DIR)/etc/olsrd.conf || \
-		$(INSTALL) -D -m 0644 $(@D)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf
+	$(INSTALL) -D -m 0644 $(@D)/files/olsrd.conf.default.lq \
+		$(TARGET_DIR)/etc/olsrd/olsrd.conf
 endef
 
 define OLSR_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/olsr/S50olsr $(TARGET_DIR)/etc/init.d/S50olsr
+	$(INSTALL) -D -m 0755 package/olsr/S50olsr \
+		$(TARGET_DIR)/etc/init.d/S50olsr
 endef
 
 $(eval $(generic-package))
-- 
2.0.5
