From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Oct 2012 15:47:55 +0200
Subject: [Buildroot] [git commit] netatalk: bump version
Message-ID: <20121008140651.760C9997D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd4bce0ba65a37633145a07427de61a569a99399
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Netatalk goes to version 3.0.
The startup script has changed too, there is now only one binary called
netatalk. No more afpd, cnid, ... at startup ! They are executed by netatalk.

All the config is done within /etc/afp.conf, look at :
http://netatalk.sourceforge.net/3.0/htmldocs/upgrade.html
for more info about the upgrade process.

[Peter: added --without-kerberos to disable kerberos detection]
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netatalk/S50netatalk |   32 +++++++++++---------------------
 package/netatalk/netatalk.mk |    5 +++--
 2 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/package/netatalk/S50netatalk b/package/netatalk/S50netatalk
index 94bb161..f109174 100755
--- a/package/netatalk/S50netatalk
+++ b/package/netatalk/S50netatalk
@@ -1,40 +1,30 @@
-#!/bin/sh 
-# 
-# Start netatalk daemon  (aftpd && cnid_metad)
+#!/bin/sh
+#
+# Start netatalk
 #
-
-AFPD_UAMLIST="-U uams_dhx2.so,uams_clrtxt.so"
 
 start() {
-    echo -n "Starting Netatalk services (this will take a while): "
-    echo "Starting afpd"
-    echo -n " afpd"
-    start-stop-daemon -S -q -p /var/run/afpd.pid --exec /usr/sbin/afpd -- $AFPD_UAMLIST -g nobody -c 50
-    echo -n " cnid_metad"
-    start-stop-daemon -S -q -p /var/run/cnid_metad.pid --exec /usr/sbin/cnid_metad -- -l log_note
-    echo "."
+    echo "Starting Netatalk"
+    start-stop-daemon -S -q -p /var/run/netatalk.pid --exec /usr/sbin/netatalk
 }
 
 stop(){
-    echo -n "Stopping Netatalk Daemons:"
-    echo -n " afpd"
-    start-stop-daemon -K -q -p /var/run/afpd.pid
-    echo -n " cnid_metad"
-    start-stop-daemon -K -q -p /var/run/cnid_metad.pid
+    echo "Stopping Netatalk"
+    start-stop-daemon -K -q -p /var/run/netatalk.pid
 }
 
 case "$1" in
     start)
         start
-    ;; 
+    ;;
     stop)
         stop
-    ;; 
+    ;;
     restart)
         start
         stop
-    ;; 
-    *) 
+    ;;
+    *)
         echo $"Usage: $0 {start|stop|restart}"
         exit 1
 esac
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 4b8d66f..c01e360 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -3,8 +3,8 @@
 # netatalk
 #
 #############################################################
-NETATALK_VERSION = 2.2.2
-NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)/
+NETATALK_VERSION = 3.0
+NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 
 NETATALK_DEPENDENCIES = openssl berkeleydb libgcrypt libgpg-error
@@ -16,6 +16,7 @@ NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--with-libgcrypt-dir=$(STAGING_DIR)/usr \
 	--with-shadow \
 	--disable-shell-check \
+	--without-kerberos \
 	--without-pam
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
