From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 23:38:27 +0200
Subject: [Buildroot] [git commit] modem-manager: support a defaults file in
 the init script
Message-ID: <20180422213833.BD0C588321@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5b14df1104c66a12b1203620afcf9bcb4ff22c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sometimes it is useful to pass some parameters to ModemManager when it
starts (e.g. --log-level). Allow the user add a file with such flags in
a MODEMMANAGER_ARGS variable. This is simpler than overriding the whole
startup script (e.g. by means of a rootfs overlay).

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/modem-manager/S44modem-manager | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/modem-manager/S44modem-manager b/package/modem-manager/S44modem-manager
index a3f5003aa1..416c1e2ee6 100755
--- a/package/modem-manager/S44modem-manager
+++ b/package/modem-manager/S44modem-manager
@@ -3,13 +3,16 @@
 # Starts ModemManager
 #
 
+# Allow a few customizations from a config file
+test -r /etc/default/ModemManager && . /etc/default/ModemManager
+
 PIDFILE=/var/run/ModemManager.pid
 
 start() {
 	printf "Starting ModemManager: "
 	umask 077
 	start-stop-daemon -S -q -b -m -p $PIDFILE \
-		--exec /usr/sbin/ModemManager
+		--exec /usr/sbin/ModemManager -- $MODEMMANAGER_ARGS
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 stop() {
