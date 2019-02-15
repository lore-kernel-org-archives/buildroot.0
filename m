From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 23:00:12 +0100
Subject: [Buildroot] [git commit] package/mender: fix sysv startup script
Message-ID: <20190215215834.576C08A3A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63739c5c25805816a20e7073e837e18854e83ada
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mender is a service explicitly written for systemd and so it doesn't
fork on background, doesn't redirect outputs and doesn't create a pid
file by itself.
To make the service running correctly is therefore necessary to use the
-m switch of start-stop-daemon to create the pid file and -b option to
send the process to background.
Logging is preserved because the service will log anyway on syslog.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
