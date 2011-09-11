From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] netsnmp: fix stop and restart actions in
	init script
Message-ID: <20110912052631.4779B8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=77cc11d533f79d13e9a440823d6f5e100cbdd202
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
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
1.7.3.4
