From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 25 Apr 2012 10:24:50 +0200
Subject: [Buildroot] [PATCH] Add Netatalk
Message-ID: <1335342290-7553-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch add the Netatalk package to Buildroot, it also update the Berkeley
DB package as it was required by Netatalk.  I did not go extensively through
the configure option but they works for me.

Note : I must add that I had a strange problem while building. I have the
openssl-dev package on my machine (Debian testing) and Buildroot did not
built openssl package, later the build of Netatalk complained about my
/usr/include/openssl/ folder (which is obviously, not correct). After moving
this folder to openssl.old (on my machine not the staging dir), Buildroot
built openssl and Netatalk was happy. I don't know what happened there but,
you are informed.

Also, a big thanks to Maxime Ripad for his help and for introducing me to
buildroot :)

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in                |    1 +
 package/berkeleydb/berkeleydb.mk |    3 +-
 package/netatalk/Config.in       |   11 +++
 package/netatalk/S50netatalk     |  152 ++++++++++++++++++++++++++++++++++++++
 package/netatalk/netatalk.mk     |   33 +++++++++
 5 files changed, 198 insertions(+), 2 deletions(-)
 create mode 100644 package/netatalk/Config.in
 create mode 100755 package/netatalk/S50netatalk
 create mode 100644 package/netatalk/netatalk.mk

diff --git a/package/Config.in b/package/Config.in
index 5ae1c81..7c19ed9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -487,6 +487,7 @@ source "package/netcat/Config.in"
 source "package/netkitbase/Config.in"
 source "package/netkittelnet/Config.in"
 endif
+source "package/netatalk/Config.in"
 source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index ed70486..3d57852 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -3,7 +3,7 @@
 # berkeley db
 #
 #############################################################
-BERKELEYDB_VERSION:=4.4.20
+BERKELEYDB_VERSION:=5.3.15
 BERKELEYDB_SITE:=http://download.oracle.com/berkeley-db
 BERKELEYDB_SOURCE:=db-$(BERKELEYDB_VERSION).NC.tar.gz
 BERKELEYDB_SUBDIR=build_unix
@@ -33,7 +33,6 @@ define BERKELEYDB_CONFIGURE_CMDS
 		--with-gnu-ld \
 		--disable-cxx \
 		--disable-java \
-		--disable-rpc \
 		--disable-tcl \
 		--disable-compat185 \
 		$(SHARED_STATIC_LIBS_OPTS) \
diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
new file mode 100644
index 0000000..5adbce9
--- /dev/null
+++ b/package/netatalk/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_NETATALK
+	bool "netatalk"
+    select BR2_PACKAGE_BERKELEYDB
+    select BR2_PACKAGE_OPENSSL
+    select BR2_PACKAGE_LIBGCRYPT
+    select BR2_PACKAGE_LIBGPG_ERROR
+    help
+      Netatalk can be used to turn a *NIX machine into an extremely 
+      high-performance and reliable file server for Macintosh computers.
+
+	  http://netatalk.sourceforge.net/
diff --git a/package/netatalk/S50netatalk b/package/netatalk/S50netatalk
new file mode 100755
index 0000000..c46f58f
--- /dev/null
+++ b/package/netatalk/S50netatalk
@@ -0,0 +1,152 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          netatalk
+# Required-Start:    $remote_fs $syslog
+# Should-Start:      avahi-daemon
+# Required-Stop:     $remote_fs $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      1
+### END INIT INFO
+#
+# netatalk      Netatalk 2.2.2 initscript
+# Author:       Thomas Kaiser <Thomas.Kaiser@phg-online.de>
+
+set -e
+
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+DESC="Netatalk"
+NAME=netatalk
+SCRIPTNAME=/etc/init.d/$NAME
+
+# Guard to prevent execution if netatalk was removed.
+test -x /usr/sbin/afpd || exit 0
+
+# Set defaults. Please change these options in /etc/default/netatalk
+ATALK_NAME=`/bin/hostname`
+ATALK_UNIX_CHARSET='LOCALE'
+ATALK_MAC_CHARSET='MAC_ROMAN'
+
+CNID_METAD_RUN=yes
+AFPD_RUN=yes
+AFPD_MAX_CLIENTS=50
+AFPD_UAMLIST="-U uams_dhx2.so,uams_clrtxt.so"
+AFPD_GUEST=nobody
+CNID_CONFIG="-l log_note"
+
+ATALKD_RUN=no
+PAPD_RUN=no
+TIMELORD_RUN=no
+#A2BOOT_RUN=no
+ATALK_ZONE=
+ATALK_BGROUND=no
+
+# old /etc/default/netatalk expected hostname in $HOSTNAME by default
+HOSTNAME=`/bin/hostname`
+
+# Read in netatalk configuration.
+if [ -f /etc/default/netatalk ]; then
+    . /etc/default/netatalk
+fi
+
+# Start Netatalk servers.
+atalk_startup() {
+	if [ x"$ATALKD_RUN" = x"yes" ]; then
+
+	# Try to load the AppleTalk kernel module if it was intended.
+    if grep -q '^appletalk$' /etc/modules; then
+		/sbin/modprobe appletalk || echo "[could not load appletalk module]"
+    fi
+
+	# Start atalkd server.
+	/usr/sbin/atalkd
+
+	# register workstation
+	/usr/bin/nbprgstr -p 4 "$ATALK_NAME:Workstation$ATALK_ZONE"
+	/usr/bin/nbprgstr -p 4 "$ATALK_NAME:netatalk$ATALK_ZONE"
+
+	echo -n " atalkd"
+	fi
+	
+	# prepare startup of file services
+	if [ "x$CNID_METAD_RUN" = "xyes" -a -x /usr/sbin/cnid_metad ] ; then
+		echo -n " cnid_metad"
+        /usr/sbin/cnid_metad $CNID_CONFIG
+    fi
+	
+	if [ x"$AFPD_RUN" = x"yes" ]; then
+	/usr/sbin/afpd $AFPD_UAMLIST -g $AFPD_GUEST -c $AFPD_MAX_CLIENTS \
+		-n "$ATALK_NAME$ATALK_ZONE"
+	echo -n " afpd"
+	fi
+
+    if [ "x$ATALKD_RUN" = "xyes" ]; then
+        if [ "x$PAPD_RUN" = "xyes" ]; then
+            /usr/sbin/papd
+            echo -n " papd"
+        fi
+
+        if [ x"$TIMELORD_RUN" = x"yes" ]; then
+            /usr/sbin/timelord
+            echo -n " timelord"
+        fi
+    fi
+}
+
+case "$1" in
+	start)
+		if [ "x$ATALK_BGROUND" = "xyes" -a "x$ATALKD_RUN" = "xyes" ]; then
+			echo "Starting Netatalk services in the background."
+			atalk_startup >/dev/null &
+		else
+			echo -n "Starting Netatalk services (this will take a while): "
+			atalk_startup
+			echo "."
+		fi
+	;;
+
+	stop)
+		echo -n "Stopping Netatalk Daemons:"
+		echo -n " afpd"
+		start-stop-daemon --stop --quiet --oknodo --exec /usr/sbin/afpd
+
+		echo -n " cnid_metad"
+		start-stop-daemon --stop --quiet --oknodo --exec /usr/sbin/cnid_metad
+	
+		if test -x /usr/sbin/papd; then
+                    echo -n " papd"
+		    start-stop-daemon --stop --quiet --oknodo --exec /usr/sbin/papd
+	        fi
+	
+		if test -x /usr/sbin/timelord; then
+                    echo -n " timelord"
+		    start-stop-daemon --stop --quiet --oknodo --exec /usr/sbin/timelord
+	        fi
+
+		if test -x /usr/sbin/atalkd; then
+                    echo -n " atalkd"
+		    start-stop-daemon --stop --quiet --oknodo --exec /usr/sbin/atalkd
+	        fi
+	
+		echo "."
+	;;
+	
+	restart)
+		$0 force-reload
+	;;
+
+	force-reload)
+		echo -n "Restarting Netatalk Daemons (this will take a while)"
+		$0 stop
+		echo -n "."
+		sleep 2
+		echo -n "."
+		if $0 start; then
+			echo "done."
+		fi
+	;;
+  
+	*)
+		echo "Usage: $0 {start|stop|restart|force-reload}" >&2
+		exit 1
+	;;
+esac
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
new file mode 100644
index 0000000..f370136
--- /dev/null
+++ b/package/netatalk/netatalk.mk
@@ -0,0 +1,33 @@
+#############################################################
+#
+# netatalk
+#
+#############################################################
+NETATALK_VERSION = 2.2.2
+NETATALK_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/netatalk/netatalk/$(NETATALK_VERSION)/
+NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
+NETATALK_CFLAGS += -DNO_DEBUG
+
+NETALATK_DEPENDENCIES = openssl berkeleydb libgcrypt libgpg-error
+NETATALK_CONF_OPT += --sysconfdir=/etc \
+	--with-cnid-cdb-backend \
+	--disable-cups \
+	--with-bdb=${STAGING_DIR}/usr \
+	--disable-cups \
+	--disable-zeroconf \
+	--with-ssl-dir=$(STAGING_DIR)/usr \
+	--with-libgcrypt-dir=$(STAGING_DIR)/usr \
+	--with-shadow \
+	--disable-shell-check \
+	--without-pam \
+	--prefix=$(STAGING_DIR)
+
+define NETATALK_INSTALL_EXTRA_FILES
+	[ -f $(TARGET_DIR)/etc/init.d/S50netatalk ] || \
+		$(INSTALL) -m 0755 -D package/netatalk/S50netatalk \
+			$(TARGET_DIR)/etc/init.d/S50netatalk
+endef
+
+NETATALK_POST_INSTALL_TARGET_HOOKS += NETATALK_INSTALL_EXTRA_FILES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.10
