From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 15 Nov 2014 17:27:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: let init script cleanup
	stale pidfile
Message-ID: <1416068836-4053-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dnsmasq does not clean up its pidfile after termination. Do this manually.

Supersedes: [PATCH 1/1] package/dnsmasq: cleanup run-time files in init script
https://patchwork.ozlabs.org/patch/411015/

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/dnsmasq/S80dnsmasq | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
index 587751e..ca74d8b 100755
--- a/package/dnsmasq/S80dnsmasq
+++ b/package/dnsmasq/S80dnsmasq
@@ -13,6 +13,8 @@ case "$1" in
 		echo -n "Stopping dnsmasq: "
 		start-stop-daemon -K -q -x /usr/sbin/dnsmasq
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		# dnsmasq does not clean its pid file
+		rm -f /var/run/dnsmasq.pid
 		;;
 	restart|reload)
 		$0 stop
-- 
2.1.3
