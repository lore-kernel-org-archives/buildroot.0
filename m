From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 3 Feb 2019 20:35:26 +0100
Subject: [Buildroot] [git commit] package/ntp: sntp time sync script
Message-ID: <20190203194355.281CF81965@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e08d929474a4ec84432f4829e113f524a103e3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the installation of a startup script if the sntp
utility is selected as an option. The utility is design to do a
one time step/slew adjustment of the system time (similar to the
ntpdate tool http://support.ntp.org/bin/view/Dev/DeprecatingNtpdate).
One nice benefit over ntpdate is that sntp can run while ntpd is still
running. However, ntpd may still need to be restarted if the time
step was large enough.

The script provides the ability to override the arguments as part of a
/etc/defaults/sntp file.

On a local LAN, the initial large step adjustment took less then
one second to be retrieved and system time updated. If a user already
has a RTC maintaining the time and the system was powered off for
a long period of time, the script assumes a slew adjustment when
+/- 128ms, rather then a time step(jump). This could be further
tuned by a user with the /etc/defaults/sntp configuration file.

One NTP pool server is being set as sntp uses all of the servers
provided when the DNS is resolved as servers to attempt to retrieve
time from before timing out. It looks like currently that is 4 servers
per *pool.ntp.org hostname.

Cc: Oscar Gomez Fuente <oscargomezf@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Tested-by: Oscar Gomez Fuente <oscargomezf@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ntp/Config.in |  7 ++++++-
 package/ntp/S48sntp   | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++
 package/ntp/S49ntp    |  0
 package/ntp/ntp.mk    |  9 +++++++++
 4 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index efd47e1895..97d933b5a8 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -12,7 +12,12 @@ if BR2_PACKAGE_NTP
 config BR2_PACKAGE_NTP_SNTP
 	bool "sntp"
 	help
-	  Simple network time protocol program
+	  Simple network time protocol program (a replacement
+	  for the ntpdate tool)
+
+	  A script is installed as S48sntp which will retrieve and
+	  step the time if there is a large difference before ntpd
+	  takes over the necessary slew adjustments in S49ntp.
 
 config BR2_PACKAGE_NTP_NTP_KEYGEN
 	bool "ntp-keygen"
diff --git a/package/ntp/S48sntp b/package/ntp/S48sntp
new file mode 100644
index 0000000000..96d8d507aa
--- /dev/null
+++ b/package/ntp/S48sntp
@@ -0,0 +1,55 @@
+#!/bin/sh
+
+DAEMON="sntp"
+# sntp uses all the IPs resolved for the hostname (i.e. pool.ntp.org has 4).
+# It will try each until they either all timeout or time has been set. Thus
+# default to only providing one NTP pool host.
+SNTP_SERVERS="pool.ntp.org"
+# Step if time delta is greater then 128ms, otherwise slew
+SNTP_ARGS="-Ss -M 128"
+SNTP_KEY_CACHE="/tmp/kod"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# Create key cache file to prevents warning that file is missing
+	touch $SNTP_KEY_CACHE
+	# shellcheck disable=SC2086 # we need the word splitting
+	/usr/bin/$DAEMON $SNTP_ARGS -K $SNTP_KEY_CACHE $SNTP_SERVERS
+	# sntp behavior
+	# - Does not background
+	# - Does not infinitely block
+	# - Time-out w/o network = ~2 sec
+	# - Time-out w/ network = ~5sec * # of servers
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	echo "Nothing to do, $DAEMON is not a daemon."
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+reload() {
+	echo "Nothing to do, $DAEMON does not support reload."
+}
+
+case "$1" in
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
old mode 100755
new mode 100644
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index af3c1aad9f..aad1cdd661 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -93,9 +93,18 @@ define NTP_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 644 package/ntp/ntpd.etc.conf $(TARGET_DIR)/etc/ntp.conf
 endef
 
+# This script will step the time if there is a large difference
+# before ntpd takes over the necessary slew adjustments
+ifeq ($(BR2_PACKAGE_NTP_SNTP),y)
+define NTP_INSTALL_INIT_SYSV_SNTP
+	$(INSTALL) -D -m 755 package/ntp/S48sntp $(TARGET_DIR)/etc/init.d/S48sntp
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_NTP_NTPD),y)
 define NTP_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/S49ntp
+	$(NTP_INSTALL_INIT_SYSV_SNTP)
 endef
 
 define NTP_INSTALL_INIT_SYSTEMD
