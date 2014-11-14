From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Fri, 14 Nov 2014 22:30:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: cleanup run-time files in
	init script
Message-ID: <1416000618-32273-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dnsmasq does not clean its run-times its run-time files after stopping with
/etc/init.d/S80dnsmasq stop. Do this manually.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/dnsmasq/S80dnsmasq | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
index 587751e..b29fff4 100755
--- a/package/dnsmasq/S80dnsmasq
+++ b/package/dnsmasq/S80dnsmasq
@@ -13,6 +13,9 @@ case "$1" in
 		echo -n "Stopping dnsmasq: "
 		start-stop-daemon -K -q -x /usr/sbin/dnsmasq
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		# dnsmasq does not clean its run-time files
+		rm -f /var/run/dnsmasq.pid
+		rm -f /var/run/dnsmasq.leases
 		;;
 	restart|reload)
 		$0 stop
-- 
2.1.3
