From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Oct 2018 08:10:18 -0500
Subject: [Buildroot] [PATCH] package/ntp: use ntpd to set initial time
Message-ID: <1540300218-59209-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ntpdate program has been in the process of being deprecated for
some time. (http://support.ntp.org/bin/view/Dev/DeprecatingNtpdate)

This patch updates the existing ntpd script to handle setting initial
time using the new ntpd "one time set and exit" approach.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Oscar Gomez Fuente <oscargomezf@gmail.com>
---
Based on Oscar's v1 patch to add a ntpdate startup script.
http://patchwork.ozlabs.org/patch/986852/
---
 package/ntp/Config.in |  5 +++++
 package/ntp/S49ntp    | 17 +++++++++++++++++
 2 files changed, 22 insertions(+)

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
index 35e5874..9851747 100755
--- a/package/ntp/S49ntp
+++ b/package/ntp/S49ntp
@@ -11,6 +11,23 @@ fi
 case "$1" in
   start)
     printf "Starting $NAME: "
+    NTP_WAIT_DELAY=15 #sec
+    CURRENT_DATE=$(date | grep "1970")
+    if [ "$CURRENT_DATE" != "" ]; then
+        printf "checking for time"
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
+        [ $? = 0 ] && printf "(Not set): "
+    fi
     start-stop-daemon -S -q -x /usr/sbin/ntpd -- -g
     [ $? = 0 ] && echo "OK" || echo "FAIL"
     ;;
-- 
1.9.1
