From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Sun, 19 Sep 2010 10:23:24 +0200
Subject: [Buildroot] [PATCH] introducing transmission bittorrent client
Message-ID: <1284884604-2433-1-git-send-email-marcus.osdoba@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the client has an excellent webinterface
and seems to be ideal for headless systems,
the statedirectory is stored in /var/transmission which links to tmp,
the user should provide a writable config direcory

Based on work by: Kelvin Cheung <keguang.zhang@gmail.com>

Signed-off-by: Marcus Osdoba <marcus.osdoba@googlemail.com>
---
 package/Config.in                    |    1 +
 package/transmission/Config.in       |   21 ++++++++
 package/transmission/S92transmission |   88 ++++++++++++++++++++++++++++++++++
 package/transmission/transmission.mk |   49 +++++++++++++++++++
 4 files changed, 159 insertions(+), 0 deletions(-)
 create mode 100644 package/transmission/Config.in
 create mode 100644 package/transmission/S92transmission
 create mode 100644 package/transmission/transmission.mk

diff --git a/package/Config.in b/package/Config.in
index 2209b55..9a63828 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -420,6 +420,7 @@ source "package/thttpd/Config.in"
 source "package/tinyhttpd/Config.in"
 endif
 source "package/tn5250/Config.in"
+source "package/transmission/Config.in"
 source "package/ttcp/Config.in"
 source "package/udpcast/Config.in"
 source "package/vpnc/Config.in"
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
new file mode 100644
index 0000000..f634f8b
--- /dev/null
+++ b/package/transmission/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_TRANSMISSION
+	bool "transmission"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBEVENT
+	help
+	  Transmission is a cross-platform BitTorrent client.
+
+config BR2_PACKAGE_TRANSMISSION_CLI
+	bool "transmissioncli"
+	depends on BR2_PACKAGE_TRANSMISSION
+	help
+	  Install transmission command line interface.
+
+config BR2_PACKAGE_TRANSMISSION_REMOTE
+	bool "transmission-remote"
+	depends on BR2_PACKAGE_TRANSMISSION
+	default y
+	help
+	  Install transmission remote management tool.
diff --git a/package/transmission/S92transmission b/package/transmission/S92transmission
new file mode 100644
index 0000000..9c15aae
--- /dev/null
+++ b/package/transmission/S92transmission
@@ -0,0 +1,88 @@
+#!/bin/sh
+if [ ! -z "$2" ]; then
+	TRANSMISSION_ARGS="$2"
+else
+	TRANSMISSION_ARGS=""
+fi
+
+if [ ! -z "$3" ]; then
+	NET_INTERFACE="$3"
+else
+	NET_INTERFACE=""
+fi
+
+DESC="bittorrent client"
+NAME=transmission-daemon
+DAEMON=$(which $NAME)
+SCRIPTNAME=/etc/init.d/$0
+
+[ -x "$DAEMON" ] || exit 0
+
+do_start()
+{
+	if [ ! -z "$NET_INTERFACE" ]; then
+		# poll network interface
+		IFCONFIG_OUTPUT=`ifconfig $NET_INTERFACE`
+		IP_ADDR=`expr match "$IFCONFIG_OUTPUT" '.*inet addr:\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*'`
+		while [ -z "$IP_ADDR" ]
+		do
+			sleep 5
+			IFCONFIG_OUTPUT=`ifconfig $NET_INTERFACE`
+			IP_ADDR=`expr match "$IFCONFIG_OUTPUT" '.*inet addr:\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*'`
+		done
+	fi
+	if [ -z "$TRANSMISSION_ARGS" ]; then
+		start-stop-daemon -S -b -x ${DAEMON}
+	else
+		start-stop-daemon -S -b -x ${DAEMON} -- ${TRANSMISSION_ARGS}
+	fi
+	return $?
+}
+
+do_stop()
+{
+	start-stop-daemon -K -b -x ${DAEMON}
+	return $?
+}
+
+case "$1" in
+	start)
+		echo "Starting $DESC" "$NAME..."
+		do_start
+		case "$?" in
+			0) echo "   Start $DESC $NAME: SUCCESS" ;;
+			*)
+				echo "   Start $DESC $NAME: FAILED"
+				exit 3
+				;;
+		esac
+		;;
+	stop)
+		echo "Stopping $DESC $NAME..."
+		do_stop
+		case "$?" in
+			0) echo "   Stop $DESC $NAME: SUCCESS" ;;
+			*)
+				echo "   Stop $DESC $NAME: FAILED"
+				exit 3
+				;;
+		esac
+		;;
+	restart|force-reload)
+		echo "Restarting $DESC $NAME..."
+		do_stop
+		sleep 2
+		do_start
+		case "$?" in
+			0) echo "   Restart $DESC $NAME: SUCCESS" ;;
+			*)
+				echo "   Restart $DESC $NAME: FAILED: couldn't start $NAME"
+				exit 3
+				;;
+		esac
+		;;
+	*)
+		echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+		exit 3
+		;;
+esac
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
new file mode 100644
index 0000000..b571c7d
--- /dev/null
+++ b/package/transmission/transmission.mk
@@ -0,0 +1,49 @@
+#############################################################
+#
+# transmission
+#
+#############################################################
+TRANSMISSION_VERSION=2.04
+TRANSMISSION_SOURCE=transmission-$(TRANSMISSION_VERSION).tar.bz2
+TRANSMISSION_SITE=http://mirrors.m0k.org/transmission/files/
+TRANSMISSION_LIBTOOL_PATCH=NO
+TRANSMISSION_DEPENDENCIES= host-pkg-config host-intltool zlib openssl libcurl libevent
+
+TRANSMISSION_CONF_OPT = --disable-gtk \
+			--disable-libnotify \
+			--enable-daemon \
+			--localstatedir=/var/transmission-statedir \
+			--with-zlib=$(STAGING_DIR) \
+
+ifneq ($(BR2_PACKAGE_TRANSMISSION_CLI),y)
+TRANSMISSION_CONF_OPT += --disable-cli
+else
+TRANSMISSION_CONF_OPT += --enable-cli
+endif
+
+
+ifneq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
+TRANSMISSION_CONF_OPT += --disable-remote
+endif
+ifeq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
+define TRANSMISSION_INITDSKRIPT_INSTALL
+	# install start/stop script
+	$(call MESSAGE,"Installing S92transmission init script")
+	if [ ! -f $(TARGET_DIR)/etc/init.d/S92transmission ]; then \
+		$(INSTALL) -m 0755 -D package/transmission/S92transmission \
+		$(TARGET_DIR)/etc/init.d/S92transmission; \
+	fi
+	$(Q)touch $@
+endef
+TRANSMISSION_POST_INSTALL_TARGET_HOOKS += TRANSMISSION_INITDSKRIPT_INSTALL
+endif
+
+
+define TRANSMISSION_STATEDIRLINK_INSTALL
+	$(call MESSAGE,"Creating link for transmission statedirectory")
+	ln -sf /tmp $(TARGET_DIR)/var/transmission-statedir
+endef
+TRANSMISSION_POST_INSTALL_TARGET_HOOKS += TRANSMISSION_STATEDIRLINK_INSTALL
+
+
+$(eval $(call AUTOTARGETS,package,transmission))
-- 
1.7.1
