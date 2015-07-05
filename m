From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Jul 2015 17:12:51 +0200
Subject: [Buildroot] [PATCH] inadyn: fix init script and default config file
Message-ID: <1436109171-30701-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit does a number of fixes to the inadyn package to make it
work properly "out of the box":

 * inadyn is installed in /usr/sbin, not /usr/bin, so we fix the path
   in the init script

 * Use "echo -n" for the Starting and Stopping messages, so that the
   OK / FAIL stay on the same line.

 * There is no need to pass the inadyn binary path during the stop
   sequence, as long as we pass the appropriate -p option with the
   path to the PID file created by inadyn, so we do this.

 * Pass the -q option to the start sequence, since it's passed in the
   stop sequence.

 * Fix the configuration file to use an existing dyndns_system and
   avoid a failure at startup.

Cc: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/inadyn/S70inadyn   | 10 +++++-----
 package/inadyn/inadyn.conf |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/inadyn/S70inadyn b/package/inadyn/S70inadyn
index b20048c..b2aaa0a 100644
--- a/package/inadyn/S70inadyn
+++ b/package/inadyn/S70inadyn
@@ -14,15 +14,15 @@ VR_INADYN=/var/run/inadyn
 
 case "$1" in
 	start)
-		echo "Starting inadyn: "
-		start-stop-daemon -S -x /usr/bin/inadyn
+		echo -n "Starting inadyn: "
+		start-stop-daemon -q -S -p ${VR_INADYN}/inadyn.pid -x /usr/sbin/inadyn
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
-		echo  "Stopping inadyn: "
-		start-stop-daemon -q -K -x /usr/bin/inadyn
+		echo -n "Stopping inadyn: "
+		start-stop-daemon -q -K -p ${VR_INADYN}/inadyn.pid
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		rm -f /var/run/inadyn/inadyn.pid
+		rm -f ${VR_INADYN}/inadyn.pid
 		;;
 	restart)
 		"$0" stop
diff --git a/package/inadyn/inadyn.conf b/package/inadyn/inadyn.conf
index b5877f7..93ad0b5 100644
--- a/package/inadyn/inadyn.conf
+++ b/package/inadyn/inadyn.conf
@@ -5,7 +5,7 @@ background
 update_period_sec 600 # Check for a new IP every 600 seconds
 username test		# replace 'test' with your username
 password test		# replace 'test' with your password
-dyndns_system dyndns at dyndns.org   # replace w/ your provider
+dyndns_system default at dyndns.org   # replace w/ your provider
 
 #  uncomment the alias statement below to test it on your system
 alias test.homeip.net
-- 
2.4.5
