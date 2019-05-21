From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Tue, 21 May 2019 12:54:27 +1000
Subject: [Buildroot] [PATCH v5 1/2] busybox: Update udhcpc.script for
 stateful DHCPv6
Message-ID: <20190521025428.9409-1-sam@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

udhcpc6 will call the default script with the address set in the "ipv6"
variable. Set "ip" to this address if present.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
v5: Split into two patches and added comment about stateful DHCPv6

 package/busybox/udhcpc.script | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index ad110d3a7f..90cc6b62ba 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -8,6 +8,8 @@ RESOLV_CONF="/etc/resolv.conf"
 [ -e $RESOLV_CONF ] || touch $RESOLV_CONF
 [ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
 [ -n "$subnet" ] && NETMASK="netmask $subnet"
+# Busybox's udhcpc only supports stateful DHCPv6 for now
+[ -n "$ipv6" ] && ip="$ipv6/128"
 
 case "$1" in
 	deconfig)
-- 
2.21.0
