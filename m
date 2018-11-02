From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu,  1 Nov 2018 21:52:34 -0500
Subject: [Buildroot] [PATCH v4] package/ntp: sntp time sync script
Message-ID: <1541127154-45957-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---

Major design/observations
(v2) Originally an attempt was made to use the ntpd in one shot mode
but it required more complex logic to handle the cases of a timeout
where the app had to be killed before the actual ntpd was started.
Similarly bad server addreses or network connection being down had
to be handled with the timeout case as the app in one shot mode
wouldn't exit.
http://lists.ntp.org/pipermail/questions/2011-July/030041.html

(post v2) An attempt was made to use the wait -w feature of ntpd but it
seems that approach requires a longer period of stability.  I believe
the -w actually means to wait for good stable time vs time being set
with the possibility of slewing required. So apps could pend on
ntp-wait to get good time before proceeding.  This doesn't work for
a quick initial time set.

(v3+) So the approach in this series uses ntpd to cleanup the time after
a quick initial set.  Plus using the feature of the sntp to manage
do we time jump or do some minor slewing.

Changes
v3 -> v4
 - Updated S48sntp script to just use a single pool host which provides
   4 NTP servers sntp will query before timing out

v2 -> v3
 - Moved initial time set to a S48sntp script as originally suggested
   by Oscar and preferred by Arnout
 - Switched to sntp tool as it simplified the logic around when and
   how do we call the tool to perform this time sync (it handles
   when to slew/step and multiple servers at once)

v1 -> v2
[Arnout
 - Moved NTP_WAIT_DELAY above sourcing of configuration file
 - Switched to using unix time for current time check
 - Added comment on why redirection of stdout and stderr
 - Attempted to use the pid file but found it added more calls
   to the shell then using a variable, so switched back
 - Adjusted printout so the actual ntpd service start was aligned
   with the respecting Ok/Fail.
 - Dropped -g from the main service call as the "big" time jump
   should have already occurred with the one-shot ntpd -gq.

v1
Based on Oscar's v1 patch to add a ntpdate startup script.
http://patchwork.ozlabs.org/patch/986852/
---
 package/ntp/S48sntp | 42 ++++++++++++++++++++++++++++++++++++++++++
 package/ntp/ntp.mk  |  9 +++++++++
 2 files changed, 51 insertions(+)
 create mode 100755 package/ntp/S48sntp

diff --git a/package/ntp/S48sntp b/package/ntp/S48sntp
new file mode 100755
index 0000000..cc0948e
--- /dev/null
+++ b/package/ntp/S48sntp
@@ -0,0 +1,42 @@
+#! /bin/sh
+
+NAME=sntp
+# sntp uses all the IPs resolved for the hostname (i.e. pool.ntp.org has 4).
+# It will try each until they either all timeout or time has been set. Thus
+# default to only providing one NTP pool host.
+SNTP_SERVERS="pool.ntp.org"
+# Step if time delta is greater then 128ms, otherwise slew
+SNTP_ARGS="-Ss -M 128"
+SNTP_KEY_CACHE="/tmp/kod"
+
+# Read config file if it is present.
+if [ -r /etc/default/$NAME ]
+then
+	. /etc/default/$NAME
+fi
+
+# Create key cache file to prevents warning that file is missing
+touch $SNTP_KEY_CACHE
+
+case "$1" in
+	start)
+		echo "Starting $NAME: "
+		$NAME $SNTP_ARGS -K $SNTP_KEY_CACHE $SNTP_SERVERS
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		echo "Stopping $NAME: OK"
+		;;
+	restart|reload)
+		echo "Restarting $NAME: "
+		$0 stop
+		sleep 1
+		$0 start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}" >&2
+		exit 1
+		;;
+esac
+
+exit 0
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index af3c1aa..aad1cdd 100644
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
-- 
1.9.1
