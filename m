From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 15 Feb 2019 22:44:10 +0100
Subject: [Buildroot] [PATCH] package/mender: fix sysv startup script
Message-ID: <20190215214410.29132-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mender is a service explicitly written for systemd and so it doesn't
fork on background, doesn't redirect outputs and doesn't create a pid
file by itself.
To make the service running correctly is therefore necessary to use the
-m switch of start-stop-daemon to create the pid file and -b option to
send the process to background.
Logging is preserved because the service will log anyway on syslog.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mender/S42mender | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender/S42mender b/package/mender/S42mender
index 665a9dd74a..108fecfea9 100644
--- a/package/mender/S42mender
+++ b/package/mender/S42mender
@@ -24,7 +24,7 @@ start() {
 	printf "Starting mender service: "
 	umask 077
 
-	start-stop-daemon -S -q -p /var/run/mender.pid \
+	start-stop-daemon -S -q -b -m -p /var/run/mender.pid \
 		--exec /usr/bin/mender -- -daemon
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
-- 
2.17.1
