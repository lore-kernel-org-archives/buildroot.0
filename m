From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Nov 2011 18:14:25 +0100
Subject: [Buildroot] [git commit] Add Transmission package
Message-ID: <20111201085835.8FD5E8F75B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e223241e1bb58a27eb890291f9f5c1fcc6a0818
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Initial work by marcus.osdoba at googlemail.com

[Peter: add -daemon option, tweak Config.in]
Signed-off-by: Maxime Ripard <maxime@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                    |    1 +
 package/transmission/Config.in       |   39 ++++++++
 package/transmission/S92transmission |  161 ++++++++++++++++++++++++++++++++++
 package/transmission/transmission.mk |   52 +++++++++++
 4 files changed, 253 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4b5e5d8..cc26f20 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -475,6 +475,7 @@ source "package/thttpd/Config.in"
 source "package/tinyhttpd/Config.in"
 endif
 source "package/tn5250/Config.in"
+source "package/transmission/Config.in"
 source "package/ttcp/Config.in"
 source "package/udpcast/Config.in"
 source "package/vpnc/Config.in"
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
new file mode 100644
index 0000000..5284446
--- /dev/null
+++ b/package/transmission/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_TRANSMISSION
+	bool "transmission"
+	depends on BR2_INET_IPV6
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBEVENT
+	help
+	  Transmission is a cross-platform BitTorrent client.
+
+if BR2_PACKAGE_TRANSMISSION
+
+config BR2_PACKAGE_TRANSMISSION_UTP
+	bool "Transmission uTP support"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Install support for uTorrent Transport Protocol
+
+comment "uTP requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_TRANSMISSION_CLI
+	bool "transmission-cli"
+	help
+	  Install transmission command line interface.
+
+config BR2_PACKAGE_TRANSMISSION_DAEMON
+	bool "transmission-daemon"
+	help
+	  Install transmission daemon.
+
+config BR2_PACKAGE_TRANSMISSION_REMOTE
+	bool "transmission-remote"
+	help
+	  Install transmission remote management tool.
+endif
+
+comment "Transmission requires a toolchain with IPv6 support"
+	depends on !BR2_INET_IPV6
diff --git a/package/transmission/S92transmission b/package/transmission/S92transmission
new file mode 100644
index 0000000..f226154
--- /dev/null
+++ b/package/transmission/S92transmission
@@ -0,0 +1,161 @@
+#!/bin/sh
+
+# Original Author: Lennart A. Jtte, based on Rob Howell's script
+# Modified by Maarten Van Coile & others (on IRC)
+
+# Changes for buildroot:
+# USERNAME points to 'default' in standard installation
+# TODO: set logfile with --logfile option
+
+# Do NOT "set -e"
+
+#
+# ----- CONFIGURATION -----
+#
+# For the default location Transmission uses, visit:
+# http://trac.transmissionbt.com/wiki/ConfigFiles
+# For a guide on how set the preferences, visit:
+# http://trac.transmissionbt.com/wiki/EditConfigFiles
+# For the available environement variables, visit:
+# http://trac.transmissionbt.com/wiki/EnvironmentVariables
+#
+# The name of the user that should run Transmission.
+# It's RECOMENDED to run Transmission in it's own user,
+# by default, this is set to 'transmission'.
+# For the sake of security you shouldn't set a password
+# on this user
+#USERNAME=transmission
+USERNAME=default
+
+
+
+# ----- *ADVANCED* CONFIGURATION -----
+# Only change these options if you know what you are doing!
+#
+# The folder where Transmission stores the config & web files.
+# ONLY change this you have it at a non-default location
+#TRANSMISSION_HOME="/var/config/transmission-daemon"
+#TRANSMISSION_WEB_HOME="/usr/share/transmission/web"
+#
+# The arguments passed on to transmission-daemon.
+# ONLY change this you need to, otherwise use the
+# settings file as per above.
+#TRANSMISSION_ARGS=""
+
+
+# ----- END OF CONFIGURATION -----
+#
+# PATH should only include /usr/* if it runs after the mountnfs.sh script.
+PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
+DESC="bittorrent client"
+NAME=transmission-daemon
+DAEMON=$(which $NAME)
+PIDFILE=/var/run/$NAME.pid
+SCRIPTNAME=/etc/init.d/$NAME
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+# Read configuration variable file if it is present
+[ -r /etc/default/$NAME ] && . /etc/default/$NAME
+
+# Load the VERBOSE setting and other rcS variables
+[ -f /etc/default/rcS ] && . /etc/default/rcS
+
+#
+# Function that starts the daemon/service
+#
+
+do_start()
+{
+    # Export the configuration/web directory, if set
+    if [ -n "$TRANSMISSION_HOME" ]; then
+          export TRANSMISSION_HOME
+    fi
+    if [ -n "$TRANSMISSION_WEB_HOME" ]; then
+          export TRANSMISSION_WEB_HOME
+    fi
+
+    # Return
+    #   0 if daemon has been started
+    #   1 if daemon was already running
+    #   2 if daemon could not be started
+    start-stop-daemon --chuid $USERNAME --start --pidfile $PIDFILE --make-pidfile \
+            --exec $DAEMON --background --test -- -f $TRANSMISSION_ARGS > /dev/null \
+            || return 1
+    start-stop-daemon --chuid $USERNAME --start --pidfile $PIDFILE --make-pidfile \
+            --exec $DAEMON --background -- -f $TRANSMISSION_ARGS \
+            || return 2
+}
+
+#
+# Function that stops the daemon/service
+#
+do_stop()
+{
+        # Return
+        #   0 if daemon has been stopped
+        #   1 if daemon was already stopped
+        #   2 if daemon could not be stopped
+        #   other if a failure occurred
+        start-stop-daemon --stop --quiet --retry=TERM/10/KILL/5 --pidfile $PIDFILE --name $NAME
+        RETVAL="$?"
+        [ "$RETVAL" = 2 ] && return 2
+
+        # Wait for children to finish too if this is a daemon that forks
+        # and if the daemon is only ever run from this initscript.
+        # If the above conditions are not satisfied then add some other code
+        # that waits for the process to drop all resources that could be
+        # needed by services started subsequently.  A last resort is to
+        # sleep for some time.
+
+        start-stop-daemon --stop --quiet --oknodo --retry=0/30/KILL/5 --exec $DAEMON
+        [ "$?" = 2 ] && return 2
+
+        # Many daemons don't delete their pidfiles when they exit.
+        rm -f $PIDFILE
+
+        return "$RETVAL"
+}
+
+case "$1" in
+  start)
+        echo "Starting $DESC" "$NAME..."
+        do_start
+        case "$?" in
+                0|1) echo "   Starting $DESC $NAME succeeded" ;;
+                *)   echo "   Starting $DESC $NAME failed" ;;
+        esac
+        ;;
+  stop)
+        echo "Stopping $DESC $NAME..."
+        do_stop
+        case "$?" in
+                0|1) echo "   Stopping $DESC $NAME succeeded" ;;
+                *)   echo "   Stopping $DESC $NAME failed" ;;
+        esac
+        ;;
+  restart|force-reload)
+        #
+        # If the "reload" option is implemented then remove the
+        # 'force-reload' alias
+        #
+        echo "Restarting $DESC $NAME..."
+        do_stop
+        case "$?" in
+          0|1)
+                do_start
+                case "$?" in
+                    0|1) echo "   Restarting $DESC $NAME succeeded" ;;
+                    *)   echo "   Restarting $DESC $NAME failed: couldn't start $NAME" ;;
+                esac
+                ;;
+          *)
+                echo "   Restarting $DESC $NAME failed: couldn't stop $NAME" ;;
+        esac
+        ;;
+  *)
+        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        exit 3
+        ;;
+esac
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
new file mode 100644
index 0000000..db06692
--- /dev/null
+++ b/package/transmission/transmission.mk
@@ -0,0 +1,52 @@
+#############################################################
+#
+# transmission
+#
+#############################################################
+TRANSMISSION_VERSION = 2.33
+TRANSMISSION_SITE = http://download.transmissionbt.com/files/
+TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.bz2
+TRANSMISSION_DEPENDENCIES = \
+	host-pkg-config \
+	libcurl \
+	libevent \
+	openssl \
+	zlib
+
+TRANSMISSION_CONF_OPT = \
+	--disable-gtk \
+	--disable-libnotify \
+	--enable-lightweight
+
+define TRANSMISSION_INIT_SCRIPT_INSTALL
+	[ -f $(TARGET_DIR)/etc/init.d/S92transmission ] || \
+		$(INSTALL) -m 0755 -D package/transmission/S92transmission \
+			$(TARGET_DIR)/etc/init.d/S92transmission
+endef
+
+ifeq ($(BR2_PACKAGE_TRANSMISSION_UTP),y)
+	TRANSMISSION_CONF_OPT += --enable-utp
+else
+	TRANSMISSION_CONF_OPT += --disable-utp
+endif
+
+ifeq ($(BR2_PACKAGE_TRANSMISSION_CLI),y)
+	TRANSMISSION_CONF_OPT += --enable-cli
+else
+	TRANSMISSION_CONF_OPT += --disable-cli
+endif
+
+ifeq ($(BR2_PACKAGE_TRANSMISSION_DAEMON),y)
+	TRANSMISSION_CONF_OPT += --enable-daemon
+	TRANSMISSION_POST_INSTALL_TARGET_HOOKS += TRANSMISSION_INIT_SCRIPT_INSTALL
+else
+	TRANSMISSION_CONF_OPT += --disable-daemon
+endif
+
+ifeq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
+	TRANSMISSION_CONF_OPT += --enable-remote
+else
+	TRANSMISSION_CONF_OPT += --disable-remote
+endif
+
+$(eval $(call AUTOTARGETS))
