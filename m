From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 15 Jun 2011 17:47:57 +0200
Subject: [Buildroot] [PATCH 1/2] netsnmp: fix stop and restart actions in
	init script
Message-ID: <1308152878-14593-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/etc/init.d/S59snmpd stop (and restart) currently fail if either snmpd or
snmptrapd are not running.
This is because start-stop-daemon -K returns nonzero if the process to be
killed is not running, and this causes the whole script to fail because it runs
under 'set -e'.

This may not be noticed if only the last start-stop-daemon fails, but this is
in general wrong. It would also cause a failure in other scripts that execute
S59snmpd and check the return value.

Adding the --oknodo (-o) option to start-stop-daemon fixes this.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
Weird enough, in the current code the ssd_oknodo variable is first set, then
cleared. git log does not help to understand why, but this looks really
useless.

This is why I removed a line, instead of adding one.

 package/netsnmp/S59snmpd |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/netsnmp/S59snmpd b/package/netsnmp/S59snmpd
index f65317a..5df4b85 100755
--- a/package/netsnmp/S59snmpd
+++ b/package/netsnmp/S59snmpd
@@ -29,7 +29,6 @@ TRAPDOPTS='-Lsd -p /var/run/snmptrapd.pid'
 [ -r /etc/default/snmpd ] && . /etc/default/snmpd
 
 ssd_oknodo="-o"
-ssd_oknodo=""
 
 # Cd to / before starting any daemons.
 cd /
-- 
1.7.4.1
