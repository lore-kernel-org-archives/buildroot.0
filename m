From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 14:49:24 +0200
Subject: [Buildroot] [git commit] netsnmp: add missing reload of snmptrapd
	in init script
Message-ID: <20160701124940.974BB80504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6eba255b716865fcb688afe627eb1568718bc09b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case of a reload command the snmpdtrapd wasn't restarted.

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsnmp/S59snmpd | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/netsnmp/S59snmpd b/package/netsnmp/S59snmpd
index 2762082..2d076e0 100755
--- a/package/netsnmp/S59snmpd
+++ b/package/netsnmp/S59snmpd
@@ -65,6 +65,11 @@ reload() {
         start-stop-daemon -q -K -s 1 -p /var/run/snmpd.pid -x /usr/sbin/snmpd
         printf " snmpd"
     fi
+
+    if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
+        start-stop-daemon -q -K -s 1 -p /var/run/snmptrapd.pid -x /usr/sbin/snmptrapd
+        printf " snmptrapd"
+    fi
     echo "."
 }
 
