From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 11:32:18 +0200
Subject: [Buildroot] [git commit] package/modem-manager: init script for
	systemV-like init systems
Message-ID: <20150702093241.D2266818CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f1def693647b2158aab38d86a11609454e72dab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ModemManager get started by NetworkManager, in case of systemd init
system. In case of other systems it needs to be started by init script.

Debian [1] solved it by detection in code. For Buildroot it's IMHO
enough to install init script for systemV-like init systems.

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=770871

[Thomas:
 - slightly simplify the script by removing the MODEMMANAGER_BIN
   variable which was used at only one place, and use directly $?
   instead of an intermediate $ret variable.
 - split the too long line added in the .mk file.]

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/modem-manager/S44modem-manager |   42 ++++++++++++++++++++++++++++++++
 package/modem-manager/modem-manager.mk |    5 ++++
 2 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/modem-manager/S44modem-manager b/package/modem-manager/S44modem-manager
new file mode 100755
index 0000000..10e58e7
--- /dev/null
+++ b/package/modem-manager/S44modem-manager
@@ -0,0 +1,42 @@
+#!/bin/sh
+#
+# Starts ModemManager
+#
+
+PIDFILE=/var/run/ModemManager.pid
+
+[ -x $MODEMMANAGER_BIN ] || exit 0
+
+start() {
+	echo -n "Starting ModemManager: "
+	umask 077
+	start-stop-daemon -S -q -b -m -p $PIDFILE \
+		--exec /usr/sbin/ModemManager
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	echo -n "Stopping ModemManager: "
+	start-stop-daemon -K -q -p $PIDFILE
+	[ $? = 0 ] && { echo "OK"; rm -f $PIDFILE; } || echo "FAIL"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart|reload)
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit $ret
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 9cd630c..97dddfe 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -26,4 +26,9 @@ else
 MODEM_MANAGER_CONF_OPTS += --without-mbim
 endif
 
+define MODEM_MANAGER_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/modem-manager/S44modem-manager \
+		$(TARGET_DIR)/etc/init.d/S44modem-manager
+endef
+
 $(eval $(autotools-package))
