From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Oct 2018 23:00:25 -0500
Subject: [Buildroot] [PATCH v2] package/ntp: use ntpd to set initial time
Message-ID: <1540353625-36573-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ntpdate program has been in the process of being deprecated for
some time. (http://support.ntp.org/bin/view/Dev/DeprecatingNtpdate)

This patch updates the existing ntpd script to handle setting initial
time using the new ntpd "one time set and exit" approach.
http://lists.ntp.org/pipermail/questions/2011-July/030041.html

The patch does not use the ntpd -w "wait for first time" option and
instead makes sure the attempt at a one-shot setting of initial time
has completed before starting the main ntpd service.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Oscar Gomez Fuente <oscargomezf@gmail.com>
---
Changes
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
 package/ntp/Config.in |  5 +++++
 package/ntp/S49ntp    | 21 ++++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index efd47e1..5cc78ce 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -54,6 +54,11 @@ config BR2_PACKAGE_NTP_NTPDATE
 	  The ntpdate utility program is used to set the local date
 	  and time from an NTP server given as an argument.
 
+	  This option is deprecated by upstream and replaced with the
+	  -gq options of ntpd. The package/ntp/S49ntp script has an
+	  example implementation.
+	  (http://support.ntp.org/bin/view/Dev/DeprecatingNtpdate)
+
 config BR2_PACKAGE_NTP_NTPDC
 	bool "ntpdc"
 	help
diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
index 35e5874..2675789 100755
--- a/package/ntp/S49ntp
+++ b/package/ntp/S49ntp
@@ -2,6 +2,7 @@
 
 NAME=ntpd
 
+NTP_WAIT_DELAY=15 #sec
 # Read config file if it is present.
 if [ -r /etc/default/$NAME ]
 then
@@ -10,8 +11,26 @@ fi
 
 case "$1" in
   start)
+    CURRENT_UNIX_TIME="$(date +%s)"
+    if [ $CURRENT_UNIX_TIME -lt 1000000000 ]; then
+        printf "Checking for time"
+        # stderr redirected to hide output if IPv6 not enabled
+        /usr/sbin/ntpd -g -q > /dev/null 2>&1 &
+        NTP_PID=$!
+        while [ ${NTP_WAIT_DELAY} -gt 0 ]; do
+            [ ! -e /proc/$NTP_PID ] && break
+            sleep 1
+            printf "."
+            : $((NTP_WAIT_DELAY -= 1))
+        done
+        # ntpd never returns if it can't access the NTP server(s)
+        # noted in /etc/ntp.conf.
+        kill $NTP_PID > /dev/null 2>&1
+        [ $? = 0 ] && printf "(Not set)"
+    fi
+    echo " OK"
     printf "Starting $NAME: "
-    start-stop-daemon -S -q -x /usr/sbin/ntpd -- -g
+    start-stop-daemon -S -q -x /usr/sbin/ntpd --
     [ $? = 0 ] && echo "OK" || echo "FAIL"
     ;;
   stop)
-- 
1.9.1
