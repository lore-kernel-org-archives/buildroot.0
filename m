From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 15:46:08 +0200
Subject: [Buildroot] [git commit] inadyn: fix init script and default config
	file
Message-ID: <20151018134639.2CB4A81D81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60be5da7c9bb92309627c58e81623da4268d1e07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit does a number of fixes to the inadyn package to make it
work properly "out of the box":

 * inadyn is installed in /usr/sbin, not /usr/bin, so we fix the path
   in the init script

 * Use "printf" for the Starting and Stopping messages, so that the OK
   / FAIL stay on the same line.

 * Pass the -q option to the start sequence, since it's passed in the
   stop sequence.

 * Fix the configuration file to use an existing dyndns_system and
   avoid a failure at startup.

 * Use a variable called ENABLED in /etc/default/inadyn to decide
   whether to start the service or not. By default, it is not started,
   as suggested by Gustavo, and an explicit ENABLED="yes" is needed.

 * Store the PID file in /var/run/inadyn.pid, like we do for all other
   daemons.

[Thomas: drop silly comment about uncommenting the alias line in the
configuration file, which is already uncommented. Noticed by Yann.]

Cc: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/inadyn/S70inadyn   |   24 ++++++++++++++++--------
 package/inadyn/inadyn.conf |    5 ++---
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/package/inadyn/S70inadyn b/package/inadyn/S70inadyn
index b20048c..ca7b414 100644
--- a/package/inadyn/S70inadyn
+++ b/package/inadyn/S70inadyn
@@ -4,25 +4,33 @@
 #
 
 CONFIG=/etc/inadyn.conf
-VR_INADYN=/var/run/inadyn
 
 # check if CONFIG exists, print message & exit if it doesn't
 [ ! -f $CONFIG ] && ( echo "The config file "$CONFIG" is missing...exiting now." && exit 2 )
 
-# check if VR_INADYN exists, create it if not
-[ ! -d $VR_INADYN ] && mkdir -p $VR_INADYN
+# Allow a few customizations from a config file. Especially inadyn
+# must be explicitly enabled by adding ENABLED="yes" in this file.
+test -r /etc/default/inadyn && . /etc/default/inadyn
 
 case "$1" in
 	start)
-		echo "Starting inadyn: "
-		start-stop-daemon -S -x /usr/bin/inadyn
+		printf "Starting inadyn: "
+		if test "${ENABLED}" != "yes" ; then
+		    echo "SKIPPED"
+		    exit 0
+		fi
+		start-stop-daemon -b -q -S -p /var/run/inadyn.pid -x /usr/sbin/inadyn
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
-		echo  "Stopping inadyn: "
-		start-stop-daemon -q -K -x /usr/bin/inadyn
+		printf "Stopping inadyn: "
+		if test "${ENABLED}" != "yes" ; then
+		    echo "SKIPPED"
+		    exit 0
+		fi
+		start-stop-daemon -q -K -p /var/run/inadyn.pid -x /usr/sbin/inadyn
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		rm -f /var/run/inadyn/inadyn.pid
+		rm -f /var/run/inadyn.pid
 		;;
 	restart)
 		"$0" stop
diff --git a/package/inadyn/inadyn.conf b/package/inadyn/inadyn.conf
index b5877f7..ab8aa36 100644
--- a/package/inadyn/inadyn.conf
+++ b/package/inadyn/inadyn.conf
@@ -1,12 +1,11 @@
 # Basic configuration file for inadyn
 #
 # /etc/inadyn.conf
-background
+pidfile /var/run/inadyn.pid
 update_period_sec 600 # Check for a new IP every 600 seconds
 username test		# replace 'test' with your username
 password test		# replace 'test' with your password
-dyndns_system dyndns at dyndns.org   # replace w/ your provider
+dyndns_system default at dyndns.org   # replace w/ your provider
 
-#  uncomment the alias statement below to test it on your system
 alias test.homeip.net
 # replace 'test.homeip.net' with yourdomainname for actual (non-test) use
