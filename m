From: Andreas Ehmanns <universeII@gmx.de>
Date: Thu, 25 Feb 2016 22:24:43 +0100
Subject: [Buildroot] [PATCH 3/4] Package netsnmp: Added missing reload of
	snmptrapd
In-Reply-To: <1456435484-4723-1-git-send-email-universeII@gmx.de>
References: <1456435484-4723-1-git-send-email-universeII@gmx.de>
Message-ID: <1456435484-4723-3-git-send-email-universeII@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case of a reload command the snmpdtrapd wasn't
restarted.

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
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
 
-- 
2.1.4
